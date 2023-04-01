import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/auth_services.dart';

class AuthRepositiry {
  final AuthServices _authServices;
  AuthRepositiry(this._authServices);
  Future<String> login(String email, String password) async {
    return _authServices.login(email, password);
  }
}

final authRepositoryProvider = Provider<AuthRepositiry>((ref) {
  return AuthRepositiry(ref.read(authServicesProvider));
});
