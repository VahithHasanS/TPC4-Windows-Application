// ignore_for_file: camel_case_types, file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Analytics_tab extends StatefulWidget {
  final UName, UEmail, UniqueCode;
  const Analytics_tab(
      {super.key,
      required this.UName,
      required this.UEmail,
      required this.UniqueCode});

  @override
  State<Analytics_tab> createState() => _Analytics_tabState();
}

class _Analytics_tabState extends State<Analytics_tab> {
  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Hello Analytics')],
        );
  }
}
