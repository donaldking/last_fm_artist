import 'package:last_artist/Architecture/DataAccessLayer/Abstract/TSAArtistDataAccess.dart';
import 'package:last_artist/Architecture/PersistenceLayer/Abstract/TSABasePersistence.dart';
import 'package:last_artist/Architecture/PersistenceLayer/TSListPersistence.dart';

class TSArtistDataAccess implements TSAArtistDataAccess {
  @override
  TSABasePersistence persistence;

  /// Default instance used by factory method
  static final TSArtistDataAccess _instance = TSArtistDataAccess(persistence: TSListPersistence());

  /// Init
  TSArtistDataAccess({required this.persistence});

  /// Factory
  factory TSArtistDataAccess.withDefaultPersistence() {
    return _instance;
  }

  @override
  create(entity) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  delete(entity) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  read(entity) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  readAll() {
    // TODO: implement readAll
    throw UnimplementedError();
  }

  @override
  update(entity) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
