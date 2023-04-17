import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:goomba/data/data.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  Future<Player?> load() async {
    var user = await _auth.userChanges().first;
    if (user == null) {
      final credential = await _auth.signInAnonymously();
      user = credential.user;
    }

    final doc = await _db.collection('users').doc(user!.uid).get();
    if (!doc.exists) {
      return null;
    }

    return Player.fromJson(doc.data()!);
  }

  Future<Player> register({
    required String nickname,
    required Character character,
  }) async {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception('User is not logged in');
    }

    final reference = _db.collection('users').doc(user.uid);
    final doc = await reference.get();
    if (doc.exists) {
      throw Exception('User already exists');
    }

    final player = Player(
      id: user.uid,
      username: nickname,
      characterId: character.id,
    );

    await reference.set(player.toJson());

    return player;
  }
}
