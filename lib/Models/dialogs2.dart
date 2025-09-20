// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_brace_in_string_interps, avoid_types_as_parameter_names, use_build_context_synchronously, unused_import, unnecessary_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:meta_blaster/Tabs/data_entries.dart';
import 'package:meta_blaster/mongoDB/DB_Supporter1.dart';
import 'package:meta_blaster/mongoDB/connect_&_constant.dart';
import 'package:meta_blaster/mongoDB/dataTable_Fetch.dart';

Widget delete_Dialog_For_Customer(
    BuildContext context, Name, Id, userCode, UNameARRAY) {
  return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      child: Container(
          height: 230.0,
          width: 300.0,
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(children: [
            Text('Confirmation',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0)),
            SizedBox(height: 16.0),
            Text(
                'Do you want to delete ${Name}. Are you sure. If you sure, Click yes or you do not want to delete, Click no or click outer the dialog box to close.',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.justify),
            SizedBox(height: 20.0),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              MaterialButton(
                  onPressed: () async {
                    await Db_Supporter_1.Delete_Customers(Id);

                    Navigator.pop(context);
                  },
                  color: Colors.red,
                  child: Text('Yes',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))),
              MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.green,
                  child: Text('No',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)))
            ])
          ])));
}

Widget Modify_Data_For_Customer(BuildContext context, Edit, Delete) {
  return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      child: Container(
          height: 230.0,
          width: 300.0,
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(children: [
            Text('Modification',
                style: TextStyle(
                    color: Colors.orange.shade700,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0)),
            SizedBox(height: 16.0),
            Text(
                'Modify your data here. If you want to Edit your data, Click Edit or do you want to delete, Click Delete or close it? click outer the dialog box to close. And click Cancle to close Dialog',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.justify),
            SizedBox(height: 20.0),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              MaterialButton(
                  onPressed: () {},
                  color: Colors.green,
                  child: Text('Edit',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))),
              MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    showDialog(
                        context: context,
                        builder: (BuildContext) {
                          return Delete;
                        });
                  },
                  color: Colors.red,
                  child: Text('Delete',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))),
              MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.indigo,
                  child: Text('Cancel',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)))
            ])
          ])));
}
