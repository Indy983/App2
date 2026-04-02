import 'package:flutter/material.dart';
import '../contentdata/data/content_list.dart';
import '../db/sync_service.dart';
import 'topic_detail_screen.dart';

class CatalogScreen extends StatefulWidget {
  final SyncService syncService;
  
  CatalogScreen({required this.syncService});

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  bool _isSyncing = false;

  Future<void> _refresh() async {
    setState(() => _isSyncing = true);
    try {
      await widget.syncService.incrementalSync();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ข้อมูลอัพเดทแล้ว'), duration: Duration(seconds: 1)),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('เกิดข้อผิดพลาด: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isSyncing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("บทเรียนคณิตศาสตร์"),
        actions: [
          IconButton(
            icon: _isSyncing 
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                  )
                : Icon(Icons.refresh),
            onPressed: _isSyncing ? null : _refresh,
            tooltip: 'รีเฟรชข้อมูล',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: mainCatalog.length,
        itemBuilder: (context, index) {
          final topic = mainCatalog[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(
                topic.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TopicDetailScreen(
                      topic: topic,
                      syncService: widget.syncService,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}