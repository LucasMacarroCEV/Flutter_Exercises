import 'dart:core';

import 'package:flutter/material.dart';

class Question {
  String questionText;
  int yesPuntuation;
  int noPuntuation;

  Question(this.questionText, this.yesPuntuation, this.noPuntuation);
}

class Exercise5 extends StatefulWidget {
  const Exercise5({super.key});

  @override
  State<Exercise5> createState() => _Exercise5ViewState();
}

class _Exercise5ViewState extends State<Exercise5> {
  late TextEditingController _ageTF;
  late int age;
  double _sleepHoursSliderValue = 0;
  double _workHoursSliderValue = 0;
  String _errorText = "";
  String _questionText = "";
  String _resultText = "";
  bool bAnswering = false;
  bool bResult = false;
  bool bError = false;

  List<Question> questionsList = [
    Question("¿Practicas ejercicio con frecuencia?", 7, -7),
    Question("¿Consumes algún tipo de estupefaciente?", -14, 4),
    Question("¿Consumes alcohol con frecuencia?", -12, 3),
    Question("¿Acaricias muchos perros?", 11, -8)
  ];
  int questionsIndex = 0;
  int lifeExpentacy = 83;
  int leisureDays = 0;

  @override
  void initState() {
    super.initState();
    _ageTF = TextEditingController();
    _ageTF.addListener(_handleNumber);
    answeringState();
  }

  void answeringState() {
    bAnswering = true;
    bResult = false;
    bError = false;
    _resultText = "Proporciona toda la información solicitada";
    _questionText = questionsList[questionsIndex].questionText;
    setState(() {});
  }

  void resultState() {
    bAnswering = false;
    bResult = true;
    bError = false;
    _resultText = "Presiona el botón para realizar el cálculo";
    setState(() {});
  }

  void errorState() {
    bError = true;
    _ageTF.text = "";
    setState(() {});
  }

  @override
  void dispose() {
    _ageTF.removeListener(_handleNumber);
    _ageTF.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  spacing: 20,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: _onExitButtonPressed,
                          icon: const Icon(Icons.arrow_back_sharp),
                          iconSize: 35,
                          color: Colors.black87,
                        )
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Ejercicio 5",
                            style:
                                TextStyle(fontSize: 40, color: Colors.black87))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: 450,
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              border:
                                  Border.all(width: 2, color: Colors.black87),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                spacing: 15,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: TextField(
                                          controller: _ageTF,
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText:
                                                  "Introduce tu edad..."),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          const Text("¿Cuántas horas duermes?",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontStyle: FontStyle.italic,
                                                  color: Colors.black87)),
                                          Slider(
                                              value: _sleepHoursSliderValue,
                                              max: 24,
                                              divisions: 24,
                                              label: _sleepHoursSliderValue
                                                  .round()
                                                  .toString(),
                                              onChanged: (double value) {
                                                setState(() {
                                                  _sleepHoursSliderValue =
                                                      value;
                                                });
                                              })
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          const Text("¿Cuántas horas trabajas?",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontStyle: FontStyle.italic,
                                                  color: Colors.black87)),
                                          Slider(
                                              value: _workHoursSliderValue,
                                              max: 24,
                                              divisions: 24,
                                              label: _workHoursSliderValue
                                                  .round()
                                                  .toString(),
                                              onChanged: (double value) {
                                                setState(() {
                                                  _workHoursSliderValue = value;
                                                });
                                              })
                                        ],
                                      )
                                    ],
                                  ),
                                  Visibility(
                                      visible: bAnswering,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            spacing: 20,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(_questionText,
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      color: Colors.black87)),
                                              Row(
                                                spacing: 15,
                                                children: [
                                                  FloatingActionButton(
                                                    onPressed:
                                                        _onYesButtonPressed,
                                                    tooltip: "Yes",
                                                    child: const Icon(
                                                        Icons.check_circle),
                                                  ),
                                                  FloatingActionButton(
                                                    onPressed:
                                                        _onNoButtonPressed,
                                                    tooltip: "No",
                                                    child: const Icon(
                                                        Icons.cancel),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      )),
                                  Visibility(
                                      visible: bResult,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          FloatingActionButton(
                                            onPressed:
                                                _onCalculateButtonPressed,
                                            tooltip: "Calculate",
                                            child: const Icon(
                                                Icons.calendar_today),
                                          )
                                        ],
                                      )),
                                  FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text(_resultText,
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87))),
                                  Visibility(
                                      visible: bError,
                                      child: Text(_errorText,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.red)))
                                ],
                              ),
                            ))
                      ],
                    )
                  ],
                ))));
  }

  void _handleNumber() {
    if (_ageTF.text.isNotEmpty) {
      try {
        int.parse(_ageTF.text);
      } catch (e) {
        _errorText = "Error: Introduce un número.";
        errorState();
      }
      if (int.parse(_ageTF.text) > 70) {
        _errorText = "Error: Eres demasiado mayor.";
        errorState();
      } else {
        age = int.parse(_ageTF.text);
        answeringState();
      }
    }
  }

  void nextQuestion(int years) {
    lifeExpentacy += years;
    questionsIndex += 1;
    if (questionsIndex == questionsList.length) {
      resultState();
    } else {
      answeringState();
    }
  }

  void _onExitButtonPressed() {
    Navigator.pop(context);
  }

  void _onYesButtonPressed() {
    nextQuestion(questionsList[questionsIndex].yesPuntuation);
  }

  void _onNoButtonPressed() {
    nextQuestion(questionsList[questionsIndex].noPuntuation);
  }

  void _onCalculateButtonPressed() {
    int currentLifeExpectancy = lifeExpentacy - age;
    int lifeExpentacyHours = (currentLifeExpectancy * 365) * 24;
    lifeExpentacyHours -=
        (_sleepHoursSliderValue.round() * 365) * currentLifeExpectancy;
    lifeExpentacyHours -=
        (_workHoursSliderValue.round() * 365) * (currentLifeExpectancy - 16);

    if ((lifeExpentacyHours / 24) < 0) {
      _resultText = "Suerte tienes de seguir viv@";
    } else {
      _resultText =
          "Te quedan aproximadamente ${(lifeExpentacyHours / 24).round()} días de ocio";
    }
    setState(() {});
  }
}
