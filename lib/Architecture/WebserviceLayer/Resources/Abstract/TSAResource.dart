import 'dart:convert';

abstract class TSAResource {
  late Map<String, String> headers;
  late Map<String, dynamic>? body;
  late String path;
  late Encoding encoding;
  Future<dynamic> parseData(dynamic data);
}
