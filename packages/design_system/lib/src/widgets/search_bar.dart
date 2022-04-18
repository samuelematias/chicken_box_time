import 'package:design_system/design_system.dart' as ds;
import 'package:flutter/material.dart';

/// The [SearchBar] widget.
class SearchBar extends SearchDelegate<dynamic> {
  /// Creates a new instance of [SearchBar].
  SearchBar({
    required this.data,
  });

  /// The search bar content.
  /// This is manual list of query for suggesting user.
  List<String> data;

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      if (query.isNotEmpty) ...[
        IconButton(
          tooltip: 'Clear',
          icon: Icon(
            Icons.clear,
            color: ds.AppTheme.of(context).colors.brand,
          ),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        )
      ]
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
tooltip: 'Back Button',
        icon: Icon(
          Icons.arrow_back,
          color: ds.AppTheme.of(context).colors.brand,
        ),
        onPressed: () {
          close(context, null);
        },
      );

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    /// Will show a query hint suggestion "flutter search bar with listview"
    final suggesstions = data.where((element) {
      final result = element.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggesstions.length,
      itemBuilder: (context, index) {
        final suggestion = suggesstions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;

            /// Close the search page after click in a item.
            // close(context, null);

            /// Open a page with the clicked result.
            showResults(context);
          },
        );
      },
    );
  }
}
