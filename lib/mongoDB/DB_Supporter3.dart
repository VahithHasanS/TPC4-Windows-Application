// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors, non_constant_identifier_names, avoid_print, camel_case_types, prefer_interpolation_to_compose_strings, file_names

import 'package:intl/intl.dart';
import 'package:meta_blaster/mongoDB/connect_&_constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Db_Supporter_3 {
  static Future<void> Delete_IndiPartyies(code) async {
    try {
      await ConnectConstant.db.collection('data').deleteOne({'_id': code});
      print('$code has been deleted from data collection.');
    } catch (e) {
      print("Error : $e");
      print('Someting went wrong on delete customer');
    }
  }

  static Future<dynamic> findLastUpdateLive_IndiPartyies(code, book) async {
    try {
      var data = await ConnectConstant.db.collection('data').findOne(where
          .eq('User_Code', code)
          .eq('Booked_By', book)
          .sortBy('Booking_Date', descending: true));
      return data['Booking_Date'];
    } catch (e) {
      print(e.toString());
      return DateFormat('yyyy-MM-dd').format(DateTime.now());
    }
  }

  static Future<dynamic> findLastUpdateLive_to_Format_IndiPartyies(
      code, book) async {
    dynamic lastDateVar = await findLastUpdateLive_IndiPartyies(code, book);

    try {
      lastDateVar = DateFormat('yyyy-MM-dd').format(
          DateTime.parse(lastDateVar.add(Duration(days: 1)).toString()));
      var lastDate =
          '${DateFormat('E-dd-MMM-yyyy').format(DateTime.parse(lastDateVar))}';
      return lastDate;
    } catch (e) {
      print(e.toString());
      return '${DateFormat('E-dd-MMM-yyyy').format(DateTime.parse(DateTime.now().toString()))}';
    }
  }

  static Future<dynamic> Total_Participation_Report_Bunker_Fetch_Data(
      code, bookedBy) async {
    try {
      dynamic lastDate = await findLastUpdateLive_IndiPartyies(code, bookedBy);

      var aggregationPipeline1 = [
        {
          '\$match': {
            '\$and': [
              {'User_Code': code},
              {'Booked_By': bookedBy},
              {'Account_Type': 'Cash'},
              {'Booking_Date': lastDate}
            ]
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue': {'\$sum': '\$Document'}
          }
        }
      ];

      var aggregationPipeline2 = [
        {
          '\$match': {
            '\$and': [
              {'User_Code': code},
              {'Booked_By': bookedBy},
              {'Account_Type': 'Cash'},
              {'Booking_Date': lastDate}
            ]
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      var aggregationPipeline3 = [
        {
          '\$match': {
            '\$and': [
              {'User_Code': code},
              {'Booked_By': bookedBy},
              {'Account_Type': 'Credit'},
              {'Booking_Date': lastDate}
            ]
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue': {'\$sum': '\$Document'}
          }
        }
      ];

      var aggregationPipeline4 = [
        {
          '\$match': {
            '\$and': [
              {'User_Code': code},
              {'Booked_By': bookedBy},
              {'Account_Type': 'Credit'},
              {'Booking_Date': lastDate}
            ]
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      var aggregationPipeline5 = [
        {
          '\$match': {
            '\$and': [
              {'User_Code': code},
              {'Booked_By': bookedBy},
              {'Payment_Type': 'UPI'},
              {'Booking_Date': lastDate}
            ]
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue': {'\$sum': '\$Document'}
          }
        }
      ];

      var aggregationPipeline6 = [
        {
          '\$match': {
            '\$and': [
              {'User_Code': code},
              {'Booked_By': bookedBy},
              {'Payment_Type': 'UPI'},
              {'Booking_Date': lastDate}
            ]
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      var aggregationPipeline7 = [
        {
          '\$match': {
            '\$and': [
              {'User_Code': code},
              {'Booked_By': bookedBy},
              {'Payment_Type': 'Hot Cash'},
              {'Booking_Date': lastDate}
            ]
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue': {'\$sum': '\$Document'}
          }
        }
      ];

      var aggregationPipeline8 = [
        {
          '\$match': {
            '\$and': [
              {'User_Code': code},
              {'Booked_By': bookedBy},
              {'Payment_Type': 'Hot Cash'},
              {'Booking_Date': lastDate}
            ]
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      var aggregationPipeline9 = [
        {
          '\$match': {
            '\$and': [
              {'User_Code': code},
              {'Booked_By': bookedBy},
              {'Booking_Date': lastDate}
            ]
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue': {'\$sum': '\$Balance_Amount'}
          }
        }
      ];

      var aggregationPipeline10 = [
        {
          '\$match': {
            '\$and': [
              {'User_Code': code},
              {'Booked_By': bookedBy},
              {'Booking_Date': lastDate}
            ]
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue': {'\$sum': '\$Excess_Amount'}
          }
        }
      ];

      var data1 = await ConnectConstant.db
          .collection('data')
          .aggregateToStream(aggregationPipeline1)
          .toList();

      var data2 = await ConnectConstant.db
          .collection('data')
          .aggregateToStream(aggregationPipeline2)
          .toList();

      var data3 = await ConnectConstant.db
          .collection('data')
          .aggregateToStream(aggregationPipeline3)
          .toList();

      var data4 = await ConnectConstant.db
          .collection('data')
          .aggregateToStream(aggregationPipeline4)
          .toList();

      var data5 = await ConnectConstant.db
          .collection('data')
          .aggregateToStream(aggregationPipeline5)
          .toList();

      var data6 = await ConnectConstant.db
          .collection('data')
          .aggregateToStream(aggregationPipeline6)
          .toList();

      var data7 = await ConnectConstant.db
          .collection('data')
          .aggregateToStream(aggregationPipeline7)
          .toList();

      var data8 = await ConnectConstant.db
          .collection('data')
          .aggregateToStream(aggregationPipeline8)
          .toList();

      var data9 = await ConnectConstant.db
          .collection('data')
          .aggregateToStream(aggregationPipeline9)
          .toList();

      var data10 = await ConnectConstant.db
          .collection('data')
          .aggregateToStream(aggregationPipeline10)
          .toList();

      dynamic data_1,
          data_2,
          data_3,
          data_4,
          data_7,
          data_8,
          data_5,
          data_6,
          data_9,
          data_10;

      try {
        data_1 = data1[0]['totalValue'].toDouble();
      } catch (e) {
        data_1 = 0.0;
      }

      try {
        data_2 = data2[0]['totalValue'].toDouble();
      } catch (e) {
        data_2 = 0.0;
      }

      try {
        data_3 = data3[0]['totalValue'].toDouble();
      } catch (e) {
        data_3 = 0.0;
      }

      try {
        data_4 = data4[0]['totalValue'].toDouble();
      } catch (e) {
        data_4 = 0.0;
      }

      try {
        data_5 = data5[0]['totalValue'].toDouble();
      } catch (e) {
        data_5 = 0.0;
      }

      try {
        data_6 = data6[0]['totalValue'].toDouble();
      } catch (e) {
        data_6 = 0.0;
      }

      try {
        data_7 = data7[0]['totalValue'].toDouble();
      } catch (e) {
        data_7 = 0.0;
      }

      try {
        data_8 = data8[0]['totalValue'].toDouble();
      } catch (e) {
        data_8 = 0.0;
      }

      try {
        data_9 = data9[0]['totalValue'].toDouble();
      } catch (e) {
        data_9 = 0.0;
      }

      try {
        data_10 = data10[0]['totalValue'].toDouble();
      } catch (e) {
        data_10 = 0.0;
      }

      //print('finalData : $finalData, ${finalData[0]}');
      List<dynamic> finalList = [
        data_1,
        data_2,
        data_3,
        data_4,
        data_7,
        data_8,
        data_5,
        data_6,
        data_9,
        data_10
      ];

      return finalList;
    } catch (e) {
      print('final error: ' + e.toString());
      return [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    }
  }

  static Future<dynamic> Total_UPI_and_Others_Analytics(code, book) async {
    try {
      dynamic lastDate = await findLastUpdateLive_IndiPartyies(code, book);
      var aggregationPipeline1 = [
        {
          '\$match': {
            '\$and': [
              {'User_Code': code},
              {'Payment_Type': 'Hot Cash'},
              {'Booked_By': book},
              {'Booking_Date': lastDate}
            ]
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      var aggregationPipeline2 = [
        {
          '\$match': {
            '\$and': [
              {'User_Code': code},
              {'Payment_Type': 'UPI'},
              {'Booked_By': book},
              {'Booking_Date': lastDate}
            ]
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      var aggregationPipeline3 = [
        {
          '\$match': {
            '\$and': [
              {'User_Code': code},
              {'Payment_Type': 'Bank Transfer'},
              {'Booked_By': book},
              {'Booking_Date': lastDate}
            ]
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue': {'\$sum': '\$Paid_Amount'}
          }
        }
      ];

      var aggregationPipeline4 = [
        {
          '\$match': {
            '\$and': [
              {'User_Code': code},
              {'Payment_Type': 'Cheque'},
              {'Booked_By': book},
              {'Booking_Date': lastDate}
            ]
          }
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
          .aggregateToStream(aggregationPipeline1)
          .toList();

      var data2 = await ConnectConstant.db
          .collection('data')
          .aggregateToStream(aggregationPipeline2)
          .toList();

      var data3 = await ConnectConstant.db
          .collection('data')
          .aggregateToStream(aggregationPipeline3)
          .toList();

      var data4 = await ConnectConstant.db
          .collection('data')
          .aggregateToStream(aggregationPipeline4)
          .toList();

      dynamic data_1, data_2, data_3, data_4;

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

      List<dynamic> lastVal = [data_1, data_2, data_3, data_4];

      return lastVal;
    } catch (e) {
      print(e.toString());
      return [0.0, 0.0, 0.0, 0.0];
    }
  }
}
