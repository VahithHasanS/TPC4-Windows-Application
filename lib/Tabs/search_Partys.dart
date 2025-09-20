// ignore_for_file: camel_case_types, file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_unnecessary_containers, sized_box_for_whitespace, constant_identifier_names, unused_field, avoid_print, annotate_overrides, must_call_super, unnecessary_string_interpolations, avoid_types_as_parameter_names, unused_local_variable, unused_import, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta_blaster/Charts/dashboard_chart1.dart';
import 'package:meta_blaster/Models/BigCards.dart';
import 'package:meta_blaster/Models/dialogs1.dart';
import 'package:meta_blaster/Models/smallWidgets.dart';
import 'package:meta_blaster/mongoDB/DB_Supporter1.dart';
import 'package:meta_blaster/mongoDB/DB_Supporter3.dart';
import 'package:meta_blaster/mongoDB/DB_Supporter5.dart';
import 'package:meta_blaster/mongoDB/DB_Supporter6.dart';
import 'package:meta_blaster/mongoDB/DB_Supporter7.dart';
import 'package:meta_blaster/mongoDB/DB_Suppoter2.dart';
import 'package:meta_blaster/mongoDB/dataTable_Fetch.dart';

class Search_Partys_Tab extends StatefulWidget {
  final UName, UEmail, UniqueCode;
  const Search_Partys_Tab(
      {super.key,
      required this.UName,
      required this.UEmail,
      required this.UniqueCode});

  @override
  State<Search_Partys_Tab> createState() => _Search_Partys_TabState();
}

class _Search_Partys_TabState extends State<Search_Partys_Tab> {
  static const List<String> Filter_Val_10 = <String>['Balance', 'Excess'];

  static const List<String> Filter_Val_First = <String>[
    'Hot Cash',
    'UPI',
    'Bank Transfer',
    'Cheque'
  ];

  static const List<String> Head_UPI_Filter_String_List = <String>[
    'Hot Cash',
    'UPI',
    'Bank Transfer',
    'Cheque'
  ];

  static const List<String> Head_Balance_Filter_String_List = <String>[
    'Balance',
    'Excess'
  ];

  String FilterValue_first = Filter_Val_First.first;

  dynamic lastDtaeFormat, indiBranch, lastDateFormatHed;

  dynamic total_bunker,
      upi_bunker,
      global_Party_Values,
      global_Branch_Values,
      global_Shajahan_Values,
      global_Root_Values,
      global_CCC_Values,
      global_Others_Values,
      upi_analytics,
      Head_Total_Bunker_UPI_Bal,
      Head_Total_Branch,
      Head_Total_Shajahan,
      Head_Total_Root,
      Head_Total_CCC,
      Head_Total_Other,
      fromDate_Format,
      toDate_Format;

  String FilterValue_10 = Filter_Val_10.first;

  String Head_Filter_Balance_Value = Head_Balance_Filter_String_List.first;
  String Head_Filter_UPI_Value = Head_UPI_Filter_String_List.first;

  TextEditingController dateinputFrom = TextEditingController();
  TextEditingController dateinputTO = TextEditingController();
  TextEditingController CustomerNameController = TextEditingController();

  static const List<String> Filter_Val_1 = <String>[
    'All',
    'Paid',
    'Un Paid',
    'Pending'
  ];

  static const List<String> Filter_Val_2 = <String>[
    'All',
    'Branch Pc-4',
    'Shajahan',
    'Root',
    'CCC',
    'Other'
  ];

  String FilterValue_1 = Filter_Val_1.first;
  String FilterValue_2 = Filter_Val_2.first;

  var FromDate, ToDate;
  dynamic Name, Status = 'All', Book = 'All';

  void initState() {
    try {
      Db_Supporter_3.findLastUpdateLive_to_Format_IndiPartyies(
              widget.UniqueCode, FilterValue_10)
          .then((value) {
        setState(() {
          lastDtaeFormat = value;
        });
      });
    } catch (e) {
      lastDtaeFormat = 'NULL';
    }

    try {
      Db_Supporter_2.findLastUpdateLive_to_Format_Hed(widget.UniqueCode)
          .then((value) {
        setState(() {
          lastDateFormatHed = value;
        });
      });
    } catch (e) {
      lastDateFormatHed = 'NULL';
    }

    Db_Supporter_3.Total_Participation_Report_Bunker_Fetch_Data(
            widget.UniqueCode, FilterValue_10)
        .then((value) {
      setState(() {
        total_bunker = value;
      });
    });

    Db_Supporter_3.Total_UPI_and_Others_Analytics(
            widget.UniqueCode, FilterValue_10)
        .then((value) {
      setState(() {
        upi_bunker = value;
      });
    });

    // One Time //

    Db_Supporter_5.Fetch_Total_Party_Bunker_SearchTab(
            widget.UniqueCode, null, null, null, 'All', 'All')
        .then((value) {
      setState(() {
        global_Party_Values = value;
      });
    });

    Db_Supporter_5.Fetch_Total_Party_Bunker_SearchTab(
            widget.UniqueCode, null, null, null, 'Branch Pc-4', 'All')
        .then((value) {
      setState(() {
        global_Branch_Values = value;
      });
    });

    Db_Supporter_5.Fetch_Total_Party_Bunker_SearchTab(
            widget.UniqueCode, null, null, null, 'Shajahan', 'All')
        .then((value) {
      setState(() {
        global_Shajahan_Values = value;
      });
    });

    Db_Supporter_5.Fetch_Total_Party_Bunker_SearchTab(
            widget.UniqueCode, null, null, null, 'Root', 'All')
        .then((value) {
      setState(() {
        global_Root_Values = value;
      });
    });

    Db_Supporter_5.Fetch_Total_Party_Bunker_SearchTab(
            widget.UniqueCode, null, null, null, 'CCC', 'All')
        .then((value) {
      setState(() {
        global_CCC_Values = value;
      });
    });

    Db_Supporter_5.Fetch_Total_Party_Bunker_SearchTab(
            widget.UniqueCode, null, null, null, 'Other', 'All')
        .then((value) {
      setState(() {
        global_Others_Values = value;
      });
    });

    Db_Supporter_5.Fetch_Total_Head_UPI_Bunker_SearchTab(
            widget.UniqueCode, null, null, 'All', 'All')
        .then((value) {
      setState(() {
        Head_Total_Bunker_UPI_Bal = value;
      });
    });

    Db_Supporter_5.Fetch_Total_Head_All_Bunker_SearchTab(
            widget.UniqueCode, null, null, 'All')
        .then((value) {
      setState(() {
        Head_Total_Branch = value[0];
        Head_Total_Shajahan = value[1];
        Head_Total_Root = value[2];
        Head_Total_CCC = value[3];
        Head_Total_Other = value[4];
      });
    });

    Db_Supporter_6.FromToDate_Formated(widget.UniqueCode).then((value) {
      setState(() {
        fromDate_Format = value[0];
        toDate_Format = value[1];
      });
    });

    //end One Time //

    Db_Supporter_6.Fetch_Total_Party_Bunker_SearchTab_UPI_Analytics(
            widget.UniqueCode, null, null, null, 'All', 'All')
        .then((value) {
      setState(() {
        upi_analytics = value;
      });
    });
  }

  void initState_sub_State_2() {
    try {
      Db_Supporter_3.findLastUpdateLive_to_Format_IndiPartyies(
              widget.UniqueCode, FilterValue_10)
          .then((value) {
        setState(() {
          lastDtaeFormat = value;
        });
      });
    } catch (e) {
      lastDtaeFormat = 'NULL';
    }

    try {
      Db_Supporter_2.findLastUpdateLive_to_Format_Hed(widget.UniqueCode)
          .then((value) {
        setState(() {
          lastDateFormatHed = value;
        });
      });
    } catch (e) {
      lastDateFormatHed = 'NULL';
    }

    Db_Supporter_3.Total_Participation_Report_Bunker_Fetch_Data(
            widget.UniqueCode, FilterValue_10)
        .then((value) {
      setState(() {
        total_bunker = value;
      });
    });

    Db_Supporter_3.Total_UPI_and_Others_Analytics(
            widget.UniqueCode, FilterValue_10)
        .then((value) {
      setState(() {
        upi_bunker = value;
      });
    });

    Db_Supporter_6.FromToDate_Formated(widget.UniqueCode).then((value) {
      setState(() {
        fromDate_Format = value[0];
        toDate_Format = value[1];
      });
    });

    ////

    Db_Supporter_5.Fetch_Total_Party_Bunker_SearchTab(
            widget.UniqueCode, FromDate, ToDate, Name, Book, Status)
        .then((value) {
      setState(() {
        global_Party_Values = value;
      });
    });

    Db_Supporter_5.Fetch_Total_Party_Bunker_SearchTab(
            widget.UniqueCode, FromDate, ToDate, Name, 'Branch Pc-4', 'All')
        .then((value) {
      setState(() {
        global_Branch_Values = value;
      });
    });

    Db_Supporter_5.Fetch_Total_Party_Bunker_SearchTab(
            widget.UniqueCode, FromDate, ToDate, Name, 'Shajahan', 'All')
        .then((value) {
      setState(() {
        global_Shajahan_Values = value;
      });
    });

    Db_Supporter_5.Fetch_Total_Party_Bunker_SearchTab(
            widget.UniqueCode, FromDate, ToDate, Name, 'Root', 'All')
        .then((value) {
      setState(() {
        global_Root_Values = value;
      });
    });

    Db_Supporter_5.Fetch_Total_Party_Bunker_SearchTab(
            widget.UniqueCode, FromDate, ToDate, Name, 'CCC', 'All')
        .then((value) {
      setState(() {
        global_CCC_Values = value;
      });
    });

    Db_Supporter_5.Fetch_Total_Party_Bunker_SearchTab(
            widget.UniqueCode, FromDate, ToDate, Name, 'Other', 'All')
        .then((value) {
      setState(() {
        global_Others_Values = value;
      });
    });

    Db_Supporter_5.Fetch_Total_Head_UPI_Bunker_SearchTab(
            widget.UniqueCode, FromDate, ToDate, Book, Status)
        .then((value) {
      setState(() {
        Head_Total_Bunker_UPI_Bal = value;
      });
    });

    Db_Supporter_5.Fetch_Total_Head_All_Bunker_SearchTab(
            widget.UniqueCode, FromDate, ToDate, Status)
        .then((value) {
      setState(() {
        Head_Total_Branch = value[0];
        Head_Total_Shajahan = value[1];
        Head_Total_Root = value[2];
        Head_Total_CCC = value[3];
        Head_Total_Other = value[4];
      });
    });

    //

    Db_Supporter_6.Fetch_Total_Party_Bunker_SearchTab_UPI_Analytics(
            widget.UniqueCode, FromDate, ToDate, Name, Book, Status)
        .then((value) {
      setState(() {
        upi_analytics = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
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
              ],
              color: Colors.white),
          width: double.infinity,
          height: 140.0,
          child: Column(children: [
            Row(children: [
              Icon(Icons.filter_list_rounded),
              Text('Filter',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500)),
              Spacer(),
              Text(
                  'Discription: Now you can fetch your data from database with some conditions.',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500)),
              SizedBox(width: 10.0)
            ]),
            SizedBox(height: 10.0),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SizedBox(
                  width: 150.0,
                  child: TextField(
                      controller: dateinputFrom,
                      style: TextStyle(fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                          labelText: "From Date",
                          suffixIcon: Icon(Icons.start),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10)),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print(pickedDate);
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(formattedDate);

                          setState(() {
                            dateinputFrom.text = formattedDate;
                          });
                        } else {
                          var now = DateTime.now();

                          var date = DateFormat('yyyy-MM-dd').format(now);
                          dateinputFrom.text = date;
                        }
                      })),
              SizedBox(
                  width: 150.0,
                  child: TextField(
                      controller: dateinputTO,
                      style: TextStyle(fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                          labelText: "To Date",
                          suffixIcon: Icon(Icons.arrow_back),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10)),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print(pickedDate);
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(formattedDate);

                          setState(() {
                            dateinputTO.text = formattedDate;
                          });
                        } else {
                          var now = DateTime.now();

                          var date = DateFormat('yyyy-MM-dd').format(now);
                          dateinputTO.text = date;
                        }
                      })),
              Container(
                  padding: EdgeInsets.all(2.5),
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.greenAccent,
                            Colors.blue,
                            Colors.indigo,
                            Colors.purple
                          ]),
                      borderRadius: BorderRadius.circular(12.0),
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
                  width: 400.0,
                  child: TextField(
                      textAlign: TextAlign.center,
                      controller: CustomerNameController,
                      textCapitalization: TextCapitalization.characters,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Customer Name',
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: "Enter Customer Name Here...",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                          suffixIcon: Icon(Icons.person, color: Colors.white),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10)),
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white))),
              Row(children: [
                Text('Booked By: ',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
                    child: SizedBox(
                        //width: 50,
                        child: DropdownButton<String>(
                            value: FilterValue_2,
                            icon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Icon(Icons.check_box_outlined),
                            ),
                            elevation: 16,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                FilterValue_2 = value!;
                                //initState();
                              });
                            },
                            items: Filter_Val_2.map<DropdownMenuItem<String>>(
                                (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList())))
              ]),
              Row(children: [
                Text('Status: ',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
                    child: SizedBox(
                        //width: 50,
                        child: DropdownButton<String>(
                            value: FilterValue_1,
                            icon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Icon(Icons.credit_card),
                            ),
                            elevation: 16,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                FilterValue_1 = value!;
                                //initState();
                              });
                            },
                            items: Filter_Val_1.map<DropdownMenuItem<String>>(
                                (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList())))
              ]),
              Column(children: [
                MaterialButton(
                    onPressed: () async {
                      Status = FilterValue_1;
                      Book = FilterValue_2;

                      if (dateinputFrom.text.isEmpty &&
                          dateinputTO.text.isEmpty) {
                        FromDate = null;
                        ToDate = DateTime.parse(
                            (DateFormat('yyyy-MM-dd').format(DateTime.now()))
                                .toString());
                      } else if (dateinputFrom.text.isNotEmpty &&
                          dateinputTO.text.isEmpty) {
                        FromDate =
                            DateTime.parse(dateinputFrom.text.toString());
                        ToDate = DateTime.parse((DateFormat('yyyy-MM-dd')
                            .format(DateTime.now())
                            .toString()));
                      } else if (dateinputFrom.text.isEmpty &&
                          dateinputTO.text.isNotEmpty) {
                        FromDate = null;
                        ToDate = DateTime.parse(dateinputTO.text.toString());
                      } else {
                        FromDate =
                            DateTime.parse(dateinputFrom.text.toString());
                        ToDate = DateTime.parse(dateinputTO.text.toString());
                      }

                      if (CustomerNameController.text.isEmpty) {
                        Name = null;
                      } else {
                        Name = CustomerNameController.text.toUpperCase();
                      }

                      initState_sub_State_2();
                    },
                    color: Colors.green,
                    padding:
                        EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0),
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 20.0,
                    )),
                SizedBox(height: 15.0),
                MaterialButton(
                    onPressed: () {
                      dateinputFrom.clear();
                      dateinputTO.clear();
                      CustomerNameController.clear();
                      setState(() {
                        FilterValue_1 = Filter_Val_1.first;
                        FilterValue_2 = Filter_Val_2.first;
                        //initState();
                      });
                    },
                    color: Colors.red,
                    padding:
                        EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0),
                    child: Icon(
                      Icons.backspace,
                      color: Colors.white,
                      size: 20.0,
                    ))
              ])
            ]),
          ])),
      Center(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              width: 350.0,
              margin: EdgeInsets.only(bottom: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
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
                  ],
                  color: Colors.white),
              child: Center(
                  child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          FilterValue_1;
                          //initState();
                        });
                      },
                      child: Text(
                          '${FromDate == null ? fromDate_Format : dateinputFrom.text}   /   ${ToDate == null ? toDate_Format : dateinputTO.text}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)))))),
      Text('$FilterValue_2 Participation Ordered Grid View Field',
          style: TextStyle(
              color: Colors.black45,
              fontSize: 16.0,
              fontWeight: FontWeight.w500)),
      Container(
          width: double.infinity,
          margin: EdgeInsets.all(20.0),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GridOutletCards(
                  context,
                  'Total Document of Cash Account',
                  '${global_Party_Values?[0] ?? 0.0}',
                  Icons.document_scanner,
                  Colors.amber),
              GridOutletCards(
                  context,
                  'Total Amount of Cash Account',
                  '₹${global_Party_Values?[1] ?? 0.0}',
                  Icons.payment,
                  Colors.blue),
              GridOutletCards(
                  context,
                  'Total Document of Credit Account',
                  '${global_Party_Values?[2] ?? 0.0}',
                  Icons.document_scanner,
                  Colors.red),
              GridOutletCards(
                  context,
                  'Total Amount of Credit Account',
                  '₹${global_Party_Values?[3] ?? 0.0}',
                  Icons.payment,
                  Colors.grey),
              GridOutletCards(
                  context,
                  'Total No of Hot Cash Amount',
                  '${global_Party_Values?[4] ?? 0.0}',
                  Icons.line_axis,
                  Colors.green),
            ]),
            SizedBox(height: 30.0),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GridOutletCards(
                  context,
                  'Total Amount of Hot Cash',
                  '₹${global_Party_Values?[5] ?? 0.0}',
                  Icons.currency_exchange,
                  Colors.purple),
              GridOutletCards(
                  context,
                  'Total No of UPI Amount',
                  '${global_Party_Values?[6] ?? 0.0}',
                  Icons.line_axis,
                  Colors.brown),
              GridOutletCards(
                  context,
                  'Total Amount of UPI',
                  '₹${global_Party_Values?[7] ?? 0.0}',
                  Icons.qr_code_2,
                  Colors.indigo),
              GridOutletCards(
                  context,
                  'Total Amount of Balance',
                  '₹${global_Party_Values?[8] ?? 0.0}',
                  Icons.balance,
                  Colors.pink),
              GridOutletCards(
                  context,
                  'Total Amount of Excess',
                  '₹${global_Party_Values?[9] ?? 0.0}',
                  Icons.pin_drop,
                  Colors.orange),
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
                      "Last Day Booking Record's For $FilterValue_2 Participation",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w500)),
                ),
                Spacer(),
                Text('From To Date: ',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500)),
                TextButton(
                    onPressed: () {
                      Db_Supporter_1.findLastUpdateLive_to_Format(
                              widget.UniqueCode)
                          .then((value) {
                        setState(() {
                          lastDtaeFormat = value;
                          //initState();
                        });
                      });
                    },
                    child: Text(
                        '${FromDate == null ? fromDate_Format : dateinputFrom.text}   /   ${ToDate == null ? toDate_Format : dateinputTO.text}',
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
                            future: Db_Supporter_6
                                .Fetch_Total_Party_Bunker_SearchTab(
                                    widget.UniqueCode,
                                    FromDate,
                                    ToDate,
                                    Name,
                                    Book,
                                    Status),
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
                                                                                      Db_Supporter_1.findLastUpdateLive_to_Format(widget.UniqueCode).then((value) {
                                                                                        setState(() {
                                                                                          lastDtaeFormat = value;
                                                                                          //initState();

                                                                                          initState_sub_State_2();
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
                                                                widget
                                                                    .UniqueCode)
                                                        .then((value) {
                                                      setState(() {
                                                        lastDtaeFormat = value;
                                                        //initState();

                                                        initState_sub_State_2();
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
                    context,
                    global_Party_Values?[8] ?? 0.0,
                    global_Party_Values?[9] ?? 0.0),
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
                          "Balance & Excess Record's For $FilterValue_2 Participation",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w500)),
                    ),
                    Spacer(),
                    Text('From To Date: ',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500)),
                    TextButton(
                        onPressed: () {
                          Db_Supporter_1.findLastUpdateLive_to_Format(
                                  widget.UniqueCode)
                              .then((value) {
                            setState(() {
                              lastDtaeFormat = value;
                              //initState();
                            });
                          });
                        },
                        child: Text(
                            "${FromDate == null ? fromDate_Format : dateinputFrom.text}   /   ${ToDate == null ? toDate_Format : dateinputTO.text}",
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
                          value: FilterValue_10,
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
                              FilterValue_10 = value!;
                              //initState();
                              initState_sub_State_2();
                            });
                          },
                          items: Filter_Val_10.map<DropdownMenuItem<String>>(
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
                          future: Db_Supporter_6
                              .Fetch_Total_Party_Bunker_SearchTab_Balance_Filter(
                                  widget.UniqueCode,
                                  FromDate,
                                  ToDate,
                                  Name,
                                  Book,
                                  Status,
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
                                                                                    Db_Supporter_1.findLastUpdateLive_to_Format(widget.UniqueCode).then((value) {
                                                                                      setState(() {
                                                                                        lastDtaeFormat = value;
                                                                                        //initState();
                                                                                        initState_sub_State_2();
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
                                                              widget.UniqueCode)
                                                      .then((value) {
                                                    setState(() {
                                                      lastDtaeFormat = value;
                                                      //initState();
                                                      initState_sub_State_2();
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
                    child: Text("Booked Payment Record's For $FilterValue_2",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500)),
                  ),
                  Spacer(),
                  Text('From To Date: ',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500)),
                  TextButton(
                      onPressed: () {
                        Db_Supporter_1.findLastUpdateLive_to_Format(
                                widget.UniqueCode)
                            .then((value) {
                          setState(() {
                            lastDtaeFormat = value;
                            //initState();
                          });
                        });
                      },
                      child: Text(
                          '${dateinputFrom.text == '' ? fromDate_Format : dateinputFrom.text}   /   ${dateinputTO.text == '' ? toDate_Format : dateinputTO.text}',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
                    child: SizedBox(
                      //width: 50,
                      child: DropdownButton<String>(
                        value: FilterValue_first,
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
                            FilterValue_first = value!;
                            //initState();
                            initState_sub_State_2();
                          });
                        },
                        items: Filter_Val_First.map<DropdownMenuItem<String>>(
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
                        future: Db_Supporter_6
                            .Fetch_Total_Party_Bunker_SearchTab_UPI_Filter(
                                widget.UniqueCode,
                                FromDate,
                                ToDate,
                                Name,
                                Book,
                                Status,
                                FilterValue_first),
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
                                                                                  Db_Supporter_1.findLastUpdateLive_to_Format(widget.UniqueCode).then((value) {
                                                                                    setState(() {
                                                                                      lastDtaeFormat = value;
                                                                                      //initState();
                                                                                      initState_sub_State_2();
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
                                                            widget.UniqueCode)
                                                    .then((value) {
                                                  setState(() {
                                                    lastDtaeFormat = value;
                                                    //initState();
                                                    initState_sub_State_2();
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
              legand_Donat_DashBoart_Chart_3_UPI_etc__(
                  context,
                  upi_analytics?[0] ?? 0.0,
                  upi_analytics?[1] ?? 0.0,
                  upi_analytics?[2] ?? 0.0,
                  upi_analytics?[3] ?? 0.0),
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
      SizedBox(height: 60.0),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
          margin: EdgeInsets.symmetric(horizontal: 156.0),
          height: 200.0,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.red,
                    Colors.orange,
                    Colors.amber,
                    Colors.yellow
                  ]),
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
                    spreadRadius: 0.0), //BoxShadow
              ]),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('HaHuTrendz',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'comfortaa',
                      fontWeight: FontWeight.bold,
                      fontSize: 36.0)),
              SizedBox(height: 20.0),
              Container(
                  width: 900.0,
                  child: Text(
                      'Firstly Thank you for the support, becuase your are the only reason to became this software, again thank you to motived us. let you want to know about us? click show more to let you know about us and developer.',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0),
                      textAlign: TextAlign.start)),
              Spacer(),
              MaterialButton(
                  onPressed: () {},
                  color: Colors.amber,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  child: Text("Show More",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0)))
            ]),
            Spacer(),
            Image.network(
                'https://assets-global.website-files.com/6364b6fd26e298b11fb9391f/6364b6fd26e2988707b93d2b_TB_%26_Transport_Isometric_Illustrations_Thumbnail-min.png'),
          ])),
      SizedBox(height: 60.0),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
                color: Colors.black,
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
            child: Center(
                child: Text(
                    'Head Office Profiles by:  ${FromDate == null ? fromDate_Format : dateinputFrom.text}   /   ${ToDate == null ? toDate_Format : dateinputTO.text}',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0))))
      ]),
      SizedBox(height: 15.0),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          width: MediaQuery.of(context).size.width / 1.21,
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
                      "Last Day Entryed Record's For $FilterValue_2 in Head Office",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w500)),
                ),
                Spacer(),
                Text('From To Date: ',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500)),
                TextButton(
                    onPressed: () {
                      Db_Supporter_1.findLastUpdateLive_to_Format(
                              widget.UniqueCode)
                          .then((value) {
                        setState(() {
                          lastDtaeFormat = value;
                          //initState();
                        });
                      });
                    },
                    child: Text(
                        '${FromDate == null ? fromDate_Format : dateinputFrom.text}   /   ${ToDate == null ? toDate_Format : dateinputTO.text}',
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
                            future: Db_Supporter_7
                                .Fetch_Total_Party_Bunker_SearchTab_crud(
                                    widget.UniqueCode,
                                    FromDate,
                                    ToDate,
                                    Book,
                                    Status),
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
                                        label: Text('Submited Date',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0)),
                                      ),
                                      DataColumn(
                                        label: Text('Document',
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
                                        label: Text('Entryed By',
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
                                        .map((item2) => DataRow(
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
                                              DataCell(Text(
                                                  '${DateFormat('yyyy-MM-dd').format(DateTime.parse(item2.Submited_Date.add(Duration(days: 1)).toString()))}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black54))),
                                              DataCell(Text("${item2.Document}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black54))),
                                              DataCell(Text(
                                                  "${item2.Valid_Amount}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black54))),
                                              DataCell(Text(
                                                  "${item2.Paid_Amount}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black54))),
                                              DataCell(Text(item2.Payment_Type,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black54))),
                                              DataCell(Text(
                                                  "${item2.Balance_Amount}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black54))),
                                              DataCell(Text(
                                                  "${item2.Excess_Amount}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black54))),
                                              DataCell(Text(item2.Entryed_By,
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
                                                        color: item2.Is_Paid ==
                                                                'Paid'
                                                            ? Colors.green
                                                            : Colors.red),
                                                    child: Text(item2.Is_Paid,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.white)),
                                                  )),
                                              DataCell(Text(item2.Remarks,
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
                                                                            'Do you want to delete ${item2.Submited_Date}. Are you sure. If you sure, Click yes or you do not want to delete, Click no or click outer the dialog box to close.',
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
                                                                                      Db_Supporter_1.Delete_Customers_Head(item2.mainID);
                                                                                      Db_Supporter_1.findLastUpdateLive_to_Format(widget.UniqueCode).then((value) {
                                                                                        setState(() {
                                                                                          lastDtaeFormat = value;
                                                                                          initState();
                                                                                          initState_sub_State_2();
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
                                                                widget
                                                                    .UniqueCode)
                                                        .then((value) {
                                                      setState(() {
                                                        lastDtaeFormat = value;
                                                        initState();
                                                        initState_sub_State_2();
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
                                                    return Modern_HeadOffice_Customer_Profile_Dialog(
                                                        context,
                                                        item2.mainID,
                                                        '${DateFormat('yyyy-MM-dd').format(DateTime.parse(item2.Submited_Date.add(Duration(days: 1)).toString()))}',
                                                        item2.Document,
                                                        item2.Valid_Amount,
                                                        item2.Paid_Amount,
                                                        item2.Payment_Type,
                                                        item2.Entryed_By,
                                                        item2.Balance_Amount,
                                                        item2.Excess_Amount,
                                                        item2.Is_Paid,
                                                        item2.Remarks);
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
                    context,
                    Head_Total_Bunker_UPI_Bal?[0] ?? 0.0,
                    Head_Total_Bunker_UPI_Bal?[1] ?? 0.0),
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
                          "Payment Record's For $FilterValue_2 in Head Office ",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w500)),
                    ),
                    Spacer(),
                    Text('From To Date: ',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500)),
                    TextButton(
                        onPressed: () {
                          Db_Supporter_1.findLastUpdateLive_to_Format(
                                  widget.UniqueCode)
                              .then((value) {
                            setState(() {
                              lastDtaeFormat = value;
                              //initState();
                            });
                          });
                        },
                        child: Text(
                            "${FromDate == null ? fromDate_Format : dateinputFrom.text}   /   ${ToDate == null ? toDate_Format : dateinputTO.text}",
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
                          value: Head_Filter_Balance_Value,
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
                              Head_Filter_Balance_Value = value!;
                              //initState();
                              initState_sub_State_2();
                            });
                          },
                          items: Head_Balance_Filter_String_List.map<
                              DropdownMenuItem<String>>((String value) {
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
                          future: Db_Supporter_7
                              .Fetch_Total_Party_Bunker_SearchTab_crud_Balance(
                                  widget.UniqueCode,
                                  FromDate,
                                  ToDate,
                                  Book,
                                  Status,
                                  Head_Filter_Balance_Value),
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
                                      label: Text('Submited Date',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0)),
                                    ),
                                    DataColumn(
                                      label: Text('Document',
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
                                      label: Text('Entryed By',
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
                                      .map((item2) => DataRow(
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
                                            DataCell(Text(
                                                '${DateFormat('yyyy-MM-dd').format(DateTime.parse(item2.Submited_Date.add(Duration(days: 1)).toString()))}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black54))),
                                            DataCell(Text("${item2.Document}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black54))),
                                            DataCell(Text(
                                                "${item2.Valid_Amount}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black54))),
                                            DataCell(Text(
                                                "${item2.Paid_Amount}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black54))),
                                            DataCell(Text(item2.Payment_Type,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black54))),
                                            DataCell(Text(
                                                "${item2.Balance_Amount}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black54))),
                                            DataCell(Text(
                                                "${item2.Excess_Amount}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black54))),
                                            DataCell(Text(item2.Entryed_By,
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
                                                      color: item2.Is_Paid ==
                                                              'Paid'
                                                          ? Colors.green
                                                          : Colors.red),
                                                  child: Text(item2.Is_Paid,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white)),
                                                )),
                                            DataCell(Text(item2.Remarks,
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
                                                                          'Do you want to delete ${item2.Submited_Date}. Are you sure. If you sure, Click yes or you do not want to delete, Click no or click outer the dialog box to close.',
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
                                                                                    Db_Supporter_1.Delete_Customers_Head(item2.mainID);
                                                                                    Db_Supporter_1.findLastUpdateLive_to_Format(widget.UniqueCode).then((value) {
                                                                                      setState(() {
                                                                                        lastDtaeFormat = value;
                                                                                        initState();
                                                                                        initState_sub_State_2();
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
                                                              widget.UniqueCode)
                                                      .then((value) {
                                                    setState(() {
                                                      lastDtaeFormat = value;
                                                      initState();
                                                      initState_sub_State_2();
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
                                                  return Modern_HeadOffice_Customer_Profile_Dialog(
                                                      context,
                                                      item2.mainID,
                                                      '${DateFormat('yyyy-MM-dd').format(DateTime.parse(item2.Submited_Date.add(Duration(days: 1)).toString()))}',
                                                      item2.Document,
                                                      item2.Valid_Amount,
                                                      item2.Paid_Amount,
                                                      item2.Payment_Type,
                                                      item2.Entryed_By,
                                                      item2.Balance_Amount,
                                                      item2.Excess_Amount,
                                                      item2.Is_Paid,
                                                      item2.Remarks);
                                                });
                                          }))
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
                        "Booked Payment Record's For $FilterValue_2 in Head Office",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500)),
                  ),
                  Spacer(),
                  Text('From To Date: ',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500)),
                  TextButton(
                      onPressed: () {
                        Db_Supporter_1.findLastUpdateLive_to_Format(
                                widget.UniqueCode)
                            .then((value) {
                          setState(() {
                            lastDtaeFormat = value;
                            //initState();
                          });
                        });
                      },
                      child: Text(
                          '${FromDate == null ? fromDate_Format : dateinputFrom.text}   /   ${ToDate == null ? toDate_Format : dateinputTO.text}',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
                    child: SizedBox(
                      //width: 50,
                      child: DropdownButton<String>(
                        value: Head_Filter_UPI_Value,
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
                            Head_Filter_UPI_Value = value!;
                            //initState();
                            initState_sub_State_2();
                          });
                        },
                        items: Head_UPI_Filter_String_List.map<
                            DropdownMenuItem<String>>((String value) {
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
                        future: Db_Supporter_7
                            .Fetch_Total_Party_Bunker_SearchTab_crud_UPI(
                                widget.UniqueCode,
                                FromDate,
                                ToDate,
                                Book,
                                Status,
                                Head_Filter_UPI_Value),
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
                                    label: Text('Submited Date',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0)),
                                  ),
                                  DataColumn(
                                    label: Text('Document',
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
                                    label: Text('Entryed By',
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
                                    .map((item2) => DataRow(
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
                                          DataCell(Text(
                                              '${DateFormat('yyyy-MM-dd').format(DateTime.parse(item2.Submited_Date.add(Duration(days: 1)).toString()))}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54))),
                                          DataCell(Text("${item2.Document}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54))),
                                          DataCell(Text("${item2.Valid_Amount}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54))),
                                          DataCell(Text("${item2.Paid_Amount}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54))),
                                          DataCell(Text(item2.Payment_Type,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54))),
                                          DataCell(Text(
                                              "${item2.Balance_Amount}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54))),
                                          DataCell(Text(
                                              "${item2.Excess_Amount}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54))),
                                          DataCell(Text(item2.Entryed_By,
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
                                                        item2.Is_Paid == 'Paid'
                                                            ? Colors.green
                                                            : Colors.red),
                                                child: Text(item2.Is_Paid,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.white)),
                                              )),
                                          DataCell(Text(item2.Remarks,
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
                                                                        'Do you want to delete ${item2.Submited_Date}. Are you sure. If you sure, Click yes or you do not want to delete, Click no or click outer the dialog box to close.',
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
                                                                                  Db_Supporter_1.Delete_Customers_Head(item2.mainID);
                                                                                  Db_Supporter_1.findLastUpdateLive_to_Format(widget.UniqueCode).then((value) {
                                                                                    setState(() {
                                                                                      lastDtaeFormat = value;
                                                                                      initState();
                                                                                      initState_sub_State_2();
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
                                                            widget.UniqueCode)
                                                    .then((value) {
                                                  setState(() {
                                                    lastDtaeFormat = value;
                                                    initState();
                                                    initState_sub_State_2();
                                                  });
                                                });
                                              },
                                              icon: Icon(Icons.edit)))
                                        ],
                                        onSelectChanged: (value) {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Modern_HeadOffice_Customer_Profile_Dialog(
                                                    context,
                                                    item2.mainID,
                                                    '${DateFormat('yyyy-MM-dd').format(DateTime.parse(item2.Submited_Date.add(Duration(days: 1)).toString()))}',
                                                    item2.Document,
                                                    item2.Valid_Amount,
                                                    item2.Paid_Amount,
                                                    item2.Payment_Type,
                                                    item2.Entryed_By,
                                                    item2.Balance_Amount,
                                                    item2.Excess_Amount,
                                                    item2.Is_Paid,
                                                    item2.Remarks);
                                              });
                                        }))
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
              legand_Donat_DashBoart_Chart_3_UPI_etc__(
                  context,
                  Head_Total_Bunker_UPI_Bal?[2] ?? 0.0,
                  Head_Total_Bunker_UPI_Bal?[3] ?? 0.0,
                  Head_Total_Bunker_UPI_Bal?[4] ?? 0.0,
                  Head_Total_Bunker_UPI_Bal?[5] ?? 0.0),
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
      SizedBox(height: 30.0),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
                color: Colors.black,
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
            child: Center(
                child: Text(
                    'Total Profiles bunker by:  ${FromDate == null ? fromDate_Format : dateinputFrom.text}   /   ${ToDate == null ? toDate_Format : dateinputTO.text}',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0))))
      ]),
      SizedBox(height: 15.0),
      Container(
          width: MediaQuery.of(context).size.width / 1.035,
          height: 420.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: const Offset(1.0, 1.0),
                    blurRadius: 3.0,
                    spreadRadius: 0.0), //BoxShadow
                BoxShadow(
                    color: Colors.black38,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0) //BoxShadow
              ]),
          child: Total_Participation_Status_Bunker_002(
              context,
              '${FromDate == null ? fromDate_Format : dateinputFrom.text}   /   ${ToDate == null ? toDate_Format : dateinputTO.text}',
              global_Branch_Values,
              global_Shajahan_Values,
              global_Root_Values,
              global_CCC_Values,
              global_Others_Values, [
            ((global_Branch_Values?[0] ?? 0.0) +
                (global_Shajahan_Values?[0] ?? 0.0) +
                (global_Root_Values?[0] ?? 0.0) +
                (global_CCC_Values?[0] ?? 0.0) +
                (global_Others_Values?[0] ?? 0.0)),
            ((global_Branch_Values?[1] ?? 0.0) +
                (global_Shajahan_Values?[1] ?? 0.0) +
                (global_Root_Values?[1] ?? 0.0) +
                (global_CCC_Values?[1] ?? 0.0) +
                (global_Others_Values?[1] ?? 0.0)),
            ((global_Branch_Values?[2] ?? 0.0) +
                (global_Shajahan_Values?[2] ?? 0.0) +
                (global_Root_Values?[2] ?? 0.0) +
                (global_CCC_Values?[2] ?? 0.0) +
                (global_Others_Values?[2] ?? 0.0)),
            ((global_Branch_Values?[3] ?? 0.0) +
                (global_Shajahan_Values?[3] ?? 0.0) +
                ((global_Root_Values?[3] ?? 0.0) +
                    (global_CCC_Values?[3] ?? 0.0)) +
                (global_Others_Values?[3] ?? 0.0)),
            ((global_Branch_Values?[4] ?? 0.0) +
                (global_Shajahan_Values?[4] ?? 0.0) +
                (global_Root_Values?[4] ?? 0.0) +
                (global_CCC_Values?[4] ?? 0.0) +
                (global_Others_Values?[4] ?? 0.0)),
            ((global_Branch_Values?[5] ?? 0.0) +
                (global_Shajahan_Values?[5] ?? 0.0) +
                (global_Root_Values?[5] ?? 0.0) +
                (global_CCC_Values?[5] ?? 0.0) +
                (global_Others_Values?[5] ?? 0.0)),
            ((global_Branch_Values?[6] ?? 0.0) +
                (global_Shajahan_Values?[6] ?? 0.0) +
                (global_Root_Values?[6] ?? 0.0) +
                (global_CCC_Values?[6] ?? 0.0) +
                (global_Others_Values?[6] ?? 0.0)),
            ((global_Branch_Values?[7] ?? 0.0) +
                (global_Shajahan_Values?[7] ?? 0.0) +
                (global_Root_Values?[7] ?? 0.0) +
                (global_CCC_Values?[7] ?? 0.0) +
                (global_Others_Values?[7] ?? 0.0)),
            ((global_Branch_Values?[8] ?? 0.0) +
                (global_Shajahan_Values?[8] ?? 0.0) +
                (global_Root_Values?[8] ?? 0.0) +
                (global_CCC_Values?[8] ?? 0.0) +
                (global_Others_Values?[8] ?? 0.0)),
            ((global_Branch_Values?[9] ?? 0.0) +
                (global_Shajahan_Values?[9] ?? 0.0) +
                (global_Root_Values?[9] ?? 0.0) +
                (global_CCC_Values?[9] ?? 0.0) +
                (global_Others_Values?[9] ?? 0.0)),
            ((global_Branch_Values?[10] ?? 0.0) +
                (global_Shajahan_Values?[10] ?? 0.0) +
                (global_Root_Values?[10] ?? 0.0) +
                (global_CCC_Values?[10] ?? 0.0) +
                (global_Others_Values?[10] ?? 0.0)),
            ((global_Branch_Values?[11] ?? 0.0) +
                (global_Shajahan_Values?[11] ?? 0.0) +
                (global_Root_Values?[11] ?? 0.0) +
                (global_CCC_Values?[11] ?? 0.0) +
                (global_Others_Values?[11] ?? 0.0))
          ])),
      SizedBox(height: 30.0),
      Container(
          width: MediaQuery.of(context).size.width / 1.035,
          height: 420.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: const Offset(1.0, 1.0),
                    blurRadius: 3.0,
                    spreadRadius: 0.0), //BoxShadow
                BoxShadow(
                    color: Colors.black38,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0) //BoxShadow
              ]),
          child: Head_Total_Status_Bunker_Box(
              context,
              '${FromDate == null ? fromDate_Format : dateinputFrom.text}   /   ${ToDate == null ? toDate_Format : dateinputTO.text}',
              Head_Total_Branch,
              Head_Total_Shajahan,
              Head_Total_Root,
              Head_Total_CCC,
              Head_Total_Other, [
            ((Head_Total_Branch?[0] ?? 0) + (Head_Total_Shajahan?[0] ?? 0) ??
                0 +
                    (Head_Total_Root?[0] ?? 0) +
                    (Head_Total_CCC?[0] ?? 0) +
                    (Head_Total_Other?[0] ?? 0)),
            ((Head_Total_Branch?[1] ?? 0) + (Head_Total_Shajahan?[1] ?? 0) ??
                0 +
                    (Head_Total_Root?[1] ?? 0) +
                    (Head_Total_CCC?[1] ?? 0) +
                    (Head_Total_Other?[1] ?? 0)),
            ((Head_Total_Branch?[2] ?? 0) + (Head_Total_Shajahan?[2] ?? 0) ??
                0 +
                    (Head_Total_Root?[2] ?? 0) +
                    (Head_Total_CCC?[2] ?? 0) +
                    (Head_Total_Other?[2] ?? 0)),
            ((Head_Total_Branch?[3] ?? 0) + (Head_Total_Shajahan?[3] ?? 0) ??
                0 +
                    (Head_Total_Root?[3] ?? 0) +
                    (Head_Total_CCC?[3] ?? 0) +
                    (Head_Total_Other?[3] ?? 0)),
            ((Head_Total_Branch?[4] ?? 0) + (Head_Total_Shajahan?[4] ?? 0) ??
                0 +
                    (Head_Total_Root?[4] ?? 0) +
                    (Head_Total_CCC?[4] ?? 0) +
                    (Head_Total_Other?[4] ?? 0)),
            ((Head_Total_Branch?[5] ?? 0) + (Head_Total_Shajahan?[5] ?? 0) ??
                0 +
                    (Head_Total_Root?[5] ?? 0) +
                    (Head_Total_CCC?[5] ?? 0) +
                    (Head_Total_Other?[5] ?? 0)),
            ((Head_Total_Branch?[6] ?? 0) + (Head_Total_Shajahan?[6] ?? 0) ??
                0 +
                    (Head_Total_Root?[6] ?? 0) +
                    (Head_Total_CCC?[6] ?? 0) +
                    (Head_Total_Other?[6] ?? 0)),
            ((Head_Total_Branch?[7] ?? 0) + (Head_Total_Shajahan?[7] ?? 0) ??
                0 +
                    (Head_Total_Root?[7] ?? 0) +
                    (Head_Total_CCC?[7] ?? 0) +
                    (Head_Total_Other?[7] ?? 0)),
            ((Head_Total_Branch?[8] ?? 0) + (Head_Total_Shajahan?[8] ?? 0) ??
                0 +
                    (Head_Total_Root?[8] ?? 0) +
                    (Head_Total_CCC?[8] ?? 0) +
                    (Head_Total_Other?[8] ?? 0)),
          ])),
      SizedBox(height: 30.0)
    ]);
  }
}
