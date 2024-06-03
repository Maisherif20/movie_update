import 'package:flutter/material.dart';
import 'package:untitled/presentation_layer/ui/tabs/searchTab/searchView.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {}

  @override
  Widget? buildLeading(BuildContext context) {}

  @override
  Widget buildResults(BuildContext context) {
    return SearchView(
      query: query,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Please Enter Text"),
        ],
      ),
    );
  }
}
