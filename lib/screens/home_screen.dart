import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _statementController = TextEditingController();
  bool _isChecking = false;
  String? _result;

  @override
  void dispose() {
    _statementController.dispose();
    super.dispose();
  }

  Future<void> _checkStatement() async {
    if (_statementController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a statement to check')),
      );
      return;
    }

    setState(() {
      _isChecking = true;
      _result = null;
    });

    // TODO: Call your fact-checking logic here
    // For now, simulate a check
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isChecking = false;
      _result = 'Verified'; // This should come from your backend
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cheqr'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Fact Checker',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _statementController,
              decoration: const InputDecoration(
                labelText: 'Enter a statement to verify',
                border: OutlineInputBorder(),
                hintText: 'e.g., The Eiffel Tower is in Paris',
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isChecking ? null : _checkStatement,
              child: _isChecking
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Check Statement'),
            ),
            if (_result != null) ...[
              const SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        'Result:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(_result!),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

