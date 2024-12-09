import 'package:app_sederhana/grade_form.dart';
import 'package:flutter/material.dart';

class AverageScorePage extends StatefulWidget {
  const AverageScorePage({Key? key}) : super(key: key);

  @override
  _AverageScorePageState createState() => _AverageScorePageState();
}

class _AverageScorePageState extends State<AverageScorePage> {
  String? _averageResult;

  void _onResult(String result) {
    setState(() {
      _averageResult = result; // Store the average result from GradeForm
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Average Score Calculation',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          GradeForm(
              onResult: _onResult,
              isAveragePage: true), // Indicate this is for average
          const SizedBox(height: 20),
          if (_averageResult != null)
            Text(
              _averageResult!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }
}
