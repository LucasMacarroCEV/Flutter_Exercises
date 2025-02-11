import 'dart:math';

import 'package:flutter/material.dart';

class Exercise2 extends StatefulWidget {
  const Exercise2({super.key});

  @override
  State<Exercise2> createState() => _Exercise2ViewState();
}

class _Exercise2ViewState extends State<Exercise2> {
  late TextEditingController _nameTF;
  late bool _bNameInputState;
  late bool _bGameState;
  late bool _bEndGameState;
  String errorText = "";
  String resultText = "";
  String turnText = "";

  int currentTurn = 0;
  List<String> playerNames = [];

  @override
  void initState() {
    super.initState();
    _nameTF = TextEditingController();
    namesInputState();
  }

  @override
  void dispose() {
    _nameTF.dispose();
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
                Text("Ejercicio 2",
                    style: TextStyle(fontSize: 40, color: Colors.black87))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 450,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      border: Border.all(width: 2, color: Colors.black87),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                          Visibility(
                            visible: _bNameInputState,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 300,
                                  child: TextField(
                                    controller: _nameTF,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: "Introduce un nombre..."),
                                  ),
                                ),
                                FloatingActionButton(
                                  onPressed: _onAddNameButtonPressed,
                                  tooltip: "SetName",
                                  child: const Icon(Icons.add),
                                )
                              ],
                            ),
                          ),
                          Visibility(
                              visible: _bGameState,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(turnText,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold))
                                ],
                              )),
                          Visibility(
                              visible: _bGameState,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FloatingActionButton(
                                    onPressed: _onRouletteButtonPressed,
                                    tooltip: "Play Roulette Game",
                                    child: const Icon(Icons.adjust),
                                  )
                                ],
                              )),
                          Visibility(
                              visible: _bGameState,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(resultText,
                                      style: const TextStyle(
                                          fontSize: 23,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold))
                                ],
                              )),
                          Visibility(
                              visible: _bEndGameState,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(resultText,
                                      style: const TextStyle(
                                          fontSize: 23,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold))
                                ],
                              )),
                          Visibility(
                              visible: _bNameInputState,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(errorText,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.red))
                                ],
                              ))
                        ],
                      ),
                    ))
              ],
            )
          ],
        ),
      )),
    );
  }

  void _onExitButtonPressed() {
    Navigator.pop(context);
  }

  void _onAddNameButtonPressed() {
    errorText = "";
    var currentName = _nameTF.text;
    if (currentName.isEmpty) {
      errorText = "Error: Escribe un nombre.";
    } else if (currentName.length > 10) {
      errorText = "Error: Introduce un nombre más corto.";
    } else {
      playerNames.add(currentName);
    }

    _nameTF.text = "";

    if (playerNames.length == 2) {
      rouletteState();
    } else {
      setState(() {});
    }
  }

  void _onRouletteButtonPressed() {
    var bullet = getRandomNumber(0, 6);
    var shoot = getRandomNumber(0, 6);

    if (bullet == shoot) {
      resultText = "PUM! ${playerNames[currentTurn]} HA MUERTO";
      endGameState();
    } else {
      resultText = "CLICK! ${playerNames[currentTurn]} SE HA SALVADO";
      currentTurn = (currentTurn + 1) % playerNames.length;
      nextTurnState();
    }
  }

  int getRandomNumber(int min, int max) {
    return min + Random().nextInt(max - min);
  }

  void namesInputState() {
    setState(() {
      _bNameInputState = true;
      _bGameState = false;
      _bEndGameState = false;
    });
  }

  void rouletteState() {
    _bNameInputState = false;
    _bGameState = true;
    nextTurnState();
  }

  void nextTurnState() {
    turnText = "Es el turno de ${playerNames[currentTurn]}";
    setState(() {});
  }

  void endGameState() {
    _bNameInputState = false;
    _bGameState = false;
    _bEndGameState = true;
    setState(() {});
  }
}
