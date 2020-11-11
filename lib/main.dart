import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:redlipschallange/res/app_colors.dart';
import 'package:redlipschallange/screens/home.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: AppColors.primaryColor,
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
            color: AppColors.primaryColor,
            elevation: 0,
            textTheme: TextTheme()),
        textTheme: TextTheme(
            headline2: Theme.of(context)
                .textTheme
                .headline2
                .copyWith(color: Colors.white, fontSize: 16),
            headline6: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.white, fontSize: 16),
            bodyText1: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: Colors.white, fontSize: 16)),
      ),
      home: HomeScreen(
        cameras: cameras,
      ),
    );
  }
}
