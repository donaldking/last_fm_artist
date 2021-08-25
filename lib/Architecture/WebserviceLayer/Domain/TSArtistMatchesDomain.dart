import 'package:last_artist/Architecture/WebserviceLayer/Domain/TSArtistDomain.dart';

class TSArtistMatchesDomain {
  List<TSArtistDomain>? artistList;

  TSArtistMatchesDomain({this.artistList});

  factory TSArtistMatchesDomain.fromMap(Map map) {
    List<TSArtistDomain> artistList = [];
    if (map["artist"] != null) {
      List artist = map["artist"] as List;
      artistList = artist.map((e) => TSArtistDomain.fromMap(map: e)).toList();
    }
    return TSArtistMatchesDomain(artistList: artistList);
  }
}
