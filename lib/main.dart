import 'package:examentema5/pages/home.dart';
import 'package:examentema5/provider/main_controller.dart';
import 'package:examentema5/provider/theme.dart';
import 'package:examentema5/routes/routes.dart';
import 'package:examentema5/services/words_services.dart';
import 'package:examentema5/shared_preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  final list = await getWords();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider(isDarkMode: Preferences.isDarkMode)),
    ChangeNotifierProvider(create: (_) => MainController(list)),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //home:
      initialRoute: 'home',
      routes: getAppRoutes(),
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      onGenerateRoute: (RouteSettings settings) => MaterialPageRoute(builder: (BuildContext context) => HomePage()),
    );
  }
}
