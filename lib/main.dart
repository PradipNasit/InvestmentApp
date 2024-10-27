import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investment/controller/investment_controller.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.put(InvestmentController()).loadInvestments();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Investment Tracker',
      theme: ThemeData.dark().copyWith(
      primaryColor: Colors.tealAccent,
      scaffoldBackgroundColor: const Color(0xFF1D1E33),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.tealAccent,
        foregroundColor: Colors.black,
        elevation: 2,
      ) , floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.tealAccent,
        foregroundColor: Colors.black,
      ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          bodyMedium: TextStyle(color: Colors.white70, fontSize: 16),
        ),
      ),

      home: HomeScreen(),
    );
  }
}
