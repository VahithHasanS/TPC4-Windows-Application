// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, file_names, sized_box_for_whitespace, avoid_web_libraries_in_flutter, unused_import, unused_local_variable, avoid_types_as_parameter_names, prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers

//import 'dart:js';

//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta_blaster/Models/smallCards.dart';

Widget First_Graph_Labels(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(10.0),
    //width: 300.0,
    child: Column(
      children: [
        Text('Total Participation Graph Analytics',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
        SizedBox(height: 30.0),
        Row(children: [
          Container(
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(6.0))),
          SizedBox(width: 10.0),
          Text('Cash Amt',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0)),
          SizedBox(width: 30.0),
          Container(
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(6.0))),
          SizedBox(width: 10.0),
          Text('Credit Amt',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0))
        ]),
        SizedBox(height: 30.0),
        Row(children: [
          Container(
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(6.0))),
          SizedBox(width: 10.0),
          Text('Cash Doc',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0)),
          SizedBox(width: 30.0),
          //Spacer(),
          Container(
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(6.0))),
          SizedBox(width: 10.0),
          Text('Credit Doc',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0))
        ]),
        SizedBox(height: 30.0),
        Row(children: [
          Text('1. Branch Pc-4, ',
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87)),
          SizedBox(width: 20.0),
          Text('2. Shajahan',
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87))
        ]),
        SizedBox(height: 20.0),
        Row(children: [
          Text('3. Root, ',
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87)),
          SizedBox(width: 20.0),
          Text('4. CCC, ',
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87)),
          SizedBox(width: 20.0),
          Text('5. Others',
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87))
        ])
      ],
    ),
  );
}

Widget NotificationPellatte(BuildContext context) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    Container(
        padding: EdgeInsets.all(15.0),
        height: 250.0,
        width: MediaQuery.of(context).size.width / 3.5,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
                image: NetworkImage(
                    'https://s3.us-west-1.wasabisys.com/ft-backgrounds/-mreflowMatt_Wolfe_a_colorful_digital_background_477e314c-c8c2-4491-88d5-1194cd417006.jpeg'),
                fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: const Offset(
                    1.0,
                    1.0,
                  ),
                  blurRadius: 4.0,
                  spreadRadius: 1.0), //BoxShadow
              BoxShadow(
                  color: Colors.black38,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0) //BoxShadow
            ]),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: double.infinity,
                  child: Text('Wednesday 21 Semptember 2023',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.start)),
              Container(
                  width: double.infinity,
                  child: Text(
                      'Hi there, welcome to HaHuTrendz Dashboard, you can do your work by us for easy, simple and fast, you have done such a great job by choosing us, we are thanking you to that great job, Do your best, have a nice day. Click to Know more information.',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.justify)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.white,
                      child: Text('show more'),
                    ),
                  ),
                ],
              )
            ])),
    Container(
        padding: EdgeInsets.all(15.0),
        height: 250.0,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              children: [
                Text('Notification and navigation task bar field',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
                SizedBox(width: 10.0),
                Icon(Icons.notifications_outlined,
                    color: Colors.red, size: 30.0)
              ],
            ),
            Text(
              'Thiscontaineris for nothification from groups and important things and defualt parmanent participation.',
              style: TextStyle(color: Colors.black87),
            ),
            SizedBox(height: 20.0),
            Container(
                width: MediaQuery.of(context).size.width / 2.08,
                child: MSG_Notification_Reminder())
          ]),
          Container(
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://media1.tenor.com/m/iCHjia7sQZUAAAAd/herramientas.gif'),
                      fit: BoxFit.cover)))
        ]))
  ]);
}

Widget inputFields001(BuildContext context, readMode, keyboardType, controller,
    label, hint, icon, _focusNode1, _focusNode2) {
  return TextFormField(
      focusNode: _focusNode1,
      autofocus: true,
      keyboardType: keyboardType,
      textCapitalization: TextCapitalization.characters,
      controller: controller,
      readOnly: readMode,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(_focusNode2);
      },
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
              color: Colors.black54,
              fontSize: 15.0,
              fontWeight: FontWeight.w500),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.black54, fontSize: 14.6),
          suffixIcon: Icon(icon)),
      style: TextStyle(
          color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 16.0));
}

Widget GridOutletCards(BuildContext context, title, value, icon, color) {
  return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: const Offset(
                  1.0,
                  1.0,
                ),
                blurRadius: 4.0,
                spreadRadius: 1.0), //BoxShadow
            BoxShadow(
                color: Colors.black38,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0) //BoxShadow
          ],
          color: Colors.white),
      width: 270.0,
      height: 100.0,
      child: Column(children: [
        Spacer(),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(children: [
              Text(title,
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500))
            ])),
        Spacer(),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${value ?? 0}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500)),
                  Icon(icon, color: color.shade900, size: 40.0)
                ])),
        Spacer(),
        Divider(color: color, thickness: 15.0)
      ]));
}
