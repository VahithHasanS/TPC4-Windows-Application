// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, file_names, depend_on_referenced_packages, unnecessary_string_interpolations, avoid_types_as_parameter_names, unused_local_variable, unused_import
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:meta_blaster/Models/dialogs1.dart';
import 'package:meta_blaster/Models/dialogs2.dart';
import 'package:meta_blaster/mongoDB/dataTable_Fetch.dart';

Widget Balance_and_Excess_table_dash(
    BuildContext context, userCode, futureBuilderFunction) {
  return Container(
    //width: double.infinity,
    width: MediaQuery.of(context).size.width / 1.045,
    //margin: EdgeInsets.all(15.0),
    height: 300.0,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0))),
    child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: FutureBuilder<List<dynamic>>(
            future: futureBuilderFunction,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                //
                return Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width / 1.15,
                        height: 250.0,
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 15.0),
                            Text(
                              'Loading...',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20.0),
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
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width / 1.15,
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
                              DataCell(Text("${item.Balance_Amount}",
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
                                        horizontal: 10.0, vertical: 2.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        color: item.Is_Paid == 'Paid'
                                            ? Colors.green
                                            : Colors.red),
                                    child: Text(item.Is_Paid,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
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
                                          return delete_Dialog_For_Customer(
                                              context,
                                              item.Customer_Name,
                                              item.mainID,
                                              userCode,
                                              ['', '', '']);
                                        });
                                  },
                                  icon: Icon(Icons.delete))),
                              DataCell(IconButton(
                                  onPressed: () {}, icon: Icon(Icons.edit)))
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
                                        item.Is_Paid, item.Remarks);
                                  });
                            },
                          ),
                        )
                        .toList());
              }
            }),
      ),
    ),
  );
}
