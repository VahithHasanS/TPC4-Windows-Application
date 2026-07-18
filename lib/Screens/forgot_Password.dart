// ignore_for_file: camel_case_types, file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, avoid_types_as_parameter_names, use_build_context_synchronously, await_only_futures, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:meta_blaster/mongoDB/connect_&_constant.dart';

class ForgotPassword_Here extends StatefulWidget {
  const ForgotPassword_Here({super.key});

  @override
  State<ForgotPassword_Here> createState() => _ForgotPassword_HereState();
}

class _ForgotPassword_HereState extends State<ForgotPassword_Here> {
  TextEditingController userEmail = TextEditingController();

  void sendMail({
    required String recipientEmail,
    required String OTP,
  }) async {
    // change your email here
    String username = 'vahithhasannorth@gmail.com';
    // change your password here
    String password = 'oxec cash bpbo atsn';
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'Mail Service')
      ..recipients.add(recipientEmail)
      ..subject = 'HaHuTrendz Forgot Password Mail.'
      ..text =
          'Message: This is just an email from HaHuTrendz. You have forgot your password, so you want to send password in your mail. This is the Password:  $OTP  forgotten by $recipientEmail user. Do you want to open your account?. please enter this password for your authenticate email, Again this is your password $OTP . I think this was usefull to you, Thanking you.';

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
          height: MediaQuery.of(context).size.height / 1.15,
          width: MediaQuery.of(context).size.width / 1.15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width / 2.75,
                  height: MediaQuery.of(context).size.height / 1,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.network(
                            'https://images.prismic.io/vindicia-public/18107d92-9a66-45ac-833e-db1c18864a71_private-data-animation-security-and-compliance.gif?auto=compress%2Cformat&fit=max&q=80&w=500&h=500&dpr=1.5')
                      ])),
              Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width / 2.5, //1.9775
                  height: MediaQuery.of(context).size.height / 1,
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Center(
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 3.325,
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'assets/icon/icon-outline.png'),
                                          height: 50.0,
                                          width: 50.0,
                                          fit: BoxFit.fill,
                                          filterQuality: FilterQuality.high,
                                        ),
                                        RichText(
                                            text: const TextSpan(
                                                children: <TextSpan>[
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
                                            ]))
                                      ]))),
                          SizedBox(height: 15.0),
                          Container(
                              width: double.infinity,
                              child: Text(
                                'Forgot Your Password?',
                                style: TextStyle(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.start,
                              )),
                          SizedBox(height: 6.0),
                          Text(
                              'Hey!, Forgot password field is here, Enter your valid email to find it is you or not, Please put your email address here...',
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 13.0),
                              textAlign: TextAlign.center),
                          SizedBox(height: 30.0),
                          Container(
                              width: double.infinity,
                              child: Text('Valid User Email Check',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.start)),
                          SizedBox(height: 7.0),
                          Container(
                              child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: userEmail,
                                  decoration: InputDecoration(
                                      hintText:
                                          'Please enter valid email address here...',
                                      suffixIcon: Icon(Icons.mail,
                                          color: Colors.black45),
                                      hintStyle: TextStyle(
                                          color: Colors.black38,
                                          letterSpacing: 1.0),
                                      labelText: 'Valid Email Address',
                                      labelStyle: TextStyle(fontSize: 18.0)),
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      fontSize: 18.0, letterSpacing: 3.0))),
                          SizedBox(height: 20.0),
                          MaterialButton(
                            onPressed: () async {
                              if (await ConnectConstant.fetchMail(
                                      userEmail.text.toString()) ==
                                  true) {
                                var pass =
                                    await ConnectConstant.fetchPasswordOnly(
                                        userEmail.text.toString());
                                sendMail(
                                    recipientEmail: userEmail.text.toString(),
                                    OTP: pass.toString());
                                userEmail.clear();
                                showDialog(
                                    context: context,
                                    builder: (BuildContext) {
                                      return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0))),
                                          child: Container(
                                            height: 350.0,
                                            width: 350.0,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        'https://i.pinimg.com/originals/b9/88/b7/b988b7c3e84e1f83ef9447157831b460.gif'),
                                                    fit: BoxFit.cover)),
                                          ));
                                    });

                                Future.delayed(Duration(seconds: 9), () async {
                                  Navigator.pop(context);
                                });
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext) {
                                      return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0))),
                                          child: Container(
                                            width: 300.0,
                                            height: 435.0,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.0)),
                                            child: Column(
                                              children: [
                                                Container(
                                                    height: 250.0,
                                                    width: 250.0,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                'https://img.freepik.com/free-vector/toggle-concept-illustration_114360-8307.jpg?w=740&t=st=1702821171~exp=1702821771~hmac=7fdc6ff6b6f48e1ef3dff5970ed7c3fb51fd8f96b6c9f5726a85fba4f9e0909c'),
                                                            fit:
                                                                BoxFit.cover))),
                                                Container(
                                                    width: double.infinity,
                                                    padding: EdgeInsets.only(
                                                        top: 15.0, left: 15.0),
                                                    child: Text(
                                                        'Unavailable Email',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .redAccent
                                                                .shade200,
                                                            fontSize: 19.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                        textAlign:
                                                            TextAlign.start)),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Text(
                                                        'Sorry, this Email is unavailable here, please enter the valid email for get your password to unlock your account. Pleases try again later or now.',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black45,
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                        textAlign:
                                                            TextAlign.center))
                                              ],
                                            ),
                                          ));
                                    });
                              }
                            },
                            color: Colors.purple.shade400,
                            minWidth: double.infinity,
                            height: 50.0,
                            splashColor: Colors.purple.shade600,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Text('Submit Email',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.5,
                                    wordSpacing: 3.5,
                                    letterSpacing: 2)),
                          ),
                          SizedBox(height: 30.0),
                          Text(
                              "Hi there, Do you forgot your password, Mmm...?, Don't wory we will find your password and give back to you. Just you want to put your valid email here, and then your password will be sent to your valid mail. Do it, you soon find it.",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 13.0),
                              textAlign: TextAlign.center),
                          SizedBox(height: 30.0),
                          Container(
                              width: 100.0,
                              child: MaterialButton(
                                  hoverElevation: 0.0,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  color: Colors.grey.shade200,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.arrow_back,
                                          size: 20.0,
                                        ),
                                        SizedBox(width: 5.0),
                                        Text('Back')
                                      ])))
                        ]),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
