import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar peliculas';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [Text("Actions")];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Text("Actions");
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("Actions");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text("Actions");
  }
}
