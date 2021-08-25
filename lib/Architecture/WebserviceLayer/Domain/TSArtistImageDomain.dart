class TSArtistImageDomain {
  String? text;
  String? size;

  TSArtistImageDomain({this.text, this.size});

  factory TSArtistImageDomain.fromMap({required Map map}) {
    String text = map["#text"] ?? "";
    String size = map["size"] ?? "";

    return TSArtistImageDomain(text: text, size: size);
  }
}
