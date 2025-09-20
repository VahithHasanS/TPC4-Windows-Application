// ignore_for_file: camel_case_types, file_names, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names, avoid_types_as_parameter_names, unused_local_variable, await_only_futures, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:meta_blaster/Screens/DashBoard.dart';
import 'package:meta_blaster/Screens/forgot_Password.dart';
import 'package:meta_blaster/Screens/sign_In.dart';
import 'package:meta_blaster/mongoDB/connect_&_constant.dart';

class log_IN_Here extends StatefulWidget {
  const log_IN_Here({super.key});

  @override
  State<log_IN_Here> createState() => _log_IN_HereState();
}

class _log_IN_HereState extends State<log_IN_Here> {
  TextEditingController userPasswordCon = TextEditingController();
  TextEditingController userEmailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Container(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width / 1.15,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: const Offset(
                      1.0,
                      1.0,
                    ),
                    blurRadius: 5.0,
                    spreadRadius: 1.0), //BoxShadow
                BoxShadow(
                    color: Colors.black38,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0) //BoxShadow
              ]),
          child: Row(children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        bottomLeft: Radius.circular(12.0))),
                width: MediaQuery.of(context).size.width / 2.75,
                height: MediaQuery.of(context).size.height / 1,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3.325,
                          child: Row(
                            children: [
                              Image(
                                image:
                                    AssetImage('assets/icon/icon-outline.png'),
                                height: 50.0,
                                width: 50.0,
                                fit: BoxFit.fill,
                                filterQuality: FilterQuality.high,
                              ),
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
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                            width: MediaQuery.of(context).size.width / 3.5,
                            height: 230.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: const Offset(
                                        1.0,
                                        1.0,
                                      ),
                                      blurRadius: 2.0,
                                      spreadRadius: 1.0), //BoxShadow
                                  BoxShadow(
                                      color: Colors.black38,
                                      offset: const Offset(0.0, 0.0),
                                      blurRadius: 0.0,
                                      spreadRadius: 0.0) //BoxShadow
                                ]),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: TextField(
                                          controller: userEmailCon,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          cursorColor: Colors.black,
                                          decoration: InputDecoration(
                                              labelText: 'Enter valid email',
                                              labelStyle: TextStyle(
                                                  color: Colors.black38),
                                              hintText:
                                                  'Enter valid email address here',
                                              hintStyle: TextStyle(
                                                  color: Colors.black38),
                                              icon: Icon(Icons.email)),
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.0))),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: TextField(
                                          keyboardType: TextInputType.text,
                                          cursorColor: Colors.black,
                                          obscureText: true,
                                          controller: userPasswordCon,
                                          decoration: InputDecoration(
                                              labelText: 'Enter valid Password',
                                              labelStyle: TextStyle(
                                                  color: Colors.black38),
                                              hintText:
                                                  'Enter your valid password',
                                              hintStyle: TextStyle(
                                                  color: Colors.black38,
                                                  letterSpacing: 1.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.0),
                                              icon: Icon(Icons.password)),
                                          style: TextStyle(
                                              letterSpacing: 4.0,
                                              color: Colors.black45,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0))),
                                  Container(
                                      padding: EdgeInsets.only(
                                          bottom: 6.0, right: 6.0),
                                      width: MediaQuery.of(context).size.width /
                                          3.5,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ForgotPassword_Here()),
                                                );
                                              },
                                              child: Text(
                                                'Forgot password',
                                                style: TextStyle(
                                                    color: Colors.indigo),
                                              )),
                                        ],
                                      )),
                                  MaterialButton(
                                    color: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    hoverElevation: 6.0,
                                    splashColor: Colors.green.shade700,
                                    minWidth:
                                        MediaQuery.of(context).size.width / 4,
                                    onPressed: () async {
                                      if (userEmailCon.text.isEmpty ||
                                          userPasswordCon.text.isEmpty) {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext) {
                                              return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15.0))),
                                                  child: Container(
                                                    width: 300.0,
                                                    height: 430.0,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    15.0)),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                            height: 250.0,
                                                            width: 250.0,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                                image: DecorationImage(
                                                                    image: NetworkImage(
                                                                        'https://img.freepik.com/free-vector/toggle-concept-illustration_114360-8307.jpg?w=740&t=st=1702821171~exp=1702821771~hmac=7fdc6ff6b6f48e1ef3dff5970ed7c3fb51fd8f96b6c9f5726a85fba4f9e0909c'),
                                                                    fit: BoxFit
                                                                        .cover))),
                                                        Container(
                                                            width:
                                                                double.infinity,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 15.0,
                                                                    left: 15.0),
                                                            child: Text(
                                                                "Fields won't be empty",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .redAccent
                                                                        .shade200,
                                                                    fontSize:
                                                                        19.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start)),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: Text(
                                                                'Sorry, Email or password is Empty, there are no fields will not be empty, please fill the all text fields and enter the valid email and password to unlock your account.',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black45,
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center))
                                                      ],
                                                    ),
                                                  ));
                                            });
                                      } else if (await ConnectConstant
                                              .login_Fetch(
                                                  userEmailCon.text.toString(),
                                                  userPasswordCon.text
                                                      .toString()) ==
                                          true) {
                                        String uName = await ConnectConstant
                                            .fetchUNameOnly(
                                                userEmailCon.text.toString());

                                        dynamic userCodeName =
                                            await ConnectConstant.fetchIDOnly(
                                                userEmailCon.text.toString());

                                        showDialog(
                                            context: context,
                                            builder: (BuildContext) {
                                              return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15.0))),
                                                  child: Container(
                                                    height: 250.0,
                                                    width: 250.0,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                'https://cdn.dribbble.com/users/129972/screenshots/3964116/75_smile.gif'),
                                                            fit: BoxFit.cover)),
                                                  ));
                                            });

                                        Future.delayed(Duration(seconds: 3),
                                            () async {
                                          Navigator.pop(context);

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Dash_Board_Page(
                                                        UName: uName.toString(),
                                                        UEmail: userEmailCon
                                                            .text
                                                            .toString(),
                                                        userCode: userCodeName,
                                                        indexVal: 0,
                                                      )));

                                          //userEmailCon.clear();
                                          //userPasswordCon.clear();
                                        });
                                      } else {
                                        //userEmailCon.clear();
                                        //userPasswordCon.clear();

                                        showDialog(
                                            context: context,
                                            builder: (BuildContext) {
                                              return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15.0))),
                                                  child: Container(
                                                    width: 300.0,
                                                    height: 430.0,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    15.0)),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                            height: 250.0,
                                                            width: 250.0,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                                image: DecorationImage(
                                                                    image: NetworkImage(
                                                                        'https://img.freepik.com/free-vector/toggle-concept-illustration_114360-8307.jpg?w=740&t=st=1702821171~exp=1702821771~hmac=7fdc6ff6b6f48e1ef3dff5970ed7c3fb51fd8f96b6c9f5726a85fba4f9e0909c'),
                                                                    fit: BoxFit
                                                                        .cover))),
                                                        Container(
                                                            width:
                                                                double.infinity,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 15.0,
                                                                    left: 15.0),
                                                            child: Text(
                                                                'Invalid Entries',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .redAccent
                                                                        .shade200,
                                                                    fontSize:
                                                                        19.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start)),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: Text(
                                                                'Sorry, This Email or password is incorrect, please enter the valid email and password to unlock your account. Pleases try again later or now.',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black45,
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center))
                                                      ],
                                                    ),
                                                  ));
                                            });
                                      }
                                    },
                                    child: Text('Log In',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                  ),
                                  SizedBox(height: 5.0)
                                ])),
                      ),
                      SizedBox(height: 20.0),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3.5,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: const Offset(
                                      1.0,
                                      1.0,
                                    ),
                                    blurRadius: 2.0,
                                    spreadRadius: 1.0), //BoxShadow
                                BoxShadow(
                                    color: Colors.black38,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0) //BoxShadow
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person, color: Colors.grey),
                              SizedBox(width: 7.0),
                              Text("Don't have an account?"),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Sing_In_Here()),
                                    );
                                  },
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ))
                            ],
                          ),
                        ),
                      )
                    ])),
            Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(2500, 2050.0),
                        bottomLeft: Radius.elliptical(600, 500),
                        topRight: Radius.elliptical(50, 50),
                        bottomRight: Radius.elliptical(50, 50))),
                height: MediaQuery.of(context).size.height / 1,
                width: MediaQuery.of(context).size.width / 1.9775,
                child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                    Container(
                        height: 250.0,
                        width: 250.0,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(250.0)),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://images1.the-dots.com/2767093/octi3.gif?p=socialLarge'),
                                fit: BoxFit.cover))),
                    SizedBox(height: 50.0),
                    Text('Welcome to login',
                        style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                          'Hi welcome to HaHuTrendz login page, This will be conformed your account for navigate you to work on your account page. If you do not have any account please go and create an account first in the sign in page the page is under the login container click that sigin text button.',
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                          textAlign: TextAlign.center),
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 200.0),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.arrow_back, color: Colors.white),
                                Text(
                                  'Back',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0),
                                )
                              ])),
                    ),
                    SizedBox(height: 10.0)
                  ]),
                ))
          ]),
        )));
  }
}
