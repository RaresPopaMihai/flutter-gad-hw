import 'package:flutter/material.dart';

void main() {
  runApp(const Directionality(
    textDirection: TextDirection.ltr,
    child: const Text(
      "Homework App",
      style: TextStyle(
        color: Colors.green
      ),
    ),
  ));
}
