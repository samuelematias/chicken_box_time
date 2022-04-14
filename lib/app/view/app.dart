import 'package:chicken_box_time/features/home/home.dart';
import 'package:chicken_box_time/flavor/flavor.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
      builder: (BuildContext context, Widget? child) {
        return FlavorBanner(child: child);
      },
    );
  }
}
