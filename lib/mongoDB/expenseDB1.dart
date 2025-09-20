// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names, avoid_print, unused_local_variable, empty_catches, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings

import 'package:meta_blaster/Models/module/constModules.dart';
import 'package:meta_blaster/mongoDB/connect_&_constant.dart';

class ExpenseDB_1 {
  static Future<void> Delete_Expense(code) async {
    try {
      await ConnectConstant.db.collection('expense').deleteOne({'_id': code});
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> Expense_InsertData(code, date, expBy, getAMT, expAMT,
      balAmt, exsAmt, getFrom, use_exp, remarks) async {
    try {
      await ConnectConstant.db.collection('expense').insertOne({
        'Expense_Date': date,
        'Expense_By': expBy,
        'Get_Amount': getAMT,
        'Expense_Amount': expAMT,
        'Balance_Amount': balAmt,
        'Excess_Amount': exsAmt,
        'Get_From_Where': getFrom,
        'Expense_For_Used': use_exp,
        'Remarks': remarks,
        'User_Code': code
      });
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<List> ExpenseCards(code, fdate, tdate, getFrom) async {
    try {
      List Qr = [];

      code != null
          ? Qr.add({'User_Code': code})
          : print('Expense code is null');

      fdate != null
          ? Qr.add({
              'Expense_Date': {'\$gte': fdate}
            })
          : print('Expense Fdate is null');

      tdate != null
          ? Qr.add({
              'Expense_Date': {'\$lte': tdate}
            })
          : print('Expense Tdate is null');

      if (getFrom == 'All') {
        print('Nothing');
      } else if (getFrom == 'None of Above') {
        Qr.addAll([
          {
            'Get_From_Where': {'\$ne': 'All'}
          },
          {
            'Get_From_Where': {'\$ne': 'Shajahan'}
          },
          {
            'Get_From_Where': {'\$ne': 'Ayiesha'}
          },
          {
            'Get_From_Where': {'\$ne': 'Head Office'}
          },
          {
            'Get_From_Where': {'\$ne': 'Other Branch'}
          },
          {
            'Get_From_Where': {'\$ne': 'Office Booking Amount'}
          },
          {
            'Get_From_Where': {'\$ne': 'Line Booking Amount'}
          },
          {
            'Get_From_Where': {'\$ne': 'Vahith Hasan'}
          },
          {
            'Get_From_Where': {'\$ne': 'Vajith Husan'}
          },
          {
            'Get_From_Where': {'\$ne': 'Third Party'}
          },
          {
            'Get_From_Where': {'\$ne': 'Other'}
          }
        ]);
      } else {
        Qr.add({'Get_From_Where': getFrom});
      }

      var query1 = [
        {
          '\$match': {'\$and': Qr}
        },
        {
          '\$group': {
            '_id': null,
            'Get_Amount': {'\$sum': '\$Get_Amount'},
            'Expense_Amount': {'\$sum': '\$Expense_Amount'},
            'Balance_Amount': {'\$sum': '\$Balance_Amount'},
            'Excess_Amount': {'\$sum': '\$Excess_Amount'}
          }
        }
      ];

      var data = await ConnectConstant.db
          .collection('expense')
          .aggregateToStream(query1)
          .toList();

      var GetAmount, ExpAmount, BalAmount, ExsAmount, NetAmount;

      try {
        GetAmount = data[0]['Get_Amount'] ?? 0.0;
      } catch (e) {
        GetAmount = 0.0;
      }

      try {
        ExpAmount = data[0]['Expense_Amount'] ?? 0.0;
      } catch (e) {
        ExpAmount = 0.0;
      }

      try {
        BalAmount = data[0]['Balance_Amount'] ?? 0.0;
      } catch (e) {
        BalAmount = 0.0;
      }

      try {
        ExsAmount = data[0]['Excess_Amount'] ?? 0.0;
      } catch (e) {
        ExsAmount = 0.0;
      }

      try {
        NetAmount = ExpAmount - BalAmount;
      } catch (e) {
        NetAmount = 0.0;
      }

      print("$GetAmount, $ExpAmount, $BalAmount, $ExsAmount, $NetAmount");

      return [GetAmount, ExpAmount, BalAmount, ExsAmount, NetAmount];
    } catch (e) {
      print(e.toString());
      return [0.0, 0.0, 0.0, 0.0, 0.0];
    }
  }

  static Future<List<dynamic>> Expense_Total_Tabel(
      code, fdate, tdate, getFrom) async {
    try {
      //print('There is second unique code: ' + code.toString());
      List Qr = [];

      code != null
          ? Qr.add({'User_Code': code})
          : print('Expense code is null');

      fdate != null
          ? Qr.add({
              'Expense_Date': {'\$gte': fdate}
            })
          : print('Expense Fdate is null');

      tdate != null
          ? Qr.add({
              'Expense_Date': {'\$lte': tdate}
            })
          : print('Expense Tdate is null');

      if (getFrom == 'All') {
        print('Nothing');
      } else if (getFrom == 'None of Above') {
        Qr.addAll([
          {
            'Get_From_Where': {'\$ne': 'All'}
          },
          {
            'Get_From_Where': {'\$ne': 'Shajahan'}
          },
          {
            'Get_From_Where': {'\$ne': 'Ayiesha'}
          },
          {
            'Get_From_Where': {'\$ne': 'Head Office'}
          },
          {
            'Get_From_Where': {'\$ne': 'Other Branch'}
          },
          {
            'Get_From_Where': {'\$ne': 'Office Booking Amount'}
          },
          {
            'Get_From_Where': {'\$ne': 'Line Booking Amount'}
          },
          {
            'Get_From_Where': {'\$ne': 'Vahith Hasan'}
          },
          {
            'Get_From_Where': {'\$ne': 'Vajith Husan'}
          },
          {
            'Get_From_Where': {'\$ne': 'Third Party'}
          },
          {
            'Get_From_Where': {'\$ne': 'Other'}
          }
        ]);
      } else {
        Qr.add({'Get_From_Where': getFrom});
      }

      var data = await ConnectConstant.db
          .collection('expense')
          .find({'\$and': Qr}).toList();
      //print(data);
      var dataList = data
          .map((item) => MyExpense_Model(
              item['Expense_Date'],
              item['Expense_By'].toString(),
              item['Get_Amount'].toInt(),
              item['Expense_Amount'].toInt(),
              item['Balance_Amount'].toInt(),
              item['Excess_Amount'].toInt(),
              item['Get_From_Where'].toString(),
              item['Expense_For_Used'].toString(),
              item['Remarks'].toString(),
              item['_id']))
          .toList();

      return dataList;
    } catch (e) {
      print('Exception: ' + e.toString());
      final v1 = [];
      return v1
          .map((item) => MyExpense_Model(item[''], item[''], item[''], item[''],
              item[''], item[''], item[''], item[''], item[''], item['']))
          .toList();
    }
  }

  static Future<List<dynamic>> Expense_Total_Balance_Tabel(
      code, fdate, tdate, getFrom, balance) async {
    try {
      List Qr = [];

      balance == 'Balance'
          ? Qr.add({
              'Balance_Amount': {'\$gt': 0}
            })
          : Qr.add({
              'Excess_Amount': {'\$gt': 0}
            });

      code != null
          ? Qr.add({'User_Code': code})
          : print('Expense code is null');

      fdate != null
          ? Qr.add({
              'Expense_Date': {'\$gte': fdate}
            })
          : print('Expense Fdate is null');

      tdate != null
          ? Qr.add({
              'Expense_Date': {'\$lte': tdate}
            })
          : print('Expense Tdate is null');

      if (getFrom == 'All') {
        print('Nothing');
      } else if (getFrom == 'None of Above') {
        Qr.addAll([
          {
            'Get_From_Where': {'\$ne': 'All'}
          },
          {
            'Get_From_Where': {'\$ne': 'Shajahan'}
          },
          {
            'Get_From_Where': {'\$ne': 'Ayiesha'}
          },
          {
            'Get_From_Where': {'\$ne': 'Head Office'}
          },
          {
            'Get_From_Where': {'\$ne': 'Other Branch'}
          },
          {
            'Get_From_Where': {'\$ne': 'Office Booking Amount'}
          },
          {
            'Get_From_Where': {'\$ne': 'Line Booking Amount'}
          },
          {
            'Get_From_Where': {'\$ne': 'Vahith Hasan'}
          },
          {
            'Get_From_Where': {'\$ne': 'Vajith Husan'}
          },
          {
            'Get_From_Where': {'\$ne': 'Third Party'}
          },
          {
            'Get_From_Where': {'\$ne': 'Other'}
          }
        ]);
      } else {
        Qr.add({'Get_From_Where': getFrom});
      }

      var data = await ConnectConstant.db
          .collection('expense')
          .find({'\$and': Qr}).toList();
      //print(data);
      var dataList = data
          .map((item) => MyExpense_Model(
              item['Expense_Date'],
              item['Expense_By'].toString(),
              item['Get_Amount'].toInt(),
              item['Expense_Amount'].toInt(),
              item['Balance_Amount'].toInt(),
              item['Excess_Amount'].toInt(),
              item['Get_From_Where'].toString(),
              item['Expense_For_Used'].toString(),
              item['Remarks'].toString(),
              item['_id']))
          .toList();

      return dataList;
    } catch (e) {
      print('Exception: ' + e.toString());
      final v1 = [];
      return v1
          .map((item) => MyExpense_Model(item[''], item[''], item[''], item[''],
              item[''], item[''], item[''], item[''], item[''], item['']))
          .toList();
    }
  }
}
