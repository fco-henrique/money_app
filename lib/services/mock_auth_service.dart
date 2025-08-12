import 'package:money_app/common/models/user_model.dart';
import 'package:money_app/services/auth_service.dart';

class MockAuthService implements AuthService {
  @override
  Future signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
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