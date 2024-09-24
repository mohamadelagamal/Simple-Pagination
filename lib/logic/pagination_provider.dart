import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import '../model/model_class.dart';

class PaginationProvider with ChangeNotifier {
  /// List to store the fetched results.
  List<Result> result = [];

  /// Boolean to indicate if the initial data is being loaded.
  bool loading = true;

  /// Boolean to indicate if more data is being loaded when the user scrolls.
  bool loadingMore = false;

  /// Integer to keep track of the current offset for pagination.
  int offset = 1;

  /// ScrollController to manage the scroll position and detect when the user has scrolled to the bottom.
  final ScrollController scrollController = ScrollController();

  /// Constant string for the API URL.
  static const String apiUrl = "https://pokeapi.co/api/v2/pokemon";
  static const String appKey = "base64:7+4+S0ntVJXJgJWh8A1axdkJZuNRGfJZOu2pDL1zloA=";

  PaginationProvider() {
    _initialize();
  }

  /// Initializes the provider by fetching initial data and setting up the scroll listener.
  void _initialize() {
    fetchData(offset);
    _setupScrollListener();
  }

  /// Fetches data from the API based on the given offset.
  /// Updates the loading state and handles the response.
  Future<void> fetchData(int paraOffset) async {
    _setLoadingState(paraOffset);

    try {
      final response = await http.get(Uri.parse("$apiUrl?offset=$paraOffset&limit=15"));

      print("print : ${paraOffset}");
      print("Response: ${response.body}");
      if (response.statusCode == 200) {
        final modelClass = ModelClass.fromJson(json.decode(response.body));
        _updateResults(modelClass.results, paraOffset);

      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // Handle error
      print("Error fetching data: $e");
    } finally {
      _resetLoadingState();
    }
  }

  /// Sets the loading state based on the offset.
  /// If offset is 0, it indicates initial loading, otherwise it's loading more data.
  void _setLoadingState(int paraOffset) {
    if (paraOffset == 1) {
      loading = true;
    } else {
      loadingMore = true;
    }
    notifyListeners();
  }

  /// Resets the loading state after data is fetched.
  void _resetLoadingState() {
    loading = false;
    loadingMore = false;
    notifyListeners();
  }

  /// Updates the results list with new data.
  /// If offset is 0, it replaces the list, otherwise it appends to the existing list.
  void _updateResults(List<Result> newResults, int paraOffset) {
    if (paraOffset == 1) {
      result = newResults;
    } else {
      result.addAll(newResults);
    }
    offset = paraOffset + 1;
    notifyListeners();
  }

  /// Sets up a scroll listener to detect when the user has scrolled to the bottom of the list.
  /// Fetches more data when the bottom is reached.
  void _setupScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent == scrollController.position.pixels) {
        fetchData(offset);
      }
    });
  }

  /// Refreshes the data by fetching it from the beginning (offset 0).
  Future<void> refresh() async {
    await fetchData(1);
  }

  /// Disposes the scroll controller when the provider is disposed.
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}