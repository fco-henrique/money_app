import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:money_app/common/models/user_model.dart';

import '../mock/mock_classes.dart';

void main() {
  late MockFirebaseAuthService mockFirebaseAuthService;
  late UserModel user;

  setUp((){
    mockFirebaseAuthService = MockFirebaseAuthService();
    user = UserModel(
      name: "User", 
      email: "user@email.com", 
      id: "1a2b3c4d5e",
    );
  });

  group("Sign up Tests", () {
      test("Test sign up success", () async {
      when(() => mockFirebaseAuthService.signUp(
        name: "User", 
        email: "user@email.com", 
        password: "User@123",
      )).thenAnswer((_) async => user);

      final result = await mockFirebaseAuthService.signUp(
        name: "User", 
        email: "user@email.com", 
        password: "User@123",
      );

      expect(result, user);
    });

    test("Test sign up fail", () async {
      when(() => mockFirebaseAuthService.signUp(
        name: "User", 
        email: "user@email.com", 
        password: "User@123",
      )).thenThrow(Exception());

      expect(
        () => mockFirebaseAuthService.signUp(
          name: "User", 
          email: "user@email.com", 
          password: "User@123",
        ), 
        throwsException
      );
    });
  });
}