import 'package:mocktail/mocktail.dart';
import 'package:money_app/services/auth_service.dart';
import 'package:money_app/services/secure_storage.dart';

class MockFirebaseAuthService extends Mock implements AuthService{}

class MockSecureStorage extends Mock implements SecureStorage {}