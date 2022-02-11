import 'package:flutter/material.dart';
import 'package:flutter_todoey_list/screens/tasks_screen.dart';
import 'package:flutter_todoey_list/models/task_data.dart';
import 'package:provider/provider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: AnimatedSplashScreen(
          duration: 3000,
          splash: Image.asset('Images/splashScreen.png'),
          nextScreen: TasksScreen(),
          splashTransition: SplashTransition.fadeTransition,
          // pageTransitionType: PageTransitionType.rotate,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
