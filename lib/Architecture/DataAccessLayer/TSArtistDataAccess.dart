import 'package:last_artist/Architecture/ApplicationLayer/Models/Abstract/TSAArtistModel.dart';
import 'package:last_artist/Architecture/ApplicationLayer/Models/TSArtistModel.dart';
import 'package:last_artist/Architecture/DataAccessLayer/Abstract/TSAArtistDataAccess.dart';
import 'package:last_artist/Architecture/PersistenceLayer/Abstract/TSAArtistListPersistence.dart';
import 'package:last_artist/Architecture/PersistenceLayer/TSArtistListPersistence.dart';
import 'package:last_artist/Architecture/WebserviceLayer/Domain/TSArtistDomain.dart';

class TSArtistDataAccess implements TSAArtistDataAccess {
  @override
  TSAArtistListPersistence persistence;

  /// Default instance used by factory method
  static final TSArtistDataAccess _instance = TSArtistDataAccess(persistence: TSArtistListPersistence());

  /// Init
  TSArtistDataAccess({required this.persistence});

  /// Factory
  factory TSArtistDataAccess.withDefaultPersistence() {
    return _instance;
  }

  @override
  Future<void> create(entity) async {
    await persistence.create(entity);
  }

  @override
  Future<void> delete(entity) async {
    await persistence.delete(entity);
  }

  @override
  Future<void> deleteAll() async {
    await persistence.deleteAll();
  }

  @override
  Future<TSAArtistModel?> read(entity) async {
    TSArtistDomain? domain = await persistence.read(entity);
    if (domain != null)
      return TSArtistModel.fromDomain(domain: domain);
    else
      return null;
  }

  @override
  Future<List<TSAArtistModel>?> readAll() async {
    List<TSArtistDomain>? domain = await persistence.readAll();
    if (domain != null)
      return domain.map((e) => TSArtistModel.fromDomain(domain: e)).toList();
    else
      return null;
  }

  @override
  Future<void> update(entity) async {
    await persistence.update(entity);
  }
}
