import 'package:last_artist/Architecture/PersistenceLayer/Abstract/TSAArtistListPersistence.dart';
import 'package:last_artist/Architecture/WebserviceLayer/Domain/TSArtistDomain.dart';
import 'package:last_artist/Support/Error/TSError.dart';

class TSArtistListPersistence implements TSAArtistListPersistence {
  List<TSArtistDomain> _store = List.empty(growable: true);

  @override
  Future<void> create(TSArtistDomain domain) async {
    try {
      if (!_store.contains(domain)) _store.add(domain);
    } catch (error) {
      throw TSError(
        errorType: TSErrorType.persistence,
        message: error.toString(),
      );
    }
  }

  @override
  Future<void> delete(mbid) async {
    try {
      return _store.removeWhere(
        (element) => element.mbid == mbid,
      );
    } catch (error) {
      throw TSError(
        errorType: TSErrorType.persistence,
        message: error.toString(),
      );
    }
  }

  @override
  Future<void> deleteAll() async {
    try {
      return _store.clear();
    } catch (error) {
      throw TSError(
        errorType: TSErrorType.persistence,
        message: error.toString(),
      );
    }
  }

  @override
  Future<TSArtistDomain?> read(mbid) async {
    try {
      return _store.firstWhere(
        (element) => element.mbid == mbid,
      );
    } catch (error) {
      throw TSError(
        errorType: TSErrorType.persistence,
        message: error.toString(),
      );
    }
  }

  @override
  Future<List<TSArtistDomain>?> readAll() async {
    try {
      _store.sort((a, b) => a.mbid?.compareTo(b.mbid ?? "") ?? 0);
      return _store;
    } catch (error) {
      throw TSError(
        errorType: TSErrorType.persistence,
        message: error.toString(),
      );
    }
  }

  @override
  Future<void> update(TSArtistDomain domain) async {
    try {
      _store.removeWhere(
        (element) => element.mbid == domain.mbid,
      );
      _store.add(domain);
    } catch (error) {
      throw TSError(
        errorType: TSErrorType.persistence,
        message: error.toString(),
      );
    }
  }
}
