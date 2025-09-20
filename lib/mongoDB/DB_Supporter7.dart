// ignore_for_file: avoid_print, camel_case_types, non_constant_identifier_names, unused_import, file_names, unused_element, unused_local_variable, prefer_interpolation_to_compose_strings, prefer_typing_uninitialized_variables

import 'package:intl/intl.dart';
import 'package:meta_blaster/Models/module/constModules.dart';
import 'package:meta_blaster/mongoDB/connect_&_constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Db_Supporter_7 {
  static Future<void> Delete_Head(code) async {
    try {
      await ConnectConstant.db
          .collection('headOffice_data')
          .deleteOne({'_id': code});
      print('$code has been deleted from data collection.');
    } catch (e) {
      print("Error : $e");
      print('Someting went wrong on delete customer');
    }
  }

  static Future<dynamic> Fetch_Total_Party_Bunker_SearchTab(
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

      query1 = [
        {
          '\$match': {
            '\$and': Qr1,
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue_of_Cash_Document': {'\$sum': '\$Document'},
            'totalValue_of_Cash_Amount': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      query2 = [
        {
          '\$match': {
            '\$and': Qr2,
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue_of_Credit_Document': {'\$sum': '\$Document'},
            'totalValue_of_Credit_Amount': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      query3 = [
        {
          '\$match': {
            '\$and': Qr3,
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue_of_HotCash_Document': {'\$sum': '\$Document'},
            'totalValue_of_HotCash_Amount': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      query4 = [
        {
          '\$match': {
            '\$and': Qr4,
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue_of_UPI_Document': {'\$sum': '\$Document'},
            'totalValue_of_UPI_Amount': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      query5 = [
        {
          '\$match': {
            '\$and': Qr,
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue_of_Balance_Amount': {'\$sum': '\$Balance_Amount'},
            'totalValue_of_Excess_Amount': {'\$sum': '\$Excess_Amount'}
          }
        }
      ];

      var data1 = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(query1)
          .toList();

      var data2 = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(query2)
          .toList();

      var data3 = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(query3)
          .toList();

      var data4 = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(query4)
          .toList();

      var data5 = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(query5)
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
        data_1 = data1[0]['totalValue_of_Cash_Document'];
        data_2 = data1[0]['totalValue_of_Cash_Amount'];
      } catch (e) {
        data_1 = 0;
        data_2 = 0.0;
      }

      try {
        data_3 = data2[0]['totalValue_of_Credit_Document'];
        data_4 = data2[0]['totalValue_of_Credit_Amount'];
      } catch (e) {
        data_3 = 0;
        data_4 = 0.0;
      }

      try {
        data_5 = data3[0]['totalValue_of_HotCash_Document'];
        data_6 = data3[0]['totalValue_of_HotCash_Amount'];
      } catch (e) {
        data_5 = 0;
        data_6 = 0.0;
      }

      try {
        data_7 = data4[0]['totalValue_of_UPI_Document'];
        data_8 = data4[0]['totalValue_of_UPI_Amount'];
      } catch (e) {
        data_7 = 0;
        data_8 = 0.0;
      }

      try {
        data_9 = data5[0]['totalValue_of_Balance_Amount'];
        data_10 = data5[0]['totalValue_of_Excess_Amount'];
      } catch (e) {
        data_9 = 0.0;
        data_10 = 0.0;
      }

      try {
        data_11 = (data1[0]['totalValue_of_Cash_Document']) -
            (data5[0]['totalValue_of_Balance_Amount']);
      } catch (e) {
        data_11 = 0.0;
      }

      List<dynamic> lastVal = [
        data_1 ?? 0,
        data_2 ?? 0.0,
        data_3 ?? 0,
        data_4 ?? 0.0,
        data_5 ?? 0,
        data_6 ?? 0.0,
        data_7 ?? 0,
        data_8 ?? 0.0,
        data_9 ?? 0.0,
        data_10 ?? 0.0,
        data_11 ?? 0.0
      ];

      print(lastVal);

      return lastVal;
    } catch (e) {
      print(e.toString());
      print('Error: 10');
      return [0, 0.0, 0, 0.0, 0, 0.0, 0, 0.0, 0.0, 0.0, 0.0];
    }
  }

  static Future<List<dynamic>> Fetch_Total_Party_Bunker_SearchTab_crud(
      code, Fdate, Tdate, book, status) async {
    try {
      List Qr = [];

      Fdate != null
          ? Qr.add({
              'Submited_Date': {'\$gte': Fdate}
            })
          : print(Fdate);
      Tdate != null
          ? Qr.add({
              'Submited_Date': {'\$lte': Tdate}
            })
          : print(Tdate);
      code != null ? Qr.add({'User_Code': code}) : print(code);
      book != 'All' ? Qr.add({'Entryed_By': book}) : print(book);
      status != 'All' ? Qr.add({'Is_Paid': status}) : print(status);

      var data = await ConnectConstant.db
          .collection('headOffice_data')
          .find({'\$and': Qr}).toList();
      //print(data);
      var dataList = data
          .map((item2) => MyDataSolidParty_Head(
              item2['Submited_Date'],
              item2['Document'].toInt(),
              item2['Valid_Amount'].toInt(),
              item2['Paid_Amount'].toInt(),
              item2['Payment_Type'].toString(),
              item2['Balance_Amount'].toInt(),
              item2['Excess_Amount'].toInt(),
              item2['Entryed_By'].toString(),
              item2['Is_Paid'].toString(),
              item2['Remarks'].toString(),
              item2['_id']))
          .toList();

      print('Section 15 is perfect...!!!');

      return dataList;
    } catch (e) {
      print('Error No: 15');
      print(e.toString());

      var v1;
      return v1
          .map((item2) => MyDataSolidParty_Head(
              item2[''],
              item2[''],
              item2[''],
              item2[''],
              item2[''],
              item2[''],
              item2[''],
              item2[''],
              item2[''],
              item2[''],
              item2['']))
          .toList();
    }
  }

  //

  static Future<List<dynamic>> Fetch_Total_Party_Bunker_SearchTab_crud_Balance(
      code, Fdate, Tdate, book, status, filter) async {
    try {
      List Qr = [];

      Fdate != null
          ? Qr.add({
              'Submited_Date': {'\$gte': Fdate}
            })
          : print(Fdate);
      Tdate != null
          ? Qr.add({
              'Submited_Date': {'\$lte': Tdate}
            })
          : print(Tdate);
      code != null ? Qr.add({'User_Code': code}) : print(code);
      book != 'All' ? Qr.add({'Entryed_By': book}) : print(book);
      status != 'All' ? Qr.add({'Is_Paid': status}) : print(status);
      filter == 'Balance'
          ? Qr.add({
              'Balance_Amount': {'\$gt': 0}
            })
          : Qr.add({
              'Excess_Amount': {'\$gt': 0}
            });

      var data = await ConnectConstant.db
          .collection('headOffice_data')
          .find({'\$and': Qr}).toList();
      //print(data);
      var dataList = data
          .map((item2) => MyDataSolidParty_Head(
              item2['Submited_Date'],
              item2['Document'].toInt(),
              item2['Valid_Amount'].toInt(),
              item2['Paid_Amount'].toInt(),
              item2['Payment_Type'].toString(),
              item2['Balance_Amount'].toInt(),
              item2['Excess_Amount'].toInt(),
              item2['Entryed_By'].toString(),
              item2['Is_Paid'].toString(),
              item2['Remarks'].toString(),
              item2['_id']))
          .toList();

      print('Section 15 is perfect...!!!');

      return dataList;
    } catch (e) {
      print('Error No: 15');
      print(e.toString());

      var v1;
      return v1
          .map((item2) => MyDataSolidParty_Head(
              item2[''],
              item2[''],
              item2[''],
              item2[''],
              item2[''],
              item2[''],
              item2[''],
              item2[''],
              item2[''],
              item2[''],
              item2['']))
          .toList();
    }
  }

  //

  static Future<List<dynamic>> Fetch_Total_Party_Bunker_SearchTab_crud_UPI(
      code, Fdate, Tdate, book, status, filter) async {
    try {
      List Qr = [];

      Fdate != null
          ? Qr.add({
              'Submited_Date': {'\$gte': Fdate}
            })
          : print(Fdate);
      Tdate != null
          ? Qr.add({
              'Submited_Date': {'\$lte': Tdate}
            })
          : print(Tdate);
      code != null ? Qr.add({'User_Code': code}) : print(code);
      book != 'All' ? Qr.add({'Entryed_By': book}) : print(book);
      status != 'All' ? Qr.add({'Is_Paid': status}) : print(status);
      filter == 'Hot Cash'
          ? Qr.add({'Payment_Type': filter})
          : Qr.add({'Payment_Type': filter});

      var data = await ConnectConstant.db
          .collection('headOffice_data')
          .find({'\$and': Qr}).toList();
      //print(data);
      var dataList = data
          .map((item2) => MyDataSolidParty_Head(
              item2['Submited_Date'],
              item2['Document'].toInt(),
              item2['Valid_Amount'].toInt(),
              item2['Paid_Amount'].toInt(),
              item2['Payment_Type'].toString(),
              item2['Balance_Amount'].toInt(),
              item2['Excess_Amount'].toInt(),
              item2['Entryed_By'].toString(),
              item2['Is_Paid'].toString(),
              item2['Remarks'].toString(),
              item2['_id']))
          .toList();

      print('Section 15 is perfect...!!!');

      return dataList;
    } catch (e) {
      print('Error No: 15');
      print(e.toString());

      var v1;
      return v1
          .map((item2) => MyDataSolidParty_Head(
              item2[''],
              item2[''],
              item2[''],
              item2[''],
              item2[''],
              item2[''],
              item2[''],
              item2[''],
              item2[''],
              item2[''],
              item2['']))
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
}
