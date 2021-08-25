import 'package:last_artist/Architecture/ApplicationLayer/Models/Abstract/TSAArtistImageModel.dart';
import 'package:last_artist/Architecture/WebserviceLayer/Domain/TSArtistImageDomain.dart';
import 'package:last_artist/Architecture/WebserviceLayer/Domain/TSArtistMatchesDomain.dart';

class TSArtistImageModel implements TSAArtistImageModel {
  @override
  String? url;

  @override
  String? size;

  TSArtistImageModel({required this.url, required this.size});

  factory TSArtistImageModel.fromDomain({required TSArtistImageDomain domain}) {
    return TSArtistImageModel(url: domain.text, size: domain.size);
  }
}
