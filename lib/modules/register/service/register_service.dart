import 'package:alpha/enums/request_methods.dart';
import 'package:alpha/helpers/network_helper.dart';
import 'package:alpha/modules/profile/models/user.dart';
import 'package:alpha/network/network_layer.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

class RegisterService {
  Future<Either<Exception, Response>> register(User user) => Api().request(
      'requestUrl',
      RequestMethod.post,
      NetworkHelper().getHeadersWithJsonContentType(),
      body: {});
}
