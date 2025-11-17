class Picture {
  final String url;

  const Picture({required this.url});

  factory Picture.fromJson(dynamic json) {
    return Picture(url: json["userImageURL"]);
  }
}
