import 'package:last_artist/Architecture/WebserviceLayer/Domain/TSArtistImageDomain.dart';

class TSArtistDomain {
  String? name;
  String? listeners;
  String? mbid;
  String? url;
  String? streamable;
  List<TSArtistImageDomain>? images;

  TSArtistDomain({
    this.name,
    this.listeners,
    this.mbid,
    this.url,
    this.streamable,
    this.images,
  });

  factory TSArtistDomain.fromMap({required Map map}) {
    String name = map["name"] ?? "";
    String listeners = map["listeners"] ?? "";
    String mbid = map["mbid"] ?? "";
    String url = map["url"] ?? "";
    String streamable = map["streamable"] ?? "";
    List<TSArtistImageDomain> images = [];
    if (map["image"] != null) {
      List imageList = map["image"] as List;
      images = imageList.map((e) => TSArtistImageDomain.fromMap(map: e)).toList();
    }

    return TSArtistDomain(
      name: name,
      listeners: listeners,
      mbid: mbid,
      url: url,
      streamable: streamable,
      images: images,
    );
  }
}
