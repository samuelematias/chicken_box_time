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
        child: ds.Text(
          query,
          style: ds.CustomTextStyle.labelMedium,
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
          title: ds.Text(
            suggestion,
            style: ds.CustomTextStyle.labelMedium,
          ),
          onTap: () {
            query = suggestion;

            /// This action is toggled when your click on some item
            /// or click on seach in your mobile keyboard.

            /// Close the search page after click in a item.
            // close(context, null);

            /// Open a page with the clicked result.
            showResults(context);
          },
        );
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = ds.AppTheme.of(context);
    final colorTheme = theme.colors;
    return Theme.of(context).copyWith(
      scaffoldBackgroundColor: colorTheme.background,
      appBarTheme: AppBarTheme(
        backgroundColor: colorTheme.background,
        elevation: 0,
      ),
      textTheme: TextTheme(
        headline6: theme.typography.titleMedium.copyWith(
          color: colorTheme.font,
        ),
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            border: InputBorder.none,
            focusColor: colorTheme.background,
            focusedBorder: InputBorder.none,
            hintStyle: theme.typography.titleMedium.copyWith(
              color: colorTheme.font,
            ),
          ),
    );
  }
}
