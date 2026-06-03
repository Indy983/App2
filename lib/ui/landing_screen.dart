import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../db/sync_service.dart';
import 'catalog_screen.dart';
import 'login_screen.dart';
import 'google_sign_in.dart';

class LandingScreen extends StatefulWidget {
  final SyncService syncService;
  
  LandingScreen({required this.syncService});

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _performInitialSync();
  }

  Future<void> _performInitialSync() async {
    try {
      await widget.syncService.initialSync();
    } catch (e) {
      print('Initial sync error: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _logout(BuildContext context) async {
    // Clear sync data
    await widget.syncService.logout();
    
    // Sign out from Supabase
    await Supabase.instance.client.auth.signOut();
    
    // Clear Google Sign In
    await clearGoogleSignIn();
    
    if (context.mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;
    
    if (_isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _logout(context),
            tooltip: 'ออกจากระบบ',
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: user?.userMetadata?['avatar_url'] != null
                    ? NetworkImage(user!.userMetadata!['avatar_url'])
                    : null,
                child: user?.userMetadata?['avatar_url'] == null
                    ? Icon(Icons.person, size: 50)
                    : null,
              ),
              SizedBox(height: 24),
              Text(
                'ยินดีต้อนรับ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                user?.userMetadata?['full_name'] ?? user?.email ?? 'ผู้ใช้',
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
              SizedBox(height: 64),
              
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => CatalogScreen(syncService: widget.syncService),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                child: Text('เริ่มเรียน'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}