import 'package:flutter/material.dart';

Map<String, int> romanNumerals = {
  "I": 1,
  "V": 5,
  "X": 10,
  "L": 50,
  "C": 100,
  "D": 500,
  "M": 1000
};

class Exercise4 extends StatefulWidget {
  const Exercise4({super.key});

  @override
  State<Exercise4> createState() => _Exercise4ViewState();
}

class _Exercise4ViewState extends State<Exercise4> {
  late TextEditingController _numberTF;
  String _errorText = "";
  bool bError = false;
  String _resultText = "";

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
                        Text("Ejercicio 4",
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
                                                  "Introduce un número romano..."),
                                        ),
                                      ),
                                      FloatingActionButton(
                                        onPressed:
                                            _onCheckRomanNumberButtonPressed,
                                        tooltip: "TranslateNumber",
                                        child: Icon(Icons.send),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(_resultText,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black87))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(_errorText,
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

  void _onCheckRomanNumberButtonPressed() {
    _resultText = "";
    _errorText = "";
    bError = false;
    String romanNum = _numberTF.text;
    for (var x in romanNum.characters) {
      x = x.toUpperCase();
      if (!romanNumerals.keys.contains(x)) {
        bError = true;
        _errorText = "Error: Introduce un número romano válido.";
      }
    }
    if (!bError) {
      _resultText = (romanNumberTranslator(romanNum)).toString();
    }
    setState(() {});
  }

  int romanNumberTranslator(String romanNum) {
    var prevValue = 0;
    var total = 0;

    for (var char in romanNum.characters) {
      char = char.toUpperCase();

      var value = romanNumerals[char]!;

      if (value > prevValue) {
        total += value - 2 * prevValue;
      } else {
        total += value;
      }

      prevValue = value;
    }
    return total;
  }
}
