class WebtoonModel {
  final String title, thumb, id;

  //named constructor 사용하여, 초기화 진행.
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
