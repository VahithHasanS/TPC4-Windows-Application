// ignore_for_file: camel_case_types, file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, constant_identifier_names, unnecessary_string_interpolations, avoid_types_as_parameter_names, unused_local_variable, sized_box_for_whitespace, must_call_super, unused_field

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta_blaster/Charts/dashboard_chart1.dart';
import 'package:meta_blaster/Models/smallWidgets.dart';
import 'package:meta_blaster/mongoDB/DB_Supporter6.dart';
import 'package:meta_blaster/mongoDB/expenseDB1.dart';

class More_Status_Tab extends StatefulWidget {
  final UName, UEmail, UniqueCode;
  const More_Status_Tab(
      {super.key,
      required this.UName,
      required this.UEmail,
      required this.UniqueCode});

  @override
  State<More_Status_Tab> createState() => _More_Status_TabState();
}

class _More_Status_TabState extends State<More_Status_Tab> {
  TextEditingController dateinputFrom = TextEditingController();
  TextEditingController dateinputTO = TextEditingController();
  TextEditingController CustomerNameController = TextEditingController();

  static const List<String> Filter_Val_2 = <String>[
    'All',
    'Branch Pc-4',
    'Shajahan',
    'Ayiesha',
    'Head Office',
    'Other Branch',
    'Office Booking Amount',
    'Line Booking Amount',
    'Vahith Hasan',
    'Vajith Husan',
    'Third Party',
    'Other',
    'None of Above'
  ];

  static const List<String> Filter_Balance = <String>['Balance', 'Excess'];

  String FilterValue_2 = Filter_Val_2.first;
  String FilterBalance = Filter_Balance.first;

  var FromDate, ToDate;
  dynamic Book = 'All';
  dynamic expenseCardValues, fromDate_Format, toDate_Format;

  @override
  void initState() {
    ExpenseDB_1.ExpenseCards(widget.UniqueCode, null, null, 'All')
        .then((value) {
      setState(() {
        expenseCardValues = value;
      });
    });

    Db_Supporter_6.FromToDate_Formated_Exp(widget.UniqueCode).then((value) {
      setState(() {
        fromDate_Format = value[0];
        toDate_Format = value[1];
      });
    });
  }

  void initState_sub() {
    ExpenseDB_1.ExpenseCards(widget.UniqueCode, FromDate, ToDate, Book)
        .then((value) {
      setState(() {
        expenseCardValues = value;
      });
    });

    Db_Supporter_6.FromToDate_Formated_Exp(widget.UniqueCode).then((value) {
      setState(() {
        fromDate_Format = value[0];
        toDate_Format = value[1];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
            margin: EdgeInsets.only(
                top: 20.0, bottom: 20.0, left: 20.0, right: 0.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    opacity: 0.75,
                    filterQuality: FilterQuality.high,
                    image: NetworkImage(
                        'https://www.netsuite.com/portal/assets/img/business-articles/financial-management/bnr-expense-management-travel.jpg'),
                    fit: BoxFit.cover),
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
                color: Colors.black),
            width: MediaQuery.of(context).size.width / 3.4,
            height: 110.0,
            padding: EdgeInsets.all(15.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      'Manage your expense with us and improve it\nBe aware on your expensess',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0)),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      onPressed: () {},
                      color: Colors.white,
                      child: Text('Show More',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0))),
                ],
              )
            ])),
        Container(
            margin: EdgeInsets.only(
                top: 20.0, left: 10.0, right: 20.0, bottom: 20.0),
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
            width: MediaQuery.of(context).size.width / 1.5,
            height: 110.0,
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
                Row(children: [
                  Text('Get From: ',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w500)),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13.0),
                      child: SizedBox(
                          //width: 50,
                          child: DropdownButton<String>(
                              value: FilterValue_2,
                              icon: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
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
                MaterialButton(
                    onPressed: () {
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

                      initState_sub();
                    },
                    color: Colors.green,
                    padding:
                        EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0),
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 20.0,
                    )),
                MaterialButton(
                    onPressed: () async {
                      dateinputFrom.clear();
                      dateinputTO.clear();
                      CustomerNameController.clear();
                      FromDate = null;
                      ToDate = null;
                      Book = 'All';
                      setState(() {
                        FilterValue_2 = Filter_Val_2.first;
                        initState();
                      });
                    },
                    color: Colors.red,
                    padding:
                        EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0),
                    child:
                        Icon(Icons.backspace, color: Colors.white, size: 20.0))
              ])
            ]))
      ]),
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
                          FilterValue_2;
                          //initState();
                        });
                      },
                      child: Text(
                          '${FromDate == null ? fromDate_Format : dateinputFrom.text}   /   ${ToDate == null ? toDate_Format : dateinputTO.text}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)))))),
      Text('You have get expense from $FilterValue_2',
          style: TextStyle(
              color: Colors.black45,
              fontSize: 16.0,
              fontWeight: FontWeight.w500)),
      Container(
          width: double.infinity,
          margin: EdgeInsets.all(20.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GridOutletCards(
                context,
                'Get Amount',
                '₹${expenseCardValues?[0] ?? 0.0}',
                Icons.payment,
                Colors.amber),
            GridOutletCards(context, 'Expensed Amount',
                '₹${expenseCardValues?[1] ?? 0.0}', Icons.forward, Colors.blue),
            GridOutletCards(context, 'Balance Amount',
                '₹${expenseCardValues?[2] ?? 0.0}', Icons.balance, Colors.red),
            GridOutletCards(
                context,
                'Excess Amount',
                '₹${expenseCardValues?[3] ?? 0.0}',
                Icons.insights,
                Colors.grey),
            GridOutletCards(
                context,
                'Net Amount',
                '₹${expenseCardValues?[4] ?? 0.0}',
                Icons.line_axis,
                Colors.green)
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
                      setState(() {});
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
                            future: ExpenseDB_1.Expense_Total_Tabel(
                                widget.UniqueCode, FromDate, ToDate, Book),
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
                                        label: Text('Expense Date',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0)),
                                      ),
                                      DataColumn(
                                        label: Text('Expense By',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0)),
                                      ),
                                      DataColumn(
                                        label: Text('Get Amount',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0)),
                                      ),
                                      DataColumn(
                                        label: Text('Expense Amount',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0)),
                                      ),
                                      DataColumn(
                                        label: Text('Balance Amount',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0)),
                                      ),
                                      DataColumn(
                                        label: Text('Excess Amount',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0)),
                                      ),
                                      DataColumn(
                                        label: Text('Get From Where',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0)),
                                      ),
                                      DataColumn(
                                        label: Text('For Use',
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
                                                          color:
                                                              Colors.black54))),
                                                  DataCell(Text(
                                                      '${DateFormat('yyyy-MM-dd').format(DateTime.parse(item.Expense_Date.add(Duration(days: 1)).toString()))}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Colors.black54))),
                                                  DataCell(Text(item.Expense_By,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Colors.black54))),
                                                  DataCell(Text(
                                                      "${item.Get_Amount}",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Colors.black54))),
                                                  DataCell(Text(
                                                      "${item.Expensed_Amount}",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Colors.black54))),
                                                  DataCell(Text(
                                                      "${item.Balance_Amount}",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Colors.black54))),
                                                  DataCell(Text(
                                                      "${item.Excess_Amount}",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Colors.black54))),
                                                  DataCell(
                                                      placeholder: true,
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    10.0,
                                                                vertical: 2.0),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                            color: item.Get_From ==
                                                                    'None of Above'
                                                                ? Colors.red
                                                                : Colors
                                                                    .orange),
                                                        child: Text(
                                                            item.Get_From,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .white)),
                                                      )),
                                                  DataCell(Text(
                                                      "${item.For_Use}",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Colors.black54))),
                                                  DataCell(Text(item.Remark,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Colors.black54))),
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
                                                                              Radius.circular(12.0))),
                                                                  child: Container(
                                                                      height: 230.0,
                                                                      width: 300.0,
                                                                      padding: EdgeInsets.all(15.0),
                                                                      decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child: Column(children: [
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
                                                                            'Do you want to delete ${item.Expense_By}. Are you sure. If you sure, Click yes or you do not want to delete, Click no or click outer the dialog box to close.',
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
                                                                                      ExpenseDB_1.Delete_Expense(item.mainID);
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
                                                      icon:
                                                          Icon(Icons.delete))),
                                                  DataCell(IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(Icons.edit)))
                                                ]))
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
                legand_Donat_DashBoart_Chart_2_bal_Exs(context,
                    expenseCardValues?[2] ?? 0, expenseCardValues?[3] ?? 0),
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
                        onPressed: () {},
                        child: Text(
                            '${FromDate == null ? fromDate_Format : dateinputFrom.text}   /   ${ToDate == null ? toDate_Format : dateinputTO.text}',
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
                          value: FilterBalance,
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
                              FilterBalance = value!;
                              //initState();
                            });
                          },
                          items: Filter_Balance.map<DropdownMenuItem<String>>(
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
                          future: ExpenseDB_1.Expense_Total_Balance_Tabel(
                              widget.UniqueCode,
                              FromDate,
                              ToDate,
                              Book,
                              FilterBalance),
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
                                      label: Text('Expense Date',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0)),
                                    ),
                                    DataColumn(
                                      label: Text('Expense By',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0)),
                                    ),
                                    DataColumn(
                                      label: Text('Get Amount',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0)),
                                    ),
                                    DataColumn(
                                      label: Text('Expense Amount',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0)),
                                    ),
                                    DataColumn(
                                      label: Text('Balance Amount',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0)),
                                    ),
                                    DataColumn(
                                      label: Text('Excess Amount',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0)),
                                    ),
                                    DataColumn(
                                      label: Text('Get From Where',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0)),
                                    ),
                                    DataColumn(
                                      label: Text('For Use',
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
                                                        color:
                                                            Colors.black54))),
                                                DataCell(Text(
                                                    '${DateFormat('yyyy-MM-dd').format(DateTime.parse(item.Expense_Date.add(Duration(days: 1)).toString()))}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Colors.black54))),
                                                DataCell(Text(item.Expense_By,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Colors.black54))),
                                                DataCell(Text(
                                                    "${item.Get_Amount}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Colors.black54))),
                                                DataCell(Text(
                                                    "${item.Expensed_Amount}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Colors.black54))),
                                                DataCell(Text(
                                                    "${item.Balance_Amount}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Colors.black54))),
                                                DataCell(Text(
                                                    "${item.Excess_Amount}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Colors.black54))),
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
                                                                  .circular(
                                                                      4.0),
                                                          color: item.Get_From ==
                                                                  'None of Above'
                                                              ? Colors.red
                                                              : Colors.orange),
                                                      child: Text(item.Get_From,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .white)),
                                                    )),
                                                DataCell(Text("${item.For_Use}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Colors.black54))),
                                                DataCell(Text(item.Remark,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Colors.black54))),
                                                DataCell(IconButton(
                                                    onPressed: () {
                                                      showDialog(
                                                          context: context,
                                                          builder:
                                                              (BuildContext) {
                                                            return Dialog(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(Radius.circular(
                                                                            12.0))),
                                                                child:
                                                                    Container(
                                                                        height:
                                                                            230.0,
                                                                        width:
                                                                            300.0,
                                                                        padding:
                                                                            EdgeInsets.all(
                                                                                15.0),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                        ),
                                                                        child: Column(
                                                                            children: [
                                                                              Text('Confirmation', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500, fontSize: 18.0)),
                                                                              SizedBox(height: 16.0),
                                                                              Text('Do you want to delete ${item.Expense_By}. Are you sure. If you sure, Click yes or you do not want to delete, Click no or click outer the dialog box to close.', style: TextStyle(color: Colors.grey), textAlign: TextAlign.justify),
                                                                              SizedBox(height: 20.0),
                                                                              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                                                                                MaterialButton(
                                                                                    onPressed: () {
                                                                                      setState(() {
                                                                                        ExpenseDB_1.Delete_Expense(item.mainID);
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
                                                    onPressed: () {},
                                                    icon: Icon(Icons.edit)))
                                              ]))
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
    ]);
  }
}
