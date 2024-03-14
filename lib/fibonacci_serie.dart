import 'package:flutter/material.dart';

class FibonacciScreen extends StatefulWidget {
  const FibonacciScreen({super.key});

  @override
  State<FibonacciScreen> createState() => _FibonacciScreenState();
}

class _FibonacciScreenState extends State<FibonacciScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int fibonacci(int n, Map<int, int> memo) {
    if (memo.containsKey(n)) {
      return memo[n]!;
    }
    if (n <= 2) {
      return 1;
    }
    int result = fibonacci(n - 1, memo) + fibonacci(n - 2, memo);
    memo[n] = result;
    return result;
  }

  void calculateFibonacci() {
    int value = int.tryParse(_controller.text) ?? 0;
    if (value <= 0) {
      setState(() {
        _result = 'Please enter a positive intege.';
      });
      return;
    }
    int fib = fibonacci(value, {});
    setState(() {
      _result = 'Fibonacci number at position $value is $fib';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fibonacci Identifier'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter a position in the Fibonacci series',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateFibonacci,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
