import 'package:flutter/material.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../db/app_database.dart';
import '../db/sync_service.dart';
import 'landing_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.school, size: 80, color: Colors.blue),
              SizedBox(height: 16),
              Text(
                'บทเรียนคณิตศาสตร์',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 64),

              SupaSocialsAuth(
                socialProviders: [
                  OAuthProvider.apple,
                  OAuthProvider.google,
                ],
                nativeGoogleAuthConfig: NativeGoogleAuthConfig(
                  webClientId: '2255303404-sdddvm4j925jft63lb8d83j2lof0u9s7.apps.googleusercontent.com',
                  iosClientId: '2255303404-7s4pt5k901sp74736jdfc6n8n57h5okq.apps.googleusercontent.com'
                ),
                onSuccess: (Session session) {
                  // ✅ Create database and sync service
                  final database = AppDatabase();
                  final syncService = SyncService(database, Supabase.instance.client);
                  
                  // Navigate to LandingScreen with syncService
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => LandingScreen(syncService: syncService),
                    ),
                  );
                },
                onError: (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('เกิดข้อผิดพลาด: $error')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}