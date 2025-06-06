import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    'Pending',
    'Accepted',
    'Declined',
    'Canceled',
  ];

  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: BlocConsumer<OfferCubit, OfferState>(
        listenWhen: (previous, current) =>
            current.status == OfferStatus.setStatusIndex,
        listener: (context, state) {},
        builder: (context, state) {
          return SizedBox(
            height: 34,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _scrollController,
              itemCount: filterItems.length,
              itemBuilder: (_, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    context.read<OfferCubit>().statusIndex = index;
                    context.read<OfferCubit>().setStatusIndex();
                  });
                },
                child: FliterItem(
                  title: filterItems[index],
                  isSelected: context.read<OfferCubit>().statusIndex == index,
                ),
              ),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 16),
            ),
          );
        },
      ),
    );
  }
}
