import 'package:flutter/material.dart';
import 'db/app_database.dart';
import 'db/sync_service_web.dart';
import 'ui/catalog_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // No Supabase initialization — web users skip auth entirely.
  final database = AppDatabase();
  final syncService = SyncServiceWeb(database);

  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
    home: CatalogScreen(syncService: syncService),
  ));
}