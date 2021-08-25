import 'package:last_artist/Architecture/DataAccessLayer/Abstract/TSABaseDataAccess.dart';
import 'package:last_artist/Architecture/PersistenceLayer/Abstract/TSABasePersistence.dart';

abstract class TSAArtistDataAccess extends TSABaseDataAccess {
  late TSABasePersistence persistence;
}
