import 'package:money_app/common/models/user_model.dart';
import 'package:money_app/services/auth_service.dart';

class MockAuthService implements AuthService {
  @override
  Future<UserModel> signIn({required String email, required String password}) async {
    await Future.delayed(Duration(seconds: 2));
    try {

      if (password.startsWith("123")) {
        throw Exception();
      }

      return UserModel(email.hashCode, email, password);
    } catch (e) {
      if (password.startsWith("123")) {
        throw "Erro ao logar, tente novamente.";
      }
      throw "Não foi possivel logar. Tente novamente mais tarde";
    }
  }

  @override
  Future<UserModel> signUp({String? name, required String email, required String password}) async {
    await Future.delayed(Duration(seconds: 2));
    try {

      if (password.startsWith("123")) {
        throw Exception();
      }

      return UserModel(email.hashCode, name, email, password);
    } catch (e) {
      if (password.startsWith("123")) {
        throw "Senha insegura, tente outra.";
      }
      throw "não foi possivel criar a conta. Tente novamente mais tarde";
    }
  }

}