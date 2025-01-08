import 'package:flutter/material.dart';

class Exercise1 extends StatefulWidget {
  const Exercise1({super.key});

  @override
  State<Exercise1> createState() => _Exercise1ViewState();
}

class _Exercise1ViewState extends State<Exercise1> {
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

  void _addNumber() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 35.0),
            child: const Text("Ejercicio 1",
                style: TextStyle(fontSize: 30, color: Colors.black87)),
          ),
          Container(
            margin: const EdgeInsets.all(40),
            alignment: Alignment.center,
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
                ]),
            child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextField(
                          controller: _numberTF,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Introduce un número..."),
                        ),
                        FloatingActionButton(
                          onPressed: _addNumber,
                          tooltip: "AddNumber",
                          child: const Icon(Icons.add),
                        )
                      ],
                    )
                  ],
                )),
          )
        ],
      )),
    );
  }
}
