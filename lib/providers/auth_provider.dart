import 'package:flutter_riverpod/flutter_riverpod.dart';

// Static username and password
const String correctUsername = 'Zaidbaloch';
const String correctPassword = 'Balochzaid';

// Authentication provider to track login status
final authProvider = StateNotifierProvider<AuthNotifier, bool>((ref) => AuthNotifier());

class AuthNotifier extends StateNotifier<bool> {
  AuthNotifier() : super(false);  // Initially logged out

  // Function to handle login
  void login(String username, String password) {
    if (username == correctUsername && password == correctPassword) {
      state = true;  // User is logged in
    } else {
      state = false; // Login failed
    }
  }

  // Function to handle logout
  void logout() {
    state = false;  // User is logged out
  }
}
