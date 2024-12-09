import 'package:app_sederhana/grade_form.dart';
import 'package:flutter/material.dart';


class GradePage extends StatefulWidget {
  const GradePage({Key? key}) : super(key: key);

  @override
  _GradePageState createState() => _GradePageState();
}

class _GradePageState extends State<GradePage> {
  String? _gradeResult;

  void _onResult(String result) {
    setState(() {
      _gradeResult = result; // Store the result from GradeForm
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
            'Grade Calculation',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          GradeForm(onResult: _onResult), 
          const SizedBox(height: 20),
          if (_gradeResult != null)
            Text(
              _gradeResult!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }
}