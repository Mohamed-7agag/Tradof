import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../../core/utils/widgets/custom_refresh_indicator.dart';
import '../../../../projects/data/models/project_model.dart';
import '../../../../projects/presentation/logic/project_cubit/project_cubit.dart';
import '../../../../projects/presentation/logic/project_cubit/project_extenstion.dart';
import '../../../../projects/presentation/widgets/project_item.dart';

class CurrentProjectsListView extends StatefulWidget {
  const CurrentProjectsListView({super.key});

  @override
  State<CurrentProjectsListView> createState() =>
      _CurrentProjectsListViewState();
}

class _CurrentProjectsListViewState extends State<CurrentProjectsListView> {
  late final PagingController<int, ProjectModel> _pagingController;
  @override
  void initState() {
    _pagingController = PagingController(firstPageKey: 1);
    final projectCubit = context.read<ProjectCubit>();
    if (projectCubit.state.currentProjects.isNotEmpty) {
      _pagingController.value = PagingState(
        itemList: projectCubit.state.currentProjects,
        nextPageKey: projectCubit.state.currentProjectsPagination.pageIndex + 1,
      );
    } else {
      _pagingController.addPageRequestListener((pageKey) {
        projectCubit.getCurrentProjects(loadMore: pageKey != 1);
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
          current.status.isCurrentProjectsFailure ||
          current.status.isCurrentProjectsLoading ||
          current.status.isCurrentProjectsSuccess,
      listener: (context, state) {
        if (state.status.isCurrentProjectsSuccess) {
          if (state.currentProjectsPagination.hasReachedMax) {
            _pagingController.appendLastPage(state.currentProjects);
          } else {
            _pagingController.appendPage(state.currentProjects,
                state.currentProjectsPagination.pageIndex + 1);
          }
        } else if (state.status.isCurrentProjectsFailure) {
          _pagingController.error = state.errorMessage;
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomRefreshIndicator(
          onRefresh: () async => _refreshData(),
          child: PagedListView<int, ProjectModel>(
            pagingController: _pagingController,
            padding: const EdgeInsets.only(bottom: 45, top: 25),
            physics: const NeverScrollableScrollPhysics(),
            builderDelegate: PagedChildBuilderDelegate<ProjectModel>(
              itemBuilder: (context, project, index) {
                return ProjectItem(
                  project: project,
                  onTap: () {
                    context.pushNamed(
                      Routes.startedAndCurrentProjectDetailsViewRoute,
                      arguments: {
                        'projectModel': project,
                        'isStartedProject': false,
                      },
                    );
                  },
                );
              },
              firstPageProgressIndicatorBuilder: (context) {
                return const CustomLoadingWidget();
              },
              newPageProgressIndicatorBuilder: (context) {
                return const CustomLoadingWidget();
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
                      'No projecsts found',
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
    context.read<ProjectCubit>().getCurrentProjects();
  }
}
