import 'package:flutter/material.dart';
import 'package:pagination_project/ui/widget/dynamic_card.dart';
import 'package:pagination_project/ui/widget/dynamic_list_view.dart';
import 'package:pagination_project/ui/widget/dynamic_sliver_list_view.dart';
import 'package:pagination_project/ui/widget/shimmer_row.dart';
import 'package:provider/provider.dart';

import '../logic/pagination_provider.dart';
import '../model/model_class.dart';

/// A stateless widget that represents the pagination screen.
class PaginationScreen extends StatelessWidget {
  /// Creates a [PaginationScreen] widget.
  const PaginationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PaginationProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Scroll Pagination",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.teal,
        ),
        body: Consumer<PaginationProvider>(
          builder: (context, provider, child) {
            return provider.loading
                ? ListView.builder(
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return const ShimmerRow();
                    },
                  )
                : DynamicSliverListView<CategoryDetails>(
                    scrollController: provider.scrollController,
                    items: provider.result,
                    isLoadingMore: provider.loadingMore,
                    itemBuilder: (context, item) {
                      return DynamicCard(
                        name: item.name,
                        url: item.area.toString(),
                      );
                    },
                    onRefresh: provider.refresh,
                  );
          },
        ),
      ),
    );
  }
}
