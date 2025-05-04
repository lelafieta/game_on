import 'package:dartz/dartz.dart';

abstract class IAuthRemoteDataSource {
  Future<Unit> login(String email, String password);
  Future<bool> isLoggedIn();
}
