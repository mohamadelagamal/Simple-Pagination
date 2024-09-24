import 'package:flutter/material.dart';

/// A stateless widget that represents a dynamic sliver list view with customizable properties.
class DynamicSliverListView<T> extends StatelessWidget {
  /// The scroll controller to manage the scroll position.
  final ScrollController scrollController;

  /// The list of items to be displayed in the sliver list view.
  final List<T> items;

  /// A boolean to indicate if more data is being loaded.
  final bool isLoadingMore;

  /// A function to build each item in the sliver list view.
  final Widget Function(BuildContext, T) itemBuilder;

  /// A function to handle the refresh action.
  final Future<void> Function() onRefresh;

  /// Creates a [DynamicSliverListView] widget.
  const DynamicSliverListView({
    required this.scrollController,
    required this.items,
    required this.isLoadingMore,
    required this.itemBuilder,
    required this.onRefresh,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                if (index == items.length) {
                  return const SizedBox(
                    height: 80,
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                      ),
                    ),
                  );
                }
                return itemBuilder(context, items[index]);
              },
              childCount: items.length + (isLoadingMore ? 1 : 0),
            ),
          ),
        ],
      ),
    );
  }
}