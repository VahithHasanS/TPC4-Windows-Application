// ignore_for_file: non_constant_identifier_names, unnecessary_import, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, unused_import, sort_child_properties_last, unnecessary_new, unused_element, unused_local_variable

import 'dart:math';
import 'dart:ui';

import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/d_chart.dart';
import 'package:d_chart/ordinal/bar.dart';
import 'package:easy_pie_chart/easy_pie_chart.dart' as easy_pie;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mrx_charts/mrx_charts.dart';

Widget dashboard_chart1_parties(doc, amt, bal, exs, sub, net) {
  List dataVar = [
    doc ?? 0.0,
    amt ?? 0.0,
    doc ?? 0.0,
    amt ?? 0.0,
    bal ?? 0.0,
    exs ?? 0.0,
    sub ?? 0.0,
    net ?? 0.0
  ];
  List dataColor = [
    Colors.green,
    Colors.red,
    Colors.indigo,
    Colors.amber,
    Colors.grey,
    Colors.purple,
    Color.fromARGB(255, 41, 255, 219),
    Colors.black
  ];
  //Color(0xFF8043F9)
  dynamic amtFree;
  if (amt == null || amt == Null || amt == '' || amt == 0 || amt == 0.0) {
    amtFree = 8.0;
  } else {
    amtFree = (amt ?? 0.0).toDouble();
  }
  return Chart(
    padding: EdgeInsets.all(8),
    layers: [
      ChartAxisLayer(
        settings: ChartAxisSettings(
          x: ChartAxisSettingsAxis(
            frequency: 1.0,
            max: 8.0,
            min: 1.0,
            textStyle: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 10.0,
                fontWeight: FontWeight.bold),
          ),
          y: ChartAxisSettingsAxis(
            frequency: amtFree / 8.0,
            max: amt ?? 0.0,
            min: 0.0,
            textStyle: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 10.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        labelX: (value) => value.toInt().toString(),
        labelY: (value) => value.toInt().toString(),
      ),
      ChartBarLayer(
        items: List.generate(
          8,
          (index) => ChartBarDataItem(
            color: dataColor[index],
            value: dataVar[index],
            x: index.toDouble() + 1,
          ),
        ),
        settings: const ChartBarSettings(
          thickness: 15.0,
          radius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    ],
  );
}

Widget legand_Donat_DashBoart_Chart(
    BuildContext context, branch, shajahan, root, ccc, other) {
  return easy_pie.EasyPieChart(
      borderWidth: 20.0,
      gap: 30.0,
      child: Center(
          child: Text('Participations Amount Analytics',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                  fontSize: 15.0),
              textAlign: TextAlign.center)),
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.black),
      children: [
        easy_pie.PieData(
            value: (branch ?? 0.0).toDouble(), color: Colors.blueAccent),
        easy_pie.PieData(
            value: (shajahan ?? 0.0).toDouble(), color: Colors.redAccent),
        easy_pie.PieData(
            value: (root ?? 0.0).toDouble(), color: Colors.greenAccent),
        easy_pie.PieData(
            value: (ccc ?? 0.0).toDouble(), color: Colors.amberAccent),
        easy_pie.PieData(
            value: (other ?? 0.0).toDouble(), color: Colors.purpleAccent)
      ]);
}

Widget legand_Donat_DashBoart_Chart_2_bal_Exs(
    BuildContext context, balance, excess) {
  return easy_pie.EasyPieChart(
      borderWidth: 25.0,
      gap: 15.0,
      centerText: 'Balance Excess Analytics',
      centerStyle: TextStyle(
          fontWeight: FontWeight.w600, color: Colors.black54, fontSize: 15.0),
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.black),
      children: [
        easy_pie.PieData(
            value: (excess ?? 0.0).toDouble(), color: Colors.indigo),
        easy_pie.PieData(value: (balance ?? 0.0).toDouble(), color: Colors.red)
      ]);
}

Widget legand_Donat_DashBoart_Chart_3_UPI_etc__(
    BuildContext context, hot_cash, UPI, bank, cheque) {
  return easy_pie.EasyPieChart(
      borderWidth: 20.0,
      gap: 30.0,
      centerText: 'Amt Transfer Analytics',
      centerStyle: TextStyle(
          fontWeight: FontWeight.w600, color: Colors.black54, fontSize: 15.0),
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.black),
      children: [
        easy_pie.PieData(
            value: (cheque ?? 0.0).toDouble(), color: Colors.indigo),
        easy_pie.PieData(
            value: (UPI ?? 0.0).toDouble(), color: Colors.redAccent),
        easy_pie.PieData(
            value: (hot_cash ?? 0.0).toDouble(), color: Colors.greenAccent),
        easy_pie.PieData(
            value: (bank ?? 0.0).toDouble(), color: Colors.amberAccent)
      ]);
}

Container BarChartHeadOffice(
    BuildContext context,
    brChAmt,
    brCtAmt,
    brChDoc,
    brCtDoc,
    shChAmt,
    shCtAmt,
    shChDoc,
    shCtDoc,
    rtChAmt,
    rtCtAmt,
    rtChDoc,
    rtCtDoc,
    cccChAmt,
    cccCtAmt,
    cccChDoc,
    cccCtDoc,
    otChAmt,
    otCtAmt,
    otChDoc,
    otCtDoc) {
  return Container(
    //width: 200.0,
    //height: 250.0,
    child: BarChart(
      BarChartData(
        borderData: FlBorderData(
            border: Border(
                top: BorderSide.none,
                right: BorderSide.none,
                left: BorderSide(width: 1, color: Colors.black26),
                bottom: BorderSide(width: 1, color: Colors.black26))),
        groupsSpace: 10,
        barGroups: [
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                width: 10.0,
                toY: (brChAmt ?? 0.0).toDouble(),
                color: Colors.blueAccent,
              ),
              BarChartRodData(
                width: 10.0,
                toY: (brCtAmt ?? 0.0).toDouble(),
                color: Colors.redAccent,
              ),
              BarChartRodData(
                width: 10.0,
                toY: (brChDoc ?? 0.0).toDouble(),
                color: Colors.greenAccent,
              ),
              BarChartRodData(
                width: 10.0,
                toY: (brCtDoc ?? 0.0).toDouble(),
                color: Colors.amberAccent,
              )
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                width: 10.0,
                toY: (shChAmt ?? 0.0).toDouble(),
                color: Colors.blueAccent,
              ),
              BarChartRodData(
                width: 10.0,
                toY: (shCtAmt ?? 0.0).toDouble(),
                color: Colors.redAccent,
              ),
              BarChartRodData(
                width: 10.0,
                toY: (shChDoc ?? 0.0).toDouble(),
                color: Colors.greenAccent,
              ),
              BarChartRodData(
                width: 10.0,
                toY: (shCtDoc ?? 0.0).toDouble(),
                color: Colors.amberAccent,
              )
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(
                width: 10.0,
                toY: (rtChAmt ?? 0.0).toDouble(),
                color: Colors.blueAccent,
              ),
              BarChartRodData(
                width: 10.0,
                toY: (rtCtAmt ?? 0.0).toDouble(),
                color: Colors.redAccent,
              ),
              BarChartRodData(
                width: 10.0,
                toY: (rtChDoc ?? 0.0).toDouble(),
                color: Colors.greenAccent,
              ),
              BarChartRodData(
                width: 10.0,
                toY: (rtCtDoc ?? 0.0).toDouble(),
                color: Colors.amberAccent,
              )
            ],
          ),
          BarChartGroupData(
            x: 4,
            barRods: [
              BarChartRodData(
                width: 10.0,
                toY: (cccChAmt ?? 0.0).toDouble(),
                color: Colors.blueAccent,
              ),
              BarChartRodData(
                width: 10.0,
                toY: (cccCtAmt ?? 0.0).toDouble(),
                color: Colors.redAccent,
              ),
              BarChartRodData(
                width: 10.0,
                toY: (cccChDoc ?? 0.0).toDouble(),
                color: Colors.greenAccent,
              ),
              BarChartRodData(
                width: 10.0,
                toY: (cccCtDoc ?? 0.0).toDouble(),
                color: Colors.amberAccent,
              )
            ],
          ),
          BarChartGroupData(
            //groupVertically: true,
            x: 5,
            barRods: [
              BarChartRodData(
                width: 10.0,
                toY: (otChAmt ?? 0.0).toDouble(),
                color: Colors.blueAccent,
              ),
              BarChartRodData(
                width: 10.0,
                toY: (otCtAmt ?? 0.0).toDouble(),
                color: Colors.redAccent,
              ),
              BarChartRodData(
                width: 10.0,
                toY: (otChDoc ?? 0.0).toDouble(),
                color: Colors.greenAccent,
              ),
              BarChartRodData(
                width: 10.0,
                toY: (otCtDoc ?? 0.0).toDouble(),
                color: Colors.amberAccent,
              )
            ],
          )
        ],
      ),
    ),
  );
}

Widget GraphForGraphLine2(
    BuildContext context,
    brChAmt,
    brCtAmt,
    brChDoc,
    brCtDoc,
    shChAmt,
    shCtAmt,
    shChDoc,
    shCtDoc,
    rtChAmt,
    rtCtAmt,
    rtChDoc,
    rtCtDoc,
    cccChAmt,
    cccCtAmt,
    cccChDoc,
    cccCtDoc,
    otChAmt,
    otCtAmt,
    otChDoc,
    otCtDoc) {
  return LineChart(
    LineChartData(
      borderData: FlBorderData(show: false),
      lineBarsData: [
        // The red line
        LineChartBarData(
          spots: [
            FlSpot(1.0, (brChAmt ?? 0.0).toDouble()),
            FlSpot(2.0, (shChAmt ?? 0.0).toDouble()),
            FlSpot(3.0, (rtChAmt ?? 0.0).toDouble()),
            FlSpot(4.0, (cccChAmt ?? 0.0).toDouble()),
            FlSpot(5.0, (otChAmt ?? 0.0).toDouble())
          ],
          isCurved: true,
          barWidth: 3,
          color: Colors.blueAccent,
        ),
        // The orange line
        LineChartBarData(
          spots: [
            FlSpot(1.0, (brCtDoc ?? 0.0).toDouble()),
            FlSpot(2.0, (shCtDoc ?? 0.0).toDouble()),
            FlSpot(3.0, (rtCtAmt ?? 0.0).toDouble()),
            FlSpot(4.0, (cccCtDoc ?? 0.0).toDouble()),
            FlSpot(5.0, (otCtDoc ?? 0.0).toDouble())
          ],
          isCurved: true,
          barWidth: 3,
          color: Colors.redAccent,
        ),

        LineChartBarData(
          spots: [
            FlSpot(1.0, (brChDoc ?? 0.0).toDouble()),
            FlSpot(2.0, (shChDoc ?? 0.0).toDouble()),
            FlSpot(3.0, (rtChDoc ?? 0.0).toDouble()),
            FlSpot(4.0, (cccChDoc ?? 0.0).toDouble()),
            FlSpot(5.0, (otChDoc ?? 0.0).toDouble())
          ],
          isCurved: true,
          barWidth: 3,
          color: Colors.greenAccent,
        ),

        LineChartBarData(
          spots: [
            FlSpot(1.0, (brCtAmt ?? 0.0).toDouble()),
            FlSpot(2.0, (shCtAmt ?? 0.0).toDouble()),
            FlSpot(3.0, (rtCtDoc ?? 0.0).toDouble()),
            FlSpot(4.0, (cccCtAmt ?? 0.0).toDouble()),
            FlSpot(5.0, (otCtAmt ?? 0.0).toDouble())
          ],
          isCurved: true,
          barWidth: 3,
          color: Colors.amberAccent,
        )
      ],
    ),
  );
}

Widget D_chart_Head_Office(BuildContext context) {
  return ListView(padding: EdgeInsets.all(16), children: [
    AspectRatio(
        aspectRatio: 2.9,
        child: DChartBarO(
            //animate: true,
            //flipVertical: true,
            //vertical: false,
            groupList: [
              OrdinalGroup(chartType: ChartType.scatterPlot, id: '1', data: [
                OrdinalData(domain: 'Mon', measure: 2),
                OrdinalData(domain: 'Tue', measure: 6),
                OrdinalData(domain: 'Wed', measure: 3),
                OrdinalData(domain: 'Thu', measure: 7)
              ])
            ]))
  ]);
}
