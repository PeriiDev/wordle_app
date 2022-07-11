import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:examentema5/provider/main_controller.dart';
import 'package:examentema5/widgets/box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainController = Provider.of<MainController>(context);
    final size = MediaQuery.of(context).size;
    print('La palabra secreta es ${mainController.secretWord}');
    return (mainController.index == 6 || mainController.finishGame)
        ? _FinishPage(
            message: mainController.message,
          )
        : Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20,),
                    const _AppBar(),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: (mainController.index == 0)
                            ? buildRow(size, 0, mainController)
                            : buildRow(size, 0, mainController, mainController.c0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: (mainController.index == 1)
                            ? buildRow(size, 1, mainController)
                            : buildRow(size, 1, mainController, mainController.c1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: (mainController.index == 2)
                            ? buildRow(size, 2, mainController)
                            : buildRow(size, 2, mainController, mainController.c2),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: (mainController.index == 3)
                            ? buildRow(size, 3, mainController)
                            : buildRow(size, 3, mainController, mainController.c3),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: (mainController.index == 4)
                            ? buildRow(size, 4, mainController)
                            : buildRow(size, 4, mainController, mainController.c4),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: (mainController.index == 5)
                            ? buildRow(size, 5, mainController)
                            : buildRow(size, 5, mainController, mainController.c5),
                      ),
                    ),
                    Box(
                      width: double.infinity,
                      height: size.height * 0.35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: buildKeyBoard(size, 1, mainController)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: buildKeyBoard(size, 2, mainController)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: buildKeyBoard(size, 3, mainController)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}

class _KeyBoardLetter extends StatelessWidget {
  final Size size;
  final String letter;

  const _KeyBoardLetter({Key? key, required this.size, this.letter = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final mainController = Provider.of<MainController>(context);
    return GestureDetector(
      onTap: () {
        mainController.printLetter(letter);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 6),
        child: Box(
          width: size.width * 0.08,
          height: size.height * 0.06,
          borderColor: (themeProvider.currentTheme == ThemeData.light()) ? Colors.black : Colors.white,
          borderRadius: 10,
          borderWidth: 0.8,
          child: Center(
            child: Text(
              letter,
              style: const TextStyle(fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }
}

class _Letter extends StatelessWidget {
  String letter;
  Color? color;

  _Letter({
    Key? key,
    required this.size,
    this.letter = "",
    this.color = Colors.transparent,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Box(
        width: size.width * 0.16,
        height: size.height * 0.065,
        borderColor: Colors.grey,
        borderWidth: 1.5,
        backgroundColor: (letter == '') ? Colors.transparent : color!,
        child: Center(
          child: Text(
            letter,
            style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.device_unknown),
        ),
        Expanded(child: Container()),
        const Text(
          'WORDLE (ES)',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Expanded(child: Container()),
        GestureDetector(
          onTap: () {
            final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
            if (themeProvider.currentTheme == ThemeData.light()) {
              themeProvider.setDarkMode();
            } else {
              themeProvider.setLightMode();
            }
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.settings,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}

List<Widget> buildRow(Size size, int index, MainController mainController, [List<Color>? listColors]) {
  List<Widget> result = [];
  String letter = mainController.inputWords[index];
  List<String> letters = letter.split('');
  int i = 0;

  for (String l in letters) {
    result.add(_Letter(
      size: size,
      letter: l,
      color: (listColors != null) ? listColors[i] : Colors.transparent,
    ));
    i++;
  }

  while (result.length < 5) {
    result.add(_Letter(
      size: size,
      letter: '',
    ));
  }

  return result;
}

List<Widget> buildKeyBoard(Size size, int index, MainController mainController) {
  List<Widget> result = [];
  String row1 = "QWERTYUIOP";
  String row2 = "ASDFGHJKLÑ";
  String row3 = "ZXCVBNM";

  if (index == 1) {
    for (int i = 0; i < 10; i++) {
      result.add(_KeyBoardLetter(
        size: size,
        letter: row1[i],
      ));
    }
  }
  if (index == 2) {
    for (int i = 0; i < 10; i++) {
      result.add(_KeyBoardLetter(
        size: size,
        letter: row2[i],
      ));
    }
  }

  if (index == 3) {
    Widget sendWidget = GestureDetector(
      onTap: () {
        mainController.onSendWord();
        //print(mainController.secretWord);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Box(
            width: size.width * 0.14,
            height: size.height * 0.065,
            borderColor: Colors.grey,
            borderWidth: 1.5,
            child: const Center(
              child: Text(
                "Enviar",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            )),
      ),
    );

    result.add(sendWidget);
    for (int i = 0; i < 7; i++) {
      result.add(_KeyBoardLetter(
        size: size,
        letter: row3[i],
      ));
    }

    Widget deleteWidget = GestureDetector(
      onTap: () {
        mainController.deleteChar();
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Box(
            width: size.width * 0.11,
            height: size.height * 0.065,
            borderColor: Colors.grey,
            borderWidth: 1.5,
            child: const Center(
              child: Icon(
                Icons.arrow_back_outlined,
                size: 40,
              ),
            )),
      ),
    );

    result.add(deleteWidget);
  }

  return result;
}

class _FinishPage extends StatelessWidget {
  String message;

  _FinishPage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainController = Provider.of<MainController>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final size = MediaQuery.of(context).size;
    return ElasticInUp(
      child: Scaffold(
        //appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const _AppBar(),
                SizedBox(
                  height: size.height * 0.22,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      message,
                      style: const TextStyle(fontSize: 30),
                    ),
                    const Text('La palabra secreta era ', style: TextStyle(fontSize: 20)),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(mainController.secretWord, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        mainController.playAgain();
                        Navigator.pushReplacementNamed(context, 'home');
                      },
                      child: Box(
                        height: 70,
                        width: 130,
                        borderRadius: 30,
                        borderWidth: 2,
                        borderColor: (themeProvider.currentTheme == ThemeData.light()) ? Colors.black : Colors.white,
                        backgroundColor: Colors.green.shade300,
                        child: const Center(
                          child: Text(
                            'Jugar',
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        mainController.finishApp();
                      },
                      child: Box(
                        height: 70,
                        width: 130,
                        borderRadius: 30,
                        borderWidth: 2,
                        borderColor: (themeProvider.currentTheme == ThemeData.light()) ? Colors.black : Colors.white,
                        backgroundColor: Colors.red.shade300,
                        child: const Center(
                          child: Text(
                            'Salir',
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
