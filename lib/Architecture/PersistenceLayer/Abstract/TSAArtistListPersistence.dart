import 'package:last_artist/Architecture/WebserviceLayer/Domain/TSArtistDomain.dart';

abstract class TSAArtistListPersistence {
  Future<void> create(TSArtistDomain domain);

  Future<TSArtistDomain?> read(String mbid);

  Future<List<TSArtistDomain>?> readAll();

  Future<void> update(TSArtistDomain domain);

  Future<void> delete(String mbid);

  Future<void> deleteAll();
}
