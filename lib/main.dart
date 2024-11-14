import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/app/app.dart';  // Your main app widget
import 'package:flutter_riverpod_todo_app/providers/auth_provider.dart';
import 'package:flutter_riverpod_todo_app/screens/login_screen.dart';  // Your login screen

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the auth state (true or false)
    final isLoggedIn = ref.watch(authProvider);  // Watch auth state directly

    return MaterialApp(
      title: 'Flutter Riverpod Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Conditional routing based on whether the user is logged in
      home: isLoggedIn ? const FlutterRiverpodTodoApp() : LoginScreen(),
      routes: {
        '/home': (context) => const FlutterRiverpodTodoApp(),
        '/login': (context) =>  LoginScreen(),
      },
    );
  }
}
