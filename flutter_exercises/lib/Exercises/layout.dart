import 'package:flutter/material.dart';

class Exercise extends StatefulWidget {
  const Exercise({super.key});

  @override
  State<Exercise> createState() => _Exercise1ViewState();
}

class _Exercise1ViewState extends State<Exercise> {
  late TextEditingController _numberTF;

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
                                      const FloatingActionButton(
                                        onPressed: null,
                                        tooltip: "AddNumber",
                                        child: Icon(Icons.add),
                                      )
                                    ],
                                  ),
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
}
