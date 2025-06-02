import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../projects/data/models/project_model.dart';
import '../../../../projects/presentation/logic/project_cubit/project_cubit.dart';
import '../../../../projects/presentation/logic/project_cubit/project_extenstion.dart';
import '../../../../projects/presentation/widgets/project_item.dart';

class StartedProjectsListView extends StatefulWidget {
  const StartedProjectsListView({super.key});

  @override
  State<StartedProjectsListView> createState() =>
      _StartedProjectsListViewState();
}

class _StartedProjectsListViewState extends State<StartedProjectsListView> {
  late final PagingController<int, ProjectModel> _pagingController;

  @override
  void initState() {
    _pagingController = PagingController(firstPageKey: 1);
    final projectCubit = context.read<ProjectCubit>();
    if (projectCubit.state.startedProjects.isNotEmpty) {
      _pagingController.value = PagingState(
        itemList: projectCubit.state.startedProjects,
        nextPageKey: projectCubit.state.startedProjectsPagination.pageIndex + 1,
      );
    } else {
      _pagingController.addPageRequestListener((pageKey) {
        projectCubit.getStartedProjects(loadMore: pageKey != 1);
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
      listenWhen: (previous, current) => _buildWhen(current),
      listener: (context, state) {
        if (state.status.isGetStartedtProjectsSuccess) {
          if (state.startedProjectsPagination.hasReachedMax) {
            _pagingController.appendLastPage(state.startedProjects);
          } else {
            _pagingController.appendPage(state.startedProjects,
                state.startedProjectsPagination.pageIndex + 1);
          }
        } else if (state.status.isGetStartedtProjectsFailure) {
          _pagingController.error = state.errorMessage;
        }
      },
      child: PagedListView<int, ProjectModel>(
        pagingController: _pagingController,
        clipBehavior: Clip.none,
        padding: const EdgeInsets.symmetric(vertical: 45),
        builderDelegate: PagedChildBuilderDelegate<ProjectModel>(
          itemBuilder: (context, project, index) {
            return ProjectItem(
              project: project,
              onTap: () {
                // context.pushNamed(
                //   Routes.freelancerProjectDetailsViewRoute,
                //   arguments: project,
                // );
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
                  'No started projects found',
            );
          },
        ),
      ),
    );
  }

  bool _buildWhen(ProjectState state) =>
      state.status.isGetStartedtProjectsSuccess ||
      state.status.isGetStartedtProjectsFailure ||
      state.status.isGetStartedtProjectsLoading;
}
