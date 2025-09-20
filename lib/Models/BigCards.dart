// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, file_names, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, unnecessary_brace_in_string_interps, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:meta_blaster/Charts/dashboard_chart1.dart';

Widget Total_Participation_Status_Bunker(BuildContext context, lastDate, branch,
    shajahan, root, ccc, others, total) {
  return Column(children: [
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
              'https://cdn-icons-png.flaticon.com/512/2737/2737698.png',
              height: 25.0,
              width: 25.0),
          SizedBox(width: 7.5),
          Text('Total Participation Status Report Bunker',
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
              textAlign: TextAlign.start),
          Spacer(),
          Text('Last Update is:',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500)),
          TextButton(
              onPressed: () {},
              child: Text('$lastDate',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500)))
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0),
      child: Divider(
          thickness: 1.0,
          color: Colors.black12,
          indent: BorderSide.strokeAlignCenter),
    ),
    SizedBox(height: 5.0),
    DataTable(dividerThickness: 0.0, columns: <DataColumn>[
      DataColumn(
          label: Text('Participations',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Cash Doc',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Cash Amt',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Val Amt',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Crt Doc',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Crt Amt',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('UPI Doc',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('UPI Amt',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Hot Ch Doc',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Hot Ch Amt',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Balance',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Excess',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Net Amt',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0)))
    ], rows: <DataRow>[
      DataRow(selected: true, cells: [
        DataCell(Text('Branch Pc-4',
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold))),
        DataCell(Text('${branch?[0] ?? 0.0}',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 11.0,
                fontWeight: FontWeight.bold))),
        DataCell(Text('₹${branch?[1] ?? 0.0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${branch?[12] ?? 0.0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${branch?[2] ?? 0.0}',
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${branch?[3] ?? 0.0}',
            style: TextStyle(
                color: Colors.amber.shade800,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${branch?[4] ?? 0.0}',
            style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${branch?[5] ?? 0.0}',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${branch?[6] ?? 0.0}',
            style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${branch?[7] ?? 0.0}',
            style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${branch?[8] ?? 0.0}',
            style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${branch?[9] ?? 0.0}',
            style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${branch?[10] ?? 0.0}',
            style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 13.0)))
      ]),
      DataRow(cells: [
        DataCell(Text('Shajahan',
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold))),
        DataCell(Text('${shajahan?[0] ?? 0.0}',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 11.0,
                fontWeight: FontWeight.bold))),
        DataCell(Text('₹${shajahan?[1] ?? 0.0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${shajahan?[12] ?? 0.0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${shajahan?[2] ?? 0.0}',
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${shajahan?[3] ?? 0.0}',
            style: TextStyle(
                color: Colors.amber.shade800,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${shajahan?[4] ?? 0.0}',
            style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${shajahan?[5] ?? 0.0}',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${shajahan?[6] ?? 0.0}',
            style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${shajahan?[7] ?? 0.0}',
            style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${shajahan?[8] ?? 0.0}',
            style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${shajahan?[9] ?? 0.0}',
            style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${shajahan?[10] ?? 0.0}',
            style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 13.0)))
      ]),
      DataRow(selected: true, cells: [
        DataCell(Text('Root',
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold))),
        DataCell(Text('${root?[0] ?? 0.0}',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 11.0,
                fontWeight: FontWeight.bold))),
        DataCell(Text('${root?[1] ?? 0.0}',
            style: TextStyle(
                color: Colors.red,
                fontSize: 11.0,
                fontWeight: FontWeight.bold))),
        DataCell(Text('₹${root?[12] ?? 0.0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${root?[2] ?? 0.0}',
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${root?[3] ?? 0.0}',
            style: TextStyle(
                color: Colors.amber.shade800,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${root?[4] ?? 0.0}',
            style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${root?[5] ?? 0.0}',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${root?[6] ?? 0.0}',
            style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${root?[7] ?? 0.0}',
            style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${root?[8] ?? 0.0}',
            style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${root?[9] ?? 0.0}',
            style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${root?[10] ?? 0.0}',
            style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 13.0)))
      ]),
      DataRow(cells: [
        DataCell(Text('CCC',
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold))),
        DataCell(Text('${ccc?[0] ?? 0.0}',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 11.0,
                fontWeight: FontWeight.bold))),
        DataCell(Text('₹${ccc?[1] ?? 0.0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${ccc?[12] ?? 0.0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${ccc?[2] ?? 0.0}',
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${ccc?[3] ?? 0.0}',
            style: TextStyle(
                color: Colors.amber.shade800,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${ccc?[4] ?? 0.0}',
            style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${ccc?[5] ?? 0.0}',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${ccc?[6] ?? 0.0}',
            style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${ccc?[7] ?? 0.0}',
            style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${ccc?[8] ?? 0.0}',
            style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${ccc?[9] ?? 0.0}',
            style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${ccc?[10] ?? 0.0}',
            style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 13.0)))
      ]),
      DataRow(selected: true, cells: [
        DataCell(Text('Others',
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold))),
        DataCell(Text('${others?[0] ?? 0.0}',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 11.0,
                fontWeight: FontWeight.bold))),
        DataCell(Text('₹${others?[1] ?? 0.0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${others?[12] ?? 0.0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${others?[2] ?? 0.0}',
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${others?[3] ?? 0.0}',
            style: TextStyle(
                color: Colors.amber.shade800,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${others?[4] ?? 0.0}',
            style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${others?[5] ?? 0.0}',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${others?[6] ?? 0.0}',
            style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${others?[7] ?? 0.0}',
            style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${others?[8] ?? 0.0}',
            style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${others?[9] ?? 0.0}',
            style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${others?[10] ?? 0.0}',
            style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 13.0)))
      ]),
      DataRow(cells: [
        DataCell(Text('Grand Total: ',
            style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold))),
        DataCell(Text('${total?[0] ?? 0.0}',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 13.0,
                fontWeight: FontWeight.bold))),
        DataCell(Text('₹${total?[1] ?? 0.0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('₹${total?[11] ?? 0.0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('${total?[2] ?? 0.0}',
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('₹${total?[3] ?? 0.0}',
            style: TextStyle(
                color: Colors.amber.shade800,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('${total?[4] ?? 0.0}',
            style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('₹${total?[5] ?? 0.0}',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('${total?[6] ?? 0.0}',
            style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('₹${total?[7] ?? 0.0}',
            style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('₹${total?[8] ?? 0.0}',
            style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('₹${total?[9] ?? 0.0}',
            style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('₹${total?[10] ?? 0.0}',
            style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 13.0)))
      ])
    ])
  ]);
}

//--------------------------

Widget Total_Participation_Status_Bunker_002(BuildContext context, lastDate,
    branch, shajahan, root, ccc, others, total) {
  return Column(children: [
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
              'https://cdn-icons-png.flaticon.com/512/2737/2737698.png',
              height: 25.0,
              width: 25.0),
          SizedBox(width: 7.5),
          Text('Total Participation Status Report Bunker',
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
              textAlign: TextAlign.start),
          Spacer(),
          Text('Last Update is:',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500)),
          TextButton(
              onPressed: () {},
              child: Text('$lastDate',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500)))
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0),
      child: Divider(
          thickness: 1.0,
          color: Colors.black12,
          indent: BorderSide.strokeAlignCenter),
    ),
    SizedBox(height: 5.0),
    DataTable(dividerThickness: 0.0, columns: <DataColumn>[
      DataColumn(
          label: Text('Participations',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Cash Doc',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Cash Amt',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Val Amt',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Crt Doc',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Crt Amt',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('UPI Doc',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('UPI Amt',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Hot Ch Doc',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Hot Ch Amt',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Balance',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Excess',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Net Amt',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0)))
    ], rows: <DataRow>[
      DataRow(selected: true, cells: [
        DataCell(Text('Branch Pc-4',
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold))),
        DataCell(Text('${branch?[0] ?? 0.0}',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 11.0,
                fontWeight: FontWeight.bold))),
        DataCell(Text('₹${branch?[1] ?? 0.0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${branch?[11] ?? 0.0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${branch?[2] ?? 0.0}',
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${branch?[3] ?? 0.0}',
            style: TextStyle(
                color: Colors.amber.shade800,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${branch?[4] ?? 0.0}',
            style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${branch?[5] ?? 0.0}',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${branch?[6] ?? 0.0}',
            style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${branch?[7] ?? 0.0}',
            style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${branch?[8] ?? 0.0}',
            style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${branch?[9] ?? 0.0}',
            style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${branch?[10] ?? 0.0}',
            style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 13.0)))
      ]),
      DataRow(cells: [
        DataCell(Text('Shajahan',
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold))),
        DataCell(Text('${shajahan?[0] ?? 0.0}',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 11.0,
                fontWeight: FontWeight.bold))),
        DataCell(Text('₹${shajahan?[1] ?? 0.0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${shajahan?[11] ?? 0.0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${shajahan?[2] ?? 0.0}',
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${shajahan?[3] ?? 0.0}',
            style: TextStyle(
                color: Colors.amber.shade800,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${shajahan?[4] ?? 0.0}',
            style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${shajahan?[5] ?? 0.0}',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${shajahan?[6] ?? 0.0}',
            style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${shajahan?[7] ?? 0.0}',
            style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${shajahan?[8] ?? 0.0}',
            style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${shajahan?[9] ?? 0.0}',
            style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${shajahan?[10] ?? 0.0}',
            style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 13.0)))
      ]),
      DataRow(selected: true, cells: [
        DataCell(Text('Root',
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold))),
        DataCell(Text('${root?[0] ?? 0.0}',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 11.0,
                fontWeight: FontWeight.bold))),
        DataCell(Text('${root?[1] ?? 0.0}',
            style: TextStyle(
                color: Colors.red,
                fontSize: 11.0,
                fontWeight: FontWeight.bold))),
        DataCell(Text('₹${root?[11] ?? 0.0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${root?[2] ?? 0.0}',
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${root?[3] ?? 0.0}',
            style: TextStyle(
                color: Colors.amber.shade800,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${root?[4] ?? 0.0}',
            style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${root?[5] ?? 0.0}',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${root?[6] ?? 0.0}',
            style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${root?[7] ?? 0.0}',
            style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${root?[8] ?? 0.0}',
            style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${root?[9] ?? 0.0}',
            style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${root?[10] ?? 0.0}',
            style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 13.0)))
      ]),
      DataRow(cells: [
        DataCell(Text('CCC',
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold))),
        DataCell(Text('${ccc?[0] ?? 0.0}',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 11.0,
                fontWeight: FontWeight.bold))),
        DataCell(Text('₹${ccc?[1] ?? 0.0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${ccc?[11] ?? 0.0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${ccc?[2] ?? 0.0}',
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${ccc?[3] ?? 0.0}',
            style: TextStyle(
                color: Colors.amber.shade800,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${ccc?[4] ?? 0.0}',
            style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${ccc?[5] ?? 0.0}',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${ccc?[6] ?? 0.0}',
            style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${ccc?[7] ?? 0.0}',
            style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${ccc?[8] ?? 0.0}',
            style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${ccc?[9] ?? 0.0}',
            style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${ccc?[10] ?? 0.0}',
            style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 13.0)))
      ]),
      DataRow(selected: true, cells: [
        DataCell(Text('Others',
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold))),
        DataCell(Text('${others?[0] ?? 0.0}',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 11.0,
                fontWeight: FontWeight.bold))),
        DataCell(Text('₹${others?[1] ?? 0.0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${others?[11] ?? 0.0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${others?[2] ?? 0.0}',
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${others?[3] ?? 0.0}',
            style: TextStyle(
                color: Colors.amber.shade800,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${others?[4] ?? 0.0}',
            style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${others?[5] ?? 0.0}',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${others?[6] ?? 0.0}',
            style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${others?[7] ?? 0.0}',
            style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${others?[8] ?? 0.0}',
            style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${others?[9] ?? 0.0}',
            style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${others?[10] ?? 0.0}',
            style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 13.0)))
      ]),
      DataRow(cells: [
        DataCell(Text('Grand Total: ',
            style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold))),
        DataCell(Text('${total?[0] ?? 0.0}',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 13.0,
                fontWeight: FontWeight.bold))),
        DataCell(Text('₹${total?[1] ?? 0.0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('₹${total?[11] ?? 0.0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('${total?[2] ?? 0.0}',
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('₹${total?[3] ?? 0.0}',
            style: TextStyle(
                color: Colors.amber.shade800,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('${total?[4] ?? 0.0}',
            style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('₹${total?[5] ?? 0.0}',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('${total?[6] ?? 0.0}',
            style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('₹${total?[7] ?? 0.0}',
            style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('₹${total?[8] ?? 0.0}',
            style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('₹${total?[9] ?? 0.0}',
            style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('₹${total?[10] ?? 0.0}',
            style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 13.0)))
      ])
    ])
  ]);
}

//-------------------------

Widget Head_Office_Bunker001(
    BuildContext context, lastDate, doc, amt, bal, exc) {
  return Column(children: [
    SizedBox(height: 15.0),
    Row(children: [
      SizedBox(width: 15.0),
      Text(
        'Total Head Office Status Report Bunker',
        style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
      ),
      Spacer(),
      Text('Last Update is:',
          style: TextStyle(
              color: Colors.black54,
              fontSize: 14.0,
              fontWeight: FontWeight.w500)),
      TextButton(
          onPressed: () {},
          child: Text('$lastDate',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500))),
      SizedBox(width: 15.0)
    ]),
    Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 100.0,
              child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 60.0,
                    width: 60.0,
                    child: Icon(Icons.note_outlined,
                        color: Colors.white, size: 50.0)),
                SizedBox(width: 20.0),
                Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${doc ?? 0.0}',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 22.0),
                          textAlign: TextAlign.start),
                      Text('Total No.Of given Documents',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0),
                          textAlign: TextAlign.start)
                    ])
              ])),
          Container(
              height: 100.0,
              child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 60.0,
                    width: 60.0,
                    child: Icon(Icons.currency_bitcoin,
                        color: Colors.white, size: 50.0)),
                SizedBox(width: 20.0),
                Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('₹${amt ?? 0.0}',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 22.0),
                          textAlign: TextAlign.start),
                      Text('Total Amount of Valid Payment',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0),
                          textAlign: TextAlign.start)
                    ])
              ])),
          Container(
              height: 100.0,
              child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 60.0,
                    width: 60.0,
                    child: Icon(Icons.file_open_outlined,
                        color: Colors.white, size: 50.0)),
                SizedBox(width: 20.0),
                Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('36',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 22.0),
                          textAlign: TextAlign.start),
                      Text('Total No.Of Credit Documents',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0),
                          textAlign: TextAlign.start)
                    ])
              ]))
        ]),
    SizedBox(height: 60.0),
    Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 100.0,
              child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 60.0,
                    width: 60.0,
                    child:
                        Icon(Icons.payment, color: Colors.white, size: 50.0)),
                SizedBox(width: 20.0),
                Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('₹1440.0',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 22.0),
                          textAlign: TextAlign.start),
                      Text('Total Amount of Credit Account',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0),
                          textAlign: TextAlign.start)
                    ])
              ])),
          Container(
              height: 100.0,
              child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 60.0,
                    width: 60.0,
                    child:
                        Icon(Icons.balance, color: Colors.white, size: 50.0)),
                SizedBox(width: 20.0),
                Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('₹${bal ?? 0.0}',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 22.0),
                          textAlign: TextAlign.start),
                      Text('Total Amount of Balance',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0),
                          textAlign: TextAlign.start)
                    ])
              ])),
          Container(
              height: 100.0,
              child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 60.0,
                    width: 60.0,
                    child: Icon(Icons.leaderboard,
                        color: Colors.white, size: 50.0)),
                SizedBox(width: 20.0),
                Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('₹${exc ?? 0.0}',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 22.0),
                          textAlign: TextAlign.start),
                      Text('Total Amount of Excess',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0),
                          textAlign: TextAlign.start)
                    ])
              ]))
        ])
  ]);
}

Widget HeadOff_Dash_Analytics_cards(
    BuildContext context, lastDate, doc, amt, bal, exs, sub, net) {
  return Column(
    children: [
      Container(
          padding: EdgeInsets.only(bottom: 11.0),
          width: MediaQuery.of(context).size.width / 1.02,
          child: Row(
            children: [
              Text('Total Head Office Status Report Bunker Graph Analytics',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.start),
              Spacer(),
              Text('Last Update is:',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500)),
              TextButton(
                  onPressed: () {},
                  child: Text('$lastDate',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500)))
            ],
          )),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 231.0,
                width: 350.0,
                child: dashboard_chart1_parties(doc, amt, bal, exs, sub, net)),
            Container(
                height: 180.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(children: [
                      Container(
                          height: 20.0,
                          width: 20.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.green)),
                      SizedBox(width: 10.0),
                      Text("Total No.Of Cash Documents",
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold)),
                      SizedBox(width: 50.0),
                      Container(
                          height: 20.0,
                          width: 20.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.red)),
                      SizedBox(width: 10.0),
                      Text("Total Amount of Cash Account",
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))
                    ]),
                    Row(children: [
                      Container(
                          height: 20.0,
                          width: 20.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.indigo)),
                      SizedBox(width: 10.0),
                      Text("Total No.Of Credit Documents",
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold)),
                      SizedBox(width: 50.0),
                      Container(
                          height: 20.0,
                          width: 20.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.amber)),
                      SizedBox(width: 10.0),
                      Text("Total Amount of Credit Account",
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))
                    ]),
                    Row(children: [
                      Container(
                          height: 20.0,
                          width: 20.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.grey)),
                      SizedBox(width: 10.0),
                      Text("Total Amount of Balance",
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold)),
                      SizedBox(width: 50.0),
                      Container(
                          height: 20.0,
                          width: 20.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.purple)),
                      SizedBox(width: 10.0),
                      Text("Total Amount of Excess",
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))
                    ]),
                    Row(children: [
                      Container(
                          height: 20.0,
                          width: 20.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.black)),
                      SizedBox(width: 10.0),
                      Text("Head Office Total Cash, Net Amount",
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold)),
                      SizedBox(width: 50.0),
                      Container(
                          height: 20.0,
                          width: 20.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Color.fromARGB(255, 41, 255, 219))),
                      SizedBox(width: 10.0),
                      Text("Total Submitted Amount",
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))
                    ])
                  ],
                )),
            Container(
                height: 231.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 41, 255, 219),
                              borderRadius: BorderRadius.circular(10.0)),
                          height: 60.0,
                          width: 60.0,
                          child: Icon(Icons.work_outline,
                              color: Colors.white, size: 50.0)),
                      SizedBox(width: 20.0),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('₹${sub ?? 0.0}',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22.0),
                                textAlign: TextAlign.start),
                            Text('Head Office Total Submitted Amount',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0),
                                textAlign: TextAlign.start)
                          ])
                    ]),
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10.0)),
                          height: 60.0,
                          width: 60.0,
                          child: Icon(Icons.network_ping_outlined,
                              color: Colors.white, size: 50.0)),
                      SizedBox(width: 20.0),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('₹${net ?? 0.0}',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22.0),
                                textAlign: TextAlign.start),
                            Text('Head Office Total Cash, Net Amount',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0),
                                textAlign: TextAlign.start)
                          ])
                    ]),
                  ],
                ))
          ]),
    ],
  );
}

// First Widget has ended here //

//Second widget starts here//

Widget Head_Total_Status_Bunker_Box(BuildContext context, lastDate, branch,
    shajahan, root, ccc, others, total) {
  return Column(children: [
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
              'https://cdn-icons-png.flaticon.com/512/2737/2737698.png',
              height: 25.0,
              width: 25.0),
          SizedBox(width: 7.5),
          Text('Total Head Office Status Report Bunker',
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
              textAlign: TextAlign.start),
          Spacer(),
          Text('Last Update is:',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500)),
          TextButton(
              onPressed: () {},
              child: Text('$lastDate',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500)))
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0),
      child: Divider(
          thickness: 1.0,
          color: Colors.black12,
          indent: BorderSide.strokeAlignCenter),
    ),
    SizedBox(height: 5.0),
    DataTable(dividerThickness: 0.0, columns: <DataColumn>[
      DataColumn(
          label: Text('Participations',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Document',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Valid Amount',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Paid Amount',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Hot Cash Doc',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Hot Cash Amount',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('UPI Document',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('UPI Amount',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Balance',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Excess',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0))),
      DataColumn(
          label: Text('Net Amount',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0)))
    ], rows: <DataRow>[
      DataRow(selected: true, cells: [
        DataCell(Text('Branch Pc-4',
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold))),
        DataCell(Text('${branch?[0] ?? 0}',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 11.0,
                fontWeight: FontWeight.bold))),
        DataCell(Text('₹${branch?[1] ?? 0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${branch?[2] ?? 0}',
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${branch?[3] ?? 0}',
            style: TextStyle(
                color: Colors.amber.shade800,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${branch?[4] ?? 0}',
            style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${branch?[5] ?? 0}',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${branch?[6] ?? 0}',
            style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${branch?[7] ?? 0}',
            style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${branch?[8] ?? 0}',
            style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${(branch?[2] ?? 0) - (branch?[7] ?? 0)}',
            style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 13.0)))
      ]),
      DataRow(cells: [
        DataCell(Text('Shajahan',
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold))),
        DataCell(Text('${shajahan?[0] ?? 0}',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 11.0,
                fontWeight: FontWeight.bold))),
        DataCell(Text('₹${shajahan?[1] ?? 0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${shajahan?[2] ?? 0}',
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${shajahan?[3] ?? 0}',
            style: TextStyle(
                color: Colors.amber.shade800,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${shajahan?[4] ?? 0}',
            style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${shajahan?[5] ?? 0}',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${shajahan?[6] ?? 0}',
            style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${shajahan?[7] ?? 0}',
            style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${shajahan?[8] ?? 0}',
            style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${(shajahan?[2] ?? 0) - (shajahan?[7] ?? 0)}',
            style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 13.0)))
      ]),
      DataRow(selected: true, cells: [
        DataCell(Text('Root',
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold))),
        DataCell(Text('${root?[0] ?? 0}',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 11.0,
                fontWeight: FontWeight.bold))),
        DataCell(Text('₹${root?[1] ?? 0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${root?[2] ?? 0}',
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${root?[3] ?? 0}',
            style: TextStyle(
                color: Colors.amber.shade800,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${root?[4] ?? 0}',
            style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${root?[5] ?? 0}',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${root?[6] ?? 0}',
            style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${root?[7] ?? 0}',
            style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${root?[8] ?? 0}',
            style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${(root?[2] ?? 0) - (root?[7] ?? 0)}',
            style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 13.0)))
      ]),
      DataRow(cells: [
        DataCell(Text('CCC',
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold))),
        DataCell(Text('${ccc?[0] ?? 0}',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 11.0,
                fontWeight: FontWeight.bold))),
        DataCell(Text('₹${ccc?[1] ?? 0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${ccc?[2] ?? 0}',
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${ccc?[3] ?? 0}',
            style: TextStyle(
                color: Colors.amber.shade800,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${ccc?[4] ?? 0}',
            style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${ccc?[5] ?? 0}',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${ccc?[6] ?? 0}',
            style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${ccc?[7] ?? 0}',
            style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${ccc?[8] ?? 0}',
            style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${(ccc?[2] ?? 0) - (ccc?[7] ?? 0)}',
            style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 13.0)))
      ]),
      DataRow(selected: true, cells: [
        DataCell(Text('Others',
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold))),
        DataCell(Text('${others?[0] ?? 0}',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 11.0,
                fontWeight: FontWeight.bold))),
        DataCell(Text('₹${others?[1] ?? 0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${others?[2] ?? 0}',
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${others?[3] ?? 0}',
            style: TextStyle(
                color: Colors.amber.shade800,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${others?[4] ?? 0}',
            style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('${others?[5] ?? 0}',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${others?[6] ?? 0}',
            style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${others?[7] ?? 0}',
            style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${others?[8] ?? 0}',
            style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 11.0))),
        DataCell(Text('₹${(others?[2] ?? 0) - (others?[7] ?? 0)}',
            style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 13.0)))
      ]),
      DataRow(cells: [
        DataCell(Text('Grand Total: ',
            style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold))),
        DataCell(Text('${total?[0] ?? 0}',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 13.0,
                fontWeight: FontWeight.bold))),
        DataCell(Text('₹${total?[1] ?? 0}',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('₹${total?[2] ?? 0}',
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('${total?[3] ?? 0}',
            style: TextStyle(
                color: Colors.amber.shade800,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('₹${total?[4] ?? 0}',
            style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('${total?[5] ?? 0}',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('₹${total?[6] ?? 0}',
            style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('₹${total?[7] ?? 0}',
            style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('₹${total?[8] ?? 0}',
            style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 13.0))),
        DataCell(Text('₹${(total?[2] ?? 0) - (total?[7] ?? 0)}',
            style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 13.0)))
      ])
    ])
  ]);
}


    // end //
