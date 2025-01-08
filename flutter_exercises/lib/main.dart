import 'package:flutter/material.dart';
import 'package:flutter_exercises/exercise1.dart';

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
  void goToExercise1() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Exercise1()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 35.0),
            child: const Text("Ejercicios Flutter",
                style: TextStyle(fontSize: 40, color: Colors.black87)),
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
                        TextButton(
                            onPressed: goToExercise1,
                            child: const Text("Ejercicio 1",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black87))),
                        // TextButton(
                        //     onPressed:,
                        //     child: const Text("Ejercicio 2",
                        //         style: TextStyle(
                        //             fontSize: 20, color: Colors.black87)))
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    ));
  }
}
