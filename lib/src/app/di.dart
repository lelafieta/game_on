import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/cache/i_secure_storage_helper.dart';
import '../core/cache/secure_storage_helper.dart';
import '../features/auth/data/datasources/auth_remote_datasource.dart';
import '../features/auth/data/datasources/i_auth_remote_datasource.dart';
import '../features/auth/data/repositories/auth_repository.dart';
import '../features/auth/domain/repositories/i_auth_repository.dart';
import '../features/auth/domain/usecases/is_logged_in_usecase.dart';
import '../features/auth/domain/usecases/login_usecase.dart';
import '../features/auth/presentation/cubit/auth_cubit.dart';
import '../features/teams/data/datasources/i_team_datasource.dart';
import '../features/teams/data/datasources/team_datasource.dart';
import '../features/teams/data/repositories/team_repository.dart';
import '../features/teams/domain/repositories/i_team_repository.dart';
import '../features/teams/domain/usecases/create_team_usecase.dart';
import '../features/teams/domain/usecases/delete_team_usecase.dart';
import '../features/teams/domain/usecases/get_my_teams_usecase.dart';
import '../features/teams/domain/usecases/get_team_by_id_usecase.dart';
import '../features/teams/domain/usecases/get_teams_usecase.dart';
import '../features/teams/domain/usecases/update_team_usecase.dart';
import '../features/teams/presentation/cubit/team_action_cubit/team_action_cubit.dart';
import '../features/teams/presentation/cubit/team_fetch_cubit/team_fetch_cubit.dart';
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
  sl.registerFactory(() => AuthCubit(
      loginUseCase: sl(), isLoggedInUseCase: sl(), secureStorageHelper: sl()));
  // TEAM
  sl.registerFactory(
      () => TeamActionCubit(createTeamUseCase: sl(), updateTeamUseCase: sl()));
  sl.registerFactory(() => TeamFetchCubit(getMyTeamsUseCase: sl()));
}

void _registerRepositories() {
  // Registre seus repositórios aqui
  // Exemplo: sl.registerLazySingleton(() => YourRepository(sl()));
  sl.registerLazySingleton<IAuthRepository>(
      () => AuthRepository(authRemoteDataSource: sl()));
  // TEAM
  sl.registerLazySingleton<ITeamRepository>(
      () => TeamRepository(teamDatasource: sl()));
}

void _registerDatasources() {
  // Registre seus datasources aqui
  // Exemplo: sl.registerLazySingleton(() => YourDatasource(sl()));

  sl.registerLazySingleton<IAuthRemoteDataSource>(
      () => AuthRemoteDataSource(client: sl()));
  // TEAM
  sl.registerLazySingleton<ITeamRemoteDataSource>(
      () => TeamRemoteDataSource(client: sl()));
}

void _registerUseCases() {
  // Registre seus casos de uso aqui
  // Exemplo: sl.registerLazySingleton(() => YourUseCase(sl()));
  sl.registerLazySingleton(() => LoginUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => IsLoggedInUseCase(authRepository: sl()));
  // TEAM
  sl.registerLazySingleton(() => CreateTeamUseCase(teamRepository: sl()));
  sl.registerLazySingleton(() => UpdateTeamUseCase(teamRepository: sl()));
  sl.registerLazySingleton(() => GetTeamsUseCase(teamRepository: sl()));
  sl.registerLazySingleton(() => GetTeamByIdUseCase(teamRepository: sl()));
  sl.registerLazySingleton(() => GetMyTeamsUseCase(teamRepository: sl()));
  sl.registerLazySingleton(() => DeleteTeamUseCase(teamRepository: sl()));
}

void _registerExternal() {
  // Registre dependências externas aqui
  // Exemplo: sl.registerLazySingleton(() => YourExternalService());

  sl.registerLazySingleton<ISecureStorageHelper>(
      () => SecureStorageHelper(secureStorage: sl()));
  sl.registerLazySingleton(() => const FlutterSecureStorage());
}
