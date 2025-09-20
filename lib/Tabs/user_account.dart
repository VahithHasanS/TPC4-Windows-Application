// ignore_for_file: camel_case_types, file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class User_Account_Tab extends StatefulWidget {
  final UName, UEmail, UniqueCode;
  const User_Account_Tab(
      {super.key,
      required this.UName,
      required this.UEmail,
      required this.UniqueCode});

  @override
  State<User_Account_Tab> createState() => _User_Account_TabState();
}

class _User_Account_TabState extends State<User_Account_Tab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text('Hello User Account')],
    );
  }
}
