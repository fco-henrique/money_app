import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:money_app/common/models/user_model.dart';
import 'package:money_app/features/sign_in/sign_in_controller.dart';
import 'package:money_app/features/sign_in/sign_in_state.dart';

import '../../mock/mock_classes.dart';

void main() {
  late MockSecureStorage mockSecureStorage;
  late MockFirebaseAuthService mockFirebaseAuthService;
  late SignInController signInController;
  late UserModel user;
  
  setUp(() {
    mockSecureStorage = MockSecureStorage();
    mockFirebaseAuthService = MockFirebaseAuthService();
    signInController = SignInController(mockFirebaseAuthService, mockSecureStorage);
    user = UserModel(
      name: 'User',
      email: 'user@email.com',
      id: '1a2b3c4d5e',
    );
  });

  group("Test Sign In Controller State", () {
    test("Should update state to SignInStateSuccess", () async {
      when(
        () => mockFirebaseAuthService.signIn(
          email: 'user@email.com',
          password: 'user@123',
        ),
      ).thenAnswer((_) async => user);
      when(
        () => mockSecureStorage.write(
          key: "CURRENT_USER",
          value: any(named: 'value'),
        ),
      ).thenAnswer((_) async => Future.value()); 

      final states = <SignInState>[];
      signInController.addListener(() {
        states.add(signInController.state);
      });

      await signInController.signIn(
        email: 'user@email.com',
        password: 'user@123',
      );

      expect(states[0], isA<SignInLoadingState>());
      expect(states.last, isA<SignInSuccessState>()); 
    });
    test("Should update state to SignInStateError", () async {
      expect(signInController.state, isInstanceOf<SignInInitialState>());

      when(
        () => mockFirebaseAuthService.signIn(
          email: 'user@email.com',
          password: 'user@123',
        ),
      ).thenThrow(Exception());

      await signInController.signIn(
        email: 'user@email.com',
        password: 'user@123',
      );

      expect(signInController.state, isInstanceOf<SignInErrorState>());
    });
  });
  
}