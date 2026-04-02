import 'package:flutter/material.dart';
import '../contentui/content_blocks.dart';
import '../contentui/widgets.dart';
import 'content_models.dart';
import '../db/app_database.dart';
import '../db/sync_service.dart';

class LessonScreen extends StatefulWidget {
  final ContentLesson lesson;
  final String lessonId;
  final SyncService syncService;
  
  LessonScreen({
    required this.lesson, 
    required this.lessonId,
    required this.syncService,
  });
  
  @override
  _LessonScreenState createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  int _currentIndex = 0;
  final Map<String, dynamic> _answers = {};
  final Map<String, int> _attemptCounts = {};
  final Map<String, bool> _checkedStates = {};
  late AppDatabase _database;
  late List<Widget> _pages;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _database = AppDatabase();
    _loadFromDatabase();
  }

  Future<void> _loadFromDatabase() async {
    final state = await _database.loadLessonState(widget.lessonId);
    setState(() {
      _answers.addAll(state['answers']);
      _attemptCounts.addAll(state['attemptCounts']);
      _checkedStates.addAll(state['checkedStates']);
      _isLoading = false;
    });
    
    _pages = widget.lesson.sections.map((section) => ListView(
      padding: EdgeInsets.all(20),
      children: [
        SelectableRegion(  // ADDED: Single wrapper for all content
          focusNode: FocusNode(),
          selectionControls: MaterialTextSelectionControls(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(section.headerL1, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue[900])),
              Divider(height: 30),
              ...section.blocks.map((b) => Padding(padding: EdgeInsets.only(bottom: 20), child: _buildBlock(b))),
            ],
          ),
        ),
      ],
    )).toList();
  }

  @override
  void dispose() {
    _database.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.lesson.title)),
        body: Center(child: CircularProgressIndicator()),
      );
    }
    
    return Scaffold(
      appBar: AppBar(title: Text(widget.lesson.title)),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _currentIndex,
            onDestinationSelected: (i) => setState(() => _currentIndex = i),
            labelType: NavigationRailLabelType.all,
            destinations: widget.lesson.sections.map((s) => NavigationRailDestination(
              icon: Icon(Icons.menu_book), label: Text(s.headerL1.substring(0, 4)),
            )).toList(),
          ),
          VerticalDivider(width: 1),
          Expanded(child: IndexedStack(index: _currentIndex, children: _pages)),
        ],
      ),
    );
  }

  Widget _buildBlock(ContentBlock b) {
    final params = QuestionParams(
      id: b.id,
      data: b.data,
      state: _answers,
      lessonId: widget.lessonId,
      database: _database,
      syncService: widget.syncService,
      isChecked: _checkedStates[b.id] ?? false,
    );

    switch (b.type) {
      case 'header': 
        return HeaderBlock(b.data);
      
      case 'text': 
        return TextBlock(b.data);
      
      case 'question_choice': 
        return QuestionWrapper(
          questionType: 'choice',
          params: params,
          checkedStates: _checkedStates,
          attemptCounts: _attemptCounts,
        );
      
      case 'question_fill_in':
        return QuestionWrapper(
          questionType: 'fillin',
          params: params,
          checkedStates: _checkedStates,
          attemptCounts: _attemptCounts,
        );
      
      case 'drag_and_drop':
        return QuestionWrapper(
          questionType: 'dragdrop',
          params: params,
          checkedStates: _checkedStates,
          attemptCounts: _attemptCounts,
        );
        
      case 'interactive_graph': 
        return GraphBlock(b.data);
      
      case 'image': 
        return ImageBlock(b.data);
      
      default: 
        return const SizedBox();
    }
  }
}