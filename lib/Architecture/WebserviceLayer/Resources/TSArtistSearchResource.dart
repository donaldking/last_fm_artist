import 'dart:convert';
import 'package:last_artist/Architecture/WebserviceLayer/Domain/TSArtistMatchesDomain.dart';
import 'package:last_artist/Architecture/WebserviceLayer/Resources/Abstract/TSAResource.dart';
import 'package:last_artist/Architecture/WebserviceLayer/TSWebserviceLayerConstants.dart';

class TSArtistSearchResource implements TSAResource {
  @override
  Map<String, dynamic>? body;

  @override
  Encoding encoding = utf8;

  @override
  Map<String, String> headers = kJSONContentType;

  @override
  String path;

  @override
  Future parseData(data) async {
    final json = jsonDecode(data);
    final artistmatches = json["results"]["artistmatches"];
    TSArtistMatchesDomain artistMatchesDomain = TSArtistMatchesDomain.fromMap(artistmatches);
    return artistMatchesDomain.artistList;
  }

  TSArtistSearchResource({
    required this.path,
  });
}
