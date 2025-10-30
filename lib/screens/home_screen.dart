import 'package:flutter/material.dart';
import '../services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>>? _results; // List of {question, answer} maps
  bool? _verdict;
  bool _loading = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _checkStatement() async {
    setState(() => _loading = true);
    try {
      final response = await ApiService.checkStatement(_controller.text);
      // Convert the list of lists to list of maps for easier access
      final resultsList = (response['result'] as List).map((item) {
        return {
          'question': item[0] as String,
          'answer': item[1] as String,
        };
      }).toList();
      setState(() {
        _results = resultsList;
        _verdict = response['verdict'] as bool;
      });
    } catch (e) {
      setState(() {
        _results = null;
        _verdict = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Statement Checker')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Enter or paste text',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loading ? null : _checkStatement,
              child: _loading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Check'),
            ),
            const SizedBox(height: 20),
            if (_verdict != null) ...[
              // Overall verdict
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _verdict! ? Colors.green.shade50 : Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: _verdict! ? Colors.green : Colors.red,
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _verdict! ? '✅ OVERALL VERDICT: TRUE' : '❌ OVERALL VERDICT: FALSE',
                      style: TextStyle(
                        fontSize: 20,
                        color: _verdict! ? Colors.green.shade800 : Colors.red.shade800,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Individual question results
              if (_results != null && _results!.isNotEmpty) ...[
                const Text(
                  'Question Results:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _results!.length,
                    itemBuilder: (context, index) {
                      final result = _results![index];
                      final answer = result['answer'] as String;
                      final isCorrect = answer == 'Yes';
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          leading: Icon(
                            isCorrect ? Icons.check_circle : Icons.cancel,
                            color: isCorrect ? Colors.green : Colors.red,
                          ),
                          title: Text(
                            result['question'] as String,
                            style: const TextStyle(fontSize: 14),
                          ),
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: isCorrect ? Colors.green.shade100 : Colors.red.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              answer,
                              style: TextStyle(
                                color: isCorrect ? Colors.green.shade800 : Colors.red.shade800,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
