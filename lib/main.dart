import 'package:flutter/material.dart';
import 'package:payment_app_ui/pages/bottomNav.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            themeMode: themeProvider.themeMode,
            // theme: ThemeData(
            //   colorScheme: ColorScheme.fromSeed(
            //       seedColor: const Color.fromARGB(255, 17, 29, 230)),
            //   useMaterial3: true,
            //   fontFamily: 'Lato',
            // ),
            home: const BottomNav(),
          );
        });
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;

    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black45,
    primaryColor: Colors.black,
    colorScheme:
        ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0)),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 243, 242, 248),
    // primaryColor: Colors.white,
    // colorScheme: ColorScheme.fromSeed(
    //     seedColor: const Color.fromARGB(255, 255, 245, 245)),
  );
}
