// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:flutter/material.dart';

dynamic navSixCardBgColor,
    navSixCardNoOfDoc,
    navSixCardNoOfAmount,
    navSixCardBottomBgCollor,
    navSixCardBottomTitle,
    noOfDoc,
    totalAmount;

Container sixNavDashboard(
    BuildContext context,
    navSixCardBgColor,
    navSixCardNoOfDoc,
    navSixCardNoOfAmount,
    navSixCardBottomBgCollor,
    navSixCardBottomTitle,
    noOfDoc,
    totalAmount) {
  return Container(
    decoration: BoxDecoration(
        color: navSixCardBgColor,
        borderRadius: BorderRadius.circular(10.0),
        /*
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              offset: const Offset(
                1.0,
                1.0,
              ),
              blurRadius: 3.0,
              spreadRadius: 0.0), //BoxShadow
          BoxShadow(
              color: Colors.black38,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0) //BoxShadow
        ]
         */
        border: Border.all(color: Colors.black12)),
    //height: 191.0,

    width: MediaQuery.of(context).size.width / 8.5,
    child: Column(
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          width: double.infinity,
          child: Text(navSixCardNoOfDoc,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600)),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          width: double.infinity,
          child: Text(
            noOfDoc,
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
        ),
        const Divider(
          thickness: 1.0,
          color: Colors.grey,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          width: double.infinity,
          child: Text(navSixCardNoOfAmount,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600)),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          width: double.infinity,
          child: Text(
            totalAmount,
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
        ),
        const SizedBox(height: 5.0),
        Container(
          decoration: BoxDecoration(
              color: navSixCardBottomBgCollor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0))),
          height: 40.0,
          alignment: const Alignment(0.0, 0.0),
          width: double.infinity,
          child: Text(
            navSixCardBottomTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    ),
  );
}

Column rowForContainer(containerContentNoOne, containerContentNoTwo,
    containerContentTitleOne, containerContentTitleTwo) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(containerContentNoOne,
              style: const TextStyle(
                  color: Colors.indigo,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500)),
          //SizedBox(width: 30.0),
          Text(
            containerContentNoTwo,
            style: const TextStyle(
                color: Colors.indigo,
                fontSize: 18.0,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Text(
              containerContentTitleOne,
              style: const TextStyle(color: Colors.black87, fontSize: 16.0),
            ),
          ),
          //SizedBox(width: 30.0),
          Container(
            color: Colors.white,
            child: Text(
              containerContentTitleTwo,
              style: const TextStyle(color: Colors.black87, fontSize: 16.0),
            ),
          )
        ],
      ),
    ],
  );
}

Column statusContainerForDash(containerContentNoOne, containerContentNoTwo,
    containerContentTitleOne, containerContentTitleTwo) {
  return Column(
    children: [
      Container(
          width: double.infinity,
          child: Text('Total Participation Status',
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500))),
      Divider(),
      Row(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            rowForContainer(containerContentNoOne, containerContentNoTwo,
                containerContentTitleOne, containerContentTitleTwo),
            //Spacer(),
            rowForContainer(containerContentNoOne, containerContentNoTwo,
                containerContentTitleOne, containerContentTitleTwo),
            //Spacer(),
            rowForContainer(containerContentNoOne, containerContentNoTwo,
                containerContentTitleOne, containerContentTitleTwo),
          ]),
          Column(children: [
            TextButton(
                onPressed: () {},
                child: Row(children: [
                  Icon(Icons.download, color: Colors.green),
                  SizedBox(width: 7.0),
                  Text('Excell CSV',
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold))
                ])),
            SizedBox(height: 18.0),
            TextButton(
                onPressed: () {},
                child: Row(children: [
                  Icon(Icons.download, color: Colors.red),
                  SizedBox(width: 7.0),
                  Text('PDF Document',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold))
                ])),
          ])
        ],
      ),
    ],
  );
}

Widget MSG_Notification_Reminder() {
  return SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    scrollDirection: Axis.horizontal,
    child: Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0))),
              child: Row(children: [
                Container(
                  height: 30.0,
                  width: 30.0,
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: ClipOval(
                    child: Image.network(
                        'https://randomuser.me/api/portraits/men/78.jpg'),
                  ),
                ),
                SizedBox(width: 5.0),
                Text('Aysha Begam',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                SizedBox(width: 15.0)
              ])),
          SizedBox(width: 20.0),
          MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0))),
              child: Row(children: [
                Container(
                  height: 30.0,
                  width: 30.0,
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: ClipOval(
                    child: Image.network(
                        'https://randomuser.me/api/portraits/men/78.jpg'),
                  ),
                ),
                SizedBox(width: 5.0),
                Text('Shajahan',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                SizedBox(width: 15.0)
              ])),
          SizedBox(width: 20.0),
          MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0))),
              child: Row(children: [
                Container(
                  height: 30.0,
                  width: 30.0,
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: ClipOval(
                    child: Image.network(
                        'https://randomuser.me/api/portraits/men/78.jpg'),
                  ),
                ),
                SizedBox(width: 5.0),
                Text('Vahith Hasan',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                SizedBox(width: 15.0)
              ])),
          SizedBox(width: 20.0),
          MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0))),
              child: Row(children: [
                Container(
                  height: 30.0,
                  width: 30.0,
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: ClipOval(
                    child: Image.network(
                        'https://randomuser.me/api/portraits/men/78.jpg'),
                  ),
                ),
                SizedBox(width: 5.0),
                Text('Vajith Husan',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                SizedBox(width: 15.0)
              ])),
          SizedBox(width: 20.0),
          MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0))),
              child: Row(children: [
                Container(
                  height: 30.0,
                  width: 30.0,
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: ClipOval(
                    child: Image.network(
                        'https://randomuser.me/api/portraits/men/78.jpg'),
                  ),
                ),
                SizedBox(width: 5.0),
                Text('Mukesh',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                SizedBox(width: 15.0)
              ])),
          SizedBox(width: 20.0),
          MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0))),
              child: Row(children: [
                Container(
                  height: 30.0,
                  width: 30.0,
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: ClipOval(
                    child: Image.network(
                        'https://randomuser.me/api/portraits/men/78.jpg'),
                  ),
                ),
                SizedBox(width: 5.0),
                Text('Annai Xerox',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                SizedBox(width: 15.0)
              ])),
          SizedBox(width: 20.0),
          MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0))),
              child: Row(children: [
                Container(
                  height: 30.0,
                  width: 30.0,
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: ClipOval(
                    child: Image.network(
                        'https://randomuser.me/api/portraits/men/78.jpg'),
                  ),
                ),
                SizedBox(width: 5.0),
                Text('Sakthi Xerox',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                SizedBox(width: 15.0)
              ])),
          SizedBox(width: 20.0),
          MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0))),
              child: Row(children: [
                Container(
                  height: 30.0,
                  width: 30.0,
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: ClipOval(
                    child: Image.network(
                        'https://randomuser.me/api/portraits/men/78.jpg'),
                  ),
                ),
                SizedBox(width: 5.0),
                Text('TPC BR-4',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                SizedBox(width: 15.0)
              ])),
        ],
      ),
    ),
  );
}
