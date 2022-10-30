import 'package:alpha/enums/request_methods.dart';
import 'package:alpha/helpers/network_helper.dart';
import 'package:alpha/network/network_layer.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

class LoginService {
  Future<Either<Exception, Response>> login(String username, String password) =>
      Api().request('requestUrl', RequestMethod.post,
          NetworkHelper().getHeadersWithJsonContentType(),
          body: {'username': username, 'password': password});
}
