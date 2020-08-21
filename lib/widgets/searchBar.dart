import 'package:eLibrabryapp/models/api.dart';
import 'package:flutter/material.dart';
import 'package:eLibrabryapp/models/getAffectedCountries.dart';

class SearchBar extends SearchDelegate<String> {
  final recentCountries = [];
  Future<GetCountries> futureCountries;

  String get searchFieldLabel => "Enter Countries";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return InkWell(
      onTap: () {
        showSuggestions(context);
      },
      child: Container(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext contexntext) {
    return FutureBuilder<GetCountries>(
      future: fetchCountries(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final sugestion = query.isEmpty
            ? recentCountries
            : snapshot.data.affectedCountries
                .where((element) => element
                    .startsWith(query[0].toUpperCase() + query.substring(1)))
                .toList();

        return ListView.builder(
            itemCount: sugestion.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: RichText(
                    text: TextSpan(
                        text: sugestion[index].substring(0, query.length),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0),
                        children: [
                      TextSpan(
                          text: sugestion[index].substring(query.length),
                          style: TextStyle(color: Colors.grey, fontSize: 24.0))
                    ])),
                onTap: () {
                  query = sugestion[index];
                  recentCountries.add(query);
                  close(context, query);
                },
              );
            });
      },
    );
  }
}
