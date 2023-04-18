import 'package:flutter/material.dart';

class BuildApp extends StatelessWidget {
  const BuildApp({super.key, required this.myFunctionality});
  final Widget myFunctionality;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: myFunctionality,
      ),
    );
  }
}
