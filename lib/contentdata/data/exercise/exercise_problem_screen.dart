import 'package:flutter/material.dart';
import '../../../contentui/widgets.dart';
import '../../../ui/content_models.dart';
import '../../../db/app_database.dart';
import '../../../db/sync_service.dart';

class ExerciseProblemScreen extends StatefulWidget {
  final ExerciseSet exerciseSet;
  final SyncService syncService;

  const ExerciseProblemScreen({
    Key? key,
    required this.exerciseSet,
    required this.syncService,
  }) : super(key: key);

  @override
  State<ExerciseProblemScreen> createState() => _ExerciseProblemScreenState();
}

class _ExerciseProblemScreenState extends State<ExerciseProblemScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  final Map<String, dynamic> _answers = {};
  final Map<String, int> _attemptCounts = {};
  final Map<String, bool> _checkedStates = {};
  late AppDatabase _database;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _database = AppDatabase();
    _loadFromDatabase();
  }

  Future<void> _loadFromDatabase() async {
    final state = await _database.loadLessonState(widget.exerciseSet.id);
    setState(() {
      _answers.addAll(state['answers']);
      _attemptCounts.addAll(state['attemptCounts']);
      _checkedStates.addAll(state['checkedStates']);
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _database.close();
    super.dispose();
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.exerciseSet.title)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exerciseSet.title),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                "${_currentPage + 1}/${widget.exerciseSet.problems.length}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: ((_currentPage + 1) / widget.exerciseSet.problems.length),
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
          
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.exerciseSet.problems.length,
              onPageChanged: (page) => setState(() => _currentPage = page),
              itemBuilder: (context, index) {
                return _buildProblemPage(widget.exerciseSet.problems[index], index);
              },
            ),
          ),
          
          _buildNavigationBar(),
        ],
      ),
    );
  }

  Widget _buildProblemPage(ExerciseProblem problem, int index) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            "ข้อที่ ${index + 1}",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900],
            ),
          ),
        ),
        const SizedBox(height: 20),
        
        _buildProblemBlock(problem),
      ],
    );
  }

Widget _buildProblemBlock(ExerciseProblem problem) {
    // 1. Create QuestionParams
    final params = QuestionParams(
      id: problem.id,
      data: problem.data,
      state: _answers,
      lessonId: widget.exerciseSet.id,
      database: _database,
      syncService: widget.syncService,
      isChecked: _checkedStates[problem.id] ?? false,
    );

    // 2. Map the incoming problem type to the short codes expected by QuestionWrapper
    String wrapperType;
    switch (problem.type) {
      case 'question_choice':
        wrapperType = 'choice';
        break;
      case 'question_fill_in':
        wrapperType = 'fillin';
        break;
      case 'drag_and_drop':
        wrapperType = 'dragdrop';
        break;
      default:
        return Center(child: Text("Unknown type: ${problem.type}"));
    }

    // 3. Pass the 'questionType' string instead of a 'child' widget
    return QuestionWrapper(
      questionType: wrapperType, 
      params: params,
      checkedStates: _checkedStates,
      attemptCounts: _attemptCounts,
    );
  }

  Widget _buildNavigationBar() {
    final isFirstPage = _currentPage == 0;
    final isLastPage = _currentPage == widget.exerciseSet.problems.length - 1;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed: isFirstPage ? null : () => _goToPage(_currentPage - 1),
            icon: const Icon(Icons.arrow_back),
            label: const Text("ก่อนหน้า"),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
          ),
          
          Text(
            "${_currentPage + 1} / ${widget.exerciseSet.problems.length}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          ElevatedButton.icon(
            onPressed: isLastPage ? _handleFinish : () => _goToPage(_currentPage + 1),
            icon: Icon(isLastPage ? Icons.check : Icons.arrow_forward),
            label: Text(isLastPage ? "เสร็จสิ้น" : "ถัดไป"),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              backgroundColor: isLastPage ? Colors.green : null,
            ),
          ),
        ],
      ),
    );
  }

  void _handleFinish() {
    int correct = 0;
    for (var problem in widget.exerciseSet.problems) {
      if (_checkedStates[problem.id] == true && _answers[problem.id] != null) {
        correct++;
      }
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("เสร็จสิ้น! 🎉"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "คุณทำได้",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            const SizedBox(height: 12),
            Text(
              "$correct / ${widget.exerciseSet.problems.length}",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: correct == widget.exerciseSet.problems.length 
                    ? Colors.green 
                    : Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              correct == widget.exerciseSet.problems.length
                  ? "สุดยอด! ทำถูกทุกข้อ! 💯"
                  : "พยายามต่อไป! 💪",
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text("กลับไปหน้ารวมชุดฝึกหัด"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("ทบทวนคำตอบ"),
          ),
        ],
      ),
    );
  }
}