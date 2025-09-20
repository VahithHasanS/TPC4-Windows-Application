// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names, avoid_types_as_parameter_names, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers, unused_local_variable, use_build_context_synchronously, avoid_print, avoid_print, duplicate_ignore

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:meta_blaster/Screens/log_In.dart';
import 'package:meta_blaster/mongoDB/connect_&_constant.dart';
import 'package:mailer/mailer.dart';

class Sing_In_Here extends StatefulWidget {
  const Sing_In_Here({super.key});

  @override
  State<Sing_In_Here> createState() => _Sing_In_HereState();
}

class _Sing_In_HereState extends State<Sing_In_Here> {
  TextEditingController OTP1 = TextEditingController();
  TextEditingController OTP2 = TextEditingController();
  TextEditingController OTP3 = TextEditingController();
  TextEditingController OTP4 = TextEditingController();

  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhoneNumber = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  void sendMail({
    required String recipientEmail,
    required String OTP,
  }) async {
    // change your email here
    String username = 'vahithhasannorth@gmail.com';
    // change your password here
    String password = 'idtyefgburvogera';
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'Mail Service')
      ..recipients.add(recipientEmail)
      ..subject = 'HaHuTrendz Verification Mail.'
      ..text =
          'Message: This is just an email from HaHuTrendz Verification. You are creating an account $recipientEmail by the username in our app. Do you want to create an account in our app?. please verifiy the code, The code is $OTP . This code will have been expired in 8 minutes. Thanking you.';

    try {
      await send(message, smtpServer);
      print('Email sent successfully');
    } catch (e) {
      print(e.toString());
    }
  }

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
                            height: 375.0,
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
                                      child: TextFormField(
                                          controller: userName,
                                          keyboardType: TextInputType.text,
                                          cursorColor: Colors.black,
                                          decoration: InputDecoration(
                                              labelText: 'User name',
                                              labelStyle: TextStyle(
                                                  color: Colors.black38),
                                              hintText:
                                                  'Enter youe user name here',
                                              hintStyle: TextStyle(
                                                  color: Colors.black38),
                                              icon: Icon(Icons.person)),
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.0))),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: TextFormField(
                                          controller: userEmail,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          cursorColor: Colors.black,
                                          decoration: InputDecoration(
                                              labelText: 'Enter  email',
                                              labelStyle: TextStyle(
                                                  color: Colors.black38),
                                              hintText:
                                                  'Enter your email address here',
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
                                      child: TextFormField(
                                          controller: userPhoneNumber,
                                          keyboardType: TextInputType.number,
                                          cursorColor: Colors.black,
                                          decoration: InputDecoration(
                                              labelText: 'Phone number',
                                              labelStyle: TextStyle(
                                                  color: Colors.black38),
                                              hintText:
                                                  'Enter youe valid phone number',
                                              hintStyle: TextStyle(
                                                  color: Colors.black38),
                                              icon: Icon(Icons.phone)),
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.0))),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          cursorColor: Colors.black,
                                          controller: userPassword,
                                          obscureText: true,
                                          decoration: InputDecoration(
                                              labelText: 'Enter Password',
                                              labelStyle: TextStyle(
                                                  color: Colors.black38),
                                              hintText:
                                                  'Enter your password here',
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
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          cursorColor: Colors.black,
                                          obscureText: true,
                                          controller: confirmPassword,
                                          decoration: InputDecoration(
                                              labelText: 'Confirm Password',
                                              labelStyle: TextStyle(
                                                  color: Colors.black38),
                                              hintText:
                                                  'Enter Confirm password here',
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
                                  MaterialButton(
                                    color: Colors.orange.shade700,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    hoverElevation: 6.0,
                                    splashColor: Colors.amber.shade700,
                                    minWidth:
                                        MediaQuery.of(context).size.width / 4,
                                    onPressed: () async {
                                      if (userName.text.isEmpty ||
                                          userEmail.text.isEmpty ||
                                          userPhoneNumber.text.isEmpty ||
                                          userPassword.text.isEmpty ||
                                          confirmPassword.text.isEmpty) {
                                        Future.delayed(Duration(seconds: 4),
                                            () async {
                                          Navigator.pop(context);

                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    15.0))),
                                                    child: Container(
                                                        width: 300.0,
                                                        height: 420.0,
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
                                                                          BorderRadius.circular(
                                                                              15.0),
                                                                      image: DecorationImage(
                                                                          image: NetworkImage(
                                                                              'https://img.freepik.com/free-vector/toggle-concept-illustration_114360-8307.jpg?w=740&t=st=1702821171~exp=1702821771~hmac=7fdc6ff6b6f48e1ef3dff5970ed7c3fb51fd8f96b6c9f5726a85fba4f9e0909c'),
                                                                          fit: BoxFit
                                                                              .cover))),
                                                              Container(
                                                                  width: double
                                                                      .infinity,
                                                                  padding: EdgeInsets.only(
                                                                      top: 15.0,
                                                                      left:
                                                                          15.0),
                                                                  child: Text(
                                                                      'Text fields should be filled',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .redAccent
                                                                              .shade200,
                                                                          fontSize:
                                                                              18.0,
                                                                          fontWeight: FontWeight
                                                                              .w700),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start)),
                                                              Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          10.0),
                                                                  child: Text(
                                                                      'Sorry, Please fill the all text fields to create an account for you as your email and password. Pleases try again.',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black45,
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight: FontWeight
                                                                              .w500),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center))
                                                            ])));
                                              });
                                        });
                                      }

                                      if ((userPassword.text !=
                                              confirmPassword.text) &&
                                          (confirmPassword.text.isNotEmpty &&
                                              userPassword.text.isNotEmpty)) {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15.0))),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.all(15.0),
                                                    height: 350.0,
                                                    width: 200.0,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    15.0)),
                                                    child: Column(children: [
                                                      Container(
                                                          width: double
                                                              .infinity,
                                                          height: 150,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          15.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          15.0)),
                                                              color: Colors
                                                                  .white,
                                                              image: DecorationImage(
                                                                  image: NetworkImage(
                                                                      'https://t3.ftcdn.net/jpg/04/16/19/66/360_F_416196635_Psda8E0GFemB1L6wOhOq8ffS2ayERDsg.jpg'),
                                                                  fit: BoxFit
                                                                      .cover))),
                                                      SizedBox(height: 10.0),
                                                      Container(
                                                          color: Colors.white,
                                                          width:
                                                              double.infinity,
                                                          child: Text(
                                                              'Password is not match',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .redAccent
                                                                      .shade400,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      18.0),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start)),
                                                      SizedBox(height: 10.0),
                                                      Text(
                                                          'Your password and confirm password is not match, please check again it, or change your password as confirm password. Try again.',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          textAlign:
                                                              TextAlign.center)
                                                    ]),
                                                  ));
                                            });
                                      }

                                      var URLIMAGE =
                                          'https://arrdp.com/wp-content/uploads/2022/01/feedback-01-1-300x234.png';
                                      var subName = 'Email';

                                      if (await ConnectConstant.fetchMail(
                                              userEmail.text.toString()) ==
                                          true) {
                                        URLIMAGE =
                                            'https://arrdp.com/wp-content/uploads/2022/01/feedback-01-1-300x234.png';
                                        subName = 'Email';
                                      } else if (await ConnectConstant
                                              .fetchPhoneNumber(userPhoneNumber
                                                  .text
                                                  .toString()) ==
                                          true) {
                                        URLIMAGE =
                                            'https://i.pinimg.com/564x/a9/7f/0b/a97f0b624be3f4085a980f9b976aa79a.jpg';
                                        subName = 'Phone Number';
                                      } else if (await ConnectConstant
                                              .fetchPassword(userPassword.text
                                                  .toString()) ==
                                          true) {
                                        URLIMAGE =
                                            'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRzbpRDdyRuikJy0-8KaOcYE0YtUB1cveJwiT39REpWPBnfJjZ3';
                                        subName = 'Password';
                                      }

                                      if (await ConnectConstant.fetchMail(
                                                  userEmail.text.toString()) ==
                                              true ||
                                          await ConnectConstant
                                                  .fetchPhoneNumber(
                                                      userPhoneNumber.text
                                                          .toString()) ==
                                              true ||
                                          await ConnectConstant.fetchPassword(
                                                  userPassword.text
                                                      .toString()) ==
                                              true) {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15.0))),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.all(15.0),
                                                    height: 375.0,
                                                    width: 250.0,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    15.0)),
                                                    child: Column(children: [
                                                      Container(
                                                          width: double
                                                              .infinity,
                                                          height: 200,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          15.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          15.0)),
                                                              color: Colors
                                                                  .white,
                                                              image: DecorationImage(
                                                                  image: NetworkImage(
                                                                      URLIMAGE),
                                                                  fit: BoxFit
                                                                      .cover))),
                                                      SizedBox(height: 10.0),
                                                      Container(
                                                          color: Colors.white,
                                                          width:
                                                              double.infinity,
                                                          child: Text(
                                                              '$subName is already existed',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .redAccent
                                                                      .shade400,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      18.0),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start)),
                                                      SizedBox(height: 10.0),
                                                      Text(
                                                          'This $subName is already existed, please try another, then you can continue. Try again.',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          textAlign:
                                                              TextAlign.center)
                                                    ]),
                                                  ));
                                            });
                                      }

                                      if (userName.text.isNotEmpty &&
                                          userEmail.text.isNotEmpty &&
                                          userPassword.text.isNotEmpty &&
                                          userPhoneNumber.text.isNotEmpty &&
                                          confirmPassword.text.isNotEmpty) {
                                        Random random = Random();

                                        int randomNumberOne = random.nextInt(9);
                                        int randomNumberTwo = random.nextInt(9);
                                        int randomNumberThree =
                                            random.nextInt(9);
                                        int randomNumberFour =
                                            random.nextInt(9);

                                        String OTP_Verify =
                                            randomNumberOne.toString() +
                                                randomNumberTwo.toString() +
                                                randomNumberThree.toString() +
                                                randomNumberFour.toString();

                                        sendMail(
                                            recipientEmail:
                                                userEmail.text.toString(),
                                            OTP: OTP_Verify);

                                        print('OTP is: $OTP_Verify');

                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                  backgroundColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0)),
                                                  child: Container(
                                                      height: 500.0,
                                                      width: 325.0,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          color: Colors.white),
                                                      child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 175.0,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.only(
                                                                        topLeft:
                                                                            Radius.circular(
                                                                                8.0),
                                                                        topRight:
                                                                            Radius.circular(
                                                                                8.0)),
                                                                    image: DecorationImage(
                                                                        image: NetworkImage(
                                                                            'https://t3.ftcdn.net/jpg/05/37/85/78/240_F_537857822_31Dpuks9SWqXeFlkjowjZsAHsOeBZYzb.jpg'),
                                                                        fit: BoxFit
                                                                            .cover))),
                                                            Container(
                                                                width: double
                                                                    .infinity,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            15.0,
                                                                        vertical:
                                                                            5.0),
                                                                child: Text(
                                                                    'Authenticate the OTP',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontSize:
                                                                            18.0))),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          15.0),
                                                              child: Text(
                                                                  'Please verify the OTP for continue your profile. Please check your email and validate it.',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54,
                                                                      fontSize:
                                                                          13.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center),
                                                            ),
                                                            SizedBox(
                                                                height: 20.0),
                                                            Container(
                                                                width: double
                                                                    .infinity,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            15.0),
                                                                child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: <Widget>[
                                                                      otpInputBox(
                                                                          context,
                                                                          OTP1),
                                                                      otpInputBox(
                                                                          context,
                                                                          OTP2),
                                                                      otpInputBox(
                                                                          context,
                                                                          OTP3),
                                                                      otpInputBox(
                                                                          context,
                                                                          OTP4)
                                                                    ])),
                                                            Container(
                                                                height: 80.0,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            20.0,
                                                                        horizontal:
                                                                            20.0),
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                    MaterialButton(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0)),
                                                                  onPressed:
                                                                      () async {
                                                                    if ("${OTP1.text}${OTP2.text}${OTP3.text}${OTP4.text}" ==
                                                                        OTP_Verify) {
                                                                      await ConnectConstant.SingnIn_Data(
                                                                          userName
                                                                              .text
                                                                              .toString(),
                                                                          userEmail
                                                                              .text
                                                                              .toString(),
                                                                          userPhoneNumber
                                                                              .text
                                                                              .toString(),
                                                                          userPassword
                                                                              .text
                                                                              .toString());

                                                                      userEmail
                                                                          .clear();
                                                                      userName
                                                                          .clear();
                                                                      userPhoneNumber
                                                                          .clear();
                                                                      userPassword
                                                                          .clear();
                                                                      confirmPassword
                                                                          .clear();

                                                                      OTP1.clear();
                                                                      OTP2.clear();
                                                                      OTP3.clear();
                                                                      OTP4.clear();
                                                                      Navigator.pop(
                                                                          context);
                                                                      showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (BuildContext context) {
                                                                            return Dialog(
                                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                                                                                child: Container(
                                                                                  height: 250.0,
                                                                                  width: 250.0,
                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0), image: DecorationImage(image: NetworkImage('https://cdn.dribbble.com/users/28588/screenshots/3669080/holfuy_done_gifconvert.gif'), fit: BoxFit.cover)),
                                                                                ));
                                                                          });
                                                                    } else {
                                                                      OTP1.clear();
                                                                      OTP2.clear();
                                                                      OTP3.clear();
                                                                      OTP4.clear();
                                                                    }
                                                                  },
                                                                  color: Colors
                                                                      .purple
                                                                      .shade300,
                                                                  child: Text(
                                                                    'Submit OTP',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontSize:
                                                                            18.0),
                                                                  ),
                                                                )),
                                                            Text(
                                                                'Do you want to resend the OTP, click the resend button to sent OTP to your email.',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black54,
                                                                    fontSize:
                                                                        13.0),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center),
                                                            SizedBox(
                                                                height: 10.0),
                                                            Center(
                                                                child:
                                                                    TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          Random
                                                                              random =
                                                                              Random();

                                                                          int randomNumberOne =
                                                                              random.nextInt(9);
                                                                          int randomNumberTwo =
                                                                              random.nextInt(9);
                                                                          int randomNumberThree =
                                                                              random.nextInt(9);
                                                                          int randomNumberFour =
                                                                              random.nextInt(9);

                                                                          String OTP_Verify = randomNumberOne.toString() +
                                                                              randomNumberTwo.toString() +
                                                                              randomNumberThree.toString() +
                                                                              randomNumberFour.toString();

                                                                          sendMail(
                                                                              recipientEmail: userEmail.text.toString(),
                                                                              OTP: OTP_Verify);

                                                                          print(
                                                                              'OTP is: $OTP_Verify');
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          'Resend OTP',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Colors.purple),
                                                                        )))
                                                          ])));
                                            });
                                      }
                                    },
                                    child: Text('Sign In',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                  )
                                ])),
                      ),
                      SizedBox(height: 5.0),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person, color: Colors.grey),
                              SizedBox(width: 7.0),
                              Text("Already I have an account"),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => log_IN_Here()),
                                    );
                                  },
                                  child: Text(
                                    'Log In',
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
                    color: Colors.orange.shade700,
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
                        height: 320.0,
                        width: 320.0,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(320.0)),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://photo.safetyhandler.com/sc0/https:%2F%2Fmedia.safetyhandler.com%2Fmedia%2Fimage%2Fgif%2Fbucket%2Ff5a36ceabfbb6f240347cca1a558d957-0.gif%3Fview=image'),
                                fit: BoxFit.cover))),
                    SizedBox(height: 15.0),
                    Text('Welcome to Sign In',
                        style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                    SizedBox(height: 15.0),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                          'Hi welcome to HaHuTrendz sign in page, A new account can be created by you as your email and password. If you already have an account please go and login your account and go to your dashboard page, and also enjoy your work. Have a good day.',
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                          textAlign: TextAlign.center),
                    ),
                    SizedBox(height: 10.0),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
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
                    ),
                    SizedBox(height: 10.0)
                  ]),
                ))
          ]),
        )));
  }

  Container otpInputBox(
      BuildContext context, TextEditingController _Controller) {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.all(Radius.circular(6.0))),
      child: TextField(
        controller: _Controller,
        maxLength: 1,
        style: TextStyle(fontSize: 20.0),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(counterText: ''),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
