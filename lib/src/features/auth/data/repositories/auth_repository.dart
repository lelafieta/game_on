import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../datasources/i_auth_remote_datasource.dart';

class AuthRepository extends IAuthRepository {
  final IAuthRemoteDataSource authRemoteDataSource;

  AuthRepository({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    try {
      final result = await authRemoteDataSource.isLoggedIn();

      return Right(result);
    } catch (e) {
      return Left(Failure(message: "$e"));
    }
  }

  @override
  Future<Either<Failure, Unit>> login(String email, String password) async {
    try {
      await authRemoteDataSource.login(email, password);
      return const Right(unit);
    } catch (e) {
      return Left(Failure(message: "$e"));
    }
  }
}
