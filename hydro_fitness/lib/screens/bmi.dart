import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  String? height;
  String? weight;
  final _fieldKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  double? _bmi;
  late String _message = "";

  void calculate() {
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);

    if (height == 0 || height! <= 0 || weight == 0 || weight! <= 0) {
      setState(() {
        _message = "Please enter number bigger than 0";
      });
      return;
    }
    setState(() {
      _bmi = weight / (height * height);
      if (_bmi! < 18.5) {
        _message = "You are underweight";
      } else if (_bmi! < 25) {
        _message = 'Your body is fine';
      } else if (_bmi! < 30) {
        _message = 'You are overweight';
      } else {
        _message = 'Not Fine';
      }
    });
  }

  void showBmiDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Container(
                alignment: Alignment.center,
                child: Text(
                  "Your BMI is",
                  style: TextStyle(color: Colors.black),
                )),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text(
                      _bmi == null ? ' ' : _bmi!.toStringAsFixed(2),
                      style: TextStyle(fontSize: 60, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    _message,
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          //   physics: ScrollPhysics(),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "BMI\nCALCULATOR",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 25),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: Card(
                      color: Colors.grey.shade900.withOpacity(0.5),
                      child: Form(
                          key: _fieldKey,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.center,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    keyboardType:
                                        TextInputType.numberWithOptions(
                                            decimal: true),
                                    controller: _heightController,
                                    onChanged: (val) {
                                      setState(() {
                                        val = height!;
                                      });
                                    },
                                    validator: (val) =>
                                        val!.isEmpty ? "Height is Empty" : null,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green)),
                                      hintText: "Height (m)",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    keyboardType:
                                        TextInputType.numberWithOptions(
                                            decimal: true),
                                    controller: _weightController,
                                    onChanged: (val) {
                                      setState(() {
                                        val = weight!;
                                      });
                                    },
                                    validator: (val) =>
                                        val!.isEmpty ? "Weight is Empty" : null,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green)),
                                      hintText: "Weight (kg)",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green)),
                                    ),
                                  ),
                                  //---
                                ],
                              ),
                            ),
                          )),
                    )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      onPressed: () {
                        // _fieldKey.currentState!.validate();
                        // showBmiDialog();
                        // calculate();
                        if (_fieldKey.currentState!.validate()) {
                          showBmiDialog();
                          calculate();
                        }
                      },
                      child: Text("Calculate")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
