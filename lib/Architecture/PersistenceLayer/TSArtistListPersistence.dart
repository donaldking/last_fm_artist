import 'package:last_artist/Architecture/ApplicationLayer/Models/Abstract/TSAArtistModel.dart';
import 'package:last_artist/Architecture/PersistenceLayer/Abstract/TSAArtistListPersistence.dart';
import 'package:last_artist/Support/Error/TSError.dart';

class TSArtistListPersistence implements TSAArtistListPersistence {
  List<TSAArtistModel> _store = List.empty(growable: true);

  @override
  Future<void> create(TSAArtistModel entity) async {
    try {
      if (!_store.contains(entity)) _store.add(entity);
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
  Future<TSAArtistModel?> read(mbid) async {
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
  Future<List<TSAArtistModel>?> readAll() async {
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
  Future<void> update(entity) async {
    try {
      _store.removeWhere(
        (element) => element.mbid == entity.mbid,
      );
      _store.add(entity);
    } catch (error) {
      throw TSError(
        errorType: TSErrorType.persistence,
        message: error.toString(),
      );
    }
  }
}
