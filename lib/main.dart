// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, deprecated_member_use, must_be_immutable, avoid_print

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta_blaster/Screens/log_In.dart';
import 'package:meta_blaster/Screens/sign_In.dart';
import 'package:meta_blaster/mongoDB/connect_&_constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConnectConstant.connect();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.green,
  ));

  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage()));

  doWhenWindowReady(() {
    final initialSize = Size(1500, 800);
    appWindow.maxSize = Size(1500, 900);
    appWindow.minSize = initialSize;
    appWindow.title = 'HaHuTrendz';

    appWindow.size = initialSize; //default size 
    appWindow.show();
  });
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.white,
            elevation: 0.0,
            actions: [
              Center(
                  child: Row(children: [
                Image(image: AssetImage('assets/icon/icon-outline.png')),
                RichText(
                    text: const TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: 'HaHu',
                      style: TextStyle(
                          fontFamily: 'Comfortaa',
                          fontSize: 20.0,
                          color: Colors.red)),
                  TextSpan(
                      text: "Trendz",
                      style: TextStyle(
                          fontFamily: 'Comfortaa',
                          fontSize: 20.0,
                          color: Colors.grey))
                ])),
                SizedBox(width: 7.0),
                Text('Version 1.0.4',
                    style: TextStyle(fontSize: 10.0),
                    textAlign: TextAlign.center),
                SizedBox(width: 10.0)
              ]))
            ]),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                SizedBox(height: 50.0),
                Container(
                    width: double.infinity,
                    child: Text(
                        'Welcome To HaHuTrendz Windows Management System',
                        style: TextStyle(fontSize: 20.0, color: Colors.black54),
                        textAlign: TextAlign.center)),
                SizedBox(height: 35.0),
                Center(
                  child: Container(
                      width: 500.0,
                      height: 370.0,
                      child: Image.network(
                          'https://static.vecteezy.com/system/resources/previews/029/711/432/original/green-environment-with-ai-generated-free-png.png',
                          fit: BoxFit.cover)),
                ),
                SizedBox(height: 50.0),
                Center(
                    child: Column(children: <Widget>[
                  MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => log_IN_Here()),
                        );
                      },
                      minWidth: 400.0,
                      height: 50.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side: BorderSide(
                              color: Colors.black45,
                              width: 1.0,
                              strokeAlign: BorderSide.strokeAlignCenter)),
                      child: Text('Log In', style: TextStyle(fontSize: 16.0))),
                  SizedBox(height: 15.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Container(
                      padding: const EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          border: const Border(
                              bottom: BorderSide(color: Colors.black),
                              top: BorderSide(color: Colors.black),
                              left: BorderSide(color: Colors.black),
                              right: BorderSide(color: Colors.black))),
                      child: MaterialButton(
                          minWidth: 400.0,
                          color: Colors.yellow,
                          splashColor: Colors.yellow.shade600,
                          height: 50.0,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Sing_In_Here()),
                            );
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          child: const Text("Sign In",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600))),
                    ),
                  ),
                ])),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(right: 22.0),
                          child: Text('Powered by',
                              style: TextStyle(
                                  fontSize: 11.0, color: Colors.red.shade700),
                              textAlign: TextAlign.end)),
                      Container(
                          width: double.infinity,
                          child: Text('Vahith Hasan.S',
                              style: TextStyle(
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87),
                              textAlign: TextAlign.end)),
                    ],
                  ),
                )
              ])),
        ));
  }
}
