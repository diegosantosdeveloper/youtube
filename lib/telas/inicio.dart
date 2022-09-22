import 'package:flutter/material.dart';
import 'package:youtube/api.dart';
import 'package:youtube/model/video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Inicio extends StatefulWidget {
  String pesquisa;

  Inicio(this.pesquisa);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  Future<List<Video>> _listarVideos(String pesquisa) {
    Api api = Api();
    return api.pesquisar(pesquisa);
  }

  @override
  void initState() {
    super.initState();
    print("chamando 1 - initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("chamando 2 - didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant Inicio oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("chamando 2 - didUpdateWidget");
  }

  @override
  void dispose() {
    super.dispose();
    print("chamando 4 - dispose");
  }

  @override
  Widget build(BuildContext context) {
    print("chamando 3 - build");
    return FutureBuilder<List<Video>>(
        future: _listarVideos(widget.pesquisa),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      List<Video>? videos = snapshot.data;
                      Video video = videos![index];
                      return Column(
                        children: [
                          YoutubePlayer(
                              controller: YoutubePlayerController(
                                  initialVideoId: video.id,
                                  flags: const YoutubePlayerFlags(
                                      autoPlay: false)),
                              showVideoProgressIndicator: true),
                          // Container(
                          //   height: 200,
                          //   decoration: BoxDecoration(
                          //       image: DecorationImage(
                          //           fit: BoxFit.cover,
                          //           image: NetworkImage(video.imagem))),
                          // ),
                          ListTile(
                            title: Text(video.titulo),
                            subtitle: Text(video.descricao),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const Divider(height: 2, color: Colors.grey),
                    itemCount: snapshot.data!.length);
              } else {
                return const Center(
                    child: Text('Nenhum dado a ser exibido!!!'));
              }
              break;
          }
        });
  }
}
