class Video {
  String? _id;
  String? _titulo;
  String? _descricao;
  String? _imagem;
  String? _canal;

  Video({id, titulo, descricao, imagem, canal}) {
    _id = id;
    _titulo = titulo;
    _descricao = descricao;
    _imagem = imagem;
    _canal = canal;
  }

  // SOLUÇÃO OTIMIZADA POIS SÓ UTILIZA UMA INSTÂNCIA DE VÍDEO NA MEMÓRIA
  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json['id']['videoId'],
        titulo: json['snippet']['title'],
        descricao: json['snippet']['description'],
        imagem: json['snippet']['thumbnails']['high']['url'],
        canal: json['snippet']['channelId'],
      );

  /* SOLUÇÃO NÃO OTIMIZADA PARA UM VOLUME GRANDE DE VÍDEOS
  static converterJson(Map<String, dynamic> json) {
    return Video(
      id: json['id']['videoId'],
      titulo: json['snippet']['title'],
      imagem: json['snippet']['thumbnails']['high']['url'],
      canal: json['snippet']['channelId'],
    )
  } */

  String get canal => _canal!;

  set canal(String value) {
    _canal = value;
  }

  String get imagem => _imagem!;

  set imagem(String value) {
    _imagem = value;
  }

  String get descricao => _descricao!;

  set descricao(String value) {
    _descricao = value;
  }

  String get titulo => _titulo!;

  set titulo(String value) {
    _titulo = value;
  }

  String get id => _id!;

  set id(String value) {
    _id = value;
  }
}
