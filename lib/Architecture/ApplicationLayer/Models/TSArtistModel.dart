import 'package:last_artist/Architecture/ApplicationLayer/Models/Abstract/TSAArtistImageModel.dart';
import 'package:last_artist/Architecture/ApplicationLayer/Models/Abstract/TSAArtistModel.dart';
import 'package:last_artist/Architecture/ApplicationLayer/Models/TSArtistImageModel.dart';
import 'package:last_artist/Architecture/WebserviceLayer/Domain/TSArtistDomain.dart';

class TSArtistModel implements TSAArtistModel {
  @override
  String? name;

  @override
  String? listeners;

  @override
  String? mbid;

  @override
  String? streamable;

  @override
  List<TSAArtistImageModel>? images;

  TSArtistModel({
    required this.name,
    required this.listeners,
    required this.mbid,
    required this.streamable,
    required this.images,
  });

  factory TSArtistModel.fromDomain({required TSArtistDomain domain}) {
    return TSArtistModel(
      name: domain.name,
      listeners: domain.listeners,
      mbid: domain.mbid,
      streamable: domain.streamable,
      images: domain.images?.map((e) => TSArtistImageModel.fromDomain(domain: e)).toList(),
    );
  }
}
