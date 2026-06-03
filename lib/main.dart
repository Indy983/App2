import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'ui/login_screen.dart';
import 'ui/landing_screen.dart';
import 'db/app_database.dart';
import 'db/sync_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://frnbesgefxgtfxainacl.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZybmJlc2dlZnhndGZ4YWluYWNsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjU3ODIzMjEsImV4cCI6MjA4MTM1ODMyMX0.7rc-dloiiRlqjH9juOOkgIrxgKamLdbjRxpdt-bn9OE',
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: AuthCheck(),
    );
  }
}

class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final session = Supabase.instance.client.auth.currentSession;

    if (session != null) {
      // User is logged in - create SyncService and go to LandingScreen
      final database = AppDatabase();
      final syncService = SyncService(database, Supabase.instance.client);
      return LandingScreen(syncService: syncService);
    } else {
      // User not logged in
      return LoginScreen();
    }
  }
}