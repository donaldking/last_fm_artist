import 'package:last_artist/Architecture/ApplicationLayer/Models/Abstract/TSAArtistModel.dart';
import 'package:last_artist/Architecture/ApplicationLayer/Models/TSArtistModel.dart';
import 'package:last_artist/Architecture/DataAccessLayer/Abstract/TSAArtistDataAccess.dart';
import 'package:last_artist/Architecture/PersistenceLayer/Abstract/TSAArtistListPersistence.dart';
import 'package:last_artist/Architecture/PersistenceLayer/TSArtistListPersistence.dart';
import 'package:last_artist/Architecture/WebserviceLayer/Domain/TSArtistDomain.dart';
import 'package:last_artist/Architecture/WebserviceLayer/Generic/TSWebservice.dart';
import 'package:last_artist/Architecture/WebserviceLayer/Resources/TSArtistSearchResource.dart';
import 'package:last_artist/Architecture/WebserviceLayer/TSWebserviceLayerConstants.dart';

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
  Future<void> create(domain) async {
    await persistence.create(domain);
  }

  @override
  Future<void> delete(id) async {
    await persistence.delete(id);
  }

  @override
  Future<void> deleteAll() async {
    await persistence.deleteAll();
  }

  @override
  Future<TSAArtistModel?> read(id) async {
    TSArtistDomain? domain = await persistence.read(id);
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
  Future<void> update(domain) async {
    await persistence.update(domain);
  }

  @override
  Future<TSAArtistModel?> getArtistInfo({required String artistName, required String mbid}) {
    // TODO: implement getInfo
    throw UnimplementedError();
  }

  @override
  Future<List<TSAArtistModel>?> searchArtist({required String artistName}) async {
    TSArtistSearchResource resource = TSArtistSearchResource(path: kArtistSearchEndpoint);
    Map<String, dynamic> params = {"artist": artistName};
    List<TSArtistDomain>? artistList = await TSWebservice().get(resource: resource, params: params);

    return artistList?.map((e) => TSArtistModel.fromDomain(domain: e)).toList();
  }
}
