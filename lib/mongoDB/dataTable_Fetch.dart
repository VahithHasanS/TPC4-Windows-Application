// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, unused_import, file_names, unused_local_variable, prefer_interpolation_to_compose_strings, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:meta_blaster/Models/module/constModules.dart';
import 'package:meta_blaster/mongoDB/DB_Supporter1.dart';
import 'package:meta_blaster/mongoDB/DB_Supporter3.dart';
import 'package:meta_blaster/mongoDB/connect_&_constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Data_Table_Fetch_Model_1 {
  static Future<List<dynamic>> Dash_FillterType_Bal_or_Exs(code) async {
    try {
      //print('There is second unique code: ' + code.toString());

      dynamic dateCode = await Db_Supporter_1.findLastUpdateLive4455(code);

      //'Booking_Date': dateCode  User_Code

      var data = await ConnectConstant.db.collection('data').find({
        '\$and': [
          {'User_Code': code},
          {
            'Booking_Date': {'\$gte': dateCode}
          }
        ]
      }).toList();

      //print('Finised');

      //print(data);
      var dataList = data
          .map((item) => MyDataSolidParty(
              item['Customer_Name'].toString(),
              item['Booking_Date'],
              item['Document'].toInt(),
              item['Valid_Amount'].toDouble(),
              item['Paid_Amount'].toDouble(),
              item['Account_Type'].toString(),
              item['Payment_Type'].toString(),
              item['Balance_Amount'].toDouble(),
              item['Excess_Amount'].toDouble(),
              item['Booked_By'].toString(),
              item['Is_Paid'].toString(),
              item['Remarks'].toString(),
              item['_id']))
          .toList();

      return dataList;
    } catch (e) {
      print(e.toString());
      final v1 = [];
      return v1
          .map((item) => MyDataSolidParty(
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item['']))
          .toList();
    }
  }

  static Future<List<dynamic>> Dash_FillterType_Real_Balance_And_Excess_Fetch(
      fieldtName, code) async {
    try {
      //print('There is second unique code: ' + code.toString());
      if (fieldtName == 'Balance') {
        fieldtName = 'Balance_Amount';
      } else {
        fieldtName = 'Excess_Amount';
      }
      dynamic dateCode = await Db_Supporter_1.findLastUpdateLive4455(code);
      var data = await ConnectConstant.db.collection('data').find({
        '\$and': [
          {'User_Code': code},
          {
            fieldtName: {'\$gt': 0}
          },
          {'Booking_Date': dateCode}
        ]
      }).toList();
      //print(data);
      var dataList = data
          .map((item) => MyDataSolidParty(
              item['Customer_Name'].toString(),
              item['Booking_Date'],
              item['Document'].toInt(),
              item['Valid_Amount'].toDouble(),
              item['Paid_Amount'].toDouble(),
              item['Account_Type'].toString(),
              item['Payment_Type'].toString(),
              item['Balance_Amount'].toDouble(),
              item['Excess_Amount'].toDouble(),
              item['Booked_By'].toString(),
              item['Is_Paid'].toString(),
              item['Remarks'].toString(),
              item['_id']))
          .toList();

      return dataList;
    } catch (e) {
      print('Exception: ' + e.toString());
      final v1 = [];
      return v1
          .map((item) => MyDataSolidParty(
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item['']))
          .toList();
    }
  }

  static Future<List<dynamic>> Dash_FillterType_Real_UPI_And_Others_Fetch(
      fieldtName, code) async {
    try {
      print('There is second unique code: ' + code.toString());
      dynamic dateCode = await Db_Supporter_1.findLastUpdateLive4455(code);
      var data = await ConnectConstant.db.collection('data').find({
        '\$and': [
          {'User_Code': code},
          {'Payment_Type': fieldtName},
          {'Booking_Date': dateCode}
        ]
      }).toList();
      //print(data);
      var dataList = data
          .map((item) => MyDataSolidParty(
              item['Customer_Name'].toString(),
              item['Booking_Date'],
              item['Document'].toInt(),
              item['Valid_Amount'].toDouble(),
              item['Paid_Amount'].toDouble(),
              item['Account_Type'].toString(),
              item['Payment_Type'].toString(),
              item['Balance_Amount'].toDouble(),
              item['Excess_Amount'].toDouble(),
              item['Booked_By'].toString(),
              item['Is_Paid'].toString(),
              item['Remarks'].toString(),
              item['_id']))
          .toList();

      return dataList;
    } catch (e) {
      print('Exception: ' + e.toString());
      final v1 = [];
      return v1
          .map((item) => MyDataSolidParty(
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item['']))
          .toList();
    }
  }

  static Future<List<dynamic>> GridView_FillterType_Bal_or_Exs(
      code, bookedBy) async {
    try {
      //print('There is second unique code: ' + code.toString());

      dynamic dateCode =
          await Db_Supporter_3.findLastUpdateLive_IndiPartyies(code, bookedBy);

      //'Booking_Date': dateCode  User_Code

      var data = await ConnectConstant.db.collection('data').find({
        '\$and': [
          {'User_Code': code},
          {'Booked_By': bookedBy},
          {
            'Booking_Date': {'\$gte': dateCode}
          }
        ]
      }).toList();

      //print('Finised');

      //print(data);
      var dataList = data
          .map((item) => MyDataSolidParty(
              item['Customer_Name'].toString(),
              item['Booking_Date'],
              item['Document'].toInt(),
              item['Valid_Amount'].toDouble(),
              item['Paid_Amount'].toDouble(),
              item['Account_Type'].toString(),
              item['Payment_Type'].toString(),
              item['Balance_Amount'].toDouble(),
              item['Excess_Amount'].toDouble(),
              item['Booked_By'].toString(),
              item['Is_Paid'].toString(),
              item['Remarks'].toString(),
              item['_id']))
          .toList();

      return dataList;
    } catch (e) {
      print(e.toString());
      final v1 = [];
      return v1
          .map((item) => MyDataSolidParty(
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item['']))
          .toList();
    }
  }

  static Future<List<dynamic>>
      GridView_FillterType_Real_Balance_And_Excess_Fetch(
          fieldtName, code, bookedBy) async {
    try {
      //print('There is second unique code: ' + code.toString());
      if (fieldtName == 'Balance') {
        fieldtName = 'Balance_Amount';
      } else {
        fieldtName = 'Excess_Amount';
      }
      dynamic dateCode =
          await Db_Supporter_3.findLastUpdateLive_IndiPartyies(code, bookedBy);
      var data = await ConnectConstant.db.collection('data').find({
        '\$and': [
          {'User_Code': code},
          {'Booked_By': bookedBy},
          {
            fieldtName: {'\$gt': 0}
          },
          {'Booking_Date': dateCode}
        ]
      }).toList();
      //print(data);
      var dataList = data
          .map((item) => MyDataSolidParty(
              item['Customer_Name'].toString(),
              item['Booking_Date'],
              item['Document'].toInt(),
              item['Valid_Amount'].toDouble(),
              item['Paid_Amount'].toDouble(),
              item['Account_Type'].toString(),
              item['Payment_Type'].toString(),
              item['Balance_Amount'].toDouble(),
              item['Excess_Amount'].toDouble(),
              item['Booked_By'].toString(),
              item['Is_Paid'].toString(),
              item['Remarks'].toString(),
              item['_id']))
          .toList();

      return dataList;
    } catch (e) {
      print('Exception: ' + e.toString());
      final v1 = [];
      return v1
          .map((item) => MyDataSolidParty(
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item['']))
          .toList();
    }
  }

  static Future<List<dynamic>> GridView_FillterType_Real_UPI_And_Others_Fetch(
      fieldtName, code, bookedBy) async {
    try {
      print('There is second unique code: ' + code.toString());
      dynamic dateCode =
          await Db_Supporter_3.findLastUpdateLive_IndiPartyies(code, bookedBy);
      var data = await ConnectConstant.db.collection('data').find({
        '\$and': [
          {'User_Code': code},
          {'Payment_Type': fieldtName},
          {'Booked_By': bookedBy},
          {'Booking_Date': dateCode}
        ]
      }).toList();
      //print(data);
      var dataList = data
          .map((item) => MyDataSolidParty(
              item['Customer_Name'].toString(),
              item['Booking_Date'],
              item['Document'].toInt(),
              item['Valid_Amount'].toDouble(),
              item['Paid_Amount'].toDouble(),
              item['Account_Type'].toString(),
              item['Payment_Type'].toString(),
              item['Balance_Amount'].toDouble(),
              item['Excess_Amount'].toDouble(),
              item['Booked_By'].toString(),
              item['Is_Paid'].toString(),
              item['Remarks'].toString(),
              item['_id']))
          .toList();

      return dataList;
    } catch (e) {
      print('Exception: ' + e.toString());
      final v1 = [];
      return v1
          .map((item) => MyDataSolidParty(
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item[''],
              item['']))
          .toList();
    }
  }
}
