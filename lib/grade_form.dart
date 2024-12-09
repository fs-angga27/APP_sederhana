import 'package:flutter/material.dart';

class GradeForm extends StatefulWidget {
  final Function(String) onResult;
  final bool isAveragePage;

  const GradeForm({
    Key? key,
    required this.onResult,
    this.isAveragePage = false,
  }) : super(key: key);

  @override
  _GradeFormState createState() => _GradeFormState();
}

class _GradeFormState extends State<GradeForm> {
  final TextEditingController _controller = TextEditingController();
  List<int> _scores = [];
  String? _errorText;

  void _addScore() {
    final value = _controller.text;
    final score = int.tryParse(value);

    if (score == null || score < 0 || score > 100) {
      setState(() {
        _errorText = "Please enter a valid score between 0 and 100.";
        widget.onResult('');
      });
      return;
    }

    setState(() {
      _scores.add(score);
      _errorText = null;
      _controller.clear(); // Clear input after adding score
      widget.onResult('');
    });
  }

  void _calculateGrade() {
    final value = _controller.text;
    final score = int.tryParse(value);

    if (score == null || score < 0 || score > 100) {
      setState(() {
        _errorText = "Please enter a valid score between 0 and 100.";

       widget.onResult(''); 
      });
      return;
    }

    String category;
    if (score >= 85) {
      category = 'A';
    } else if (score >= 70) {
      category = 'B';
    } else if (score >= 55) {
      category = 'C';
    } else {
      category = 'D';
    }
    widget.onResult('Kategori = $category');
  }

  void _calculateAverageGrade() {
    if (_scores.isEmpty) {
      setState(() {
        _errorText = "Please input at least one score.";
        widget.onResult('');
      });
      return;
    }

    final average = _scores.reduce((a, b) => a + b) / _scores.length;
    String category;
    if (average >= 85) {
      category = 'A';
    } else if (average >= 70) {
      category = 'B';
    } else if (average >= 55) {
      category = 'C';
    } else {
      category = 'D';
    }
    widget.onResult('Rata-rata Nilai = ${average.toStringAsFixed(2)} termasuk kategori: $category');
  }

  void _clearScores() {
    setState(() {
      _scores.clear(); // Clear all scores
      _errorText = null; // Reset any error text
      _controller.clear(); // Clear input field
      widget.onResult('');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Enter score',
            errorText: _errorText,
          ),
        ),
        const SizedBox(height: 20),
        if (widget.isAveragePage) ...[
          ElevatedButton(
            onPressed: _addScore, // Button to add score
            child: const Text('Add Score'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _calculateAverageGrade, // Button to calculate average
            child: const Text('Calculate Average Grade'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _clearScores, // Button to clear scores
            child: const Text('Clear All Scores'),
          ),
        ] else ...[
          ElevatedButton(
            onPressed: _calculateGrade, // Button to calculate category
            child: const Text('Calculate Grade'),
          ),
        ],
        const SizedBox(height: 20),
        Wrap(
          children: _scores
              .map((score) => Chip(
                    label: Text(score.toString()),
                  ))
              .toList(),
        ),
      ],
    );
  }
}