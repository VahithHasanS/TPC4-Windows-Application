// ignore_for_file: file_names, constant_identifier_names, prefer_typing_uninitialized_variables, non_constant_identifier_names, unused_local_variable, avoid_print, camel_case_types, await_only_futures, prefer_interpolation_to_compose_strings, prefer_const_constructors, unused_import

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta_blaster/Models/module/constModules.dart';
import 'package:meta_blaster/mongoDB/DB_Supporter1.dart';
import 'package:mongo_dart/mongo_dart.dart';

const MONGO_CONN_URL =
    'mongodb+srv://shajahan_tpcBR4:SFKIZZWPGDff3Wdd@tpcbr-4-project.ou5hsth.mongodb.net/HaHuTrendz?retryWrites=true&w=majority'; //Our Database URL
const USER_COLLECTION =
    'Login_Collection'; // Our Collection Name is Login_Collection

const MONGO_CONN_URL_2 =
    'mongodb+srv://Shajahan_Access_2:pMaZXmSalrhJTkK7@tpcbr-4-project.ou5hsth.mongodb.net/HaHuTrendz?retryWrites=true&w=majority';

const USER_COLLECTION_2 =
    'DailyEntry_Collections'; // Our Collection Name is Login_Collection  DailyEntry_Collections

const headOffice_Collectoin_1 = 'HeadOfficeEntry_Collection';

const favoriteCustomer_Collectino =
    'FavoriteCustomer_Collection'; //FavoriteCustomer_Collection

class ConnectConstant {
  static var db, userCollection;
  static var dataRe;

  static connect() async {
    try {
      db = await Db.create(MONGO_CONN_URL);
      await db.open();
      inspect(db);
    } catch (e) {
      print(e.toString());
      db = await Db.create(MONGO_CONN_URL);
      await db.open();
      inspect(db);
    }

    //userCollection = db.collection();
  }

  static Future<dynamic> login_Fetch(userName, userPassword) async {
    try {
      var dataList = await db
          .collection('users')
          .find({'Email': userName, 'Password': userPassword}).toList();
      //print(dataList.toString());
      if (userName == dataList[0]['Email'] &&
          userPassword == dataList[0]['Password']) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  static Future<dynamic> fetchIDOnly(email) async {
    try {
      var data = await db.collection('users').find({'Email': email}).toList();

      return data[0]['_id'];
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<dynamic> fetchMail(uEmail) async {
    try {
      var emailRes =
          await db.collection('users').find({'Email': uEmail}).toList();
      if (emailRes[0]['Email'] == uEmail) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<dynamic> fetchPhoneNumber(uEmail) async {
    try {
      var emailRes =
          await db.collection('users').find({'PhoneNumber': uEmail}).toList();
      if (emailRes[0]['PhoneNumber'] == uEmail) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<dynamic> fetchPassword(uEmail) async {
    try {
      var emailRes =
          await db.collection('users').find({'Password': uEmail}).toList();
      if (emailRes[0]['Password'] == uEmail) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<dynamic> fetchPasswordOnly(uEmail) async {
    var emailRes =
        await db.collection('users').find({'Email': uEmail}).toList();

    return emailRes[0]['Password'].toString();
  }

  static Future<String> fetchUNameOnly(uEmail) async {
    var emailRes =
        await db.collection('users').find({'Email': uEmail}).toList();

    //print(emailRes);
    //print(emailRes[0]['Name']);

    return emailRes[0]['Name'].toString();
  }

  static Future<void> SingnIn_Data(
      userName, userEmail, userPhoneNumber, userPassword) async {
    var data = await db.collection('users').insertOne({
      'Name': userName,
      'Email': userEmail,
      'PhoneNumber': userPhoneNumber,
      'Password': userPassword
    });

    if (data.isSuccess) {
      print('Data inserted.');
    } else {
      print('Some thing went wrong');
    }
  }

  static Future<void> insert_Records_Daily(
      customerName,
      date,
      document,
      validAmt,
      paidAmt,
      accType,
      payType,
      balAmt,
      exsAmt,
      bookedBy,
      isPaid,
      remarks,
      userCode) async {
    var data = await db.collection('data').insertOne({
      'Customer_Name': customerName,
      'Booking_Date': date,
      'Document': document,
      'Valid_Amount': validAmt,
      'Paid_Amount': paidAmt,
      'Account_Type': accType,
      'Payment_Type': payType,
      'Balance_Amount': balAmt,
      'Excess_Amount': exsAmt,
      'Booked_By': bookedBy,
      'Is_Paid': isPaid,
      'Remarks': remarks,
      'User_Code': userCode
    });

    if (data.isSuccess) {
      print('Customer Data inserted.');
    } else {
      print('Some thing went wrong in customer data.');
    }
  }

  static Future<void> insert_Records_Head_Office(
      date,
      document,
      validAmt,
      paidAmt,
      payType,
      balAmt,
      exsAmt,
      bookedBy,
      isPaid,
      remarks,
      userCode) async {
    var data = await db.collection('headOffice_data').insertOne({
      'Submited_Date': date,
      'Document': document,
      'Valid_Amount': validAmt,
      'Paid_Amount': paidAmt,
      'Payment_Type': payType,
      'Balance_Amount': balAmt,
      'Excess_Amount': exsAmt,
      'Entryed_By': bookedBy,
      'Is_Paid': isPaid,
      'Remarks': remarks,
      'User_Code': userCode
    });

    if (data.isSuccess) {
      print('Customer Data inserted.');
    } else {
      print('Some thing went wrong in customer data.');
    }
  }

  static Future<List<dynamic>> entryFetchList(code) async {
    DateTime toDay = await Db_Supporter_1.findLastUpdateLive4455(code);
    try {
      var data = await db
          .collection('data')
          .find(where.eq('User_Code', code).eq('Booking_Date', toDay))
          .toList();

      var dataList = data
          .map((item) => List001(item['Customer_Name'].toString(),
              item['Is_Paid'].toString(), item['_id']))
          .toList();
      //print('Customer data is: ' + dataList.length);
      //print('It works good!...');
      //print(dataList);
      //print(toDay);
      return dataList;
    } catch (e) {
      print('this is exception: ' + e.toString());
      final v1 = [];
      return v1.map((item) => List001(item[''], item[''], item[''])).toList();
    }
  }
}
