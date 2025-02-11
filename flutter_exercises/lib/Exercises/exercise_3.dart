import 'package:flutter/material.dart';

class Exercise3 extends StatefulWidget {
  const Exercise3({super.key});

  @override
  State<Exercise3> createState() => _Exercise3ViewState();
}

class _Exercise3ViewState extends State<Exercise3> {
  late TextEditingController _phraseTF;
  String _resultText = "";

  @override
  void initState() {
    super.initState();
    _phraseTF = TextEditingController();
  }

  @override
  void dispose() {
    _phraseTF.dispose();
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
                      Text("Ejercicio 3",
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
                                        controller: _phraseTF,
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText:
                                                "Introduce una frase..."),
                                      ),
                                    ),
                                    FloatingActionButton(
                                      onPressed: _onSetPhraseButtonPressed,
                                      tooltip: "CensorPhrase",
                                      child: const Icon(Icons.send),
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
                                )
                              ],
                            ),
                          ))
                    ],
                  )
                ],
              ))),
    );
  }

  void _onExitButtonPressed() {
    Navigator.pop(context);
  }

  void _onSetPhraseButtonPressed() {
    var currentPhrase = _phraseTF.text;
    var currentPhraseArray = splitPhrase(currentPhrase);
    print(currentPhraseArray);
    var censoredPhraseArray = censor(currentPhraseArray);
    print(censoredPhraseArray);
    var censoredPhrase = buildCensoredPhrase(censoredPhraseArray);
    _resultText = censoredPhrase;
    setState(() {});
  }

  List<String> splitPhrase(String phrase) {
    return phrase.split(" ");
  }

  List<String> censor(List<String> phraseArray) {
    List<String> newPhraseArray = [];
    for (var word in phraseArray) {
      if (word.startsWith(RegExp(r'[pjmPJM]'))) {
        var newWord = word.characters.first;
        word = word.substring(1);
        for (var char in word.characters) {
          if (char == ',' || char == '.' || char == ';') {
            newWord += char;
          } else {
            newWord += '*';
          }
        }
        newPhraseArray.add(newWord);
      } else {
        newPhraseArray.add(word);
      }
    }
    return newPhraseArray;
  }

  String buildCensoredPhrase(List<String> phraseArray) {
    String censoredPhrase = phraseArray.join(" ");
    return censoredPhrase;
  }
}
