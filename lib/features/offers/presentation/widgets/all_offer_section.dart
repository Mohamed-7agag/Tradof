import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../core/utils/widgets/custom_failure_widget.dart';
import '../../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../../core/utils/widgets/custom_refresh_indicator.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../data/model/offer_model.dart';
import '../logic/cubit/offer_cubit.dart';
import 'offer_item.dart';

class AllOfferSection extends StatefulWidget {
  const AllOfferSection({super.key});

  @override
  State<AllOfferSection> createState() => _AllOfferSectionState();
}

class _AllOfferSectionState extends State<AllOfferSection> {
  late final PagingController<int, OfferModel> _pagingController;
  @override
  void initState() {
    _pagingController = PagingController(firstPageKey: 1);
    final offerCubit = context.read<OfferCubit>();
    if (offerCubit.state.allOffers.isNotEmpty) {
      _pagingController.value = PagingState(
        itemList: offerCubit.state.allOffers,
        nextPageKey: offerCubit.state.pageIndex + 1,
      );
    } else {
      _pagingController.addPageRequestListener((pageKey) {
        offerCubit.getAllOffers(loadMore: pageKey != 1);
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
    return BlocListener<OfferCubit, OfferState>(
      listenWhen: (previous, current) =>
          current.status.isGetAllOffersSuccess ||
          current.status.isGetAllOffersFailure ||
          current.status.isGetAllOffersLoading,
      listener: (context, state) {
        if (state.status.isGetAllOffersSuccess) {
          log(state.allOffers.toString());
          if (state.hasReachedMax) {
            _pagingController.appendLastPage(state.allOffers);
          } else {
            _pagingController.appendPage(state.allOffers, state.pageIndex + 1);
          }
        } else if (state.status.isGetAllOffersFailure) {
          _pagingController.error = state.errorMessage;
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomRefreshIndicator(
          onRefresh: () async => _refreshData(),
          child: PagedListView<int, OfferModel>(
            pagingController: _pagingController,
            padding: const EdgeInsets.symmetric(vertical: 45),
            physics: const BouncingScrollPhysics(),
            builderDelegate: PagedChildBuilderDelegate<OfferModel>(
              itemBuilder: (context, offer, index) {
                return SlideInLeft(
                  from: 400,
                  child: OfferItem(
                    offer: offer,
                    onTap: () {
                      context.pushNamed(
                        Routes.updateOfferViewRoute,
                        arguments: offer,
                      );
                    },
                  ),
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
    context.read<OfferCubit>().getAllOffers();
  }
}
