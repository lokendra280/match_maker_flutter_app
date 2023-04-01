import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthServices {
  Future<String> login(String email, String password) async {
    return Future.delayed(const Duration(microseconds: 1000))
        .then((onValue) => 'authToken');
  }
}

final authServicesProvider = Provider<AuthServices>((ref) => AuthServices());
