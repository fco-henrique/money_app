import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:money_app/common/models/user_model.dart';
import 'package:money_app/features/splash/splash_controller.dart';
import 'package:money_app/features/splash/splash_state.dart';

import '../../mock/mock_classes.dart';

void main() {
  late MockSecureStorage mockSecureStorage;
  late SplashController splashController;
  late UserModel user;

  setUp(() {
    mockSecureStorage = MockSecureStorage();
    splashController = SplashController(mockSecureStorage);
    user = UserModel(
      name: 'User',
      email: 'user@email.com',
      id: '1a2b3c4d5e',
    );
  });

  group("Test Splash Controller", () {
    test('Should update state to UnauthenticatedUser', () async {
      when(() => mockSecureStorage.readOne(key: 'CURRENT_USER'))
          .thenAnswer((_) async => null);

      expect(splashController.state, isInstanceOf<SplashInitialState>());

      await splashController.isUserLogged();

      expect(splashController.state, isInstanceOf<SplashErrorState>());
    });

    test('Should update state to AuthenticatedUser', () async {
      when(() => mockSecureStorage.readOne(key: 'CURRENT_USER'))
          .thenAnswer((_) async => user.toJson());

      expect(splashController.state, isInstanceOf<SplashInitialState>());

      await splashController.isUserLogged();

      expect(splashController.state, isInstanceOf<SplashSuccessState>());
    });
  });
}