import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../data/model/offer_model.dart';
import '../logic/cubit/offer_cubit.dart';
import '../logic/cubit/offer_state_extension.dart';
import '../widgets/project_offer_item.dart';

class ProjectOffersView extends StatefulWidget {
  const ProjectOffersView({required this.projectId, super.key});
  final int projectId;
  @override
  State<ProjectOffersView> createState() => _ProjectOffersViewState();
}

class _ProjectOffersViewState extends State<ProjectOffersView> {
  late final PagingController<int, OfferModel> _pagingController;

  @override
  void initState() {
    _pagingController = PagingController(firstPageKey: 1);
    final offerCubit = context.read<OfferCubit>();
    if (offerCubit.state.projectOffers.isNotEmpty) {
      _pagingController.value = PagingState(
        itemList: offerCubit.state.projectOffers,
        nextPageKey: offerCubit.state.projectOffersPagination.pageIndex + 1,
      );
    } else {
      _pagingController.addPageRequestListener((pageKey) {
        offerCubit.getProjectOffers(widget.projectId, loadMore: pageKey != 1);
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
    return Scaffold(
      appBar: customAppbar(
        title: 'Offers',
        actionIcon: HugeIcons.strokeRoundedClipboard,
      ),
      body: BlocListener<OfferCubit, OfferState>(
        listenWhen: (previous, current) => _listenWhen(current),
        listener: (context, state) {
          if (state.status.isGetProjectOffersSuccess) {
            if (state.projectOffersPagination.hasReachedMax) {
              _pagingController.appendLastPage(state.projectOffers);
            } else {
              _pagingController.appendPage(state.projectOffers,
                  state.projectOffersPagination.pageIndex + 1);
            }
          } else if (state.status.isGetProjectOffersFailure) {
            _pagingController.error = state.errorMessage;
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: PagedListView<int, OfferModel>(
            pagingController: _pagingController,
            padding: const EdgeInsets.symmetric(vertical: 20),
            physics: const BouncingScrollPhysics(),
            builderDelegate: PagedChildBuilderDelegate<OfferModel>(
              itemBuilder: (context, offer, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: ProjectOfferItem(offer: offer),
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
                  text:
                      _pagingController.error?.toString() ?? 'No Offers found',
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  bool _listenWhen(OfferState current) {
    return current.status.isGetProjectOffersSuccess ||
        current.status.isGetProjectOffersFailure ||
        current.status.isGetProjectOffersLoading;
  }
}
