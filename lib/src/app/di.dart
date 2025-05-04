import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  await _initSupabase();
  _registerCubits();
  _registerRepositories();
  _registerIRepositories();
  _registerDatasources();
  _registerIDatasources();
  _registerUseCases();
  _registerExternal();
}

Future<void> _initSupabase() async {
  await Supabase.initialize(
    url: 'https://your-supabase-url.supabase.co',
    anonKey: 'your-anon-key',
  );
  final supabase = Supabase.instance.client;
  sl.registerLazySingleton(() => supabase);
}

void _registerCubits() {
  // Registre seus Cubits aqui
  // Exemplo: sl.registerFactory(() => YourCubit(sl()));
}

void _registerIRepositories() {
  // Registre suas interfaces de repositórios aqui
  // Exemplo: sl.registerLazySingleton<IYourRepository>(() => YourRepository(sl()));
}

void _registerRepositories() {
  // Registre seus repositórios aqui
  // Exemplo: sl.registerLazySingleton(() => YourRepository(sl()));
}

void _registerIDatasources() {
  // Registre suas interfaces de datasources aqui
  // Exemplo: sl.registerLazySingleton<IYourDatasource>(() => YourDatasource(sl()));
}

void _registerDatasources() {
  // Registre seus datasources aqui
  // Exemplo: sl.registerLazySingleton(() => YourDatasource(sl()));
}

void _registerUseCases() {
  // Registre seus casos de uso aqui
  // Exemplo: sl.registerLazySingleton(() => YourUseCase(sl()));
}

void _registerExternal() {
  // Registre dependências externas aqui
  // Exemplo: sl.registerLazySingleton(() => YourExternalService());
}
