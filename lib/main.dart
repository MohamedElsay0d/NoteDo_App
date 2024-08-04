import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notedo_app/controllers/provider/calculator_provider.dart';
import 'package:notedo_app/themes/theme_data.dart';
import 'package:notedo_app/views/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorProvider(),
      child: GetMaterialApp(
        title: 'Notedo App',

        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.circularReveal,

        // themeMode: ThemeMode.system,

        theme: lightTheme,
        darkTheme: darkTheme,

        // initialBinding: BindingsBuilder(() {
        //   Get.lazyPut<NoteTodoController>(() => NoteTodoController());
        // }),
        home: HomeScreen(),
      ),
    );
  }
}
