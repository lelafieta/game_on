import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:game_on/src/features/auth/domain/usecases/is_logged_in_usecase.dart';
import 'package:game_on/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../features/auth/data/datasources/auth_remote_datasource.dart';
import '../features/auth/data/datasources/i_auth_remote_datasource.dart';
import '../features/auth/data/repositories/auth_repository.dart';
import '../features/auth/domain/repositories/i_auth_repository.dart';
import '../features/auth/presentation/cubit/auth_cubit.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

GetIt sl = GetIt.instance;

Future<void> init() async {
  await _initSupabase();
  _registerCubits();
  _registerRepositories();
  _registerDatasources();
  _registerUseCases();
  _registerExternal();
}

Future<void> _initSupabase() async {
  final supabaseUrl = dotenv.env["SUPABASE_URL"];
  final supabaseAnon = dotenv.env["SUPABASE_ANON"];
  await Supabase.initialize(
    url: supabaseUrl!,
    anonKey: supabaseAnon!,
  );
  final supabase = Supabase.instance.client;
  sl.registerLazySingleton(() => supabase);
}

void _registerCubits() {
  // Registre seus Cubits aqui
  // Exemplo: sl.registerFactory(() => YourCubit(sl()));
  sl.registerFactory(
      () => AuthCubit(loginUseCase: sl(), isLoggedInUseCase: sl()));
}

void _registerRepositories() {
  // Registre seus repositórios aqui
  // Exemplo: sl.registerLazySingleton(() => YourRepository(sl()));
  sl.registerLazySingleton<IAuthRepository>(
      () => AuthRepository(authRemoteDataSource: sl()));
}

void _registerDatasources() {
  // Registre seus datasources aqui
  // Exemplo: sl.registerLazySingleton(() => YourDatasource(sl()));

  sl.registerLazySingleton<IAuthRemoteDataSource>(
      () => AuthRemoteDataSource(client: sl()));
}

void _registerUseCases() {
  // Registre seus casos de uso aqui
  // Exemplo: sl.registerLazySingleton(() => YourUseCase(sl()));
  sl.registerLazySingleton(() => LoginUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => IsLoggedInUseCase(authRepository: sl()));
}

void _registerExternal() {
  // Registre dependências externas aqui
  // Exemplo: sl.registerLazySingleton(() => YourExternalService());
}
