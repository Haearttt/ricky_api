import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ricky/view/main_page.dart';
import 'package:ricky/view_model/main_view_model.dart';

void main() {
  runApp( MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (BuildContext context) => MainViewModel(),
        child: MainPage(),
      ),
    );
  }
}
