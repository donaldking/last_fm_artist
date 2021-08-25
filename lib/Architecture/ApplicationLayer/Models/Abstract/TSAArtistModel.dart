import 'package:last_artist/Architecture/ApplicationLayer/Models/Abstract/TSAArtistImageModel.dart';

abstract class TSAArtistModel {
  String? name;
  String? listeners;
  String? mbid;
  String? streamable;
  List<TSAArtistImageModel>? images;
}
