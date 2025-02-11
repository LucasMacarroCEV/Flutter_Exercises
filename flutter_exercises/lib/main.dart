import 'package:flutter/material.dart';
import 'package:flutter_exercises/Exercises/exercise_1.dart';
import 'package:flutter_exercises/Exercises/exercise_2.dart';
import 'package:flutter_exercises/Exercises/exercise_3.dart';
import 'package:flutter_exercises/Exercises/exercise_4.dart';

void main() {
  runApp(const FlutterExercisesApp());
}

class FlutterExercisesApp extends StatelessWidget {
  const FlutterExercisesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicios Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainView(title: 'Ejercicios Flutter'),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key, required this.title});

  final String title;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late String title;

  @override
  void initState() {
    super.initState();
    title = widget.title;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void goToExercise1() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Exercise1()));
  }

  void goToExercise2() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Exercise2()));
  }

  void goToExercise3() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Exercise3()));
  }

  void goToExercise4() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Exercise4()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: 40,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(title,
                      style:
                          const TextStyle(fontSize: 40, color: Colors.black87))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: 400,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        border: Border.all(width: 2, color: Colors.black87),
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
                          spacing: 20,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                    onPressed: goToExercise1,
                                    child: const Text("Ejercicio 1",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold))),
                                TextButton(
                                    onPressed: goToExercise2,
                                    child: const Text("Ejercicio 2",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold))),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                    onPressed: goToExercise3,
                                    child: const Text("Ejercicio 3",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold))),
                                TextButton(
                                    onPressed: goToExercise4,
                                    child: const Text("Ejercicio 4",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold))),
                              ],
                            ),
                          ],
                        ),
                      ))
                ],
              )
            ],
          )),
    ));
  }
}
