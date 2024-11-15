import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Basic Calculator (NACIS BSIT 3-B)'),
        ),
        body: const Calculator(),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String result = '';

  void _clear() {
    _controller1.clear();
    _controller2.clear();
    setState(() {
      result = '';
    });
  }

  void _result(String operator) {
    double num1 = double.tryParse(_controller1.text) ?? 0;
    double num2 = double.tryParse(_controller2.text) ?? 0;

    setState(() {
      if (operator == '+') {
        result = (num1 + num2).toString();
      } else if (operator == '-') {
        result = (num1 - num2).toString();
      } else if (operator == '*') {
        result = (num1 * num2).toString();
      } else if (operator == '/') {
        if (num2 != 0) {
          result = (num1 / num2).toString();
        } else {
          result = 'ERROR: num2 value is ZERO';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller1,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Number 1'),
                ),
              ),
              ElevatedButton(
                onPressed: () => _result('+'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 255, 255, 255), // Correct property
                  shadowColor: const Color(0xFF1AA260),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('+'),
              ),
              Expanded(
                child: TextField(
                  controller: _controller2,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Number 2'),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller1,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Number 1'),
                ),
              ),
              ElevatedButton(
                onPressed: () => _result('-'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  shadowColor: const Color(0xFF1AA260),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('-'),
              ),
              Expanded(
                child: TextField(
                  controller: _controller2,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Number 2'),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller1,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Number 1'),
                ),
              ),
              ElevatedButton(
                onPressed: () => _result('*'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  shadowColor: const Color(0xFF1AA260),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('*'),
              ),
              Expanded(
                child: TextField(
                  controller: _controller2,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Number 2'),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller1,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Number 1'),
                ),
              ),
              ElevatedButton(
                onPressed: () => _result('/'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  shadowColor: const Color(0xFF1AA260),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('/'),
              ),
              Expanded(
                child: TextField(
                  controller: _controller2,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Number 2'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Adjusting the width of the 'Clear' button using a SizedBox
          Center(
            child: SizedBox(
              width: 100.0, // Fixed width of 40 pixels
              child: ElevatedButton(
                onPressed: _clear,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  shadowColor: const Color(0xFF1AA260),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Clear',
                  style: TextStyle(
                      fontSize: 15), // Adjust the font size to fit in 40px
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
          Center(
            // Centering the result text
            child: Text(
              'Result: $result',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
