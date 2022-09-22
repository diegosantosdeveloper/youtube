import 'package:flutter/material.dart';

class Pesquisa extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String>? lista = [];

    if (query.isNotEmpty) {
      lista = ['Android', 'Android Navegação', 'IOS', 'Jogos']
          .where((texto) => texto.toUpperCase().startsWith(query.toUpperCase()))
          .toList();
      return ListView.builder(
          itemBuilder: (context, index) =>
              ListTile(
                title: Text(lista![index]),
                onTap: () => close(context, lista![index]),
              ),
          itemCount: lista.length);
    } else {
      return const Center(child: Text("Nenhum resultado para pesquisa!"));
    }
  }
}
