import 'package:flutter/material.dart';
import 'package:youtube/pesquisa.dart';
import 'package:youtube/telas/biblioteca.dart';
import 'package:youtube/telas/em_alta.dart';
import 'package:youtube/telas/inicio.dart';
import 'package:youtube/telas/inscricao.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indexAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black54),
        title: Image.asset('images/youtube.png', width: 98, height: 22),
        actions: [
          IconButton(
              onPressed: () async {
                String? resultado =
                    await showSearch(context: context, delegate: Pesquisa());
                setState(() => _resultado = resultado!);
              },
              icon: const Icon(Icons.search)),
          /*
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.videocam)
          ),
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.account_circle)
          )*/
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: telas[_indexAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexAtual,
        onTap: (index) => setState(() => _indexAtual = index),
        // type: BottomNavigationBarType.shifting,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        // unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.orange,
              label: 'Início',
              icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              backgroundColor: Colors.red,
              label: 'Em Alta',
              icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              label: 'Inscrições',
              icon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(
              backgroundColor: Colors.green,
              label: 'Biblioteca',
              icon: Icon(Icons.folder)),
        ],
      ),
    );
  }
}
