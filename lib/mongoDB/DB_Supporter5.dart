// ignore_for_file: avoid_print, camel_case_types, non_constant_identifier_names, unused_import, file_names, unused_element, unused_local_variable, prefer_interpolation_to_compose_strings, prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers

import 'package:intl/intl.dart';
import 'package:meta_blaster/mongoDB/connect_&_constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Db_Supporter_5 {
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
            'totalValue_of_Cash_Amount': {'\$sum': '\$Paid_Amount'},
            "totalValue_of_Valid_Amount": {'\$sum': '\$Valid_Amount'}
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

      var data5 = await ConnectConstant.db
          .collection('data')
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
          data_11,
          data_12;

      try {
        data_1 = data1[0]['totalValue_of_Cash_Document'];
        data_2 = data1[0]['totalValue_of_Cash_Amount'];
        data_12 = data1[0]['totalValue_of_Valid_Amount'];
      } catch (e) {
        data_1 = 0;
        data_2 = 0.0;
        data_12 = 0.0;
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
        data_11 = (data1[0]['totalValue_of_Cash_Amount']) -
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
        data_11 ?? 0.0,
        data_12 ?? 0.0
      ];

      print(lastVal);

      return lastVal;
    } catch (e) {
      print(e.toString());
      print('Error: 10');
      return [0, 0.0, 0, 0.0, 0, 0.0, 0, 0.0, 0.0, 0.0, 0.0, 0.0];
    }
  }

  static Future<dynamic> Fetch_Total_Head_UPI_Bunker_SearchTab(
      code, Fdate, Tdate, book, status) async {
    try {
      var query_Hot_C, query_UPI;

      List Qr = [], Qr_Hot_C = [], Qr_UPI = [], Qr_Bank = [], Qr_Cheque = [];

      var status_var, book_var, name_var;

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

      Qr_Hot_C.addAll(Qr);
      Qr_Hot_C.add({'Payment_Type': 'Hot Cash'});

      Qr_UPI.addAll(Qr);
      Qr_UPI.add({'Payment_Type': 'UPI'});

      Qr_Bank.addAll(Qr);
      Qr_Bank.add({'Payment_Type': 'Bank Transfer'});

      Qr_Cheque.addAll(Qr);
      Qr_Cheque.add({'Payment_Type': 'Cheque'});

      query_Hot_C = [
        {
          '\$match': {
            '\$and': Qr_Hot_C,
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      query_UPI = [
        {
          '\$match': {
            '\$and': Qr_UPI,
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      var query_Bank = [
        {
          '\$match': {
            '\$and': Qr_Bank,
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      var query_Cheque = [
        {
          '\$match': {
            '\$and': Qr_Cheque,
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      var query_Balance = [
        {
          '\$match': {
            '\$and': Qr,
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue_Balance': {'\$sum': '\$Balance_Amount'},
            'totalValue_Excess': {'\$sum': '\$Excess_Amount'}
          }
        }
      ];

      var data_Hot_C = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(query_Hot_C)
          .toList();

      var data_UPI = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(query_UPI)
          .toList();

      var data_Bank = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(query_Bank)
          .toList();

      var data_Cheque = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(query_Cheque)
          .toList();

      var data_General_All = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(query_Balance)
          .toList();

      dynamic _data_Balance,
          _data_Excess,
          _data_Hot_C,
          _data_UPI,
          _data_Bank,
          _data_Cheque;

      try {
        _data_Balance = data_General_All[0]['totalValue_Balance'] ?? 0.0;
        _data_Excess = data_General_All[0]['totalValue_Excess'] ?? 0.0;
      } catch (e) {
        _data_Balance = 0.0;
        _data_Excess = 0.0;
      }

      try {
        _data_Hot_C = data_Hot_C[0]['totalValue'] ?? 0.0;
      } catch (e) {
        _data_Hot_C = 0.0;
      }

      try {
        _data_UPI = data_UPI[0]['totalValue'] ?? 0.0;
      } catch (e) {
        _data_UPI = 0.0;
      }

      try {
        _data_Bank = data_Bank[0]['totalValue'] ?? 0.0;
      } catch (e) {
        _data_Bank = 0.0;
      }

      try {
        _data_Cheque = data_Cheque[0]['totalValue'] ?? 0.0;
      } catch (e) {
        _data_Cheque = 0.0;
      }

      List<dynamic> lastVal = [
        _data_Balance ?? 0.0,
        _data_Excess ?? 0.0,
        _data_Hot_C ?? 0.0,
        _data_UPI ?? 0.0,
        _data_Bank ?? 0.0,
        _data_Cheque ?? 0.0
      ];

      print(lastVal);

      return lastVal;
    } catch (e) {
      print(e.toString());
      print('Error: 10');
      return [0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
    }
  }

  static Future<dynamic> Fetch_Total_Head_All_Bunker_SearchTab(
      code, Fdate, Tdate, status) async {
    try {
      List Qr = [],
          Qr_Br_All = [],
          Qr_Br_Hot_C = [],
          Qr_Br_UPI = [],
          Qr_Sh_All = [],
          Qr_Sh_Hot_C = [],
          Qr_Sh_UPI = [],
          Qr_Rt_All = [],
          Qr_Rt_Hot_C = [],
          Qr_Rt_UPI = [],
          Qr_CCC_All = [],
          Qr_CCC_Hot_C = [],
          Qr_CCC_UPI = [],
          Qr_Ot_All = [],
          Qr_Ot_Hot_C = [],
          Qr_Ot_UPI = [];

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
      status != 'All' ? Qr.add({'Is_Paid': status}) : print(status);

      Qr_Br_All.addAll(Qr);
      Qr_Br_All.add({'Entryed_By': 'Branch Pc-4'});
      Qr_Br_Hot_C.addAll(Qr_Br_All);
      Qr_Br_Hot_C.add({'Payment_Type': 'Hot Cash'});
      Qr_Br_UPI.addAll(Qr_Br_All);
      Qr_Br_UPI.add({'Payment_Type': 'UPI'});

      Qr_Sh_All.addAll(Qr);
      Qr_Sh_All.add({'Entryed_By': 'Shajahan'});
      Qr_Sh_Hot_C.addAll(Qr_Sh_All);
      Qr_Sh_Hot_C.add({'Payment_Type': 'Hot Cash'});
      Qr_Sh_UPI.addAll(Qr_Sh_All);
      Qr_Sh_UPI.add({'Payment_Type': 'UPI'});

      Qr_Rt_All.addAll(Qr);
      Qr_Rt_All.add({'Entryed_By': 'Root'});
      Qr_Rt_Hot_C.addAll(Qr_Rt_All);
      Qr_Rt_Hot_C.add({'Payment_Type': 'Hot Cash'});
      Qr_Rt_UPI.addAll(Qr_Rt_All);
      Qr_Rt_UPI.add({'Payment_Type': 'UPI'});

      Qr_CCC_All.addAll(Qr);
      Qr_CCC_All.add({'Entryed_By': 'CCC'});
      Qr_CCC_Hot_C.addAll(Qr_CCC_All);
      Qr_CCC_Hot_C.add({'Payment_Type': 'Hot Cash'});
      Qr_CCC_UPI.addAll(Qr_CCC_All);
      Qr_CCC_UPI.add({'Payment_Type': 'UPI'});

      Qr_Ot_All.addAll(Qr);
      Qr_Ot_All.add({'Entryed_By': 'Other'});
      Qr_Ot_Hot_C.addAll(Qr_Ot_All);
      Qr_Ot_Hot_C.add({'Payment_Type': 'Hot Cash'});
      Qr_Ot_UPI.addAll(Qr_Ot_All);
      Qr_Ot_UPI.add({'Payment_Type': 'UPI'});

      var query_Br_All = [
        {
          '\$match': {
            '\$and': Qr_Br_All,
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue_Document': {'\$sum': '\$Document'},
            'totalValue_Valid_AMT': {'\$sum': '\$Valid_Amount'},
            'totalValue_Paid_AMT': {'\$sum': '\$Paid_Amount'},
            'totalValue_Balance': {'\$sum': '\$Balance_Amount'},
            'totalValue_Excess': {'\$sum': '\$Excess_Amount'}
          }
        }
      ];

      var query_Sh_All = [
        {
          '\$match': {
            '\$and': Qr_Sh_All,
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue_Document': {'\$sum': '\$Document'},
            'totalValue_Valid_AMT': {'\$sum': '\$Valid_Amount'},
            'totalValue_Paid_AMT': {'\$sum': '\$Paid_Amount'},
            'totalValue_Balance': {'\$sum': '\$Balance_Amount'},
            'totalValue_Excess': {'\$sum': '\$Excess_Amount'}
          }
        }
      ];

      var query_Rt_All = [
        {
          '\$match': {
            '\$and': Qr_Rt_All,
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue_Document': {'\$sum': '\$Document'},
            'totalValue_Valid_AMT': {'\$sum': '\$Valid_Amount'},
            'totalValue_Paid_AMT': {'\$sum': '\$Paid_Amount'},
            'totalValue_Balance': {'\$sum': '\$Balance_Amount'},
            'totalValue_Excess': {'\$sum': '\$Excess_Amount'}
          }
        }
      ];

      var query_CCC_All = [
        {
          '\$match': {
            '\$and': Qr_CCC_All,
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue_Document': {'\$sum': '\$Document'},
            'totalValue_Valid_AMT': {'\$sum': '\$Valid_Amount'},
            'totalValue_Paid_AMT': {'\$sum': '\$Paid_Amount'},
            'totalValue_Balance': {'\$sum': '\$Balance_Amount'},
            'totalValue_Excess': {'\$sum': '\$Excess_Amount'}
          }
        }
      ];

      var query_Ot_All = [
        {
          '\$match': {
            '\$and': Qr_Ot_All,
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue_Document': {'\$sum': '\$Document'},
            'totalValue_Valid_AMT': {'\$sum': '\$Valid_Amount'},
            'totalValue_Paid_AMT': {'\$sum': '\$Paid_Amount'},
            'totalValue_Balance': {'\$sum': '\$Balance_Amount'},
            'totalValue_Excess': {'\$sum': '\$Excess_Amount'}
          }
        }
      ];

      var query_Br_Hot_C = [
        {
          '\$match': {
            '\$and': Qr_Br_Hot_C,
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue_Document': {'\$sum': '\$Document'},
            'totalValue_Paid_AMT': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      var query_Br_UPI = [
        {
          '\$match': {
            '\$and': Qr_Br_UPI,
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue_Document': {'\$sum': '\$Document'},
            'totalValue_Paid_AMT': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      var query_Sh_Hot_C = [
        {
          '\$match': {
            '\$and': Qr_Sh_Hot_C,
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue_Document': {'\$sum': '\$Document'},
            'totalValue_Paid_AMT': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      var query_Sh_UPI = [
        {
          '\$match': {
            '\$and': Qr_Sh_UPI,
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue_Document': {'\$sum': '\$Document'},
            'totalValue_Paid_AMT': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      var query_Rt_Hot_C = [
        {
          '\$match': {
            '\$and': Qr_Rt_Hot_C,
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue_Document': {'\$sum': '\$Document'},
            'totalValue_Paid_AMT': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      var query_Rt_UPI = [
        {
          '\$match': {
            '\$and': Qr_Rt_UPI,
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue_Document': {'\$sum': '\$Document'},
            'totalValue_Paid_AMT': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      var query_CCC_Hot_C = [
        {
          '\$match': {
            '\$and': Qr_CCC_Hot_C,
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue_Document': {'\$sum': '\$Document'},
            'totalValue_Paid_AMT': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      var query_CCC_UPI = [
        {
          '\$match': {
            '\$and': Qr_CCC_UPI,
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue_Document': {'\$sum': '\$Document'},
            'totalValue_Paid_AMT': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      var query_Ot_Hot_C = [
        {
          '\$match': {
            '\$and': Qr_Ot_Hot_C,
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue_Document': {'\$sum': '\$Document'},
            'totalValue_Paid_AMT': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      var query_Ot_UPI = [
        {
          '\$match': {
            '\$and': Qr_Ot_UPI,
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue_Document': {'\$sum': '\$Document'},
            'totalValue_Paid_AMT': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      var data_Br_All = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(query_Br_All)
          .toList();

      var data_Br_Hot_C = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(query_Br_Hot_C)
          .toList();

      var data_Br_UPI = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(query_Br_UPI)
          .toList();

      //

      var data_Sh_All = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(query_Sh_All)
          .toList();

      var data_Sh_Hot_C = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(query_Sh_Hot_C)
          .toList();

      var data_Sh_UPI = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(query_Sh_UPI)
          .toList();

      //

      var data_Rt_All = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(query_Rt_All)
          .toList();

      var data_Rt_Hot_C = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(query_Rt_Hot_C)
          .toList();

      var data_Rt_UPI = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(query_Rt_UPI)
          .toList();

      //

      var data_CCC_All = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(query_CCC_All)
          .toList();

      var data_CCC_Hot_C = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(query_CCC_Hot_C)
          .toList();

      var data_CCC_UPI = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(query_CCC_UPI)
          .toList();

      //

      var data_Ot_All = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(query_Ot_All)
          .toList();

      var data_Ot_Hot_C = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(query_Ot_Hot_C)
          .toList();

      var data_Ot_UPI = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(query_Ot_UPI)
          .toList();

      var br_doc,
          br_vaA,
          br_paA,
          br_HDoc,
          br_HPaA,
          br_UDoc,
          br_UPaA,
          br_bal,
          br_exs;

      var sh_doc,
          sh_vaA,
          sh_paA,
          sh_HDoc,
          sh_HPaA,
          sh_UDoc,
          sh_UPaA,
          sh_bal,
          sh_exs;

      var rt_doc,
          rt_vaA,
          rt_paA,
          rt_HDoc,
          rt_HPaA,
          rt_UDoc,
          rt_UPaA,
          rt_bal,
          rt_exs;

      var ccc_doc,
          ccc_vaA,
          ccc_paA,
          ccc_HDoc,
          ccc_HPaA,
          ccc_UDoc,
          ccc_UPaA,
          ccc_bal,
          ccc_exs;

      var ot_doc,
          ot_vaA,
          ot_paA,
          ot_HDoc,
          ot_HPaA,
          ot_UDoc,
          ot_UPaA,
          ot_bal,
          ot_exs;

      try {
        br_doc = data_Br_All[0]['totalValue_Document'] ?? 0;
      } catch (e) {
        br_doc = 0;
      }

      try {
        br_vaA = data_Br_All[0]['totalValue_Valid_AMT'] ?? 0;
      } catch (e) {
        br_vaA = 0;
      }

      try {
        br_paA = data_Br_All[0]['totalValue_Paid_AMT'] ?? 0;
      } catch (e) {
        br_paA = 0;
      }

      try {
        br_HDoc = data_Br_Hot_C[0]['totalValue_Document'] ?? 0;
      } catch (e) {
        br_HDoc = 0;
      }

      try {
        br_HPaA = data_Br_Hot_C[0]['totalValue_Paid_AMT'] ?? 0;
      } catch (e) {
        br_HPaA = 0;
      }

      try {
        br_UDoc = data_Br_UPI[0]['totalValue_Document'] ?? 0;
      } catch (e) {
        br_UDoc = 0;
      }

      try {
        br_UPaA = data_Br_UPI[0]['totalValue_Paid_AMT'] ?? 0;
      } catch (e) {
        br_UPaA = 0;
      }

      try {
        br_bal = data_Br_All[0]['totalValue_Balance'] ?? 0;
      } catch (e) {
        br_bal = 0;
      }

      try {
        br_exs = data_Br_All[0]['totalValue_Excess'] ?? 0;
      } catch (e) {
        br_exs = 0;
      }
      /////

      ///
      //

      try {
        sh_doc = data_Sh_All[0]['totalValue_Document'] ?? 0;
        print('Br Sh Document is ${data_Sh_All[0]['totalValue_Document']}');
      } catch (e) {
        sh_doc = 0;
        print(e.toString());
      }

      try {
        sh_vaA = data_Sh_All[0]['totalValue_Valid_AMT'] ?? 0;
      } catch (e) {
        sh_vaA = 0;
      }

      try {
        sh_paA = data_Sh_All[0]['totalValue_Paid_AMT'] ?? 0;
      } catch (e) {
        sh_paA = 0;
      }

      try {
        sh_HDoc = data_Sh_Hot_C[0]['totalValue_Document'] ?? 0;
      } catch (e) {
        sh_HDoc = 0;
      }

      try {
        sh_HPaA = data_Sh_Hot_C[0]['totalValue_Paid_AMT'] ?? 0;
      } catch (e) {
        sh_HPaA = 0;
      }

      try {
        sh_UDoc = data_Sh_UPI[0]['totalValue_Document'] ?? 0;
      } catch (e) {
        sh_UDoc = 0;
      }

      try {
        sh_UPaA = data_Sh_UPI[0]['totalValue_Paid_AMT'] ?? 0;
      } catch (e) {
        sh_UPaA = 0;
      }

      try {
        sh_bal = data_Sh_All[0]['totalValue_Balance'] ?? 0;
      } catch (e) {
        sh_bal = 0;
      }

      try {
        sh_exs = data_Sh_All[0]['totalValue_Excess'] ?? 0;
      } catch (e) {
        sh_exs = 0;
      }

      //

      try {
        rt_doc = data_Rt_All[0]['totalValue_Document'] ?? 0;
      } catch (e) {
        br_doc = 0;
      }

      try {
        rt_vaA = data_Rt_All[0]['totalValue_Valid_AMT'] ?? 0;
      } catch (e) {
        rt_vaA = 0;
      }

      try {
        rt_paA = data_Rt_All[0]['totalValue_Paid_AMT'] ?? 0;
      } catch (e) {
        rt_paA = 0;
      }

      try {
        rt_HDoc = data_Rt_Hot_C[0]['totalValue_Document'] ?? 0;
      } catch (e) {
        rt_HDoc = 0;
      }

      try {
        rt_HPaA = data_Rt_Hot_C[0]['totalValue_Paid_AMT'] ?? 0;
      } catch (e) {
        rt_HPaA = 0;
      }

      try {
        rt_UDoc = data_Rt_UPI[0]['totalValue_Document'] ?? 0;
      } catch (e) {
        rt_UDoc = 0;
      }

      try {
        rt_UPaA = data_Rt_UPI[0]['totalValue_Paid_AMT'] ?? 0;
      } catch (e) {
        rt_UPaA = 0;
      }

      try {
        rt_bal = data_Rt_All[0]['totalValue_Balance'] ?? 0;
      } catch (e) {
        rt_bal = 0;
      }

      try {
        rt_exs = data_Rt_All[0]['totalValue_Excess'] ?? 0;
      } catch (e) {
        rt_exs = 0;
      }

      //

      try {
        ccc_doc = data_CCC_All[0]['totalValue_Document'] ?? 0;
      } catch (e) {
        ccc_doc = 0;
      }

      try {
        ccc_vaA = data_CCC_All[0]['totalValue_Valid_AMT'] ?? 0;
      } catch (e) {
        ccc_vaA = 0;
      }

      try {
        ccc_paA = data_CCC_All[0]['totalValue_Paid_AMT'] ?? 0;
      } catch (e) {
        ccc_paA = 0;
      }

      try {
        ccc_HDoc = data_CCC_Hot_C[0]['totalValue_Document'] ?? 0;
      } catch (e) {
        ccc_HDoc = 0;
      }

      try {
        ccc_HPaA = data_CCC_Hot_C[0]['totalValue_Paid_AMT'] ?? 0;
      } catch (e) {
        ccc_HPaA = 0;
      }

      try {
        ccc_UDoc = data_CCC_UPI[0]['totalValue_Document'] ?? 0;
      } catch (e) {
        ccc_UDoc = 0;
      }

      try {
        ccc_UPaA = data_CCC_UPI[0]['totalValue_Paid_AMT'] ?? 0;
      } catch (e) {
        ccc_UPaA = 0;
      }

      try {
        ccc_bal = data_CCC_All[0]['totalValue_Balance'] ?? 0;
      } catch (e) {
        ccc_bal = 0;
      }

      try {
        ccc_exs = data_CCC_All[0]['totalValue_Excess'] ?? 0;
      } catch (e) {
        ccc_exs = 0;
      }

      ///
      //

      try {
        ot_doc = data_Ot_All[0]['totalValue_Document'] ?? 0;
      } catch (e) {
        ot_doc = 0;
      }

      try {
        ot_vaA = data_Ot_All[0]['totalValue_Valid_AMT'] ?? 0;
      } catch (e) {
        ot_vaA = 0;
      }

      try {
        ot_paA = data_Ot_All[0]['totalValue_Paid_AMT'] ?? 0;
      } catch (e) {
        ot_paA = 0;
      }

      try {
        ot_HDoc = data_Ot_Hot_C[0]['totalValue_Document'] ?? 0;
      } catch (e) {
        ot_HDoc = 0;
      }

      try {
        ot_HPaA = data_Ot_Hot_C[0]['totalValue_Paid_AMT'] ?? 0;
      } catch (e) {
        ot_HPaA = 0;
      }

      try {
        ot_UDoc = data_Ot_UPI[0]['totalValue_Document'] ?? 0;
      } catch (e) {
        ot_UDoc = 0;
      }

      try {
        ot_UPaA = data_Ot_UPI[0]['totalValue_Paid_AMT'] ?? 0;
      } catch (e) {
        ot_UPaA = 0;
      }

      try {
        ot_bal = data_Ot_All[0]['totalValue_Balance'] ?? 0;
      } catch (e) {
        ot_bal = 0;
      }

      try {
        ot_exs = data_Ot_All[0]['totalValue_Excess'] ?? 0;
      } catch (e) {
        ot_exs = 0;
      }

      var data_D_Br = [
        br_doc,
        br_vaA,
        br_paA,
        br_HDoc,
        br_HPaA,
        br_UDoc,
        br_UPaA,
        br_bal,
        br_exs
      ];

      var data_D_Sh = [
        sh_doc,
        sh_vaA,
        sh_paA,
        sh_HDoc,
        sh_HPaA,
        sh_UDoc,
        sh_UPaA,
        sh_bal,
        sh_exs
      ];

      var data_D_Rt = [
        rt_doc,
        rt_vaA,
        rt_paA,
        rt_HDoc,
        rt_HPaA,
        rt_UDoc,
        rt_UPaA,
        rt_bal,
        rt_exs
      ];

      var data_D_CCC = [
        ccc_doc,
        ccc_vaA,
        ccc_paA,
        ccc_HDoc,
        ccc_HPaA,
        ccc_UDoc,
        ccc_UPaA,
        ccc_bal,
        ccc_exs
      ];

      var data_D_Ot = [
        ot_doc,
        ot_vaA,
        ot_paA,
        ot_HDoc,
        ot_HPaA,
        ot_UDoc,
        ot_UPaA,
        ot_bal,
        ot_exs
      ];

      print('Data _ D _ Sh: ');
      print(data_D_Sh);

      return [data_D_Br, data_D_Sh, data_D_Rt, data_D_CCC, data_D_Ot];
    } catch (e) {
      print(e.toString());
      print('Section 100 had any issue');
      return [
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0]
      ];
    }
  }
}
