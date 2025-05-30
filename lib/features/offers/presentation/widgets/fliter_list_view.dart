import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/cubit/offer_cubit.dart';
import 'fliter_item.dart';

class FliterListView extends StatefulWidget {
  const FliterListView({
    super.key,
  });

  @override
  State<FliterListView> createState() => _FliterListViewState();
}

class _FliterListViewState extends State<FliterListView> {
  final List<String> filterItems = [
    'All',
    'Waiting for accepting',
    'In Progress',
    'Completed',
    'unaccepted',
  ];

  int selectedFilterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: SizedBox(
        height: 34.h,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: filterItems.length,
          itemBuilder: (_, index) => GestureDetector(
            onTap: () {
              setState(() {
                selectedFilterIndex = index;
                context.read<OfferCubit>().setStatusIndex(index - 1);
                context.read<OfferCubit>().getAllOffers();
              });
            },
            child: FliterItem(
              title: filterItems[index],
              isSelected: selectedFilterIndex == index,
            ),
          ),
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(right: 16),
        ),
      ),
    );
  }
}
