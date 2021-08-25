import 'package:last_artist/Architecture/PersistenceLayer/Abstract/TSABasePersistence.dart';

class TSListPersistence implements TSABasePersistence {
  List _store = List.empty(growable: true);

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
