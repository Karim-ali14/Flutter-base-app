import 'package:flutter/material.dart';

class CustomStepperWithProgressBars extends StatefulWidget {
  @override
  _CustomStepperWithProgressBarsState createState() =>
      _CustomStepperWithProgressBarsState();
}

class _CustomStepperWithProgressBarsState
    extends State<CustomStepperWithProgressBars> {
  int _currentStep = 0;

  final List<double> _progressValues = [0.0, 0.0, 0.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Stepper with Progress Bars')),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < _progressValues.length - 1) {
            setState(() {
              _currentStep++;
            });
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep--;
            });
          }
        },
        onStepTapped: (step) {
          setState(() {
            _currentStep = step;
          });
        },
        steps: _buildSteps(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _progressValues[_currentStep] =
                (_progressValues[_currentStep] + 0.25).clamp(0.0, 1.0);
          });
        },
        child: Icon(Icons.add),
        tooltip: 'Increase Progress',
      ),
    );
  }

  List<Step> _buildSteps() {
    return List.generate(_progressValues.length, (index) {
      return Step(
        title: Text('Step ${index + 1}'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Progress for Step ${index + 1}:'),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: _progressValues[index],
              minHeight: 8,
              backgroundColor: Colors.grey[300],
              color: Colors.blue,
            ),
            SizedBox(height: 8),
            Text(
              'Completion: ${(100 * _progressValues[index]).toInt()}%',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        isActive: index == _currentStep,
        state: _progressValues[index] == 1.0
            ? StepState.complete
            : StepState.indexed,
      );
    });
  }
}
