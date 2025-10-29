import 'package:flutter/material.dart';
import '../services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  bool? _result;
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
      setState(() => _result = response);
    } catch (e) {
      setState(() => _result = null);
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
      body: Padding(
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
            if (_result != null)
              Text(
                _result! ? '✅ TRUE' : '❌ FALSE',
                style: TextStyle(
                  fontSize: 24,
                  color: _result! ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
