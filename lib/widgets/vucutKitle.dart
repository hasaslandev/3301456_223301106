import 'package:flutter/material.dart';

class vucutKitle extends StatefulWidget {
  @override
  _vucutKitle createState() => _vucutKitle();
}

class _vucutKitle extends State<vucutKitle> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double? _bmiResult;
  String? _bmiStatus;

  void calculateBMI() {
    if (_formKey.currentState!.validate()) {
      double height = double.parse(heightController.text);
      double weight = double.parse(weightController.text);

      double bmi = weight / (height * height);
      setState(() {
        _bmiResult = bmi;
        if (bmi < 18.5) {
          _bmiStatus = "Zayıf";
        } else if (bmi >= 18.5 && bmi < 25) {
          _bmiStatus = "Normal";
        } else if (bmi >= 25 && bmi < 30) {
          _bmiStatus = "Fazla Kilolu";
        } else {
          _bmiStatus = "Obez";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vücut Kitle İndeksi Hesaplayıcı"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Boy (metre cinsinden 1.70 şeklinde yazınız)",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Lütfen boyunuzu girin";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Kilo (kilogram cinsinden)",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Lütfen kilonuzu girin";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: calculateBMI,
                child: Text("Hesapla"),
              ),
              SizedBox(height: 16.0),
              if (_bmiResult != null && _bmiStatus != null)
                Column(
                  children: [
                    Text(
                      "Vücut Kitle İndeksi: ${_bmiResult!.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 24.0),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      "Durum: $_bmiStatus",
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
