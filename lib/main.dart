import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:trallo/screens/TCSplashScreen.dart';
import 'package:trallo/store/AppStore.dart';
import 'package:trallo/store/TCBoardStore.dart';
import 'package:trallo/store/TCStore.dart';
import 'package:trallo/utils/AppTheme.dart';
import 'package:trallo/utils/TCConstants.dart';

AppStore appStore = AppStore();
TCStore tcStore = TCStore();
TCBoardStore tcBoardStore = TCBoardStore();
int setWallpaper = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  appStore.toggleDarkMode(value: await getBool(isDarkModeOnPref, defaultValue: false));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return MaterialApp(
          title: 'Trallo ',
          theme: !appStore.isDarkModeOn ? AppThemeData.lightTheme : AppThemeData.darkTheme,
          builder: scrollBehaviour(),
          debugShowCheckedModeBanner: false,
          home: TCSplashScreen(),
        );
      },
    );
  }
}
