import 'package:last_artist/Architecture/ApplicationLayer/Models/Abstract/TSAArtistModel.dart';

abstract class TSAArtistListPersistence {
  Future<void> create(TSAArtistModel entity);
  Future<TSAArtistModel?> read(String mbid);
  Future<List<TSAArtistModel>?> readAll();
  Future<void> update(TSAArtistModel entity);
  Future<void> delete(String mbid);
  Future<void> deleteAll();
}
