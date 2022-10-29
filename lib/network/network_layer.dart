import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../Enums/request_methods.dart';
import '../Exceptions/exceptions.dart';

class Api {
  final Duration _timeOut = const Duration(minutes: 1);

  Future<dynamic> request(String requestUrl, RequestMethod requestMethod,
      Map<String, String> headers,
      {Map<String, dynamic> body = const {}}) async {
    try {
      final DateTime startTime = DateTime.now();
      final Uri uri = Uri.parse(requestUrl);
      late Response response;
      switch (requestMethod) {
        case RequestMethod.get:
          response = await _get(uri, headers);
          break;
        case RequestMethod.post:
          response = await _post(uri, headers, body: body);
          break;
        case RequestMethod.patch:
          response = await _patch(uri, headers, body: body);
          break;
        case RequestMethod.put:
          response = await _put(uri, headers, body: body);
          break;
        case RequestMethod.delete:
          response = await _delete(uri, headers, body: body);
          break;
        case RequestMethod.postMultiPart:
          StreamedResponse streamedResponse = (await _postMultipart(
              uri, headers,
              body: Map<String, String>.from(body)));
          response = Response(await streamedResponse.stream.bytesToString(),
              streamedResponse.statusCode);
          break;
        case RequestMethod.putMultiPart:
          StreamedResponse streamedResponse =
              (await _putMultipart(uri, headers, body: body));
          response = Response(await streamedResponse.stream.bytesToString(),
              streamedResponse.statusCode);
          break;
      }
      final DateTime endTime = DateTime.now();
      print('=============================');
      print(requestUrl +
          ' executed in ' +
          endTime.difference(startTime).inMilliseconds.toString() +
          ' milliseconds');
      print(body);
      print(response.statusCode);
      print(response.body);
      print(headers.toString());
      print('=============================');
      if (response.statusCode == 401) {
        throw AppExceptions.authorizationException;
      } else if (response.statusCode >= 500) {
        throw AppExceptions.internalServerError;
      } else if (response.statusCode < 500 && response.statusCode > 399) {
        String errorMessage = json.decode(response.body)['message'] ?? 'NA';
        throw errorMessage == 'NA'
            ? AppExceptions.defaultException
            : Exception(errorMessage);
      } else if (response.statusCode > 199 && response.statusCode < 300) {
        return response;
      } else {
        throw AppExceptions.defaultException;
      }
    } on SocketException catch (_) {
      throw AppExceptions.networkError;
    } on TimeoutException catch (_) {
      throw AppExceptions.timeOutException;
    } on Exception catch (_) {
      rethrow;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<Response> _get(Uri uri, Map<String, String> headers) =>
      get(uri, headers: headers).timeout(_timeOut);

  Future<Response> _patch(Uri uri, Map<String, String> headers,
          {Map<String, dynamic> body = const {}}) =>
      patch(uri, headers: headers, body: json.encode(body)).timeout(_timeOut);

  Future<Response> _put(Uri uri, Map<String, String> headers,
          {Map<String, dynamic> body = const {}}) =>
      put(uri, headers: headers, body: json.encode(body)).timeout(_timeOut);

  Future<Response> _post(Uri uri, Map<String, String> headers,
          {Map<String, dynamic> body = const {}}) =>
      post(uri, headers: headers, body: json.encode(body)).timeout(_timeOut);

  Future<Response> _delete(Uri uri, Map<String, String> header,
          {Map<String, dynamic> body = const {}}) =>
      delete(uri, headers: header, body: json.encode(body)).timeout(_timeOut);

  Future<StreamedResponse> _postMultipart(Uri uri, Map<String, String> header,
      {Map<String, String> body = const {}}) async {
    MultipartRequest request = MultipartRequest('POST', uri);
    request.files.add(
        await MultipartFile.fromPath('ProfileImage', body['ProfileImage']!));
    request.fields.addAll(body);
    return request.send().timeout(_timeOut);
  }

  Future<StreamedResponse> _putMultipart(Uri uri, Map<String, String> headers,
      {Map<String, dynamic> body = const {}}) async {
    MultipartRequest request = MultipartRequest('PUT', uri);
    if (body.values.first is List<String>) {
      for (var s in (body.values.first as List<String>)) {
        request.files.add(MultipartFile.fromString(body.keys.first, s));
      }
    } else {
      request.fields.addAll(Map<String, String>.from(body));
    }
    request.headers.addAll(headers);
    return request.send().timeout(_timeOut);
  }
}
