import 'package:flutter/material.dart';

void main() {
  runApp(DiabetesPredictorApp());
}

class DiabetesPredictorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diabetes Predictor',
      home: PredictorScreen(),
    );
  }
}

class PredictorScreen extends StatefulWidget {
  @override
  _PredictorScreenState createState() => _PredictorScreenState();
}

class _PredictorScreenState extends State<PredictorScreen> {
  final TextEditingController _pregnanciesController = TextEditingController();
  final TextEditingController _glucoseController = TextEditingController();
  final TextEditingController _bloodPressureController =
      TextEditingController();
  final TextEditingController _skinThicknessController =
      TextEditingController();
  final TextEditingController _insulinController = TextEditingController();
  final TextEditingController _bmiController = TextEditingController();
  final TextEditingController _diabetesPedigreeFunctionController =
      TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  String _prediction = '';

  void _predict() {
    // Add your prediction logic here.
    // For now, it just sets a placeholder prediction.
    setState(() {
      _prediction = '0.75';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diabetes Predictor'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              _buildTextField(
                  _pregnanciesController, 'Number of times pregnant'),
              _buildTextField(_glucoseController, 'Glucose'),
              _buildTextField(_bloodPressureController, 'Blood Pressure'),
              _buildTextField(_skinThicknessController, 'Skin Thickness'),
              _buildTextField(_insulinController, 'Insulin'),
              _buildTextField(_bmiController, 'BMI'),
              _buildTextField(_diabetesPedigreeFunctionController,
                  'Diabetes Pedigree Function'),
              _buildTextField(_ageController, 'Age'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _predict,
                child: Text('Predict'),
              ),
              SizedBox(height: 20),
              Text('Prediction: $_prediction'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: Color(0xFFF0F2F4),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
