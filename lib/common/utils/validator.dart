class Validator {
  Validator._();

  static String? validateName(String? value) {
    final condition = RegExp(r"^[A-ZÀ-ÖØ-Þ '.-]+$");
    if(value != null && value.isEmpty) {
      return "Esse campo não pode ser vazio. Digite seu nome.";
    }
    if (value != null && !condition.hasMatch(value)) {
      return "Nome inválido. Digite um novo nome";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final condition = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if(value != null && value.isEmpty) {
      return "Esse campo não pode ser vazio. Digite seu email.";
    }
    if (value != null && !condition.hasMatch(value)) {
      return "E-mail inválido. Digite seu e-mail";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final condition = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
    if(value != null && value.isEmpty) {
      return "Esse campo não pode ser vazio. Digite sua senha.";
    }
    if (value != null && !condition.hasMatch(value)) {
      return "Senha inválida. Digite no formato pedido";
    }
    return null;
  }

  static String? validateConfirmPassword(String? first, second) {
    if (first != second) {
      return "As senhas estão diferentes. Por favor, corrija.";
    }
    return null;
  }
}
