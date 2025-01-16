import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'providers/task_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Create and provide a single instance of TaskProvider throughout the app
      create: (_) => TaskProvider(),
      child: MaterialApp(
        // A title helps distinguish your app when running on a device
        title: 'Minimalist Task Manager',
        debugShowCheckedModeBanner: false, // Disable debug banner
        // Define global theme settings
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontFamily: 'Roboto'),
          ),
        ),

        // The first screen of your app
        home: const HomeScreen(),
      ),
    );
  }
}