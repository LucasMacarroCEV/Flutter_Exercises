import 'package:flutter/material.dart';

class Exercise1 extends StatefulWidget {
  const Exercise1({super.key});

  @override
  State<Exercise1> createState() => _Exercise1ViewState();
}

class _Exercise1ViewState extends State<Exercise1> {
  late TextEditingController _numberTF;
  String resultText = "";
  String valuesText = "La media de";
  String errorText = "";
  List<double> numList = [];

  @override
  void initState() {
    super.initState();
    _numberTF = TextEditingController();
  }

  @override
  void dispose() {
    _numberTF.dispose();
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
                        Text("Ejercicio 1",
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
                                        width: 300,
                                        child: TextField(
                                          controller: _numberTF,
                                          decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText:
                                                  "Introduce un número..."),
                                        ),
                                      ),
                                      FloatingActionButton(
                                        onPressed: _onAddNumberButtonPressed,
                                        tooltip: "AddNumber",
                                        child: const Icon(Icons.add),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Text(valuesText,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black87)),
                                          Text(resultText,
                                              style: const TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black87))
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(errorText,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.red))
                                    ],
                                  )
                                ],
                              ),
                            ))
                      ],
                    )
                  ],
                ))));
  }

  void _onExitButtonPressed() {
    Navigator.pop(context);
  }

  void _onAddNumberButtonPressed() {
    errorText = "";
    if (isNumeric(_numberTF.text)) {
      var currentNum = double.parse(_numberTF.text);
      numList.add(currentNum);
      valuesText += " $currentNum";
      if (numList.length == 5) {
        valuesText += " es:";
        resultText +=
            " \n ${(numList.fold(0.0, (a, b) => a + b) / numList.length).toString()}";
      }
    } else {
      errorText = ("Error: Introduce un número.");
    }
    _numberTF.text = "";
    setState(() {});
  }

  bool isNumeric(String s) {
    if (s.isEmpty) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}
