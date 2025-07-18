import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:game_on/src/features/squads/presentation/cubit/squad_cubit.dart';
import 'package:game_on/src/features/teams/data/datasources/i_starting_lineup_player_datasource.dart';
import 'package:game_on/src/features/teams/data/datasources/starting_lineup_player_datasource.dart';
import 'package:game_on/src/features/teams/domain/repositories/i_starting_lineup_player_repository.dart';
import 'package:game_on/src/features/teams/domain/usecases/create_starting_lineup_players_usecase.dart';
import 'package:game_on/src/features/teams/domain/usecases/delete_squad_team_usecase.dart';
import 'package:game_on/src/features/teams/domain/usecases/get_team_starting_lineup_players_usecase.dart';
import 'package:game_on/src/features/teams/domain/usecases/remove_starting_lineup_player_usecase.dart';
import 'package:game_on/src/features/teams/presentation/cubit/get_team_equipament_cubit/get_team_equipament_cubit.dart';
import 'package:game_on/src/features/teams/presentation/cubit/starting_lineup_player_cubit/starting_lineup_player_cubit.dart';
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
import '../features/players/data/datasources/i_player_datasource.dart';
import '../features/players/data/datasources/player_datasource.dart';
import '../features/players/data/repositories/player_repository.dart';
import '../features/players/domain/repositories/i_player_repository.dart';
import '../features/players/domain/usecases/create_player_usecase.dart';
import '../features/players/domain/usecases/delete_player_usecase.dart';
import '../features/players/domain/usecases/get_player_by_id_usecase.dart';
import '../features/players/domain/usecases/get_players_by_team_usecase.dart';
import '../features/players/domain/usecases/update_player_usecase.dart';
import '../features/players/presentation/cubit/fetch_players_team_cubit/fetch_players_team_cubit.dart';
import '../features/squads/data/datasources/i_squad_datasource.dart';
import '../features/squads/data/datasources/squad_datasource.dart';
import '../features/squads/data/repositories/squad_repository.dart';
import '../features/squads/domain/repositories/squad_repository.dart';
import '../features/squads/domain/usecases/create_squad_usecase.dart';
import '../features/squads/domain/usecases/get_squad_by_game_type_formation_usecase.dart';
import '../features/squads/domain/usecases/get_squads_by_team_usecase.dart';
import '../features/teams/data/datasources/i_team_datasource.dart';
import '../features/teams/data/datasources/team_datasource.dart';
import '../features/teams/data/repositories/starting_lineup_player_repository.dart';
import '../features/teams/data/repositories/team_repository.dart';
import '../features/teams/domain/repositories/i_team_repository.dart';
import '../features/teams/domain/usecases/create_team_usecase.dart';
import '../features/teams/domain/usecases/delete_team_usecase.dart';
import '../features/teams/domain/usecases/get_my_teams_usecase.dart';
import '../features/teams/domain/usecases/get_team_by_id_usecase.dart';
import '../features/teams/domain/usecases/get_team_tactical_formation_usecase.dart';
import '../features/teams/domain/usecases/get_teams_usecase.dart';
import '../features/teams/domain/usecases/update_team_squad_usecase.dart';
import '../features/teams/domain/usecases/update_team_usecase.dart';
import '../features/teams/presentation/cubit/action_team_squad_cubit/action_team_squad_cubit.dart';
import '../features/teams/presentation/cubit/get_one_team_cubit/get_one_team_cubit.dart';
import '../features/teams/presentation/cubit/team_action_cubit/team_action_cubit.dart';
import '../features/teams/presentation/cubit/team_fetch_cubit/team_fetch_cubit.dart';
import '../features/trophies/data/datasources/i_trophy_datasource.dart';
import '../features/trophies/data/datasources/trophy_datasource.dart';
import '../features/trophies/data/repositories/trophy_repository.dart';
import '../features/trophies/domain/repositories/i_trophy_repository.dart';
import '../features/trophies/domain/usecases/create_trophy_usecase.dart';
import '../features/trophies/domain/usecases/delete_trophy_usecase.dart';
import '../features/trophies/domain/usecases/get_trophies_by_team_usecase.dart';
import '../features/trophies/domain/usecases/get_trophies_usecase.dart';
import '../features/trophies/domain/usecases/get_trophy_by_id_usecase.dart';
import '../features/trophies/domain/usecases/update_tropy_usecase.dart';
import '../features/trophies/presentation/cubit/fetch_trophies_team_cubit/fetch_trophies_team_cubit.dart';
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
  sl.registerFactory(() => GetOneTeamCubit(getTeamByIdUseCase: sl()));
  sl.registerFactory(() => GetTeamEquipamentCubit(getTeamByIdUseCase: sl()));

  sl.registerFactory(() => ActionTeamSquadCubit(
      createTeamUseCase: sl(), updateTeamSquadUseCase: sl()));

  //PLAYER
  sl.registerFactory(
      () => FetchPlayersTeamCubit(getPlayersByTeamUseCase: sl()));

  // TROPHY
  sl.registerFactory(
      () => FetchTrophiesTeamCubit(getTrophiesByTeamUseCase: sl()));

  // SQUAD
  sl.registerFactory(() => SquadCubit(
      createSquadUseCase: sl(),
      getSquadsByTeamUseCase: sl(),
      getSquadByGameTypeFormationUseCase: sl()));

  // STARTING LINEUP PLAYERS
  sl.registerFactory(() => StartingLineupPlayerCubit(
      createTeamStartingLineupPlayersUseCase: sl(),
      getTeamStartingLineupPlayersUseCase: sl(),
      removeStartingLineupPlayerUseCase: sl(),
      deleteSquadTeamUseCase: sl()));
}

void _registerRepositories() {
  // Registre seus repositórios aqui
  // Exemplo: sl.registerLazySingleton(() => YourRepository(sl()));
  sl.registerLazySingleton<IAuthRepository>(
      () => AuthRepository(authRemoteDataSource: sl()));
  // TEAM
  sl.registerLazySingleton<ITeamRepository>(
      () => TeamRepository(teamDatasource: sl()));

  //PLAYER
  sl.registerLazySingleton<IPlayerRepository>(
      () => PlayerRepository(playerDataSource: sl()));

  // TROPHY
  sl.registerLazySingleton<ITrophyRepository>(
      () => TrophyRepository(trophyDataSource: sl()));

  // SQUAD
  sl.registerLazySingleton<ISquadRepository>(
      () => SquadRepository(squadDataSource: sl()));

  // STARTING LINEUP PLAYERS
  sl.registerLazySingleton<IStartingLineupPlayerRepository>(() =>
      StartingLineupPlayerRepository(startingLineupPlayerDataSource: sl()));
}

void _registerDatasources() {
  // Registre seus datasources aqui
  // Exemplo: sl.registerLazySingleton(() => YourDatasource(sl()));

  sl.registerLazySingleton<IAuthRemoteDataSource>(
      () => AuthRemoteDataSource(client: sl()));
  // TEAM
  sl.registerLazySingleton<ITeamRemoteDataSource>(
      () => TeamRemoteDataSource(client: sl()));
  // PLAYER
  sl.registerLazySingleton<IPlayerRemoteDataSource>(
      () => PlayerRemoteDataSource(client: sl()));

  // TROPHY
  sl.registerLazySingleton<ITrophyRemoteDataSource>(
      () => TrophyRemoteDataSource(client: sl()));

  // SQUAD
  sl.registerLazySingleton<ISquadRemoteDataSource>(
      () => SquadRemoteDataSource(client: sl()));

  // STARTING LINEUP PLAYERS
  sl.registerLazySingleton<IStartingLineupPlayerRemoteDataSource>(
      () => StartingLineupPlayerRemoteDataSource(client: sl()));
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
  sl.registerLazySingleton(() => UpdateTeamSquadUseCase(teamRepository: sl()));

  // PLAYER
  sl.registerLazySingleton(() => CreatePlayerUseCase(playerRepository: sl()));
  sl.registerLazySingleton(() => DeletePlayerUseCase(playerRepository: sl()));
  sl.registerLazySingleton(() => GetPlayerByIdUseCase(playerRepository: sl()));
  sl.registerLazySingleton(
      () => GetPlayersByTeamUseCase(playerRepository: sl()));
  sl.registerLazySingleton(() => UpdatePlayerUseCase(playerRepository: sl()));
  sl.registerLazySingleton(
      () => GetTeamTacticalFormationUseCase(teamRepository: sl()));

  // TROPHY
  sl.registerLazySingleton(() => CreateTrophyUseCase(trophyRepository: sl()));
  sl.registerLazySingleton(() => DeleteTrophyUseCase(trophyRepository: sl()));
  sl.registerLazySingleton(
      () => GetTrophiesByTeamUseCase(trophyRepository: sl()));
  sl.registerLazySingleton(() => GetTrophiesUseCase(trophyRepository: sl()));
  sl.registerLazySingleton(() => GetTrophyByIdUseCase(trophyRepository: sl()));
  sl.registerLazySingleton(() => UpdateTrophyUseCase(trophyRepository: sl()));

  // SQUAD
  sl.registerLazySingleton(() => CreateSquadUseCase(squadRepository: sl()));
  sl.registerLazySingleton(() => GetSquadsByTeamUseCase(squadRepository: sl()));
  sl.registerLazySingleton(
      () => GetSquadByGameTypeFormationUseCase(squadRepository: sl()));

  // STARTING LINEUP PLAYERS
  sl.registerLazySingleton(() => GetTeamStartingLineupPlayersUseCase(
      startingLineupPlayerRepository: sl()));
  sl.registerLazySingleton(() => CreateTeamStartingLineupPlayersUseCase(
      startingLineupPlayerRepository: sl()));
  sl.registerLazySingleton(() =>
      RemoveStartingLineupPlayerUseCase(startingLineupPlayerRepository: sl()));

  sl.registerLazySingleton(
      () => DeleteSquadTeamUseCase(startingLineupPlayerRepository: sl()));
}

void _registerExternal() {
  // Registre dependências externas aqui
  // Exemplo: sl.registerLazySingleton(() => YourExternalService());

  sl.registerLazySingleton<ISecureStorageHelper>(
      () => SecureStorageHelper(secureStorage: sl()));
  sl.registerLazySingleton(() => const FlutterSecureStorage());
}
