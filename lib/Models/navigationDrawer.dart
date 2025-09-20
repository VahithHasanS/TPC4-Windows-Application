// ignore_for_file: file_names, unused_import, must_be_immutable, prefer_typing_uninitialized_variables, non_constant_identifier_names, prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_types_as_parameter_names, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meta_blaster/Screens/log_In.dart';

class NavDrwer extends StatefulWidget {
  final uniqueCode, name, email;
  NavDrwer(
      {Key? key,
      required this.uniqueCode,
      required this.name,
      required this.email})
      : super(key: key);

  @override
  State<NavDrwer> createState() => _NavDrwerState();
}

class _NavDrwerState extends State<NavDrwer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 3.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      backgroundColor: Colors.white,
      child: ListView(padding: EdgeInsets.zero, children: [
        Row(
          children: <Widget>[
            Image.asset(
              'assets/icon/icon-outline.png',
              height: 75.0,
              width: 75.0,
            ),
            RichText(
                text: const TextSpan(children: <TextSpan>[
              TextSpan(
                  text: "HaHu",
                  style: TextStyle(
                      color: Colors.red,
                      fontFamily: 'Comfortaa',
                      fontSize: 20.0)),
              TextSpan(
                  text: "Trendz",
                  style: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Comfortaa',
                      fontSize: 20.0))
            ])),
          ],
        ),
        SingleChildScrollView(
          child: DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.transparent),
                accountName: Text(
                  '${widget.name}',
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: Text(
                  '${widget.email}',
                  style: TextStyle(color: Colors.black87),
                ),
                currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    backgroundImage: NetworkImage(
                        'https://randomuser.me/api/portraits/men/78.jpg')),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: MaterialButton(
            onPressed: () {},
            color: Colors.black,
            child: const Text(
              'View Account',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Action Labels',
            style: TextStyle(color: Colors.black54, fontSize: 16.0),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.email,
            color: Colors.black,
            size: 35.0,
          ),
          title: const Text(
            'My Email Manager',
            style: TextStyle(color: Colors.black, fontSize: 18.0),
          ),
          onTap: () {
            //Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.cloud,
            color: Colors.black,
            size: 35.0,
          ),
          title: const Text(
            'Database Manager',
            style: TextStyle(color: Colors.black, fontSize: 18.0),
          ),
          onTap: () {
            //Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.password,
            color: Colors.black,
            size: 35.0,
          ),
          title: const Text(
            'Password Manager',
            style: TextStyle(color: Colors.black, fontSize: 18.0),
          ),
          onTap: () {
            //Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.settings,
            color: Colors.black,
            size: 35.0,
          ),
          title: const Text(
            'Settings',
            style: TextStyle(color: Colors.black, fontSize: 18.0),
          ),
          onTap: () {
            //Navigator.pop(context);
          },
        ),
        const SizedBox(
          height: 20.0,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Additional Labels',
            style: TextStyle(color: Colors.black54, fontSize: 16.0),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.more_vert,
            color: Colors.black,
            size: 35.0,
          ),
          title: const Text(
            'More Settings',
            style: TextStyle(color: Colors.black, fontSize: 18.0),
          ),
          onTap: () {
            //Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.logout,
            color: Colors.black,
            size: 35.0,
          ),
          title: const Text(
            'Log Out',
            style: TextStyle(color: Colors.black, fontSize: 18.0),
          ),
          onTap: () {
            //Navigator.pop(context);
            showDialog(
                context: context,
                builder: (BuildContext) {
                  return Dialog(
                      child: Container(
                    padding: EdgeInsets.all(15.0),
                    height: 250.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Do you Loging Out?...',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.0))
                              ]),
                          Text(
                              'Realy? do you have to log out. It is fine, just click yes, if you changed mind click no or other side of dialog box. Thank you.',
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.justify),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  log_IN_Here()));
                                    },
                                    color: Colors.red,
                                    padding: EdgeInsets.all(15.0),
                                    child: Text('Yes',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17.0))),
                                MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    color: Colors.green,
                                    padding: EdgeInsets.all(15.0),
                                    child: Text('No',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17.0)))
                              ])
                        ]),
                  ));
                });
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.exit_to_app,
            color: Colors.black,
            size: 35.0,
          ),
          title: const Text(
            'Exit',
            style: TextStyle(color: Colors.black, fontSize: 18.0),
          ),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext) {
                  return Dialog(
                      child: Container(
                    padding: EdgeInsets.all(15.0),
                    height: 250.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Do you Exit From Here!!!...',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.0))
                              ]),
                          Text(
                              'Realy? do you have to exit. It is fine, just click yes, if you changed mind click no or other side of dialog box. Thank you.',
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.justify),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MaterialButton(
                                    onPressed: () {
                                      exit(0);
                                    },
                                    color: Colors.red,
                                    padding: EdgeInsets.all(15.0),
                                    child: Text('Yes',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17.0))),
                                MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    color: Colors.green,
                                    padding: EdgeInsets.all(15.0),
                                    child: Text('No',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17.0)))
                              ])
                        ]),
                  ));
                });

            //Navigator.pop(context);
          },
        ),
      ]),
    );
  }
}
