import 'package:flutter/material.dart';
import 'package:pagination_project/ui/widget/dynamic_card.dart';
import 'package:pagination_project/ui/widget/dynamic_list_view.dart';
import 'package:pagination_project/ui/widget/shimmer_row.dart';
import 'package:provider/provider.dart';

import '../logic/pagination_provider.dart';
import '../model/category_response_model.dart';

/// A stateless widget that represents the pagination screen.
class PaginationScreen extends StatelessWidget {
  /// Constructor for the PaginationScreen widget.
  const PaginationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      /// Creates an instance of PaginationProvider and provides it to the widget tree.
      create: (_) => PaginationProvider(),
      child: Scaffold(
        /// The main structure of the screen.
        appBar: AppBar(
          /// The title of the app bar, which changes based on the search state.
          title: Consumer<PaginationProvider>(
            /// Builds the title widget based on the provider's state.
            builder: (context, provider, child) {
              return AnimatedSwitcher(
                /// Animation duration for switching between title and search field.
                duration: const Duration(milliseconds: 300),
                child: provider.isSearching
                    ? TextField(
                  /// Key for the search field.
                  key: ValueKey('searchField'),
                  /// Controller for the search input.
                  controller: provider.searchController,
                  /// Decoration for the search input field.
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  /// Style for the search input text.
                  style: const TextStyle(color: Colors.white),
                  /// Callback for when the search input changes.
                  onChanged: (value) {
                    provider.search(value);
                  },
                  /// Callback for when the search input is submitted.
                  onSubmitted: (value) {
                    // Do nothing on submit
                  },
                )
                    : const Text(
                  /// Title text when not searching.
                  "Scroll Pagination",
                  key: ValueKey('titleText'),
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          ),
          /// Background color of the app bar.
          backgroundColor: Colors.teal,
          actions: [
            /// Action button to toggle search state.
            Consumer<PaginationProvider>(
              builder: (context, provider, child) {
                return IconButton(
                  /// Icon changes based on the search state.
                  icon: Icon(
                    provider.isSearching ? Icons.close : Icons.search,
                    color: Colors.white,
                  ),
                  /// Toggles the search state and clears the search input if not searching.
                  onPressed: () {
                    provider.toggleSearch();
                    if (!provider.isSearching) {
                      provider.searchController.clear();
                    }
                  },
                );
              },
            ),
          ],
        ),
        /// The body of the screen, which displays the list of items.
        body: Consumer<PaginationProvider>(
          builder: (context, provider, child) {
            /// Determines which list of items to display based on the search state.
            final items = provider.isSearching ? provider.resultSearch : provider.result;
            return provider.loading
                ? ListView.builder(
              /// Displays a shimmer effect while loading.
              itemCount: 15,
              itemBuilder: (context, index) {
                return const ShimmerRow();
              },
            )
                : DynamicListView<CategoryDetails>(
              /// Scroll controller for the list view.
              scrollController: provider.scrollController,
              /// List of items to display.
              items: items,
              /// Indicates if more items are being loaded.
              isLoadingMore: provider.loadingMore,
              /// Builds each item in the list.
              itemBuilder: (context, item) {
                return DynamicCard(
                  /// Name of the item.
                  name: item.name,
                  /// URL of the item.
                  url: item.area.toString(),
                );
              },
              /// Callback for refreshing the list.
              onRefresh: provider.refresh,
            );
          },
        ),
      ),
    );
  }
}