import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:last_artist/Architecture/WebserviceLayer/Abstract/TSAWebservice.dart';
import 'package:last_artist/Architecture/WebserviceLayer/Resources/Abstract/TSAResource.dart';
import 'package:last_artist/Architecture/WebserviceLayer/TSWebserviceLayerConstants.dart';
import 'package:last_artist/Support/Error/TSError.dart';

class TSWebservice implements TSAWebservice {
  late String _url;

  @override
  Future get({required TSAResource resource, Map<String, dynamic>? params}) async {
    _url = kBaseURL + resource.path;
    if (params != null) {
      if (params.isNotEmpty) {
        _url = kBaseURL + resource.path + '${_paramsToString(params: params)}';
      }
    }
    debugPrint('GET URL - $_url');
    debugPrint('GET HEADERS - ${resource.headers}');
    final response = await http.get(
      Uri.parse(_url),
      headers: resource.headers,
    );

    try {
      var result = await _handleResponse(response: response, resource: resource);
      return result;
    } catch (error) {
      throw error;
    }
  }

  /// Private methods
  Future _handleResponse({required http.Response response, required resource}) async {
    try {
      final Map<bool, TSError?> validatedResponse = _validateResponse(response: response);
      if (validatedResponse.keys.first) {
        final parsedResponse = await resource.parseData(response.body);
        return parsedResponse;
      } else {
        throw validatedResponse.values.first ?? "Webservice error";
      }
    } catch (error) {
      throw error;
    }
  }

  Map<bool, TSError?> _validateResponse({
    required Response response,
  }) {
    if (response.statusCode >= 200 && response.statusCode <= 399) {
      return {true: null};
    } else if (response.statusCode == 400) {
      return {
        false: TSError(
          errorType: TSErrorType.webservice,
          message: response.statusCode.toString(),
        )
      };
    } else if (response.statusCode == 401) {
      return {
        false: TSError(
          errorType: TSErrorType.webservice,
          message: response.statusCode.toString(),
        ),
      };
    } else if (response.statusCode >= 402 && response.statusCode <= 499) {
      return {
        false: TSError(
          errorType: TSErrorType.webservice,
          message: response.statusCode.toString(),
        ),
      };
    } else if (response.statusCode >= 500) {
      return {
        false: TSError(
          errorType: TSErrorType.webservice,
          message: response.statusCode.toString(),
        ),
      };
    } else {
      return {
        false: TSError(
          errorType: TSErrorType.webservice,
          message: response.statusCode.toString(),
        ),
      };
    }
  }

  String _paramsToString({required Map params}) {
    String string = "&";
    params.forEach((key, value) {
      string += '${Uri.encodeFull(key)}=${Uri.encodeFull(value)}&';
    });
    string = string.substring(0, string.length - 1);
    return string;
  }
}
