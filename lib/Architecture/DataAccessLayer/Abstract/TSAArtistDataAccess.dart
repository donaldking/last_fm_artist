import 'package:last_artist/Architecture/DataAccessLayer/Abstract/TSABaseDataAccess.dart';
import 'package:last_artist/Architecture/PersistenceLayer/Abstract/TSAArtistListPersistence.dart';

abstract class TSAArtistDataAccess extends TSABaseDataAccess {
  late TSAArtistListPersistence persistence;
}
