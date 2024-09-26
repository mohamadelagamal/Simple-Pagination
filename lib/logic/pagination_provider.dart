import 'dart:convert'; // Importing the Dart library for JSON encoding and decoding
import 'package:flutter/material.dart'; // Importing Flutter's material design library
import 'package:http/http.dart' as http; // Importing the HTTP package for making network requests
import 'package:pagination_project/model/category_response_model.dart'; // Importing the model for category response

class PaginationProvider with ChangeNotifier {
  // List to store the fetched results
  List<CategoryDetails> result = [];
  // List to store the search results
  List<CategoryDetails> resultSearch = [];
  // Flags to manage loading states
  bool loading = true;
  bool loadingMore = false;
  bool hasMoreData = true;
  // Offset for pagination
  int offset = 1;
  // Scroll and search controllers
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  // Flag to check if searching
  bool _isSearching = false;

  // API URLs and app key
  static const String apiUrl = "Example URL";
  static const String searchUrl = "Example URL";
  static const String appKey = "Example Key";

  // Constructor to initialize the provider
  PaginationProvider() {
    _initialize();
    // searchController.addListener(_onSearchChanged); // Uncomment if you want to listen to search input changes
  }

  // Initialize the provider by fetching data and setting up scroll listener
  void _initialize() {
    fetchData(offset);
    _setupScrollListener();
  }

  // Listener for search input changes
  void _onSearchChanged() {
    search(searchController.text);
  }

  // Fetch data from the API
  Future<void> fetchData(int paraOffset) async {
    if (!hasMoreData) return;

    _setLoadingState(paraOffset);

    try {
      final response = await http.get(
        Uri.parse("$apiUrl?page=$paraOffset"),
        headers: {
          'APP_KEY': '$appKey',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'];
        if (data.isNotEmpty) {
          final modelClass = CategoryDetailsModel.fromJson(json.decode(response.body));
          _updateResults(modelClass.data, paraOffset);
        } else {
          hasMoreData = false;
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      _resetLoadingState();
    }
  }

  // Search data from the API
  Future<void> search(String keyword) async {
    _setLoadingState(0);

    try {
      final response = await http.post(
        Uri.parse("$searchUrl?page=1"),
        headers: {
          'APP_KEY': '$appKey',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: json.encode({'keyword': keyword}),
      );
      if (response.statusCode == 200) {
        final modelClass = CategoryDetailsModel.fromJson(json.decode(response.body));
        _updateResultsSearch(modelClass.data ?? [], 1);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("Error searching data: $e");
    } finally {
      _resetLoadingState();
    }
  }

  // Set loading state based on the offset
  void _setLoadingState(int paraOffset) {
    if (paraOffset == 0) {
      loading = true;
    } else {
      loadingMore = true;
    }
    notifyListeners();
  }

  // Reset loading state
  void _resetLoadingState() {
    loading = false;
    loadingMore = false;
    notifyListeners();
  }

  // Update the results list with new data
  void _updateResults(List<CategoryDetails> newResults, int paraOffset) {
    if (paraOffset == 1) {
      result = newResults;
    } else {
      result.addAll(newResults);
    }
    offset = paraOffset + 1;
    notifyListeners();
  }

  // Update the search results list with new data
  void _updateResultsSearch(List<CategoryDetails> newResults, int paraOffset) {
    if (paraOffset == 1) {
      resultSearch = newResults;
    } else {
      resultSearch.addAll(newResults);
    }
    offset = paraOffset + 1;
    notifyListeners();
  }

  // Setup scroll listener to fetch more data when reaching the end of the list
  void _setupScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent == scrollController.position.pixels) {
        fetchData(offset);
      }
    });
  }

  // Refresh the data
  Future<void> refresh() async {
    hasMoreData = true;
    await fetchData(1);
  }

  // Toggle the search state
  void toggleSearch() {
    _isSearching = !_isSearching;
    notifyListeners();
  }

  // Getter for the searching state
  bool get isSearching => _isSearching;

  // Dispose controllers and listeners
  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    scrollController.dispose();
    super.dispose();
  }
}