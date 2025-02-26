import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_refresh_indicator.dart';
import '../../../../shared_features/projects/data/models/project_model.dart';
import '../../../../shared_features/projects/presentation/logic/project_cubit/project_cubit.dart';
import '../../../../shared_features/projects/presentation/widgets/project_item.dart';

class AllProjectsSection extends StatefulWidget {
  const AllProjectsSection({super.key});

  @override
  State<AllProjectsSection> createState() => _AllProjectsSectionState();
}

class _AllProjectsSectionState extends State<AllProjectsSection> {
  late final PagingController<int, ProjectModel> _pagingController;
  @override
  void initState() {
    _pagingController = PagingController(firstPageKey: 1);
    final projectCubit = context.read<ProjectCubit>();
    if (projectCubit.state.allProjects.isNotEmpty) {
      _pagingController.value = PagingState(
        itemList: projectCubit.state.allProjects,
        nextPageKey: projectCubit.state.pageIndex + 1,
      );
    } else {
      _pagingController.addPageRequestListener((pageKey) {
        projectCubit.getAllProjects(loadMore: pageKey != 1);
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectCubit, ProjectState>(
      listenWhen: (previous, current) =>
          current.status.isGetAllProjectsSuccess ||
          current.status.isGetAllProjectsFailure ||
          current.status.isGetAllProjectsLoading,
      listener: (context, state) {
        if (state.status.isGetAllProjectsSuccess) {
          if (state.hasReachedMax) {
            _pagingController.appendLastPage(state.allProjects);
          } else {
            _pagingController.appendPage(
                state.allProjects, state.pageIndex + 1);
          }
        } else if (state.status.isGetAllProjectsFailure) {
          _pagingController.error = state.errorMessage;
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomRefreshIndicator(
          onRefresh: () async {
            _refreshData();
          },
          child: PagedListView<int, ProjectModel>(
            pagingController: _pagingController,
            padding: const EdgeInsets.symmetric(vertical: 45),
            physics: const BouncingScrollPhysics(),
            builderDelegate: PagedChildBuilderDelegate<ProjectModel>(
              itemBuilder: (context, project, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: SlideInLeft(
                    from: 400,
                    child: ProjectItem(projectModel: project),
                  ),
                );
              },
              firstPageProgressIndicatorBuilder: (context) {
                return const CustomLoadingWidget();
              },
              newPageProgressIndicatorBuilder: (context) {
                return const Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 20),
                  child: CustomLoadingWidget(),
                );
              },
              firstPageErrorIndicatorBuilder: (context) {
                return CustomFailureWidget(
                  text: _pagingController.error?.toString() ??
                      'Error Occurred, please try again',
                  onRetry: () => _pagingController.retryLastFailedRequest(),
                );
              },
              noItemsFoundIndicatorBuilder: (context) {
                return CustomFailureWidget(
                  text: _pagingController.error?.toString() ??
                      'No projects found',
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _refreshData() {
    _pagingController.refresh();
    context.read<ProjectCubit>().getAllProjects();
  }
}
