// ignore_for_file: camel_case_types, file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables, constant_identifier_names, unnecessary_string_interpolations, avoid_types_as_parameter_names, unused_local_variable, sized_box_for_whitespace, annotate_overrides, must_call_super, unused_field

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta_blaster/Charts/dashboard_chart1.dart';
import 'package:meta_blaster/Models/dialogs1.dart';
import 'package:meta_blaster/Models/smallWidgets.dart';
import 'package:meta_blaster/mongoDB/DB_Supporter1.dart';
import 'package:meta_blaster/mongoDB/DB_Supporter3.dart';
import 'package:meta_blaster/mongoDB/DB_Suppoter2.dart';
import 'package:meta_blaster/mongoDB/dataTable_Fetch.dart';

class Grid_View_Tab extends StatefulWidget {
  final UName, UEmail, userCode;
  const Grid_View_Tab(
      {super.key,
      required this.UName,
      required this.UEmail,
      required this.userCode});

  @override
  State<Grid_View_Tab> createState() => _Grid_View_TabState();
}

class _Grid_View_TabState extends State<Grid_View_Tab> {
  static const List<String> Filter_Val_10 = <String>[
    'Branch Pc-4',
    'Shajahan',
    'Root',
    'CCC',
    'Other'
  ];

  static const List<String> Filter_Val_1 = <String>[
    'Balance',
    'Excess',
  ];

  static const List<String> Filter_Val_2 = <String>[
    'Hot Cash',
    'UPI',
    'Bank Transfer',
    'Cheque'
  ];

  static const List<String> Filter_Val_First = <String>[
    'Branch Pc-4',
    'Shajahan',
    'Root',
    'CCC',
    'Other'
  ];

  String FilterValue_1 = Filter_Val_1.first;
  String FilterValue_2 = Filter_Val_2.first;
  String FilterValue_first = Filter_Val_First.first;

  dynamic lastDtaeFormat, indiBranch, lastDateFormatHed;

  dynamic total_bunker, upi_bunker;

  String FilterValue_10 = Filter_Val_10.first;

  void initState() {
    Db_Supporter_3.findLastUpdateLive_to_Format_IndiPartyies(
            widget.userCode, FilterValue_10)
        .then((value) {
      setState(() {
        lastDtaeFormat = value;
      });
    });

    Db_Supporter_2.findLastUpdateLive_to_Format_Hed(widget.userCode)
        .then((value) {
      setState(() {
        lastDateFormatHed = value;
      });
    });

    Db_Supporter_3.Total_Participation_Report_Bunker_Fetch_Data(
            widget.userCode, FilterValue_10)
        .then((value) {
      setState(() {
        total_bunker = value;
      });
    });

    Db_Supporter_3.Total_UPI_and_Others_Analytics(
            widget.userCode, FilterValue_10)
        .then((value) {
      setState(() {
        upi_bunker = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
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
          width: double.infinity,
          height: 60.0,
          child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Participations Grid View',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500)),
                Spacer(),
                Text('Last Update is:',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500)),
                TextButton(
                    onPressed: () {
                      setState(() {
                        initState();
                      });
                    },
                    child: Text('$lastDtaeFormat',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500))),
                Spacer(),
                SizedBox(
                    //width: 50,
                    child: DropdownButton<String>(
                        value: FilterValue_10,
                        hint: Text('Fillter'),
                        icon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Icon(Icons.filter_list_rounded),
                        ),
                        elevation: 16,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            FilterValue_10 = value!;
                            initState();
                          });
                        },
                        items: Filter_Val_10.map<DropdownMenuItem<String>>(
                            (String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList()))
              ])),
      SizedBox(height: 20.0),
      Text('$FilterValue_10 Participation Ordered Grid View Field',
          style: TextStyle(
              color: Colors.black45,
              fontSize: 16.0,
              fontWeight: FontWeight.w500)),
      Container(
          width: double.infinity,
          margin: EdgeInsets.all(20.0),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GridOutletCards(context, 'Total Document of Cash Account',
                  '${total_bunker?[0]}', Icons.document_scanner, Colors.amber),
              GridOutletCards(context, 'Total Amount of Cash Account',
                  '₹${total_bunker?[1]}', Icons.payment, Colors.blue),
              GridOutletCards(context, 'Total Document of Credit Account',
                  '${total_bunker?[2]}', Icons.document_scanner, Colors.red),
              GridOutletCards(context, 'Total Amount of Credit Account',
                  '₹${total_bunker?[3]}', Icons.payment, Colors.grey),
              GridOutletCards(context, 'Total No of Hot Cash Amount',
                  '${total_bunker?[4]}', Icons.line_axis, Colors.green),
            ]),
            SizedBox(height: 30.0),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GridOutletCards(
                  context,
                  'Total Amount of Hot Cash',
                  '₹${total_bunker?[5]}',
                  Icons.currency_exchange,
                  Colors.purple),
              GridOutletCards(context, 'Total No of UPI Amount',
                  '${total_bunker?[6]}', Icons.line_axis, Colors.brown),
              GridOutletCards(context, 'Total Amount of UPI',
                  '₹${total_bunker?[7]}', Icons.qr_code_2, Colors.indigo),
              GridOutletCards(context, 'Total Amount of Balance',
                  '₹${total_bunker?[8]}', Icons.balance, Colors.pink),
              GridOutletCards(context, 'Total Amount of Excess',
                  '₹${total_bunker?[9]}', Icons.pin_drop, Colors.orange),
            ]),
          ])),
      SizedBox(height: 30.0),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          width: MediaQuery.of(context).size.width / 1.0275,
          height: 362.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
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
              ]),
          child: Column(children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                      "Last Day Booking Record's For $FilterValue_10 Participations",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w500)),
                ),
                Spacer(),
                Text('Last Update is:',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500)),
                TextButton(
                    onPressed: () {
                      Db_Supporter_1.findLastUpdateLive_to_Format(
                              widget.userCode)
                          .then((value) {
                        setState(() {
                          lastDtaeFormat = value;
                          initState();
                        });
                      });
                    },
                    child: Text('$lastDtaeFormat',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500)))
              ],
            ),
            SizedBox(height: 10.0),
            Container(
                //width: double.infinity,
                width: MediaQuery.of(context).size.width / 1.045,
                //margin: EdgeInsets.all(15.0),
                height: 300.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        child: FutureBuilder<List<dynamic>>(
                            future: Data_Table_Fetch_Model_1
                                .GridView_FillterType_Bal_or_Exs(
                                    widget.userCode, FilterValue_10),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                //
                                return Center(
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.15,
                                        height: 250.0,
                                        child: Center(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CircularProgressIndicator(),
                                            SizedBox(height: 15.0),
                                            Text(
                                              'Loading...',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0),
                                            )
                                          ],
                                        ))));
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center));
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.isEmpty) {
                                return Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.15,
                                        height: 250.0,
                                        child: Image(
                                            image: NetworkImage(
                                                'https://elements-cover-images-0.imgix.net/41ce1856-ce64-47eb-9cc9-d50c75ba936b?auto=compress%2Cformat&w=1370&fit=max&s=e2aafc4ef1374981f2c8728c846dbe33'))),
                                    Text('No Data Founded',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center)
                                  ],
                                ));
                              } else {
                                final data = snapshot.data;
                                //print('${data}');

                                int i = 0;
                                int ko = 0;
                                Color color12;

                                return DataTable(
                                    showCheckboxColumn: false,
                                    sortColumnIndex: 3,
                                    columnSpacing: 20.0,
                                    columns: <DataColumn>[
                                      DataColumn(
                                        label: Text('No',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0)),
                                      ),
                                      DataColumn(
                                        label: Text('Customer',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0)),
                                      ),
                                      DataColumn(
                                        label: Text('From Date',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0)),
                                      ),
                                      DataColumn(
                                        label: Text('Doc',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0)),
                                      ),
                                      DataColumn(
                                        label: Text('Valid Amount',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0)),
                                      ),
                                      DataColumn(
                                        label: Text('Paid Amount',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0)),
                                      ),
                                      DataColumn(
                                        label: Text('Account',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0)),
                                      ),
                                      DataColumn(
                                        label: Text('Payment',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0)),
                                      ),
                                      DataColumn(
                                        label: Text('Balance',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0)),
                                      ),
                                      DataColumn(
                                        label: Text('Excess',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0)),
                                      ),
                                      DataColumn(
                                        label: Text('Booked By',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0)),
                                      ),
                                      DataColumn(
                                        label: Text('Is Paid',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0)),
                                      ),
                                      DataColumn(
                                        label: Text('Remarks',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0)),
                                      ),
                                      DataColumn(
                                        label: Text('Delete',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0)),
                                      ),
                                      DataColumn(
                                        label: Text('Update',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0)),
                                      )
                                    ],
                                    //DateFormat('yyyy-MM-dd HH:mm:ss').format(item.FromDate)
                                    rows: data!
                                        .map((item) => DataRow(
                                            onLongPress: () {
                                              showAboutDialog(
                                                  context: context,
                                                  applicationName:
                                                      'HaHuTrendz');
                                            },
                                            cells: [
                                              DataCell(Text('${i += 1}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black54))),
                                              DataCell(Text(item.Customer_Name,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black54))),
                                              DataCell(Text(
                                                  '${DateFormat('yyyy-MM-dd').format(DateTime.parse(item.Booking_Date.add(Duration(days: 1)).toString()))}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black54))),
                                              DataCell(Text("${item.Document}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black54))),
                                              DataCell(Text(
                                                  "${item.Valid_Amount}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black54))),
                                              DataCell(Text(
                                                  "${item.Paid_Amount}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black54))),
                                              DataCell(Text(item.Account_Type,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black54))),
                                              DataCell(Text(item.Payment_Type,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black54))),
                                              DataCell(Text(
                                                  "${item.Balance_Amount}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black54))),
                                              DataCell(Text(
                                                  "${item.Excess_Amount}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black54))),
                                              DataCell(Text(item.Booked_By,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black54))),
                                              DataCell(
                                                  placeholder: true,
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10.0,
                                                            vertical: 2.0),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                        color: item.Is_Paid ==
                                                                'Paid'
                                                            ? Colors.green
                                                            : Colors.red),
                                                    child: Text(item.Is_Paid,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.white)),
                                                  )),
                                              DataCell(Text(item.Remarks,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black54))),
                                              DataCell(IconButton(
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        builder:
                                                            (BuildContext) {
                                                          return Dialog(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              12.0))),
                                                              child: Container(
                                                                  height: 230.0,
                                                                  width: 300.0,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              15.0),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child: Column(
                                                                      children: [
                                                                        Text(
                                                                            'Confirmation',
                                                                            style: TextStyle(
                                                                                color: Colors.red,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 18.0)),
                                                                        SizedBox(
                                                                            height:
                                                                                16.0),
                                                                        Text(
                                                                            'Do you want to delete ${item.Customer_Name}. Are you sure. If you sure, Click yes or you do not want to delete, Click no or click outer the dialog box to close.',
                                                                            style:
                                                                                TextStyle(color: Colors.grey),
                                                                            textAlign: TextAlign.justify),
                                                                        SizedBox(
                                                                            height:
                                                                                20.0),
                                                                        Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceEvenly,
                                                                            children: [
                                                                              MaterialButton(
                                                                                  onPressed: () {
                                                                                    setState(() {
                                                                                      Db_Supporter_1.Delete_Customers(item.mainID);
                                                                                      Db_Supporter_1.findLastUpdateLive_to_Format(widget.userCode).then((value) {
                                                                                        setState(() {
                                                                                          lastDtaeFormat = value;
                                                                                          initState();
                                                                                        });
                                                                                      });
                                                                                    });

                                                                                    //Data_Table_Fetch_Model_1.Dash_FillterType_Bal_or_Exs(widget.userCode);

                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  color: Colors.red,
                                                                                  child: Text('Yes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                                                                              MaterialButton(
                                                                                  onPressed: () {
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  color: Colors.green,
                                                                                  child: Text('No', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))
                                                                            ])
                                                                      ])));
                                                        });
                                                  },
                                                  icon: Icon(Icons.delete))),
                                              DataCell(IconButton(
                                                  onPressed: () {
                                                    Db_Supporter_1
                                                            .findLastUpdateLive_to_Format(
                                                                widget.userCode)
                                                        .then((value) {
                                                      setState(() {
                                                        lastDtaeFormat = value;
                                                        initState();
                                                      });
                                                    });
                                                  },
                                                  icon: Icon(Icons.edit)))
                                            ],
                                            onSelectChanged: (value) {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Modern_Customer_Profile_Dialog(
                                                        context,
                                                        item.Customer_Name,
                                                        item.mainID,
                                                        "₹${item.Valid_Amount}",
                                                        '${DateFormat('yyyy-MM-dd').format(DateTime.parse(item.Booking_Date.add(Duration(days: 1)).toString()))}',
                                                        item.Document,
                                                        item.Paid_Amount,
                                                        item.Account_Type,
                                                        item.Payment_Type,
                                                        item.Booked_By,
                                                        item.Balance_Amount,
                                                        item.Excess_Amount,
                                                        item.Is_Paid,
                                                        item.Remarks);
                                                  });
                                            }))
                                        .toList());
                              }
                            }))))
          ])),
      SizedBox(height: 30.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              width: MediaQuery.of(context).size.width / 3.5,
              height: 370.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
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
                  ]),
              child: Column(children: [
                Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text("Balance & Excess Amount Analytics",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500))),
                Spacer(),
                legand_Donat_DashBoart_Chart_2_bal_Exs(
                    context, total_bunker?[8], total_bunker?[9]),
                Spacer(),
                Row(children: [
                  Spacer(),
                  Container(
                      height: 20.0,
                      width: 20.0,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5.0))),
                  SizedBox(width: 10.0),
                  Text('Balance Amount',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  Spacer(),
                  Container(
                      height: 20.0,
                      width: 20.0,
                      decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(5.0))),
                  SizedBox(width: 10.0),
                  Text('Excess Amount',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  Spacer()
                ]),
              ])),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
              width: MediaQuery.of(context).size.width / 1.5,
              height: 370.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
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
                  ]),
              child: Column(children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                          "Balance & Excess Record's For $FilterValue_10 Participation",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w500)),
                    ),
                    Spacer(),
                    Text('Last Update is:',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500)),
                    TextButton(
                        onPressed: () {
                          Db_Supporter_1.findLastUpdateLive_to_Format(
                                  widget.userCode)
                              .then((value) {
                            setState(() {
                              lastDtaeFormat = value;
                              initState();
                            });
                          });
                        },
                        child: Text("$lastDtaeFormat",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500))),
                    //SizedBox(width: 18.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13.0),
                      child: SizedBox(
                        //width: 50,
                        child: DropdownButton<String>(
                          value: FilterValue_1,
                          hint: Text('Fillter'),
                          icon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Icon(Icons.filter_list_rounded),
                          ),
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              FilterValue_1 = value!;
                              initState();
                            });
                          },
                          items: Filter_Val_1.map<DropdownMenuItem<String>>(
                              (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Container(
                  //width: double.infinity,
                  width: MediaQuery.of(context).size.width / 1.045,
                  //margin: EdgeInsets.all(15.0),
                  height: 300.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: FutureBuilder<List<dynamic>>(
                          future: Data_Table_Fetch_Model_1
                              .GridView_FillterType_Real_Balance_And_Excess_Fetch(
                                  FilterValue_1,
                                  widget.userCode,
                                  FilterValue_10),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              //
                              return Center(
                                  child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.15,
                                      height: 250.0,
                                      child: Center(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CircularProgressIndicator(),
                                          SizedBox(height: 15.0),
                                          Text(
                                            'Loading...',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.0),
                                          )
                                        ],
                                      ))));
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center));
                            } else if (!snapshot.hasData ||
                                snapshot.data!.isEmpty) {
                              return Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.15,
                                      height: 250.0,
                                      child: Image(
                                          image: NetworkImage(
                                              'https://elements-cover-images-0.imgix.net/41ce1856-ce64-47eb-9cc9-d50c75ba936b?auto=compress%2Cformat&w=1370&fit=max&s=e2aafc4ef1374981f2c8728c846dbe33'))),
                                  Text('No Data Founded',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center)
                                ],
                              ));
                            } else {
                              final data = snapshot.data;
                              //print('${data}');

                              int i = 0;
                              int ko = 0;
                              Color color12;

                              return DataTable(
                                  showCheckboxColumn: false,
                                  sortColumnIndex: 3,
                                  columnSpacing: 20.0,
                                  columns: <DataColumn>[
                                    DataColumn(
                                      label: Text('No',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0)),
                                    ),
                                    DataColumn(
                                      label: Text('Customer',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0)),
                                    ),
                                    DataColumn(
                                      label: Text('From Date',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0)),
                                    ),
                                    DataColumn(
                                      label: Text('Doc',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0)),
                                    ),
                                    DataColumn(
                                      label: Text('Valid Amount',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0)),
                                    ),
                                    DataColumn(
                                      label: Text('Paid Amount',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0)),
                                    ),
                                    DataColumn(
                                      label: Text('Account',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0)),
                                    ),
                                    DataColumn(
                                      label: Text('Payment',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0)),
                                    ),
                                    DataColumn(
                                      label: Text('Balance',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0)),
                                    ),
                                    DataColumn(
                                      label: Text('Excess',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0)),
                                    ),
                                    DataColumn(
                                      label: Text('Booked By',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0)),
                                    ),
                                    DataColumn(
                                      label: Text('Is Paid',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0)),
                                    ),
                                    DataColumn(
                                      label: Text('Remarks',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0)),
                                    ),
                                    DataColumn(
                                      label: Text('Delete',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0)),
                                    ),
                                    DataColumn(
                                      label: Text('Update',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0)),
                                    )
                                  ],
                                  //DateFormat('yyyy-MM-dd HH:mm:ss').format(item.FromDate)
                                  rows: data!
                                      .map(
                                        (item) => DataRow(
                                          onLongPress: () {
                                            showAboutDialog(
                                                context: context,
                                                applicationName: 'HaHuTrendz');
                                          },
                                          cells: [
                                            DataCell(Text('${i += 1}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black54))),
                                            DataCell(Text(item.Customer_Name,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black54))),
                                            DataCell(Text(
                                                '${DateFormat('yyyy-MM-dd').format(DateTime.parse(item.Booking_Date.add(Duration(days: 1)).toString()))}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black54))),
                                            DataCell(Text("${item.Document}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black54))),
                                            DataCell(Text(
                                                "${item.Valid_Amount}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black54))),
                                            DataCell(Text("${item.Paid_Amount}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black54))),
                                            DataCell(Text(item.Account_Type,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black54))),
                                            DataCell(Text(item.Payment_Type,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black54))),
                                            DataCell(Text(
                                                "${item.Balance_Amount}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black54))),
                                            DataCell(Text(
                                                "${item.Excess_Amount}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black54))),
                                            DataCell(Text(item.Booked_By,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black54))),
                                            DataCell(
                                                placeholder: true,
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 2.0),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                      color:
                                                          item.Is_Paid == 'Paid'
                                                              ? Colors.green
                                                              : Colors.red),
                                                  child: Text(item.Is_Paid,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white)),
                                                )),
                                            DataCell(Text(item.Remarks,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black54))),
                                            DataCell(IconButton(
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext) {
                                                        return Dialog(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            12.0))),
                                                            child: Container(
                                                                height: 230.0,
                                                                width: 300.0,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            15.0),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child: Column(
                                                                    children: [
                                                                      Text(
                                                                          'Confirmation',
                                                                          style: TextStyle(
                                                                              color: Colors.red,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 18.0)),
                                                                      SizedBox(
                                                                          height:
                                                                              16.0),
                                                                      Text(
                                                                          'Do you want to delete ${item.Customer_Name}. Are you sure. If you sure, Click yes or you do not want to delete, Click no or click outer the dialog box to close.',
                                                                          style:
                                                                              TextStyle(color: Colors.grey),
                                                                          textAlign: TextAlign.justify),
                                                                      SizedBox(
                                                                          height:
                                                                              20.0),
                                                                      Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            MaterialButton(
                                                                                onPressed: () {
                                                                                  setState(() {
                                                                                    Db_Supporter_1.Delete_Customers(item.mainID);
                                                                                    Db_Supporter_1.findLastUpdateLive_to_Format(widget.userCode).then((value) {
                                                                                      setState(() {
                                                                                        lastDtaeFormat = value;
                                                                                        initState();
                                                                                      });
                                                                                    });
                                                                                  });

                                                                                  //Data_Table_Fetch_Model_1.Dash_FillterType_Bal_or_Exs(widget.userCode);

                                                                                  Navigator.pop(context);
                                                                                },
                                                                                color: Colors.red,
                                                                                child: Text('Yes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                                                                            MaterialButton(
                                                                                onPressed: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                color: Colors.green,
                                                                                child: Text('No', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))
                                                                          ])
                                                                    ])));
                                                      });
                                                },
                                                icon: Icon(Icons.delete))),
                                            DataCell(IconButton(
                                                onPressed: () {
                                                  Db_Supporter_1
                                                          .findLastUpdateLive_to_Format(
                                                              widget.userCode)
                                                      .then((value) {
                                                    setState(() {
                                                      lastDtaeFormat = value;
                                                      initState();
                                                    });
                                                  });
                                                },
                                                icon: Icon(Icons.edit)))
                                          ],
                                          onSelectChanged: (value) {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Modern_Customer_Profile_Dialog(
                                                      context,
                                                      item.Customer_Name,
                                                      item.mainID,
                                                      "₹${item.Valid_Amount}",
                                                      '${DateFormat('yyyy-MM-dd').format(DateTime.parse(item.Booking_Date.add(Duration(days: 1)).toString()))}',
                                                      item.Document,
                                                      item.Paid_Amount,
                                                      item.Account_Type,
                                                      item.Payment_Type,
                                                      item.Booked_By,
                                                      item.Balance_Amount,
                                                      item.Excess_Amount,
                                                      item.Is_Paid,
                                                      item.Remarks);
                                                });
                                          },
                                        ),
                                      )
                                      .toList());
                            }
                          }),
                    ),
                  ),
                )
              ])),
        ],
      ),
      SizedBox(height: 30.0),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            width: MediaQuery.of(context).size.width / 1.5,
            height: 380.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
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
                ]),
            child: Column(children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                        "Hot Cash, UPI, Bank Transfer and Cheque Record's For $FilterValue_10",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500)),
                  ),
                  Spacer(),
                  Text('Last Update is:',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500)),
                  TextButton(
                      onPressed: () {
                        Db_Supporter_1.findLastUpdateLive_to_Format(
                                widget.userCode)
                            .then((value) {
                          setState(() {
                            lastDtaeFormat = value;
                            initState();
                          });
                        });
                      },
                      child: Text('$lastDtaeFormat',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
                    child: SizedBox(
                      //width: 50,
                      child: DropdownButton<String>(
                        value: FilterValue_2,
                        hint: Text('Fillter'),
                        icon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Icon(Icons.filter_list_rounded),
                        ),
                        elevation: 16,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            FilterValue_2 = value!;
                            initState();
                          });
                        },
                        items: Filter_Val_2.map<DropdownMenuItem<String>>(
                            (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Container(
                //width: double.infinity,
                width: MediaQuery.of(context).size.width / 1.045,
                //margin: EdgeInsets.all(15.0),
                height: 300.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: FutureBuilder<List<dynamic>>(
                        future: Data_Table_Fetch_Model_1
                            .GridView_FillterType_Real_UPI_And_Others_Fetch(
                                FilterValue_2, widget.userCode, FilterValue_10),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            //
                            return Center(
                                child: Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.15,
                                    height: 250.0,
                                    child: Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircularProgressIndicator(),
                                        SizedBox(height: 15.0),
                                        Text(
                                          'Loading...',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20.0),
                                        )
                                      ],
                                    ))));
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.15,
                                    height: 250.0,
                                    child: Image(
                                        image: NetworkImage(
                                            'https://elements-cover-images-0.imgix.net/41ce1856-ce64-47eb-9cc9-d50c75ba936b?auto=compress%2Cformat&w=1370&fit=max&s=e2aafc4ef1374981f2c8728c846dbe33'))),
                                Text('No Data Founded',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center)
                              ],
                            ));
                          } else {
                            final data = snapshot.data;
                            //print('${data}');

                            int i = 0;
                            int ko = 0;
                            Color color12;

                            return DataTable(
                                showCheckboxColumn: false,
                                sortColumnIndex: 3,
                                columnSpacing: 20.0,
                                columns: <DataColumn>[
                                  DataColumn(
                                    label: Text('No',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0)),
                                  ),
                                  DataColumn(
                                    label: Text('Customer',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0)),
                                  ),
                                  DataColumn(
                                    label: Text('From Date',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0)),
                                  ),
                                  DataColumn(
                                    label: Text('Doc',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0)),
                                  ),
                                  DataColumn(
                                    label: Text('Valid Amount',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0)),
                                  ),
                                  DataColumn(
                                    label: Text('Paid Amount',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0)),
                                  ),
                                  DataColumn(
                                    label: Text('Account',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0)),
                                  ),
                                  DataColumn(
                                    label: Text('Payment',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0)),
                                  ),
                                  DataColumn(
                                    label: Text('Balance',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0)),
                                  ),
                                  DataColumn(
                                    label: Text('Excess',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0)),
                                  ),
                                  DataColumn(
                                    label: Text('Booked By',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0)),
                                  ),
                                  DataColumn(
                                    label: Text('Is Paid',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0)),
                                  ),
                                  DataColumn(
                                    label: Text('Remarks',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0)),
                                  ),
                                  DataColumn(
                                    label: Text('Delete',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0)),
                                  ),
                                  DataColumn(
                                    label: Text('Update',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0)),
                                  )
                                ],
                                //DateFormat('yyyy-MM-dd HH:mm:ss').format(item.FromDate)
                                rows: data!
                                    .map(
                                      (item) => DataRow(
                                        onLongPress: () {
                                          showAboutDialog(
                                              context: context,
                                              applicationName: 'HaHuTrendz');
                                        },
                                        cells: [
                                          DataCell(Text('${i += 1}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54))),
                                          DataCell(Text(item.Customer_Name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54))),
                                          DataCell(Text(
                                              '${DateFormat('yyyy-MM-dd').format(DateTime.parse(item.Booking_Date.add(Duration(days: 1)).toString()))}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54))),
                                          DataCell(Text("${item.Document}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54))),
                                          DataCell(Text("${item.Valid_Amount}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54))),
                                          DataCell(Text("${item.Paid_Amount}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54))),
                                          DataCell(Text(item.Account_Type,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54))),
                                          DataCell(Text(item.Payment_Type,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54))),
                                          DataCell(Text(
                                              "${item.Balance_Amount}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54))),
                                          DataCell(Text("${item.Excess_Amount}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54))),
                                          DataCell(Text(item.Booked_By,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54))),
                                          DataCell(
                                              placeholder: true,
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.0,
                                                    vertical: 2.0),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                    color:
                                                        item.Is_Paid == 'Paid'
                                                            ? Colors.green
                                                            : Colors.red),
                                                child: Text(item.Is_Paid,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.white)),
                                              )),
                                          DataCell(Text(item.Remarks,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54))),
                                          DataCell(IconButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (BuildContext) {
                                                      return Dialog(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          12.0))),
                                                          child: Container(
                                                              height: 230.0,
                                                              width: 300.0,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          15.0),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Column(
                                                                  children: [
                                                                    Text(
                                                                        'Confirmation',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.red,
                                                                            fontWeight: FontWeight.w500,
                                                                            fontSize: 18.0)),
                                                                    SizedBox(
                                                                        height:
                                                                            16.0),
                                                                    Text(
                                                                        'Do you want to delete ${item.Customer_Name}. Are you sure. If you sure, Click yes or you do not want to delete, Click no or click outer the dialog box to close.',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .grey),
                                                                        textAlign:
                                                                            TextAlign.justify),
                                                                    SizedBox(
                                                                        height:
                                                                            20.0),
                                                                    Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          MaterialButton(
                                                                              onPressed: () {
                                                                                setState(() {
                                                                                  Db_Supporter_1.Delete_Customers(item.mainID);
                                                                                  Db_Supporter_1.findLastUpdateLive_to_Format(widget.userCode).then((value) {
                                                                                    setState(() {
                                                                                      lastDtaeFormat = value;
                                                                                      initState();
                                                                                    });
                                                                                  });
                                                                                });

                                                                                //Data_Table_Fetch_Model_1.Dash_FillterType_Bal_or_Exs(widget.userCode);

                                                                                Navigator.pop(context);
                                                                              },
                                                                              color: Colors.red,
                                                                              child: Text('Yes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                                                                          MaterialButton(
                                                                              onPressed: () {
                                                                                Navigator.pop(context);
                                                                              },
                                                                              color: Colors.green,
                                                                              child: Text('No', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))
                                                                        ])
                                                                  ])));
                                                    });
                                              },
                                              icon: Icon(Icons.delete))),
                                          DataCell(IconButton(
                                              onPressed: () {
                                                Db_Supporter_1
                                                        .findLastUpdateLive_to_Format(
                                                            widget.userCode)
                                                    .then((value) {
                                                  setState(() {
                                                    lastDtaeFormat = value;
                                                    initState();
                                                  });
                                                });
                                              },
                                              icon: Icon(Icons.edit)))
                                        ],
                                        onSelectChanged: (value) {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Modern_Customer_Profile_Dialog(
                                                    context,
                                                    item.Customer_Name,
                                                    item.mainID,
                                                    "₹${item.Valid_Amount}",
                                                    '${DateFormat('yyyy-MM-dd').format(DateTime.parse(item.Booking_Date.add(Duration(days: 1)).toString()))}',
                                                    item.Document,
                                                    item.Paid_Amount,
                                                    item.Account_Type,
                                                    item.Payment_Type,
                                                    item.Booked_By,
                                                    item.Balance_Amount,
                                                    item.Excess_Amount,
                                                    item.Is_Paid,
                                                    item.Remarks);
                                              });
                                        },
                                      ),
                                    )
                                    .toList());
                          }
                        }),
                  ),
                ),
              )
            ])),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            width: MediaQuery.of(context).size.width / 3.5,
            height: 380.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
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
                ]),
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text("Payment Transfermation Analytics",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w500))),
              Spacer(),
              legand_Donat_DashBoart_Chart_3_UPI_etc__(context, upi_bunker?[0],
                  upi_bunker?[1], upi_bunker?[2], upi_bunker?[3]),
              Spacer(),
              Row(children: [
                Spacer(),
                Container(
                    height: 15.0,
                    width: 15.0,
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(5.0))),
                SizedBox(width: 5.0),
                Text('Hot Cash',
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500)),
                Spacer(),
                Container(
                    height: 15.0,
                    width: 15.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5.0))),
                SizedBox(width: 5.0),
                Text('UPI',
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500)),
                Spacer(),
                Container(
                    height: 15.0,
                    width: 15.0,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(5.0))),
                SizedBox(width: 5.0),
                Text('Bank Transfer',
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500)),
                Spacer(),
                Container(
                    height: 15.0,
                    width: 15.0,
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(5.0))),
                SizedBox(width: 5.0),
                Text('Cheque',
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500)),
                Spacer()
              ])
            ]))
      ]),
      SizedBox(height: 30.0)
    ]);
  }
}
