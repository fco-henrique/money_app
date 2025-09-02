import 'package:get_it/get_it.dart';
import 'package:money_app/features/home/home_controller.dart';
import 'package:money_app/features/sign_in/sign_in_controller.dart';
import 'package:money_app/features/sign_up/sign_up_controller.dart';
import 'package:money_app/features/splash/splash_controller.dart';
import 'package:money_app/repositories/transaction_repository.dart';
import 'package:money_app/services/auth_service.dart';
import 'package:money_app/services/firebase_auth_service.dart';
import 'package:money_app/services/secure_storage.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerLazySingleton<AuthService>(() => FirebaseAuthService());
  locator.registerLazySingleton<HomeController>(() => HomeController(locator.get<TransactionRepository>()));

  locator.registerFactory<SplashController>(() => SplashController(const SecureStorage()));
  locator.registerFactory<SignInController>(() => SignInController(locator.get<AuthService>(), locator.get<SecureStorage>()));
  locator.registerFactory<SignUpController>(() => SignUpController(locator.get<AuthService>(), const SecureStorage()));
  locator.registerFactory<TransactionRepository>(() => TransactionRepositoryImpl());
}