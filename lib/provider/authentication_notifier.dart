import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authNotifierProvider = ChangeNotifierProvider<AuthNotifier>((ref) => AuthNotifier());

class AuthNotifier extends ChangeNotifier {
  bool _loggedIn = false;

  bool get isLoggedIn => _loggedIn;

  void logIn() {
    _loggedIn = true;
    notifyListeners();
  }

  void logOut() {
    _loggedIn = false;
    notifyListeners();
  }
}
