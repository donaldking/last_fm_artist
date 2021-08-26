import 'package:last_artist/Architecture/ApplicationLayer/Models/Abstract/TSAArtistModel.dart';
import 'package:last_artist/Architecture/DataAccessLayer/Abstract/TSABaseDataAccess.dart';
import 'package:last_artist/Architecture/PersistenceLayer/Abstract/TSAArtistListPersistence.dart';

abstract class TSAArtistDataAccess extends TSABaseDataAccess {
  late TSAArtistListPersistence persistence;

  Future<TSAArtistModel?> getArtistInfo({required String artistName, required String mbid});

  Future<List<TSAArtistModel>?> searchArtist({required String artistName});
}
