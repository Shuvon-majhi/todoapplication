import 'package:flutter/material.dart';

AppBar AppbarWidget() {
  return AppBar(
    title: const Text(
      'Todo Application',
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.blue,
    centerTitle: true,
    elevation: 10,
  );
}
