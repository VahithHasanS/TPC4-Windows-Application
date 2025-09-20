// ignore_for_file: camel_case_types, file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Group_Up_Tab extends StatefulWidget {
  final UName, UEmail, UniqueCode;
  const Group_Up_Tab(
      {super.key,
      required this.UName,
      required this.UEmail,
      required this.UniqueCode});

  @override
  State<Group_Up_Tab> createState() => _Group_Up_TabState();
}

class _Group_Up_TabState extends State<Group_Up_Tab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text('Hello Group Up')],
    );
  }
}
