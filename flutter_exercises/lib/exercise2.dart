import 'package:flutter/material.dart';

class Exercise2 extends StatefulWidget {
  const Exercise2({super.key});

  @override
  State<Exercise2> createState() => _Exercise2ViewState();
}

class _Exercise2ViewState extends State<Exercise2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
          ],
        ),
      )),
    );
  }

  void _onExitButtonPressed() {
    Navigator.pop(context);
  }
}
