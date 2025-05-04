// domain/repositories/auth_repository.dart
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class IAuthRepository {
  Future<Either<Failure, Unit>> login(String email, String password);
  Future<Either<Failure, bool>> isLoggedIn();
}
