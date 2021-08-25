import 'package:last_artist/Architecture/WebserviceLayer/Resources/Abstract/TSAResource.dart';

abstract class TSAWebservice<T extends TSAResource> {
  Future<dynamic> get({required T resource, Map<String, dynamic>? params});
}
