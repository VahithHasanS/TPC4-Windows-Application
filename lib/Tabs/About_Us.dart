// ignore_for_file: camel_case_types, file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class About_Us_Tab extends StatefulWidget {
  final UName, UEmail, UniqueCode;
  const About_Us_Tab(
      {super.key,
      required this.UName,
      required this.UEmail,
      required this.UniqueCode});

  @override
  State<About_Us_Tab> createState() => _About_Us_TabState();
}

class _About_Us_TabState extends State<About_Us_Tab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text('Hello About Me!')],
    );
  }
}
