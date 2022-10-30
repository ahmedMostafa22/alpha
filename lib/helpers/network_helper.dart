import 'dart:io';

class NetworkHelper {
  Map<String, String> getHeadersWithToken(String token) =>
      {HttpHeaders.authorizationHeader: 'Bearer $token'};

  Map<String, String> getHeadersWithTokenAndJsonContentType(String token) => {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json'
      };
  Map<String, String> getHeadersWithJsonContentType() =>
      {HttpHeaders.contentTypeHeader: 'application/json'};
}
