import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_watcher/ui/views/home_view.dart';
import './service_locator.dart';

void main() async {
  // Register all the models and services before the app starts
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Skeleton Watcher',
        theme: ThemeData(
            primaryColor: const Color.fromARGB(255, 9, 202, 172),
            scaffoldBackgroundColor: const Color.fromARGB(255, 26, 27, 30),
            textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'Open Sans',
                bodyColor: Colors.white,
                displayColor: Colors.white)),
        home: const HomeView());
  }
}
