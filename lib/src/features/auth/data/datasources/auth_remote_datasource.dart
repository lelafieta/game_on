import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'i_auth_remote_datasource.dart';

class AuthRemoteDataSource extends IAuthRemoteDataSource {
  final SupabaseClient client;

  AuthRemoteDataSource({required this.client});

  @override
  Future<bool> isLoggedIn() async {
    final session = client.auth.currentSession;
    return session != null;
  }

  @override
  Future<Unit> login(String email, String password) async {
    try {
      final result = await client.auth
          .signInWithPassword(email: email, password: password);
      if (result.user != null) {
        return unit;
      }
      throw Exception('Login failed:');
    } catch (e) {
      rethrow;
    }
  }
}
