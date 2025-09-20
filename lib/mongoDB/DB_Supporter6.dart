// ignore_for_file: avoid_print, camel_case_types, non_constant_identifier_names, unused_import, file_names, unused_element, unused_local_variable, prefer_interpolation_to_compose_strings, prefer_typing_uninitialized_variables, unnecessary_string_interpolations, prefer_const_constructors

import 'package:intl/intl.dart';
import 'package:meta_blaster/Models/module/constModules.dart';
import 'package:meta_blaster/mongoDB/connect_&_constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Db_Supporter_6 {
  static Future<List<dynamic>> Fetch_Total_Party_Bunker_SearchTab(
      code, Fdate, Tdate, name, book, status) async {
    try {
      var query1, query2, query3, query4, query5;

      List Qr = [], Qr1 = [], Qr2 = [], Qr3 = [], Qr4 = [];

      var status_var, book_var, name_var;

      Fdate != null
          ? Qr.add({
              'Booking_Date': {'\$gte': Fdate}
            })
          : print(Fdate);
      Tdate != null
          ? Qr.add({
              'Booking_Date': {'\$lte': Tdate}
            })
          : print(Tdate);
      code != null ? Qr.add({'User_Code': code}) : print(code);
      name != null ? Qr.add({'Customer_Name': name}) : print(name);
      book != 'All' ? Qr.add({'Booked_By': book}) : print(book);
      status != 'All' ? Qr.add({'Is_Paid': status}) : print(status);

      Qr1.addAll(Qr);
      Qr1.add({'Account_Type': 'Cash'});

      Qr2.addAll(Qr);
      Qr2.add({'Account_Type': 'Credit'});

      Qr3.addAll(Qr);
      Qr3.add({'Payment_Type': 'Hot Cash'});

      Qr4.addAll(Qr);
      Qr4.add({'Payment_Type': 'UPI'});

      var data = await ConnectConstant.db
          .collection('data')
          .find({'\$and': Qr}).toList();
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
      print('Error No: 11');

      var v1 = [];
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

  //

  static Future<List<dynamic>>
      Fetch_Total_Party_Bunker_SearchTab_Balance_Filter(
          code, Fdate, Tdate, name, book, status, filter) async {
    try {
      var query1, query2, query3, query4, query5;

      List Qr = [];

      var status_var, book_var, name_var;

      Fdate != null
          ? Qr.add({
              'Booking_Date': {'\$gte': Fdate}
            })
          : print(Fdate);
      Tdate != null
          ? Qr.add({
              'Booking_Date': {'\$lte': Tdate}
            })
          : print(Tdate);
      filter != 'Excess'
          ? Qr.add({
              'Balance_Amount': {'\$gt': 0}
            })
          : Qr.add({
              'Excess_Amount': {'\$gt': 0}
            });
      code != null ? Qr.add({'User_Code': code}) : print(code);
      name != null ? Qr.add({'Customer_Name': name}) : print(name);
      book != 'All' ? Qr.add({'Booked_By': book}) : print(book);
      status != 'All' ? Qr.add({'Is_Paid': status}) : print(status);

      var data = await ConnectConstant.db
          .collection('data')
          .find({'\$and': Qr}).toList();
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
      print('Error No: 11');

      var v1 = [];
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

  //

  static Future<List<dynamic>> Fetch_Total_Party_Bunker_SearchTab_UPI_Filter(
      code, Fdate, Tdate, name, book, status, filter) async {
    try {
      var query1, query2, query3, query4, query5;

      List Qr = [];

      var status_var, book_var, name_var;

      Fdate != null
          ? Qr.add({
              'Booking_Date': {'\$gte': Fdate}
            })
          : print(Fdate);
      Tdate != null
          ? Qr.add({
              'Booking_Date': {'\$lte': Tdate}
            })
          : print(Tdate);

      if (filter == 'Hot Cash') {
        Qr.add({'Payment_Type': filter});
      } else if (filter == 'UPI') {
        Qr.add({'Payment_Type': filter});
      } else if (filter == 'Bank Transfer') {
        Qr.add({'Payment_Type': filter});
      } else {
        Qr.add({'Payment_Type': filter});
      }

      code != null ? Qr.add({'User_Code': code}) : print(code);
      name != null ? Qr.add({'Customer_Name': name}) : print(name);
      book != 'All' ? Qr.add({'Booked_By': book}) : print(book);
      status != 'All' ? Qr.add({'Is_Paid': status}) : print(status);

      var data = await ConnectConstant.db
          .collection('data')
          .find({'\$and': Qr}).toList();
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
      print('Error No: 11');

      var v1;
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

  static Future<List> Fetch_Total_Party_Bunker_SearchTab_UPI_Analytics(
      code, Fdate, Tdate, name, book, status) async {
    try {
      List Qr = [], Qr1 = [], Qr2 = [], Qr3 = [], Qr4 = [];

      Fdate != null
          ? Qr.add({
              'Booking_Date': {'\$gte': Fdate}
            })
          : print(Fdate);
      Tdate != null
          ? Qr.add({
              'Booking_Date': {'\$lte': Tdate}
            })
          : print(Tdate);

      code != null ? Qr.add({'User_Code': code}) : print(code);
      name != null ? Qr.add({'Customer_Name': name}) : print(name);
      book != 'All' ? Qr.add({'Booked_By': book}) : print(book);
      status != 'All' ? Qr.add({'Is_Paid': status}) : print(status);

      Qr1.addAll(Qr);
      Qr1.add({'Payment_Type': 'Hot Cash'});

      Qr2.addAll(Qr);
      Qr2.add({'Payment_Type': 'UPI'});

      Qr3.addAll(Qr);
      Qr3.add({'Payment_Type': 'Bank Transfer'});

      Qr4.addAll(Qr);
      Qr4.add({'Payment_Type': 'Cheque'});

      var query1 = [
        {
          '\$match': {'\$and': Qr1}
        },
        {
          '\$group': {
            '_id': null,
            'totalValue': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      var query2 = [
        {
          '\$match': {'\$and': Qr2}
        },
        {
          '\$group': {
            '_id': null,
            'totalValue': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      var query3 = [
        {
          '\$match': {'\$and': Qr3}
        },
        {
          '\$group': {
            '_id': null,
            'totalValue': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      var query4 = [
        {
          '\$match': {'\$and': Qr4}
        },
        {
          '\$group': {
            '_id': null,
            'totalValue': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      var data1 = await ConnectConstant.db
          .collection('data')
          .aggregateToStream(query1)
          .toList();

      var data2 = await ConnectConstant.db
          .collection('data')
          .aggregateToStream(query2)
          .toList();

      var data3 = await ConnectConstant.db
          .collection('data')
          .aggregateToStream(query3)
          .toList();

      var data4 = await ConnectConstant.db
          .collection('data')
          .aggregateToStream(query4)
          .toList();

      dynamic data_1,
          data_2,
          data_3,
          data_4,
          data_5,
          data_6,
          data_7,
          data_8,
          data_9,
          data_10,
          data_11;

      try {
        data_1 = data1[0]['totalValue'];
      } catch (e) {
        data_1 = 0.0;
      }

      try {
        data_2 = data2[0]['totalValue'];
      } catch (e) {
        data_2 = 0.0;
      }

      try {
        data_3 = data3[0]['totalValue'];
      } catch (e) {
        data_3 = 0.0;
      }

      try {
        data_4 = data4[0]['totalValue'];
      } catch (e) {
        data_4 = 0.0;
      }

      return [data_1 ?? 0.0, data_2 ?? 0.0, data_3 ?? 0.0, data_4 ?? 0.0];
    } catch (e) {
      print(e.toString());
      return [0.0, 0.0, 0.0, 0.0];
    }
  }

  static Future<List> FromToDate_Formated(code) async {
    try {
      var data1 = await ConnectConstant.db.collection('data').findOne(
          where.eq('User_Code', code).sortBy('Booking_Date', descending: true));

      var data2 = await ConnectConstant.db.collection('data').findOne(where
          .eq('User_Code', code)
          .sortBy('Booking_Date', descending: false));

      var Formated_data1 = DateFormat('yyyy-MM-dd')
          .format(DateTime.parse(data1.add(Duration(days: 1))))
          .toString();
      var Formated_From =
          '${DateFormat('E-dd-MMM-yyyy').format(DateTime.parse(Formated_data1))}';

      var Formated_data2 = DateFormat('yyyy-MM-dd')
          .format(DateTime.parse(data2.add(Duration(days: 1))))
          .toString();
      var Formated_To =
          '${DateFormat('E-dd-MMM-yyyy').format(DateTime.parse(Formated_data2))}';

      print('Date Tester, From Date: $Formated_From, To Date: $Formated_To');

      return [Formated_From, Formated_To];
    } catch (e) {
      print(e.toString());
      return [
        '${DateFormat('E-dd-MMM-yyyy').format(DateTime.parse(DateTime.now().toString()))}',
        '${DateFormat('E-dd-MMM-yyyy').format(DateTime.parse(DateTime.now().toString()))}'
      ];
    }
  }

  static Future<List> FromToDate_Formated_Exp(code) async {
    try {
      var data1 = await ConnectConstant.db.collection('expense').findOne(
          where.eq('User_Code', code).sortBy('Expense_Date', descending: true));

      var data2 = await ConnectConstant.db.collection('expense').findOne(where
          .eq('User_Code', code)
          .sortBy('Expense_Date', descending: false));

      var Formated_data1 = DateFormat('yyyy-MM-dd')
          .format(DateTime.parse(data1.add(Duration(days: 1))))
          .toString();
      var Formated_From =
          '${DateFormat('E-dd-MMM-yyyy').format(DateTime.parse(Formated_data1))}';

      var Formated_data2 = DateFormat('yyyy-MM-dd')
          .format(DateTime.parse(data2.add(Duration(days: 1))))
          .toString();
      var Formated_To =
          '${DateFormat('E-dd-MMM-yyyy').format(DateTime.parse(Formated_data2))}';

      print('Date Tester, From Date: $Formated_From, To Date: $Formated_To');

      return [Formated_From, Formated_To];
    } catch (e) {
      print(e.toString());
      return [
        '${DateFormat('E-dd-MMM-yyyy').format(DateTime.parse(DateTime.now().toString()))}',
        '${DateFormat('E-dd-MMM-yyyy').format(DateTime.parse(DateTime.now().toString()))}'
      ];
    }
  }
}
