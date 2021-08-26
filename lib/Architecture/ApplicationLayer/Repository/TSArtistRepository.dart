import 'package:flutter/foundation.dart';
import 'package:last_artist/Architecture/ApplicationLayer/Models/Abstract/TSAArtistModel.dart';
import 'package:last_artist/Architecture/ApplicationLayer/Models/TSArtistModel.dart';
import 'package:last_artist/Architecture/ApplicationLayer/Repository/Abstract/TSAArtistRepository.dart';
import 'package:last_artist/Architecture/DataAccessLayer/Abstract/TSABaseDataAccess.dart';
import 'package:last_artist/Architecture/DataAccessLayer/TSArtistDataAccess.dart';
import 'package:last_artist/Architecture/PersistenceLayer/TSArtistListPersistence.dart';
import 'package:last_artist/Architecture/WebserviceLayer/Abstract/TSAWebservice.dart';
import 'package:last_artist/Architecture/WebserviceLayer/Domain/TSArtistDomain.dart';
import 'package:last_artist/Architecture/WebserviceLayer/Generic/TSWebservice.dart';
import 'package:last_artist/Architecture/WebserviceLayer/Resources/Abstract/TSAResource.dart';
import 'package:last_artist/Architecture/WebserviceLayer/Resources/TSArtistSearchResource.dart';
import 'package:last_artist/Architecture/WebserviceLayer/TSWebserviceLayerConstants.dart';

class TSArtistRepository implements TSAArtistRepository {
  @override
  TSABaseDataAccess dataAccess;

  @override
  TSAWebservice<TSAResource> service;

  static TSArtistRepository _instance = TSArtistRepository(
    dataAccess: TSArtistDataAccess(persistence: TSArtistListPersistence()),
    service: TSWebservice(),
  );

  TSArtistRepository({
    required this.service,
    required this.dataAccess,
  });

  factory TSArtistRepository.defaultRepository() {
    return _instance;
  }

  @override
  Future<TSAArtistModel?> getArtistInfo({required String mbid}) async {
    /// TODO: Change this to get artist info
    return await dataAccess.read(mbid);
  }

  @override
  Future<List<TSAArtistModel>?> searchArtist({required String artistName}) async {
    /// TODO: Change this to search artist and move to data access
    TSArtistSearchResource resource = TSArtistSearchResource(path: kArtistSearchEndpoint);
    Map<String, dynamic> params = {"artist": artistName};
    List<TSArtistDomain>? artistList = await TSWebservice().get(resource: resource, params: params);
    return artistList?.map((e) => TSArtistModel.fromDomain(domain: e)).toList();
  }
}
