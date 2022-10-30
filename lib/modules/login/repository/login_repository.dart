import 'package:alpha/modules/login/services/login_service.dart';
import 'package:dartz/dartz.dart';

class LoginRepository {
  Future<Either<Exception, bool>> login(String username, String password) =>
      LoginService()
          .login(username, password)
          .then((result) => result.fold((e) => left(e), (r) {
                return right(true);
              }));
}
