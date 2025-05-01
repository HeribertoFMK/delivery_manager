import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../utils/logger.dart'; // ✅ Correto para o path relativo

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Login com email e senha
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      logger.i('Tentando login com Email: $email | Senha: $password');
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e, s) {
      logger.e('Erro ao fazer login com email', error: e, stackTrace: s);
      return null;
    }
  }

  // Login com Google
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      logger.i('Login com Google bem-sucedido: ${userCredential.user?.email}');
      return userCredential.user;
    } catch (e, s) {
      logger.e('Erro ao fazer login com Google', error: e, stackTrace: s);
      return null;
    }
  }
}
