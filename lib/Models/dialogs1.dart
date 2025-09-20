// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_adjacent_string_concatenation, unnecessary_brace_in_string_interps, unused_local_variable

import 'package:flutter/material.dart';

Widget Modern_Customer_Profile_Dialog(
    BuildContext context,
    Name,
    id,
    no,
    date,
    doc,
    amt,
    account,
    payment,
    book,
    balance,
    excess,
    payment_status,
    remarks) {
  Color color1, color2, color3, color4, color_F;

  if (payment_status == 'Paid') {
    color1 = Colors.green;
    color2 = Colors.greenAccent;
    color3 = Colors.lightGreen;
    color4 = Colors.lightGreenAccent;
    color_F = Colors.green;
  } else if (payment_status == 'Pending') {
    color1 = Colors.orange;
    color2 = Colors.orangeAccent;
    color3 = Colors.amber;
    color4 = Colors.amberAccent;
    color_F = Colors.orange;
  } else {
    color1 = Colors.red;
    color2 = Colors.redAccent;
    color3 = Colors.pink;
    color4 = Colors.pinkAccent;
    color_F = Colors.red;
  }
  return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 0.0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      child: Container(
          padding: EdgeInsets.all(15.0),
          height: MediaQuery.of(context).size.height / 1.65,
          width: MediaQuery.of(context).size.width / 2.5,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
          child: Column(children: [
            Container(
              height: 100.0,
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    height: 100.0,
                    width: 100.0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            color1,
                            color2,
                            color3,
                            color4,

                            //Colors.red,

                            //Colors.pinkAccent.shade200, Colors.orange,
                            //Colors.orangeAccent.shade200,
                          ]),
                          borderRadius: BorderRadius.circular(50)),
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: ClipOval(
                            child: Center(
                                child: Text('${Name[0]}',
                                    style: TextStyle(
                                        fontSize: 50.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45)))),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('$Name',
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.start),
                      SizedBox(height: 2.0),
                      Text('_id: $id',
                          style: TextStyle(
                              fontSize: 10.0, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start),
                    ],
                  ),
                  Spacer(),
                  Container(
                      padding: EdgeInsets.all(2.0),
                      height: 58.0,
                      decoration: BoxDecoration(
                          color: color_F,
                          borderRadius: BorderRadius.circular(4.0)),
                      child: Column(
                        children: [
                          Container(
                            //width: 64.0,
                            padding: EdgeInsets.symmetric(
                                vertical: 2.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0))),
                            child: Center(
                              child: Text('$no',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                      color: Colors.black)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: 2.0, left: 2.0, right: 2.0, bottom: 0.0),
                            decoration: BoxDecoration(
                                color: color_F,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(4.0),
                                    bottomLeft: Radius.circular(4.0))),
                            child: Text("${payment_status}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                    color: Colors.white)),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Text(
                'This costomer is very special for us, we have thank for them, this customer special pop up screen is very special for this update, we think you are enjoying this update, thank you.',
                style: TextStyle(color: Colors.black45, fontSize: 10.0),
                textAlign: TextAlign.center),
            SizedBox(height: 20.0),
            Container(
                width: double.infinity,
                child: Text('Customer Booking Info:',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start)),
            SizedBox(height: 15.0),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Name: ' + ' $Name',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.black54)),
                      Text('Booking Date: ' + ' $date',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.black54)),
                      Text('Document: ' + ' $doc',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.black54))
                    ])),
            SizedBox(height: 15.0),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Paid Amount: ' + ' ₹$amt',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.black54)),
                      Text('Account Type: ' + ' $account',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.black54))
                    ])),
            SizedBox(height: 15.0),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Payment Type: ' + ' $payment',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.black54)),
                      Text('Booked By: ' + ' $book',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.black54)),
                      Text('Balance: ' + ' ₹$balance',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.black54)),
                    ])),
            SizedBox(height: 15.0),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Excess: ' + ' ₹$excess',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.black54))
                    ])),
            SizedBox(height: 15.0),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                width: double.infinity,
                child: Container(
                  width: 600.0,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Text('Remarks: ' + ' $remarks.',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            color: Colors.black54)),
                  ),
                )),
            Spacer(),
            Container(
                width: double.infinity,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Row(children: [
                          Text('All Transaction Details'),
                          SizedBox(width: 7.0),
                          Icon(Icons.arrow_downward)
                        ])),
                    Spacer(),
                    MaterialButton(
                        onPressed: () {},
                        color: Colors.green,
                        child: Text('Download',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500))),
                    SizedBox(width: 20.0),
                    MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.indigo,
                        child: Text('close',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)))
                  ],
                )),
            SizedBox(height: 5.0)
          ])));
}

//

//

//

Widget Modern_HeadOffice_Customer_Profile_Dialog(
    BuildContext context,
    id,
    date,
    doc,
    validAMT,
    paidAMT,
    payment,
    book,
    balance,
    excess,
    payment_status,
    remarks) {
  Color color1, color2, color3, color4, color_F;

  if (payment_status == 'Paid') {
    color1 = Colors.green;
    color2 = Colors.greenAccent;
    color3 = Colors.lightGreen;
    color4 = Colors.lightGreenAccent;
    color_F = Colors.green;
  } else if (payment_status == 'Pending') {
    color1 = Colors.orange;
    color2 = Colors.orangeAccent;
    color3 = Colors.amber;
    color4 = Colors.amberAccent;
    color_F = Colors.orange;
  } else {
    color1 = Colors.red;
    color2 = Colors.redAccent;
    color3 = Colors.pink;
    color4 = Colors.pinkAccent;
    color_F = Colors.red;
  }
  return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 0.0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      child: Container(
          padding: EdgeInsets.all(15.0),
          height: MediaQuery.of(context).size.height / 1.65,
          width: MediaQuery.of(context).size.width / 2.5,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
          child: Column(children: [
            Container(
              height: 100.0,
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    height: 100.0,
                    width: 100.0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            color1,
                            color2,
                            color3,
                            color4,

                            //Colors.red,

                            //Colors.pinkAccent.shade200, Colors.orange,
                            //Colors.orangeAccent.shade200,
                          ]),
                          borderRadius: BorderRadius.circular(50)),
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: ClipOval(
                            child: Center(
                                child: Text('${book[0]}',
                                    style: TextStyle(
                                        fontSize: 50.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45)))),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('$date (By $book)',
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.start),
                      SizedBox(height: 2.0),
                      Text('_id: $id',
                          style: TextStyle(
                              fontSize: 10.0, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start),
                    ],
                  ),
                  Spacer(),
                  Container(
                      padding: EdgeInsets.all(2.0),
                      height: 58.0,
                      decoration: BoxDecoration(
                          color: color_F,
                          borderRadius: BorderRadius.circular(4.0)),
                      child: Column(
                        children: [
                          Container(
                            //width: 64.0,
                            padding: EdgeInsets.symmetric(
                                vertical: 2.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0))),
                            child: Center(
                              child: Text('₹$paidAMT',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                      color: Colors.black)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: 2.0, left: 2.0, right: 2.0, bottom: 0.0),
                            decoration: BoxDecoration(
                                color: color_F,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(4.0),
                                    bottomLeft: Radius.circular(4.0))),
                            child: Text("${payment_status}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                    color: Colors.white)),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Text(
                'This costomer is very special for us, we have thank for them, this customer special pop up screen is very special for this update, we think you are enjoying this update, thank you.',
                style: TextStyle(color: Colors.black45, fontSize: 10.0),
                textAlign: TextAlign.center),
            SizedBox(height: 20.0),
            Container(
                width: double.infinity,
                child: Text('Customer Booking Info:',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start)),
            SizedBox(height: 15.0),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Registered By: ' + ' $book',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.black54)),
                      Text('Registered On: ' + ' $date',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.black54)),
                      Text('Document: ' + ' $doc',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.black54))
                    ])),
            SizedBox(height: 15.0),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Valid Amount: ' + ' ₹$validAMT',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.black54)),
                      Text('Paid Amount: ' + ' ₹$paidAMT',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.black54))
                    ])),
            SizedBox(height: 15.0),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Payment Type: ' + ' $payment',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.black54)),
                      Text('Net Amount: ' + ' ₹${paidAMT - balance}',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.black54)),
                      Text('Balance: ' + ' ₹$balance',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.black54)),
                    ])),
            SizedBox(height: 15.0),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Excess: ' + ' ₹$excess',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.black54))
                    ])),
            SizedBox(height: 15.0),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                width: double.infinity,
                child: Container(
                  width: 600.0,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Text('Remarks: ' + ' $remarks.',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            color: Colors.black54)),
                  ),
                )),
            Spacer(),
            Container(
                width: double.infinity,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Row(children: [
                          Text('All Transaction Details'),
                          SizedBox(width: 7.0),
                          Icon(Icons.arrow_downward)
                        ])),
                    Spacer(),
                    MaterialButton(
                        onPressed: () {},
                        color: Colors.green,
                        child: Text('Download',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500))),
                    SizedBox(width: 20.0),
                    MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.indigo,
                        child: Text('close',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)))
                  ],
                )),
            SizedBox(height: 5.0)
          ])));
}
