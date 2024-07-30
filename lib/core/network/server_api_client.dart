import 'dart:convert';

import 'package:flutter_web_docker/core/network/network_info.dart';
import 'package:flutter_web_docker/core/network/server_info.dart';

import '../data/models/response_without_result_model.dart';
import '../utils/transversal.dart';
import 'exception.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ServerApiClient {
  final NetworkInfoRepository networkInfoRepository;
  // final LocalStorageRepository localStorageRepository;

  ServerApiClient({
    required this.networkInfoRepository,
  });

  final Map<String, String> _authHeader = {};

  //Here we can access  to external auth header
  Map<String, String> get authHeader => _authHeader;

  // With tahs method ensured the authorization to the headers
  void setAccessToken({
    required String accessToken,
  }) {
    if (accessToken.isNotEmpty) {
      _authHeader[authHeaderKey] = accessToken;
    }
  }

  void deleteAccessToken() {
    _authHeader.remove(authHeaderKey);
    _authHeader.remove('Content-Type');
  }

  Future<void> _restoreAuthHeaders() async {
    if (_authHeader.isEmpty) {
      // LoginResponseEntity? tokenEntity;
      // try {
      //   tokenEntity = await localStorageRepository.getSecureUserInfoStorage();
      // } catch (e) {
      //   log(e.toString());
      // }
      // if (tokenEntity != null) {
      //   _authHeader[authHeaderKey] = tokenEntity.token;
      // }
      _authHeader['Content-Type'] = "application/json";
    }
  }

  ///method to process the server response
  Future<T> _proccessResponse<T>({
    required http.Response response,
    required Future<T> Function() requestFunc,
  }) async {
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      return response as T;
    } else if (response.statusCode >= 400 && response.statusCode <= 500) {
      var result =
          ResponseWithoutResultModel.fromJson(jsonDecode(response.body));

      throw ServerException(
        message: result.messageResponse.description,
        code: result.messageResponse.code,
      );
    } else if (response.statusCode >= 500) {
      throw ServerException(
          message: "Servicio no disponible. Contacte al administrador");
    } else {
      return response as T;
    }
  }

  /// Method to format the log response
  String _formatResponseLog(http.Response response, {Object? requestBody}) {
    final time = DateTime.now().toUtc().toIso8601String();

    JsonEncoder encoder = const JsonEncoder.withIndent(' ');
    String formattedRequestBody =
        requestBody != null ? encoder.convert(requestBody) : '';

    String formattedBodyJson;

    try {
      final json = jsonDecode(response.body);
      formattedBodyJson = encoder.convert(json);
    } catch (_) {
      formattedBodyJson = response.body;
    }

    return '''
          $time
          Request: ${response.request}${formattedRequestBody.isNotEmpty == true ? '\n  Request body: $formattedRequestBody' : ''}
          Response code: ${response.statusCode}
          Body: $formattedBodyJson
          ''';
  }

  ///Method HTTP GET protocol
  Future<http.Response> get(
    host,
    path,
    serverSchema, {
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
  }) async {
    await _restoreAuthHeaders();

    final url = Uri(
      scheme: serverSchema,
      host: host,
      path: path,
      queryParameters: queryParameters,
    );

    http.Response response;

    setAccessToken(
        accessToken:
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YjA5ZDEyMDljZGNjMGI0MmI0NWQ2MjI1ODE0MzU1NiIsIm5iZiI6MTcyMjA4NDYwOS43MjM0NTgsInN1YiI6IjYxODBhMjk1ZDM4OGFlMDA2MTIyOWY0OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Z9gZT6-3SIf4pBamPWHiF0ZKfzN6uxS-MEh9sFyXJKI');

    try {
      response =
          await http.get(url, headers: _authHeader..addAll(headers ?? {}));
    } catch (_) {
      final check = await networkInfoRepository.hasConnection;

      if (!check) {
        throw ConnectionException();
      }
      rethrow;
    }

    if (kDebugMode) {
      debugPrint(_formatResponseLog(
        response,
      ));
    }

    return _proccessResponse(
      response: response,
      requestFunc: () => get(
        host,
        path,
        serverSchema,
        queryParameters: queryParameters,
        headers: headers,
      ),
    );
  }

  ///Method HTTP POST protocol
  ///
  Future<http.Response> post(
    host,
    path,
    serverScheme, {
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final url = Uri(
      scheme: serverSchema,
      host: host,
      path: path,
      queryParameters: queryParameters,
    );

    final Map<String, String> allHeaders = _authHeader;

    if (headers != null) {
      allHeaders.addAll(headers);
    }
    if (!allHeaders.containsKey('Content-Type')) {
      allHeaders['Content-Type'] = 'application/json';
    }

    http.Response response;

    try {
      if (body == null) {
        response = await http.post(
          url,
          headers: allHeaders,
          encoding: encoding,
        );
      } else {
        response = await http.post(
          url,
          headers: allHeaders,
          body: Transversal().fixJson(jsonEncode(body)),
          encoding: encoding,
        );
      }
    } catch (_) {
      final check = await networkInfoRepository.hasConnection;

      if (!check) {
        throw ConnectionException();
      }
      rethrow;
    }

    if (kDebugMode) {
      debugPrint(_formatResponseLog(
        response,
        requestBody: Transversal().fixJson(jsonEncode(body)),
      ));
    }

    return _proccessResponse(
      response: response,
      requestFunc: () => post(
        host,
        path,
        serverSchema,
        queryParameters: queryParameters,
        headers: headers,
        body: body,
        encoding: encoding,
      ),
    );
  }

  ///Method HTTP put protocol
  ///
  Future<http.Response> put(
    host,
    path,
    serverSchema, {
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final url = Uri(
      scheme: serverSchema,
      host: host,
      path: path,
      queryParameters: queryParameters,
    );
    await _restoreAuthHeaders();

    if (headers != null) {
      _authHeader.addAll(headers);
    }
    if (!_authHeader.containsKey('Content-Type')) {
      _authHeader['Content-Type'] = 'application/json';
    }

    http.Response response;
    final String requestBody = Transversal().fixJson(jsonEncode(body));

    try {
      response = await http.put(
        url,
        headers: _authHeader,
        body: requestBody,
        encoding: encoding,
      );
    } catch (_) {
      final check = await networkInfoRepository.hasConnection;

      if (!check) {
        throw ConnectionException();
      }
      rethrow;
    }

    if (kDebugMode) {
      debugPrint(_formatResponseLog(
        response,
        requestBody: requestBody,
      ));
    }

    return _proccessResponse(
      response: response,
      requestFunc: () => put(
        host,
        path,
        serverSchema,
        queryParameters: queryParameters,
        headers: headers,
        body: body,
        encoding: encoding,
      ),
    );
  }

  ///Method HTTP delete protocol
  ///
  Future<http.Response> delete(
    host,
    path,
    serverSchema, {
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
    Encoding? encoding,
  }) async {
    final url = Uri(
      scheme: serverSchema,
      host: host,
      path: path,
      queryParameters: queryParameters,
    );
    await _restoreAuthHeaders();

    if (headers != null) {
      _authHeader.addAll(headers);
    }
    if (!_authHeader.containsKey('Content-Type')) {
      _authHeader['Content-Type'] = 'application/json';
    }

    http.Response response;

    try {
      response = await http.delete(
        url,
        headers: _authHeader,
        encoding: encoding,
      );
    } catch (_) {
      final check = await networkInfoRepository.hasConnection;

      if (!check) {
        throw ConnectionException();
      }
      rethrow;
    }

    if (kDebugMode) {
      debugPrint(_formatResponseLog(
        response,
      ));
    }

    return _proccessResponse(
      response: response,
      requestFunc: () => delete(
        host,
        path,
        serverSchema,
        queryParameters: queryParameters,
        headers: headers,
        encoding: encoding,
      ),
    );
  }

  ///Method HTTP put protocol
  ///
  Future<http.Response> putUploadFile(
    host,
    path,
    serverSchema,
    Uint8List bytes, {
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final url = Uri(
      scheme: serverSchema,
      host: host,
      path: path,
      queryParameters: queryParameters,
    );
    await _restoreAuthHeaders();

    if (headers != null) {
      _authHeader.addAll(headers);
    }
    if (!_authHeader.containsKey('Content-Type')) {
      _authHeader['Content-Type'] = 'application/json';
    }

    http.Response response;
    final String requestBody = Transversal().fixJson(jsonEncode(body));

    try {
      response = await http.put(
        url,
        headers: _authHeader,
        body: requestBody,
        encoding: encoding,
      );
    } catch (_) {
      final check = await networkInfoRepository.hasConnection;

      if (!check) {
        throw ConnectionException();
      }
      rethrow;
    }

    if (kDebugMode) {
      debugPrint(_formatResponseLog(
        response,
        requestBody: requestBody,
      ));
    }

    return _proccessResponse(
      response: response,
      requestFunc: () => put(
        host,
        path,
        serverSchema,
        queryParameters: queryParameters,
        headers: headers,
        body: body,
        encoding: encoding,
      ),
    );
  }
}
