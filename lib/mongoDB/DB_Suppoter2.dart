// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_const_constructors, unnecessary_string_interpolations, avoid_print, file_names, prefer_interpolation_to_compose_strings, curly_braces_in_flow_control_structures

import 'package:intl/intl.dart';
import 'package:meta_blaster/mongoDB/connect_&_constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Db_Supporter_2 {
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

  static Future<dynamic> findLastUpdateLiveHed(code) async {
    try {
      var data = await ConnectConstant.db.collection('headOffice_data').findOne(
          where
              .eq('User_Code', code)
              .sortBy('Submited_Date', descending: true));
      return data['Submited_Date'];
    } catch (e) {
      print(e.toString());
      return DateFormat('yyyy-MM-dd').format(DateTime.now());
    }
  }

  static Future<dynamic> findLastUpdateLive_to_Format_Hed(code) async {
    try {
      dynamic lastDateVar = await findLastUpdateLiveHed(code);

      lastDateVar = DateFormat('yyyy-MM-dd').format(
          DateTime.parse(lastDateVar.add(Duration(days: 1)).toString()));
      var lastDate =
          '${DateFormat('E-dd-MMM-yyyy').format(DateTime.parse(lastDateVar))}';
      return lastDate;
    } catch (e) {
      print(e.toString());
      return DateFormat('yyyy-MM-dd').format(DateTime.now());
    }
  }

  static Future<dynamic> HeadOffice_Report_Bunker_Fetch_Data(code) async {
    try {
      dynamic lastDate = await findLastUpdateLiveHed(code);

      var aggregationPipeline1 = [
        {
          '\$match': {
            '\$and': [
              {'User_Code': code},
              {'Submited_Date': lastDate}
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
              {'Submited_Date': lastDate}
            ]
          }
        },
        {
          '\$group': {
            '_id': null,
            'totalValue': {'\$sum': '\$Valid_Amount'}
          }
        }
      ];

      var aggregationPipeline3 = [
        {
          '\$match': {
            '\$and': [
              {'User_Code': code},
              {'Submited_Date': lastDate}
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

      var aggregationPipeline4 = [
        {
          '\$match': {
            '\$and': [
              {'User_Code': code},
              {'Submited_Date': lastDate}
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

      var aggregationPipeline5 = [
        {
          '\$match': {
            '\$and': [
              {'User_Code': code},
              {'Submited_Date': lastDate}
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
          .collection('headOffice_data')
          .aggregateToStream(aggregationPipeline1)
          .toList();

      var data2 = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(aggregationPipeline2)
          .toList();

      var data3 = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(aggregationPipeline3)
          .toList();

      var data4 = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(aggregationPipeline4)
          .toList();

      var data5 = await ConnectConstant.db
          .collection('headOffice_data')
          .aggregateToStream(aggregationPipeline5)
          .toList();

      dynamic data_1, data_2, data_3, data_4, data_5, data_6;

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
        if (data3[0]['totalValue'] <= 0) {
          data_6 = 0.0;
        } else {
          data_6 = (data5[0]['totalValue']) - (data3[0]['totalValue']);
          data_6 = data_6.toDouble();
        }
      } catch (e) {
        data_6 = 0.0;
      }

      //print('finalData : $finalData, ${finalData[0]}');
      List<dynamic> finalList = [
        data_1 ?? 0.0,
        data_2 ?? 0.0,
        data_3 ?? 0.0,
        data_4 ?? 0.0,
        data_5 ?? 0.0,
        data_6 ?? 0.0
      ];

      return finalList;
    } catch (e) {
      print('final error: ' + e.toString());
      return [0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
    }
  }
}
