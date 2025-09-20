// ignore_for_file: camel_case_types, file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables, sized_box_for_whitespace, unused_field, avoid_print, unused_import, avoid_types_as_parameter_names, unused_local_variable, curly_braces_in_flow_control_structures, unnecessary_type_check, avoid_unnecessary_containers, unnecessary_new, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, use_build_context_synchronously, constant_identifier_names, await_only_futures, unused_element

import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:meta_blaster/Models/dialogs1.dart';
import 'package:meta_blaster/Models/dialogs2.dart';
import 'package:meta_blaster/Models/module/constModules.dart';
import 'package:meta_blaster/Models/smallWidgets.dart';
import 'package:meta_blaster/mongoDB/DB_Supporter1.dart';
import 'package:meta_blaster/mongoDB/connect_&_constant.dart';
import 'package:meta_blaster/mongoDB/dataTable_Fetch.dart';
import 'package:meta_blaster/mongoDB/expenseDB1.dart';

class Data_Entries_Tab extends StatefulWidget {
  final UName, UEmail, userCode;
  const Data_Entries_Tab(
      {super.key,
      required this.UName,
      required this.UEmail,
      required this.userCode});

  @override
  State<Data_Entries_Tab> createState() => _Data_Entries_TabState();
}

class _Data_Entries_TabState extends State<Data_Entries_Tab> {
  TextEditingController CustomerName = TextEditingController();
  TextEditingController Document = TextEditingController();
  TextEditingController ValidAmt = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController Remarks = TextEditingController();
  TextEditingController PaidAmt = TextEditingController();
  TextEditingController BalAmt = TextEditingController();
  TextEditingController ExsAmt = TextEditingController();
  TextEditingController IsPaidCont = TextEditingController();

  TextEditingController DocumentHed = TextEditingController();
  TextEditingController ValidAmtHed = TextEditingController();
  TextEditingController dateinputHed = TextEditingController();
  TextEditingController RemarksHed = TextEditingController();
  TextEditingController PaidAmtHed = TextEditingController();
  TextEditingController BalAmtHed = TextEditingController();
  TextEditingController ExsAmtHed = TextEditingController();
  TextEditingController IsPaidContHed = TextEditingController();

  TextEditingController date_exp = TextEditingController();
  TextEditingController expenseBy_exp = TextEditingController();
  TextEditingController GetAMT_exp = TextEditingController();
  TextEditingController expenseAMT_exp = TextEditingController();
  TextEditingController balanceAMT_exp = TextEditingController();
  TextEditingController excessAMT_exp = TextEditingController();
  TextEditingController use_exp = TextEditingController();
  TextEditingController remarks_exp = TextEditingController();
  TextEditingController NoneOfThese_exp = TextEditingController();

  static const List<String> list = <String>['Cash', 'Credit', 'Other', 'Null'];

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  final FocusNode _focusNode5 = FocusNode();
  final FocusNode _focusNode6 = FocusNode();
  final FocusNode _focusNode7 = FocusNode();
  final FocusNode _focusNode8 = FocusNode();
  final FocusNode _focusNode9 = FocusNode();
  final FocusNode _focusNodeNull = FocusNode();
  final FocusNode _focusNodeNull1 = FocusNode();
  final FocusNode _focusNodeNull2 = FocusNode();
  final FocusNode _focusNodeNull3 = FocusNode();

  final FocusNode _focusNode1_H = FocusNode();
  final FocusNode _focusNode2_H = FocusNode();
  final FocusNode _focusNode3_H = FocusNode();
  final FocusNode _focusNode4_H = FocusNode();
  final FocusNode _focusNode5_H = FocusNode();
  final FocusNode _focusNode6_H = FocusNode();
  final FocusNode _focusNode7_H = FocusNode();
  final FocusNode _focusNode8_H = FocusNode();
  final FocusNode _focusNodeNull_H = FocusNode();
  final FocusNode _focusNodeNull1_H = FocusNode();
  final FocusNode _focusNodeNull2_H = FocusNode();
  final FocusNode _focusNodeNull3_H = FocusNode();

  final FocusNode _focusNode1_E = FocusNode();
  final FocusNode _focusNode2_E = FocusNode();
  final FocusNode _focusNode3_E = FocusNode();
  final FocusNode _focusNode4_E = FocusNode();
  final FocusNode _focusNode5_E = FocusNode();
  final FocusNode _focusNode6_E = FocusNode();
  final FocusNode _focusNode7_E = FocusNode();
  final FocusNode _focusNode8_E = FocusNode();
  final FocusNode _focusNode9_E = FocusNode();
  final FocusNode _focusNodeNull_E = FocusNode();
  final FocusNode _focusNodeNull1_E = FocusNode();
  final FocusNode _focusNodeNull2_E = FocusNode();

  final GlobalKey _dropdownKey1 = GlobalKey();
  final GlobalKey _dropdownKey2 = GlobalKey();
  final GlobalKey _dropdownKey3 = GlobalKey();
  final GlobalKey _dropdownKey1_H = GlobalKey();
  final GlobalKey _dropdownKey2_H = GlobalKey();
  final GlobalKey _dropdownKey1_E = GlobalKey();

  static const List<String> payment = <String>[
    'Hot Cash',
    'UPI',
    'Bank Transfer',
    'Cheque'
  ];
  static const List<String> paymentHed = <String>[
    'Hot Cash',
    'UPI',
    'Bank Transfer',
    'Cheque'
  ];
  void fun() {}
  static const List<String> bookedBy = <String>[
    'Shajahan',
    'Branch Pc-4',
    'Root',
    'CCC',
    'Other'
  ];
  static const List<String> bookedByHed = <String>[
    'Shajahan',
    'Branch Pc-4',
    'Root',
    'CCC',
    'Other'
  ];

  static const List<String> isPaid = <String>['Paid', 'Un Paid', 'Pending'];
  static const List<String> isPaidHed = <String>['Paid', 'Un Paid', 'Pending'];

  static List<String> getFrom_exp = <String>[
    'Branch Pc-4',
    'Shajahan',
    'Ayiesha',
    'Head Office',
    'Other Branch',
    'Office Booking Amount',
    'Line Booking Amount',
    'Vahith Hasan',
    'Vajith Husan',
    'Third Party',
    'Other',
    'None of Above'
  ];

  String dropdownValue = list.first;
  String paymentValue = payment.first;
  String BookedByValue = bookedBy.first;
  String isPaidValue = isPaid.first;
  String isPaidValueHed = isPaidHed.first;
  String BookedByValueHed = bookedByHed.first;
  String paymentValueHed = paymentHed.first;
  String GetFrom_EXP = getFrom_exp.first;

  dynamic lenfinder_01 = '0';

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    _focusNode5.dispose();
    _focusNode6.dispose();
    _focusNode7.dispose();
    _focusNode8.dispose();
    _focusNode9.dispose();
    _focusNodeNull.dispose();
    _focusNode1_H.dispose();
    _focusNode2_H.dispose();
    _focusNode3_H.dispose();
    _focusNode4_H.dispose();
    _focusNode5_H.dispose();
    _focusNode6_H.dispose();
    _focusNode7_H.dispose();
    _focusNode8_H.dispose();
    _focusNode1_E.dispose();
    _focusNode2_E.dispose();
    _focusNode3_E.dispose();
    _focusNode4_E.dispose();
    _focusNode5_E.dispose();
    _focusNode6_E.dispose();
    _focusNode7_E.dispose();
    _focusNode8_E.dispose();
    _focusNode9_E.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    dateinput.text.isEmpty
        ? dateinput.text = DateFormat('yyyy-MM-dd').format(DateTime.now())
        : null;

    dateinputHed.text.isEmpty
        ? dateinputHed.text = DateFormat('yyyy-MM-dd').format(DateTime.now())
        : null;
    date_exp.text.isEmpty
        ? date_exp.text = DateFormat('yyyy-MM-dd').format(DateTime.now())
        : null;
  }

  KeyEventResult _handleKeyPress(
      FocusNode currentFocus, FocusNode nextFocus, RawKeyEvent event) {
    if (event is RawKeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.enter) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  void _openDropdown(GlobalKey key) {
    final dynamic dropdownField = key.currentState;
    if (dropdownField is StatefulElement) {
      final dynamic state = dropdownField.state;
      state?.setState(() {
        state?.widget.onTap?.call();
      });
    }
  }

  void onButtonPressed() async {
    if (CustomerName.text.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0)),
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.height / 2,
                    child: Column(children: [
                      Text("Customer name won't be empty",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16.5,
                              fontWeight: FontWeight.w500)),
                      Image.network(
                          'https://cdni.iconscout.com/illustration/premium/thumb/error-404-8291016-6632147.png',
                          height: 250.0,
                          width: 250.0),
                      Text(
                          'This field will not be empty, So please enter with valid costomer name to register their daily data for monthly invoice.',
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15.5,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center)
                    ])));
          });
    } else {
      DateTime bookingDateCont;
      int documentCont;
      double validCont;
      double paidCont;
      double balanceCont;
      double excessCont;

      CustomerName.text = CustomerName.text.toUpperCase();

      if (BalAmt.text.isEmpty) {
        BalAmt.text = '0';
        balanceCont = double.parse(BalAmt.text);
        assert(balanceCont is double);
      } else {
        balanceCont = double.parse(BalAmt.text);
        assert(balanceCont is double);
      }

      if (ExsAmt.text.isEmpty) {
        ExsAmt.text = '0';
        excessCont = double.parse(ExsAmt.text);
        assert(excessCont is double);
      } else {
        excessCont = double.parse(ExsAmt.text);
        assert(excessCont is double);
      }

      if (dateinput.text.isEmpty) {
        bookingDateCont =
            DateFormat("yyyy-MM-dd").parse(DateTime.now().toString());
      } else {
        bookingDateCont =
            new DateFormat("yyyy-MM-dd").parse(dateinput.text.toString());
      }

      if (Document.text.isEmpty) {
        Document.text = '1';
        documentCont = int.parse(Document.text);
        assert(documentCont is int);
      } else {
        documentCont = int.parse(Document.text);
        assert(documentCont is int);
      }

      if (ValidAmt.text.isEmpty && PaidAmt.text.isEmpty) {
        ValidAmt.text = '50';
        PaidAmt.text = '50';
        validCont = double.parse(ValidAmt.text);
        assert(validCont is double);

        paidCont = double.parse(PaidAmt.text);
        assert(paidCont is double);
      } else {
        validCont = double.parse(ValidAmt.text);
        assert(validCont is double);

        paidCont = double.parse(PaidAmt.text);
        assert(paidCont is double);
      }

      if (Remarks.text.isEmpty) {
        Remarks.text = 'NONE';
      } else {
        Remarks.text = Remarks.text.toUpperCase();
      }

      if (IsPaidCont.text.isEmpty) {
        IsPaidCont.text = 'Paid';
      }

      setState(() {
        ConnectConstant.entryFetchList(widget.userCode);
      });

      await ConnectConstant.insert_Records_Daily(
          CustomerName.text,
          bookingDateCont,
          documentCont,
          validCont,
          paidCont,
          dropdownValue,
          paymentValue,
          balanceCont,
          excessCont,
          BookedByValue,
          IsPaidCont.text,
          Remarks.text,
          widget.userCode);

      CustomerName.clear();
      //dateinput.clear();
      Document.clear();
      ValidAmt.clear();
      PaidAmt.clear();
      BalAmt.clear();
      ExsAmt.clear();
      IsPaidCont.clear();
      Remarks.clear();

      setState(() {
        BookedByValue = bookedBy.first;
        paymentValue = payment.first;
        dropdownValue = list.first;
      });
    }
  }

  void onButtonPressed2() async {
    DateTime bookingDateContHed;
    int documentContHed;
    double validContHed;
    double paidContHed;
    double balanceContHed;
    double excessContHed;

    if (BalAmtHed.text.isEmpty) {
      BalAmtHed.text = '0';
      balanceContHed = double.parse(BalAmtHed.text);
      assert(balanceContHed is double);
    } else {
      balanceContHed = double.parse(BalAmtHed.text);
      assert(balanceContHed is double);
    }

    if (ExsAmtHed.text.isEmpty) {
      ExsAmtHed.text = '0';
      excessContHed = double.parse(ExsAmtHed.text);
      assert(excessContHed is double);
    } else {
      excessContHed = double.parse(ExsAmtHed.text);
      assert(excessContHed is double);
    }

    if (dateinputHed.text.isEmpty) {
      bookingDateContHed =
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString());
    } else {
      bookingDateContHed =
          new DateFormat("yyyy-MM-dd").parse(dateinputHed.text.toString());
    }

    if (DocumentHed.text.isEmpty) {
      DocumentHed.text = '1';
      documentContHed = int.parse(DocumentHed.text);
      assert(documentContHed is int);
    } else {
      documentContHed = int.parse(DocumentHed.text);
      assert(documentContHed is int);
    }

    if (ValidAmtHed.text.isEmpty && PaidAmtHed.text.isEmpty) {
      ValidAmtHed.text = '50';
      PaidAmtHed.text = '50';
      validContHed = double.parse(ValidAmtHed.text);
      assert(validContHed is double);

      paidContHed = double.parse(PaidAmtHed.text);
      assert(paidContHed is double);
    } else {
      validContHed = double.parse(ValidAmtHed.text);
      assert(validContHed is double);

      paidContHed = double.parse(PaidAmtHed.text);
      assert(paidContHed is double);
    }

    if (RemarksHed.text.isEmpty) {
      RemarksHed.text = 'NONE';
    } else {
      RemarksHed.text = RemarksHed.text.toUpperCase();
    }

    if (IsPaidContHed.text.isEmpty) {
      IsPaidContHed.text = 'Paid';
    }

    await ConnectConstant.insert_Records_Head_Office(
        bookingDateContHed,
        documentContHed,
        validContHed,
        paidContHed,
        paymentValueHed,
        balanceContHed,
        excessContHed,
        BookedByValueHed,
        IsPaidContHed.text,
        RemarksHed.text,
        widget.userCode);

    dateinputHed.clear();
    DocumentHed.clear();
    ValidAmtHed.clear();
    PaidAmtHed.clear();
    BalAmtHed.clear();
    ExsAmtHed.clear();
    IsPaidContHed.clear();
    RemarksHed.clear();

    setState(() {
      paymentValueHed = paymentHed.first;
      BookedByValueHed = bookedByHed.first;
    });
  }

  void onButtonPressed3() async {
    DateTime expenseDate_var;

    double getAMT_var;
    double expAMT_var;
    double balanceAMT_var;
    double excessAMT_var;

    if ((expenseBy_exp.text.isEmpty || use_exp.text.isEmpty) ||
        (expenseBy_exp.text.isEmpty && use_exp.text.isEmpty)) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0)),
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.height / 2,
                    child: Column(children: [
                      Text("Expense By and for use won't be empty",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16.5,
                              fontWeight: FontWeight.w500)),
                      Image.network(
                          'https://cdni.iconscout.com/illustration/premium/thumb/error-404-8291016-6632147.png',
                          height: 250.0,
                          width: 250.0),
                      Text(
                          'This field will not be empty, So please enter with valid name to register their expense data for invoice.',
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15.5,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center)
                    ])));
          });
    } else {
      if (balanceAMT_exp.text.isEmpty) {
        balanceAMT_exp.text = '0';
        balanceAMT_var = double.parse(balanceAMT_exp.text);
        assert(balanceAMT_var is double);
      } else {
        balanceAMT_var = double.parse(balanceAMT_exp.text);
        assert(balanceAMT_var is double);
      }

      if (excessAMT_exp.text.isEmpty) {
        excessAMT_exp.text = '0';
        excessAMT_var = double.parse(excessAMT_exp.text);
        assert(excessAMT_var is double);
      } else {
        excessAMT_var = double.parse(excessAMT_exp.text);
        assert(excessAMT_var is double);
      }

      if (date_exp.text.isEmpty) {
        expenseDate_var =
            DateFormat("yyyy-MM-dd").parse(DateTime.now().toString());
      } else {
        expenseDate_var =
            new DateFormat("yyyy-MM-dd").parse(date_exp.text.toString());
      }

      if (GetAMT_exp.text.isEmpty && expenseAMT_exp.text.isEmpty) {
        GetAMT_exp.text = '50';
        expenseAMT_exp.text = '50';
        getAMT_var = double.parse(GetAMT_exp.text);
        assert(getAMT_var is double);

        expAMT_var = double.parse(expenseAMT_exp.text);
        assert(expAMT_var is double);
      } else {
        getAMT_var = double.parse(GetAMT_exp.text);
        assert(getAMT_var is double);

        expAMT_var = double.parse(expenseAMT_exp.text);
        assert(expAMT_var is double);
      }

      if (remarks_exp.text.isEmpty) {
        remarks_exp.text = 'NONE';
      } else {
        remarks_exp.text = remarks_exp.text.toUpperCase();
      }

      await ExpenseDB_1.Expense_InsertData(
          widget.userCode,
          expenseDate_var,
          expenseBy_exp.text.toUpperCase(),
          getAMT_var,
          expAMT_var,
          balanceAMT_var,
          excessAMT_var,
          GetFrom_EXP,
          use_exp.text.toUpperCase(),
          remarks_exp.text.toString());

      date_exp.clear();
      expenseBy_exp.clear();
      expenseAMT_exp.clear();
      GetAMT_exp.clear();
      balanceAMT_exp.clear();
      excessAMT_exp.clear();
      NoneOfThese_exp.clear();
      use_exp.clear();
      remarks_exp.clear();
      setState(() {
        GetFrom_EXP = getFrom_exp.first;
      });
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width / 2.0,
                    child: Text('Daily entry report form',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: Colors.black54))),
                Container(
                    padding: EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: Text('Head Office entry report form',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: Colors.black54)))
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.all(20.0),
                    height: MediaQuery.of(context).size.height / 1.30,
                    width: MediaQuery.of(context).size.width / 2.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(
                                1.0,
                                1.0,
                              ),
                              blurRadius: 3.0,
                              spreadRadius: 0.0), //BoxShadow
                          BoxShadow(
                              color: Colors.black38,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0)
                        ],
                        color: Colors.white),
                    child: Column(children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 5.0,
                                    child: TextField(
                                      controller: dateinput,
                                      decoration: InputDecoration(
                                        labelText: "Booking Date",
                                        suffixIcon: Icon(Icons.calendar_month),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 10),
                                      ),
                                      readOnly: true,
                                      onTap: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2000),
                                                lastDate: DateTime(2101));

                                        if (pickedDate != null) {
                                          print(pickedDate);
                                          String formattedDate =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(pickedDate);
                                          print(formattedDate);

                                          setState(() {
                                            dateinput.text = formattedDate;
                                          });
                                        } else {
                                          var now = DateTime.now();

                                          var date = DateFormat('yyyy-MM-dd')
                                              .format(now);
                                          dateinput.text = date;
                                        }
                                      },
                                    )),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 5.0,
                                    child: inputFields001(
                                        context,
                                        false,
                                        TextInputType.text,
                                        CustomerName,
                                        'Customer Name',
                                        'Enter customer name to save the customer for another booking',
                                        Icons.person,
                                        _focusNode1,
                                        _focusNode2))
                              ])),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 5.0),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 5.0,
                              child: inputFields001(
                                  context,
                                  false,
                                  TextInputType.number,
                                  Document,
                                  'No of Document',
                                  'Enter no of document for counting',
                                  Icons.file_present,
                                  _focusNode2,
                                  _focusNode3),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 5.0,
                                child: TextFormField(
                                    focusNode: _focusNode3,
                                    keyboardType: TextInputType.number,
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (_) {
                                      FocusScope.of(context)
                                          .requestFocus(_focusNode4);
                                    },
                                    maxLength: 8,
                                    controller: ValidAmt,
                                    readOnly: false,
                                    onChanged: (dynamic) {
                                      var value;
                                      if (PaidAmt.text.isEmpty) {
                                        var pay = 0;
                                        var val = 0;
                                        PaidAmt.text = '0';

                                        try {
                                          pay = int.parse(
                                              PaidAmt.text.toString());
                                          assert(pay is int);
                                          val = int.parse(
                                              ValidAmt.text.toString());
                                          assert(val is int);
                                        } catch (e) {
                                          pay = 0;
                                          val = 0;
                                        }

                                        if (pay < val) {
                                          value = val - pay;

                                          setState(() {
                                            BalAmt.text = value.toString();
                                            ExsAmt.text = '0';
                                            if (pay < 1) {
                                              IsPaidCont.text = 'Un Paid';
                                            } else {
                                              IsPaidCont.text = 'Pending';
                                            }
                                          });
                                        } else {
                                          value = pay - val;

                                          setState(() {
                                            ExsAmt.text = value.toString();
                                            BalAmt.text = '0';
                                            IsPaidCont.text = 'Paid';
                                          });
                                        }
                                      } else {
                                        var pay;
                                        var val;
                                        try {
                                          pay = int.parse(
                                              PaidAmt.text.toString());
                                          assert(pay is int);
                                          val = int.parse(
                                              ValidAmt.text.toString());
                                          assert(val is int);
                                        } catch (e) {
                                          pay = 0;
                                          val = 0;
                                        }

                                        if (pay < val) {
                                          value = val - pay;

                                          setState(() {
                                            BalAmt.text = value.toString();
                                            ExsAmt.text = '0';
                                            if (pay < 1) {
                                              IsPaidCont.text = 'Un Paid';
                                            } else {
                                              IsPaidCont.text = 'Pending';
                                            }
                                          });
                                        } else {
                                          value = pay - val;

                                          setState(() {
                                            ExsAmt.text = value.toString();
                                            BalAmt.text = '0';
                                            IsPaidCont.text = 'Paid';
                                          });
                                        }
                                      }
                                    },
                                    decoration: InputDecoration(
                                        labelText: 'Valid Amount',
                                        labelStyle: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w500),
                                        hintText:
                                            'Enter valid amount for the package booking',
                                        hintStyle: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 14.6),
                                        suffixIcon: Icon(Icons.currency_rupee)),
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0))),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 5.0,
                              child: TextFormField(
                                  focusNode: _focusNode4,
                                  keyboardType: TextInputType.number,
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(_focusNode5);
                                  },
                                  maxLength: 8,
                                  controller: PaidAmt,
                                  readOnly: false,
                                  onChanged: (dynamic) {
                                    var value;
                                    if (ValidAmt.text.isEmpty) {
                                      var val = 0;
                                      var pay = 0;
                                      ValidAmt.text = '0';

                                      try {
                                        val =
                                            int.parse(ValidAmt.text.toString());
                                        assert(val is int);

                                        pay =
                                            int.parse(PaidAmt.text.toString());
                                        assert(pay is int);
                                      } catch (e) {
                                        pay = 0;
                                        val = 0;
                                      }

                                      if (pay > val) {
                                        value = pay - val;

                                        setState(() {
                                          ExsAmt.text = value.toString();
                                          BalAmt.text = '0';

                                          IsPaidCont.text = 'Pending';
                                        });
                                      } else {
                                        value = val - pay;

                                        setState(() {
                                          BalAmt.text = value.toString();
                                          ExsAmt.text = '0';
                                          if (pay < 1) {
                                            IsPaidCont.text = 'Un Paid';
                                          } else {
                                            IsPaidCont.text = 'Pending';
                                          }
                                        });
                                      }
                                    } else {
                                      var pay;
                                      var val;
                                      try {
                                        pay =
                                            int.parse(PaidAmt.text.toString());
                                        assert(pay is int);
                                        val =
                                            int.parse(ValidAmt.text.toString());
                                      } catch (e) {
                                        pay = 0;
                                        val = 0;
                                      }
                                      assert(val is int);
                                      if (pay < val) {
                                        value = val - pay;

                                        setState(() {
                                          BalAmt.text = value.toString();
                                          ExsAmt.text = '0';
                                          if (pay < 1) {
                                            IsPaidCont.text = 'Un Paid';
                                          } else {
                                            IsPaidCont.text = 'Pending';
                                          }
                                        });
                                      } else {
                                        value = pay - val;

                                        setState(() {
                                          ExsAmt.text = value.toString();
                                          BalAmt.text = '0';
                                          IsPaidCont.text = 'Paid';
                                        });
                                      }
                                    }
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'Paid Amount',
                                      labelStyle: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500),
                                      hintText:
                                          'Enter paid amount amount recieved from the consignee',
                                      hintStyle: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 14.6),
                                      suffixIcon: Icon(Icons.call_received)),
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0)),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 5.0,
                                child: Focus(
                                  focusNode: _focusNode5,
                                  onFocusChange: (hasFocus) {
                                    if (hasFocus) {
                                      _openDropdown(_dropdownKey1);
                                      // Dropdowns don't auto-focus, so we manually open it if needed
                                      // No direct way to programmatically open DropdownButton, so this is more of a user prompt
                                    }
                                  },
                                  child: DropdownButtonFormField<String>(
                                    key: _dropdownKey1,
                                    value: dropdownValue,
                                    icon: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 230.0),
                                      child: Icon(Icons.account_balance),
                                    ),
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                    onChanged: (String? value) {
                                      // This is called when the user selects an item.
                                      setState(() {
                                        dropdownValue = value!;
                                      });
                                      FocusScope.of(context).requestFocus(
                                          _focusNode6); // Move focus to next field
                                    },
                                    items: list.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 5.0,
                              child: Focus(
                                focusNode: _focusNode6,
                                onFocusChange: (hasFocus) {
                                  if (hasFocus) {
                                    _openDropdown(_dropdownKey2);
                                    // Dropdowns don't auto-focus, so we manually open it if needed
                                    // No direct way to programmatically open DropdownButton, so this is more of a user prompt
                                  }
                                },
                                child: DropdownButtonFormField<String>(
                                  key: _dropdownKey2,
                                  value: paymentValue,
                                  hint: Text('Payment Type'),
                                  icon: Padding(
                                    padding: const EdgeInsets.only(left: 180.0),
                                    child: Icon(Icons.payment),
                                  ),
                                  elevation: 16,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      paymentValue = value!;
                                    });
                                    FocusScope.of(context)
                                        .requestFocus(_focusNode7);
                                  },
                                  items: payment.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 5.0,
                              child: inputFields001(
                                  context,
                                  true,
                                  TextInputType.number,
                                  BalAmt,
                                  'Balance Amount',
                                  'Automatically fill the balance amount',
                                  Icons.move_down,
                                  _focusNodeNull1,
                                  _focusNodeNull2),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 5.0,
                              child: inputFields001(
                                  context,
                                  true,
                                  TextInputType.number,
                                  ExsAmt,
                                  'Excess Amount',
                                  'Automatically fill the excess amount',
                                  Icons.move_up,
                                  _focusNodeNull2,
                                  _focusNodeNull3),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 5.0,
                              child: Focus(
                                focusNode: _focusNode7,
                                onFocusChange: (hasFocus) {
                                  if (hasFocus) {
                                    _openDropdown(_dropdownKey3);
                                    // Dropdowns don't auto-focus, so we manually open it if needed
                                    // No direct way to programmatically open DropdownButton, so this is more of a user prompt
                                  }
                                },
                                child: DropdownButtonFormField<String>(
                                  key: _dropdownKey3,
                                  value: BookedByValue,
                                  hint: Text('Booked By'),
                                  icon: Padding(
                                    padding: const EdgeInsets.only(left: 195.0),
                                    child: Icon(Icons.person_2),
                                  ),
                                  elevation: 16,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      BookedByValue = value!;
                                    });

                                    FocusScope.of(context)
                                        .requestFocus(_focusNode8);
                                  },
                                  items: bookedBy.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 5.0,
                                child: inputFields001(
                                    context,
                                    true,
                                    TextInputType.text,
                                    IsPaidCont,
                                    'Is Paid',
                                    'Automatically fill the Paid Status',
                                    Icons.move_down,
                                    _focusNodeNull3,
                                    FocusNode()))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: inputFields001(
                            context,
                            false,
                            TextInputType.number,
                            Remarks,
                            'Remarks section',
                            'Enter if you had any remarks about this customer, please mention it.',
                            Icons.mark_as_unread,
                            _focusNode8,
                            _focusNode9),
                      ),
                      Spacer(),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 30.0),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Focus(
                                      focusNode: _focusNode9,
                                      onKey:
                                          (FocusNode node, RawKeyEvent event) {
                                        if (event is RawKeyDownEvent &&
                                            event.logicalKey ==
                                                LogicalKeyboardKey.enter) {
                                          onButtonPressed(); // Call the button action when Enter is pressed
                                          FocusScope.of(context)
                                              .requestFocus(_focusNode1);
                                          return KeyEventResult.handled;
                                        }
                                        return KeyEventResult.ignored;
                                      },
                                      child: MaterialButton(
                                          //autofocus: true,
                                          color: Colors.green.shade500,
                                          hoverColor: Colors.greenAccent,
                                          splashColor: Colors.green.shade800,
                                          focusColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(3.0)),
                                          onPressed: () async {
                                            onButtonPressed();
                                            FocusScope.of(context)
                                                .requestFocus(_focusNode1);
                                          },
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30.0, vertical: 15.0),
                                          child: Text(
                                            'Submit',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18.0),
                                          )),
                                    ),
                                    SizedBox(width: 30.0),
                                    MaterialButton(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30.0, vertical: 15.0),
                                        color: Colors.red,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(3.0)),
                                        onPressed: () {
                                          CustomerName.clear();
                                          dateinput.clear();
                                          Document.clear();
                                          ValidAmt.clear();
                                          PaidAmt.clear();
                                          BalAmt.clear();
                                          ExsAmt.clear();
                                          Remarks.clear();
                                        },
                                        child: Text(
                                          'Clear all',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.0),
                                        ))
                                  ]),
                            ),
                            Container(
                                padding: EdgeInsets.all(5.0),
                                width: MediaQuery.of(context).size.width / 4.0,
                                height: 135.0,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          offset: const Offset(
                                            1.0,
                                            1.0,
                                          ),
                                          blurRadius: 3.0,
                                          spreadRadius: 0.0), //BoxShadow
                                      BoxShadow(
                                          color: Colors.black38,
                                          offset: const Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0)
                                    ]),
                                child: Column(children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                ConnectConstant.entryFetchList(
                                                    widget.userCode);
                                              });
                                            },
                                            icon: Icon(Icons.refresh,
                                                color: Colors.black45)),
                                        Text("Today's Deal:  ${lenfinder_01}",
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0)),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.expand),
                                            color: Colors.black45)
                                      ]),
                                  Container(
                                      width: double.infinity,
                                      height: 85.0,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      child: FutureBuilder(
                                          future:
                                              ConnectConstant.entryFetchList(
                                                  widget.userCode),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              lenfinder_01 = snapshot
                                                      .data?.length
                                                      .toString() ??
                                                  "0";
                                              //
                                              return Center(
                                                  child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.15,
                                                      height: 250.0,
                                                      child: Center(
                                                          child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          CircularProgressIndicator(),
                                                          SizedBox(
                                                              height: 15.0),
                                                          Text(
                                                            'Loading...',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20.0),
                                                          )
                                                        ],
                                                      ))));
                                            } else if (snapshot.hasError) {
                                              return Center(
                                                  child: Text(
                                                      'Error: ${snapshot.error}',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      textAlign:
                                                          TextAlign.center));
                                            } else if (!snapshot.hasData ||
                                                snapshot.data!.isEmpty) {
                                              return Center(
                                                  child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.15,
                                                      height: 65.0,
                                                      child: Image(
                                                          image: NetworkImage(
                                                              'https://elements-cover-images-0.imgix.net/41ce1856-ce64-47eb-9cc9-d50c75ba936b?auto=compress%2Cformat&w=1370&fit=max&s=e2aafc4ef1374981f2c8728c846dbe33'))),
                                                  Text('No Data Found',
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                      textAlign:
                                                          TextAlign.center)
                                                ],
                                              ));
                                            } else {
                                              dynamic data = snapshot.data;
                                              lenfinder_01 =
                                                  data.length.toString();

                                              return ListView.builder(
                                                itemCount: data
                                                    .length, // Ensure 'data' is a List and not null.
                                                itemBuilder: (context, index) {
                                                  var item = data[
                                                      index]; // Get the current item in the list.
                                                  return Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4.0),
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[100],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    child: ListTile(
                                                      selectedColor:
                                                          Colors.grey.shade200,
                                                      leading: Container(
                                                        padding:
                                                            EdgeInsets.all(1.0),
                                                        decoration: BoxDecoration(
                                                            color:
                                                                item.status ==
                                                                        'Paid'
                                                                    ? Colors
                                                                        .green
                                                                    : Colors
                                                                        .red,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0)),
                                                        child: Container(
                                                            height: 42.5,
                                                            width: 42.5,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0)),
                                                            child: Center(
                                                                child: Text(
                                                                    '${item.Name[0]}',
                                                                    style: TextStyle(
                                                                        color:
                                                                            Colors
                                                                                .black45,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontSize:
                                                                            20.0),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center))),
                                                      ),
                                                      title: Text(
                                                        item.Name, // Assuming 'Name' is a field in your data model.
                                                        style: TextStyle(
                                                          color: Colors.black54,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      subtitle: Text(
                                                        item.status, // Assuming 'status' is a field in your data model.
                                                        style: TextStyle(
                                                          color: item.status ==
                                                                  'Paid'
                                                              ? Colors.green
                                                              : Colors
                                                                  .red, // Change color based on payment status.
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      trailing: IconButton(
                                                        onPressed: () {
                                                          // Define your edit action here.
                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext) {
                                                                return Dialog(
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(12.0))),
                                                                    child: Container(
                                                                        height: 230.0,
                                                                        width: 300.0,
                                                                        padding: EdgeInsets.all(15.0),
                                                                        decoration: BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                        ),
                                                                        child: Column(children: [
                                                                          Text(
                                                                              'Modification',
                                                                              style: TextStyle(color: Colors.orange.shade700, fontWeight: FontWeight.w500, fontSize: 18.0)),
                                                                          SizedBox(
                                                                              height: 16.0),
                                                                          Text(
                                                                              'Modify your data here. If you want to Edit your data, Click Edit or do you want to delete, Click Delete or close it? click outer the dialog box to close. And click Cancle to close Dialog',
                                                                              style: TextStyle(color: Colors.grey),
                                                                              textAlign: TextAlign.justify),
                                                                          SizedBox(
                                                                              height: 20.0),
                                                                          Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                MaterialButton(onPressed: () {}, color: Colors.green, child: Text('Edit', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                                                                                MaterialButton(
                                                                                    onPressed: () {
                                                                                      Navigator.pop(context);
                                                                                      showDialog(
                                                                                          context: context,
                                                                                          builder: (BuildContext) {
                                                                                            return Dialog(
                                                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                                                                                child: Container(
                                                                                                    height: 230.0,
                                                                                                    width: 300.0,
                                                                                                    padding: EdgeInsets.all(15.0),
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Colors.white,
                                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                                    ),
                                                                                                    child: Column(children: [
                                                                                                      Text('Confirmation', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500, fontSize: 18.0)),
                                                                                                      SizedBox(height: 16.0),
                                                                                                      Text('Do you want to delete ${item.Name}. Are you sure. If you sure, Click yes or you do not want to delete, Click no or click outer the dialog box to close.', style: TextStyle(color: Colors.grey), textAlign: TextAlign.justify),
                                                                                                      SizedBox(height: 20.0),
                                                                                                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                                                                                                        MaterialButton(
                                                                                                            onPressed: () {
                                                                                                              setState(() {
                                                                                                                Db_Supporter_1.Delete_Customers(item.Id);
                                                                                                              });
                                                                                                              ConnectConstant.entryFetchList(widget.userCode);
                                                                                                              Data_Table_Fetch_Model_1.Dash_FillterType_Bal_or_Exs(widget.userCode);
                                                                                                              lenfinder_01 = snapshot.data?.length.toString() ?? "0";

                                                                                                              Navigator.pop(context);
                                                                                                            },
                                                                                                            color: Colors.red,
                                                                                                            child: Text('Yes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                                                                                                        MaterialButton(
                                                                                                            onPressed: () {
                                                                                                              Navigator.pop(context);
                                                                                                            },
                                                                                                            color: Colors.green,
                                                                                                            child: Text('No', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))
                                                                                                      ])
                                                                                                    ])));
                                                                                          });
                                                                                    },
                                                                                    color: Colors.red,
                                                                                    child: Text('Delete', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                                                                                MaterialButton(
                                                                                    onPressed: () {
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    color: Colors.indigo,
                                                                                    child: Text('Cancel', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))
                                                                              ])
                                                                        ])));
                                                              });
                                                        },
                                                        icon: Icon(
                                                          Icons.edit,
                                                          color: Colors.black45,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }
                                          }))
                                ]))
                          ])
                    ])),
                Container(
                    height: MediaQuery.of(context).size.height / 1.30,
                    width: MediaQuery.of(context).size.width / 2.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(
                                1.0,
                                1.0,
                              ),
                              blurRadius: 3.0,
                              spreadRadius: 0.0), //BoxShadow
                          BoxShadow(
                              color: Colors.black38,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0)
                        ],
                        color: Colors.white),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 5.5,
                                child: TextFormField(
                                  controller: dateinputHed,
                                  decoration: InputDecoration(
                                    labelText: "Submited Date",
                                    suffixIcon: Icon(Icons.calendar_month),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                  ),
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime? pickedDate2 =
                                        await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2101));

                                    if (pickedDate2 != null) {
                                      print(pickedDate2);
                                      String formattedDate2 =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate2);
                                      //print(formattedDate);

                                      setState(() {
                                        dateinputHed.text = formattedDate2;
                                      });
                                    } else {
                                      var now2 = DateTime.now();

                                      var date2 =
                                          DateFormat('yyyy-MM-dd').format(now2);
                                      dateinputHed.text = date2;
                                    }
                                  },
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 5.5,
                              child: inputFields001(
                                  context,
                                  false,
                                  TextInputType.text,
                                  DocumentHed,
                                  'No of Document',
                                  'Enter no of document for counting',
                                  Icons.file_present,
                                  _focusNode1_H,
                                  _focusNode2_H),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 5.5,
                                child: TextFormField(
                                    focusNode: _focusNode2_H,
                                    keyboardType: TextInputType.number,
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    maxLength: 8,
                                    controller: ValidAmtHed,
                                    readOnly: false,
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (_) {
                                      FocusScope.of(context)
                                          .requestFocus(_focusNode3_H);
                                    },
                                    onChanged: (dynamic) {
                                      var value2;
                                      if (PaidAmtHed.text.isEmpty) {
                                        var pay2 = 0;
                                        var val2 = 0;
                                        PaidAmtHed.text = '0';

                                        try {
                                          pay2 = int.parse(
                                              PaidAmtHed.text.toString());
                                          assert(pay2 is int);
                                          val2 = int.parse(
                                              ValidAmtHed.text.toString());
                                          assert(val2 is int);
                                        } catch (e) {
                                          pay2 = 0;
                                          val2 = 0;
                                        }

                                        if (pay2 < val2) {
                                          value2 = val2 - pay2;

                                          setState(() {
                                            BalAmtHed.text = value2.toString();
                                            ExsAmtHed.text = '0';
                                            if (pay2 < 1) {
                                              IsPaidContHed.text = 'Un Paid';
                                            } else {
                                              IsPaidContHed.text = 'Pending';
                                            }
                                          });
                                        } else {
                                          value2 = pay2 - val2;

                                          setState(() {
                                            ExsAmtHed.text = value2.toString();
                                            BalAmtHed.text = '0';
                                            IsPaidContHed.text = 'Paid';
                                          });
                                        }
                                      } else {
                                        var pay2;
                                        var val2;
                                        try {
                                          pay2 = int.parse(
                                              PaidAmtHed.text.toString());
                                          assert(pay2 is int);
                                          val2 = int.parse(
                                              ValidAmtHed.text.toString());
                                          assert(val2 is int);
                                        } catch (e) {
                                          pay2 = 0;
                                          val2 = 0;
                                        }

                                        if (pay2 < val2) {
                                          value2 = val2 - pay2;

                                          setState(() {
                                            BalAmtHed.text = value2.toString();
                                            ExsAmtHed.text = '0';
                                            if (pay2 < 1) {
                                              IsPaidContHed.text = 'Un Paid';
                                            } else {
                                              IsPaidContHed.text = 'Pending';
                                            }
                                          });
                                        } else {
                                          value2 = pay2 - val2;

                                          setState(() {
                                            ExsAmtHed.text = value2.toString();
                                            BalAmtHed.text = '0';
                                            IsPaidContHed.text = 'Paid';
                                          });
                                        }
                                      }
                                    },
                                    decoration: InputDecoration(
                                        labelText: 'Valid Amount',
                                        labelStyle: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w500),
                                        hintText:
                                            'Enter valid amount for the package booking',
                                        hintStyle: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 14.6),
                                        suffixIcon: Icon(Icons.currency_rupee)),
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0))),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 5.5,
                              child: TextFormField(
                                  focusNode: _focusNode3_H,
                                  keyboardType: TextInputType.number,
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  maxLength: 8,
                                  controller: PaidAmtHed,
                                  readOnly: false,
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(_focusNode4_H);
                                  },
                                  onChanged: (dynamic) {
                                    var value2;
                                    if (ValidAmtHed.text.isEmpty) {
                                      var val2 = 0;
                                      var pay2 = 0;
                                      ValidAmtHed.text = '0';

                                      try {
                                        val2 = int.parse(
                                            ValidAmtHed.text.toString());
                                        assert(val2 is int);

                                        pay2 = int.parse(
                                            PaidAmtHed.text.toString());
                                        assert(pay2 is int);
                                      } catch (e) {
                                        pay2 = 0;
                                        val2 = 0;
                                      }

                                      if (pay2 > val2) {
                                        value2 = pay2 - val2;

                                        setState(() {
                                          ExsAmtHed.text = value2.toString();
                                          BalAmtHed.text = '0';

                                          IsPaidContHed.text = 'Pending';
                                        });
                                      } else {
                                        value2 = val2 - pay2;

                                        setState(() {
                                          BalAmtHed.text = value2.toString();
                                          ExsAmtHed.text = '0';
                                          if (pay2 < 1) {
                                            IsPaidContHed.text = 'Un Paid';
                                          } else {
                                            IsPaidContHed.text = 'Pending';
                                          }
                                        });
                                      }
                                    } else {
                                      var pay2;
                                      var val2;
                                      try {
                                        pay2 = int.parse(
                                            PaidAmtHed.text.toString());
                                        assert(pay2 is int);
                                        val2 = int.parse(
                                            ValidAmtHed.text.toString());
                                      } catch (e) {
                                        pay2 = 0;
                                        val2 = 0;
                                      }
                                      assert(val2 is int);
                                      if (pay2 < val2) {
                                        value2 = val2 - pay2;

                                        setState(() {
                                          BalAmtHed.text = value2.toString();
                                          ExsAmtHed.text = '0';
                                          if (pay2 < 1) {
                                            IsPaidContHed.text = 'Un Paid';
                                          } else {
                                            IsPaidContHed.text = 'Pending';
                                          }
                                        });
                                      } else {
                                        value2 = pay2 - val2;

                                        setState(() {
                                          ExsAmtHed.text = value2.toString();
                                          BalAmtHed.text = '0';
                                          IsPaidContHed.text = 'Paid';
                                        });
                                      }
                                    }
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'Paid Amount',
                                      labelStyle: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500),
                                      hintText:
                                          'Enter paid amount amount recieved from the consignee',
                                      hintStyle: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 14.6),
                                      suffixIcon: Icon(Icons.call_received)),
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0)),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5325,
                        child: Focus(
                          focusNode: _focusNode4_H,
                          onFocusChange: (hasFocus) {
                            if (hasFocus) {
                              _openDropdown(_dropdownKey1_H);
                            }
                          },
                          child: DropdownButton<String>(
                            focusColor: Colors.purple,
                            key: _dropdownKey1_H,
                            value: paymentValueHed,
                            hint: Text('Payment Type'),
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 472.0),
                              child: Icon(Icons.payment),
                            ),
                            elevation: 16,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                paymentValueHed = value!;
                                FocusScope.of(context)
                                    .requestFocus(_focusNode5_H);
                              });
                            },
                            items: paymentHed
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 5.5,
                              child: inputFields001(
                                  context,
                                  true,
                                  TextInputType.number,
                                  BalAmtHed,
                                  'Balance Amount',
                                  'Automatically fill the balance amount',
                                  Icons.move_down,
                                  _focusNodeNull1_H,
                                  _focusNodeNull2_H),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 5.5,
                              child: inputFields001(
                                  context,
                                  true,
                                  TextInputType.number,
                                  ExsAmtHed,
                                  'Excess Amount',
                                  'Automatically fill the excess amount',
                                  Icons.move_up,
                                  _focusNodeNull2_H,
                                  _focusNodeNull3_H),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 5.5,
                              child: Focus(
                                focusNode: _focusNode5_H,
                                onFocusChange: (hasFocus) {
                                  if (hasFocus) {
                                    _openDropdown(_dropdownKey2_H);
                                  }
                                },
                                child: DropdownButton<String>(
                                  focusColor: Colors.purple,
                                  key: _dropdownKey2_H,
                                  padding: EdgeInsets.only(top: 23.0),
                                  value: BookedByValueHed,
                                  hint: Text('Entryed By'),
                                  icon: Padding(
                                    padding: const EdgeInsets.only(left: 170.0),
                                    child: Icon(Icons.person_2),
                                  ),
                                  elevation: 16,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      BookedByValueHed = value!;
                                      FocusScope.of(context)
                                          .requestFocus(_focusNode6_H);
                                    });
                                  },
                                  items: bookedByHed
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 5.5,
                                child: inputFields001(
                                    context,
                                    true,
                                    TextInputType.text,
                                    IsPaidContHed,
                                    'Is Paid',
                                    'Automatically fill the Paid Status',
                                    Icons.move_down,
                                    _focusNodeNull3_H,
                                    FocusNode()))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: inputFields001(
                            context,
                            false,
                            TextInputType.number,
                            RemarksHed,
                            'Remarks section',
                            'Enter if you had any remarks about this customer, please mention it.',
                            Icons.mark_as_unread,
                            _focusNode6_H,
                            _focusNode7_H),
                      ),
                      Spacer(),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Focus(
                              focusNode: _focusNode7_H,
                              onKey: (FocusNode node, RawKeyEvent event) {
                                if (event is RawKeyDownEvent &&
                                    event.logicalKey ==
                                        LogicalKeyboardKey.enter) {
                                  onButtonPressed2(); // Call the button action when Enter is pressed
                                  FocusScope.of(context)
                                      .requestFocus(_focusNode1_H);
                                  return KeyEventResult.handled;
                                }
                                return KeyEventResult.ignored;
                              },
                              child: MaterialButton(
                                  color: Colors.green.shade500,
                                  hoverColor: Colors.greenAccent,
                                  splashColor: Colors.green.shade800,
                                  focusColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3.0)),
                                  onPressed: () async {
                                    onButtonPressed2();
                                    FocusScope.of(context)
                                        .requestFocus(_focusNode1_H);
                                  },
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 80.0, vertical: 15.0),
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18.0),
                                  )),
                            ),
                            SizedBox(width: 30.0),
                            MaterialButton(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 80.0, vertical: 15.0),
                                color: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0)),
                                onPressed: () {
                                  dateinputHed.clear();
                                  DocumentHed.clear();
                                  ValidAmtHed.clear();
                                  PaidAmtHed.clear();
                                  BalAmtHed.clear();
                                  ExsAmtHed.clear();
                                  RemarksHed.clear();
                                },
                                child: Text('Clear all',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18.0)))
                          ]),
                      Spacer()
                    ]))
              ]),
          SizedBox(height: 20.0),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text('Expense Entry Wizard',
                    style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                        fontSize: 17.0)))
          ]),
          Container(
              height: 300.0,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: const Offset(
                          1.0,
                          1.0,
                        ),
                        blurRadius: 3.0,
                        spreadRadius: 0.0), //BoxShadow
                    BoxShadow(
                        color: Colors.black38,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0)
                  ],
                  color: Colors.white),
              child: Column(children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 5.5,
                              child: TextField(
                                controller: date_exp,
                                decoration: InputDecoration(
                                  labelText: "Expense Date",
                                  suffixIcon: Icon(Icons.calendar_month),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                ),
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickedDate2 = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101));

                                  if (pickedDate2 != null) {
                                    print(pickedDate2);
                                    String formattedDate2 =
                                        DateFormat('yyyy-MM-dd')
                                            .format(pickedDate2);
                                    //print(formattedDate);

                                    setState(() {
                                      date_exp.text = formattedDate2;
                                    });
                                  } else {
                                    var now2 = DateTime.now();

                                    var date2 =
                                        DateFormat('yyyy-MM-dd').format(now2);
                                    date_exp.text = date2;
                                  }
                                },
                              )),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 5.5,
                              child: inputFields001(
                                  context,
                                  false,
                                  TextInputType.text,
                                  expenseBy_exp,
                                  'Expense By',
                                  'Enter Who expensed the money',
                                  Icons.person,
                                  _focusNode1_E,
                                  _focusNode2_E)),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 5.5,
                              child: TextFormField(
                                  focusNode: _focusNode2_E,
                                  autofocus: true,
                                  autocorrect: true,
                                  keyboardType: TextInputType.number,
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(_focusNode3_E);
                                  },
                                  maxLength: 8,
                                  controller: GetAMT_exp,
                                  readOnly: false,
                                  onChanged: (dynamic) {
                                    var value2;
                                    if (expenseAMT_exp.text.isEmpty) {
                                      var pay2 = 0;
                                      var val2 = 0;
                                      expenseAMT_exp.text = '0';

                                      try {
                                        pay2 = int.parse(
                                            expenseAMT_exp.text.toString());
                                        assert(pay2 is int);
                                        val2 = int.parse(
                                            GetAMT_exp.text.toString());
                                        assert(val2 is int);
                                      } catch (e) {
                                        pay2 = 0;
                                        val2 = 0;
                                      }

                                      if (pay2 < val2) {
                                        value2 = val2 - pay2;

                                        setState(() {
                                          balanceAMT_exp.text =
                                              value2.toString();
                                          excessAMT_exp.text = '0';
                                        });
                                      } else {
                                        value2 = pay2 - val2;

                                        setState(() {
                                          excessAMT_exp.text =
                                              value2.toString();
                                          balanceAMT_exp.text = '0';
                                        });
                                      }
                                    } else {
                                      var pay2;
                                      var val2;
                                      try {
                                        pay2 = int.parse(
                                            excessAMT_exp.text.toString());
                                        assert(pay2 is int);
                                        val2 = int.parse(
                                            GetAMT_exp.text.toString());
                                        assert(val2 is int);
                                      } catch (e) {
                                        pay2 = 0;
                                        val2 = 0;
                                      }

                                      if (pay2 < val2) {
                                        value2 = val2 - pay2;

                                        setState(() {
                                          balanceAMT_exp.text =
                                              value2.toString();
                                          excessAMT_exp.text = '0';
                                        });
                                      } else {
                                        value2 = pay2 - val2;

                                        setState(() {
                                          excessAMT_exp.text =
                                              value2.toString();
                                          balanceAMT_exp.text = '0';
                                        });
                                      }
                                    }
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'Get Amount',
                                      labelStyle: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500),
                                      hintText:
                                          'Enter how mach amount have you got',
                                      hintStyle: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 14.6),
                                      suffixIcon: Icon(Icons.payment)),
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0))),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 5.5,
                            child: TextFormField(
                                focusNode: _focusNode3_E,
                                keyboardType: TextInputType.number,
                                textCapitalization:
                                    TextCapitalization.characters,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_focusNode4_E);
                                },
                                maxLength: 8,
                                controller: expenseAMT_exp,
                                readOnly: false,
                                onChanged: (dynamic) {
                                  var value2;
                                  if (GetAMT_exp.text.isEmpty) {
                                    var val2 = 0;
                                    var pay2 = 0;
                                    GetAMT_exp.text = '0';

                                    try {
                                      val2 =
                                          int.parse(GetAMT_exp.text.toString());
                                      assert(val2 is int);

                                      pay2 = int.parse(
                                          excessAMT_exp.text.toString());
                                      assert(pay2 is int);
                                    } catch (e) {
                                      pay2 = 0;
                                      val2 = 0;
                                    }

                                    if (pay2 > val2) {
                                      value2 = pay2 - val2;

                                      setState(() {
                                        excessAMT_exp.text = value2.toString();
                                        balanceAMT_exp.text = '0';
                                      });
                                    } else {
                                      value2 = val2 - pay2;

                                      setState(() {
                                        balanceAMT_exp.text = value2.toString();
                                        excessAMT_exp.text = '0';
                                      });
                                    }
                                  } else {
                                    var pay2;
                                    var val2;
                                    try {
                                      pay2 = int.parse(
                                          expenseAMT_exp.text.toString());
                                      assert(pay2 is int);
                                      val2 =
                                          int.parse(GetAMT_exp.text.toString());
                                    } catch (e) {
                                      pay2 = 0;
                                      val2 = 0;
                                    }
                                    assert(val2 is int);
                                    if (pay2 < val2) {
                                      value2 = val2 - pay2;

                                      setState(() {
                                        balanceAMT_exp.text = value2.toString();
                                        excessAMT_exp.text = '0';
                                      });
                                    } else {
                                      value2 = pay2 - val2;

                                      setState(() {
                                        excessAMT_exp.text = value2.toString();
                                        balanceAMT_exp.text = '0';
                                      });
                                    }
                                  }
                                },
                                decoration: InputDecoration(
                                    labelText: 'Expensed Amount',
                                    labelStyle: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500),
                                    hintText:
                                        'Enter how mach have you expensed',
                                    hintStyle: TextStyle(
                                        color: Colors.black54, fontSize: 14.6),
                                    suffixIcon: Icon(Icons.call_received)),
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0)),
                          )
                        ])),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 8,
                              child: inputFields001(
                                  context,
                                  true,
                                  TextInputType.number,
                                  balanceAMT_exp,
                                  'Balance Amount',
                                  'Auto balance amount',
                                  Icons.balance,
                                  _focusNodeNull1_E,
                                  FocusNode())),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 8,
                              child: inputFields001(
                                  context,
                                  true,
                                  TextInputType.number,
                                  excessAMT_exp,
                                  'Excess Amount',
                                  'Auto Excess amount',
                                  Icons.insights,
                                  _focusNodeNull2_E,
                                  FocusNode())),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 5.0,
                              child: Focus(
                                focusNode: _focusNode4_E,
                                onFocusChange: (hasFocus) {
                                  if (hasFocus) {
                                    _openDropdown(_dropdownKey1_E);
                                  }
                                },
                                child: DropdownButton<String>(
                                  key: _dropdownKey1_E,
                                  value: GetFrom_EXP,
                                  icon: Padding(
                                    padding: const EdgeInsets.only(left: 100.0),
                                    child: Icon(Icons.thumb_up),
                                  ),
                                  elevation: 16,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      GetFrom_EXP = value!;
                                      if (value == 'None of Above') {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext) {
                                              return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.zero)),
                                                  backgroundColor: Colors.white,
                                                  surfaceTintColor:
                                                      Colors.white,
                                                  child: Container(
                                                      height: 165.0,
                                                      padding:
                                                          EdgeInsets.all(30.0),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              4,
                                                      child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            inputFields001(
                                                                context,
                                                                false,
                                                                TextInputType
                                                                    .text,
                                                                NoneOfThese_exp,
                                                                'Get From Where',
                                                                'Enter expense amount get from where',
                                                                Icons.thumb_up,
                                                                _focusNodeNull_E,
                                                                FocusNode()),
                                                            Spacer(),
                                                            Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  MaterialButton(
                                                                      color: Colors
                                                                          .indigo,
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              20.0,
                                                                          vertical:
                                                                              10.0),
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          getFrom_exp.insert(
                                                                              11,
                                                                              NoneOfThese_exp.text.toString());
                                                                        });
                                                                        NoneOfThese_exp
                                                                            .clear();
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        'Submit',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.w400,
                                                                            fontSize: 16.0),
                                                                      ))
                                                                ])
                                                          ])));
                                            });

                                        FocusScope.of(context)
                                            .requestFocus(_focusNode5_E);
                                      }
                                    });
                                  },
                                  items: getFrom_exp
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              )),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 5.5,
                              child: inputFields001(
                                  context,
                                  false,
                                  TextInputType.number,
                                  use_exp,
                                  'For Use',
                                  'Enter the use of expense',
                                  Icons.sell,
                                  _focusNode5_E,
                                  _focusNode6_E)),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 5.5,
                              child: inputFields001(
                                  context,
                                  false,
                                  TextInputType.number,
                                  remarks_exp,
                                  'Any Remarks',
                                  'Do you have any remarks',
                                  Icons.book,
                                  _focusNode6_E,
                                  _focusNode7_E))
                        ])),
                Spacer(),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Focus(
                        focusNode: _focusNode7_E,
                        onKey: (FocusNode node, RawKeyEvent event) {
                          if (event is RawKeyDownEvent &&
                              event.logicalKey == LogicalKeyboardKey.enter) {
                            onButtonPressed3();
                            FocusScope.of(context).requestFocus(
                                _focusNode1_E); // Call the button action when Enter is pressed
                            return KeyEventResult.handled;
                          }
                          return KeyEventResult.ignored;
                        },
                        child: MaterialButton(
                            color: Colors.green.shade500,
                            hoverColor: Colors.greenAccent,
                            splashColor: Colors.green.shade800,
                            focusColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.0)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 80.0, vertical: 15.0),
                            onPressed: () async {
                              onButtonPressed3();
                              FocusScope.of(context)
                                  .requestFocus(_focusNode1_E);
                            },
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.0),
                            )),
                      ),
                      MaterialButton(
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 80.0, vertical: 15.0),
                          onPressed: () {
                            date_exp.clear();
                            expenseBy_exp.clear();
                            expenseAMT_exp.clear();
                            GetAMT_exp.clear();
                            balanceAMT_exp.clear();
                            excessAMT_exp.clear();
                            NoneOfThese_exp.clear();
                            use_exp.clear();
                            remarks_exp.clear();
                            setState(() {
                              GetFrom_EXP = getFrom_exp.first;
                            });
                          },
                          child: Text(
                            'Clear All',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 18.0),
                          ))
                    ]),
                SizedBox(height: 30.0)
              ])),
          SizedBox(height: 30.0)
        ]);
  }
}
