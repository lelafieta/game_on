import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecases.dart';
import '../entities/login_entity.dart';
import '../repositories/i_auth_repository.dart';

class LoginUseCase extends BaseUseCases<Unit, LoginEntity> {
  final IAuthRepository authRepository;

  LoginUseCase({required this.authRepository});
  @override
  Future<Either<Failure, Unit>> call(LoginEntity params) async {
    return await authRepository.login(params.email, params.password);
  }
}
