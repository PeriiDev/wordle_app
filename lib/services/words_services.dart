import 'dart:convert';

import 'package:http/http.dart';

Future<List<String>> getWords() async {
  String url = "https://examenes-103fc-default-rtdb.europe-west1.firebasedatabase.app/words.json";

  try {
    final response = await get(Uri.parse(url));
    final json = jsonDecode(response.body);

    print('Firebase words: $json');

    List<String> result = [];

    for (final a in json) {
      result.add(a);
    }
    print(result);

    return result;
  } catch (error) {
    print(error);
  }
  return [];
}
