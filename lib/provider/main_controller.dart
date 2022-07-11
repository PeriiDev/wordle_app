import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class MainController extends ChangeNotifier {
  //Todas mis palabras de mi APP
  //Deben venir desde un endpoint de firebase
  List<String> words = ["", "", "", "", ""];

  //La palabra que el usuario tiene que adivinar
  //La cogeremos de forma aleatoria del array de words
  String secretWord = "";

  //Lista de palabras que ya he introducido
  List<String> inputWords = ["", "", "", "", "", ""];

  //La palabra actual que estoy escribiendo antes de darle a enviar
  String currentWord = "";
  bool finishGame = false;

  //La posición del ROW actual para saber donde pinto
  int index = 0;

  //Mensaje de final del juego
  String message = "";

  List<Color> listColors = const [
    Color.fromARGB(0, 255, 255, 255),
    Color.fromARGB(0, 255, 255, 255),
    Color.fromARGB(0, 255, 255, 255),
    Color.fromARGB(0, 255, 255, 255),
    Color.fromARGB(0, 255, 255, 255),
    Color.fromARGB(0, 255, 255, 255)
  ];

  List<Color> c0 = [];
  List<Color> c1 = [];
  List<Color> c2 = [];
  List<Color> c3 = [];
  List<Color> c4 = [];
  List<Color> c5 = [];

  MainController(List<String> list) {
    generateSecretWord();
    words = list;
    generateSecretWord();
  }

  printLetter(String letter) {
    //Si la longitud de la letra es menor de 5 concateno
    if (currentWord.length < 5 && !finishGame) {
      currentWord += letter;
      inputWords[index] = currentWord;
    }

    notifyListeners();
  }

  deleteChar() {
    if (currentWord.isNotEmpty && !finishGame) {
      currentWord = currentWord.substring(0, currentWord.length - 1);
      inputWords[index] = currentWord;
    }
    notifyListeners();
  }

  onSendWord() {
    if (!finishGame) {
      int correctWord = 0;
      //Solo resuelvo en caso de que la longitud de la palabra sea 5
      if (currentWord.length == 5) {
        for (int i = 0; i < 5; i++) {
          if (secretWord[i] == currentWord[i]) {
            listColors[i] = const Color.fromARGB(255, 115, 243, 3);
            correctWord++;
          } else if (secretWord.contains(currentWord[i], i)) {
            listColors[i] = const Color.fromARGB(151, 251, 255, 3);
          } else {
            listColors[i] = const Color.fromARGB(255, 136, 136, 136);
          }
        }

        if (index == 0) {
          c0 = [...listColors];
        }
        if (index == 1) {
          c1 = [...listColors];
        }
        if (index == 2) {
          c2 = [...listColors];
        }
        if (index == 3) {
          c3 = [...listColors];
        }
        if (index == 4) {
          c4 = [...listColors];
        }
        if (index == 5) {
          c5 = [...listColors];
        }
        currentWord = "";
        if (index <= 5) {
          index++;
        }
      }
      if (correctWord == 5) {
        //Aqui ha ganado el juego y vuelve a pedirle que juegue de nuevo
        message = "GENIAL, HAS GANADO";
        finishGame = true;
      }
      //Si le doy a enviar palabra y el index esta en 5 es el ultimo intento
      if (index == 6 && !finishGame) {
        //En este punto he perdido y tengo que enviar al usuario a jugar de nuevo
        message = "LO SIENTO, HAS PERDIDO";
        finishGame = true;
      }
    }

    notifyListeners();
  }

  generateSecretWord() {
    //Hago una ordenacion aleatoria
    words.shuffle();
    //Me quedo con el primer elemento
    secretWord = words[0];
  }

  playAgain() {
    if (words.isNotEmpty) {
      words.removeAt(0);
      currentWord = "";
      index = 0;
      inputWords = ["", "", "", "", "", ""];
      c0.clear();
      c1.clear();
      c2.clear();
      c3.clear();
      c4.clear();
      c5.clear();
      finishGame = false;
      message = "";
      generateSecretWord();
    } else {
      finishApp();
    }
  }

  finishApp() {
    //Not support for IOS
    SystemNavigator.pop();
  }
}
