import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:goomba/core/core.dart';
import 'package:goomba/data/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  AuthService() {
    _auth.idTokenChanges().listen((user) async {
      final preferences = await SharedPreferences.getInstance();
      if (user == null) {
        await preferences.remove('token');
      } else {
        final token = await user.getIdToken();
        await preferences.setString('token', token);
      }
    });
  }

  Future<Player?> load() async {
    var user = await _auth.userChanges().first;
    if (user == null) {
      final credential = await _auth.signInAnonymously();
      user = credential.user;
    }

    final token = await user?.getIdToken(true);
    final response = await http.get(
      'api/auth',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );

    final data = response.data;
    if (data == null) {
      return null;
    }

    return Player.fromJson(data);
  }

  Future<Player> register({
    required String name,
    required String username,
    required Character character,
  }) async {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception('User is not logged in');
    }

    final response = await http.post('/api/auth', data: {
      'name': name,
      'username': username,
      'characterId': character.id,
    });
    return Player.fromJson(response.data);
  }
}
