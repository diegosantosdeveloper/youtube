import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/model/video.dart';

const CHAVE_YOUTUBE_API = 'AIzaSyCfnw-YIu1cW2_ww52Y4wOyjILv9k3giTY';
const ID_CANAL = 'UCafFexaRoRylOKdzGBU6Pgg';
const URL_BASE = 'https://www.googleapis.com/youtube/v3/';

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    List<Video> videos = [];
    Uri? uri = Uri.tryParse('${URL_BASE}search?'
        'part=snippet'
        '&type=video'
        '&maxResults=20'
        '&order=date&key=$CHAVE_YOUTUBE_API'
        '&channelId=$ID_CANAL'
        '&q=$pesquisa');
    http.Response response = await http.get(uri!);

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      videos =
          dadosJson['items'].map<Video>((map) => Video.fromJson(map)).toList();

    } else {}

    return videos;
  }
}
