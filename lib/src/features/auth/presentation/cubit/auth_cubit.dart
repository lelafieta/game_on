import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_on/src/features/auth/domain/entities/login_entity.dart';
import 'package:game_on/src/features/auth/domain/usecases/is_logged_in_usecase.dart';
import 'package:game_on/src/features/auth/domain/usecases/login_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final IsLoggedInUseCase isLoggedInUseCase;

  AuthCubit({required this.loginUseCase, required this.isLoggedInUseCase})
      : super(AuthInitial());

  Future<void> login(LoginEntity params) async {
    emit(AuthLoading());
    final result = await loginUseCase.call(params);

    result.fold((l) => emit(AuthError(message: l.message)),
        (r) => emit(AuthAuthenticated()));
  }
}
