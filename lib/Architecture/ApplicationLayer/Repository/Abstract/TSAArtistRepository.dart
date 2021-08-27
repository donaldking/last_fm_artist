import 'package:last_artist/Architecture/ApplicationLayer/Models/Abstract/TSAArtistModel.dart';
import 'package:last_artist/Architecture/DataAccessLayer/Abstract/TSABaseDataAccess.dart';
import 'package:last_artist/Architecture/WebserviceLayer/Abstract/TSAWebservice.dart';

abstract class TSAArtistRepository {
  late TSAWebservice service;
  late TSABaseDataAccess dataAccess;

  Future<List<TSAArtistModel>?> searchArtist({required String artistName});

  Future<TSAArtistModel?> getArtistInfo({required TSAArtistModel artist});
}
