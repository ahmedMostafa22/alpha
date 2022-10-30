import 'package:alpha/modules/profile/models/user.dart';
import 'package:alpha/modules/register/service/register_service.dart';
import 'package:dartz/dartz.dart';

class RegisterRepository {
  Future<Either<Exception, User>> register(User user) => RegisterService()
      .register(user)
      .then((result) => result.fold((e) => left(e), (r) => right(user)));
}
