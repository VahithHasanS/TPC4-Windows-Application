// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, unused_import, annotate_overrides, sized_box_for_whitespace, prefer_adjacent_string_concatenation, depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:meta_blaster/Models/navigationDrawer.dart';
import 'package:intl/intl.dart';
import 'package:meta_blaster/Tabs/About_Us.dart';
import 'package:meta_blaster/Tabs/DashBoard.dart';
import 'package:meta_blaster/Tabs/Grid_View.dart';
import 'package:meta_blaster/Tabs/Group_Up.dart';
import 'package:meta_blaster/Tabs/analytics.dart';
import 'package:meta_blaster/Tabs/data_entries.dart';
import 'package:meta_blaster/Tabs/more_status.dart';
import 'package:meta_blaster/Tabs/search_Partys.dart';
import 'package:meta_blaster/Tabs/user_account.dart';
import 'package:meta_blaster/mongoDB/connect_&_constant.dart';

class Dash_Board_Page extends StatefulWidget {
  final UName, UEmail, userCode, indexVal;
  Dash_Board_Page(
      {super.key,
      required this.UName,
      required this.UEmail,
      required this.userCode,
      required this.indexVal});

  @override
  State<Dash_Board_Page> createState() => _Dash_Board_PageState();
}

class _Dash_Board_PageState extends State<Dash_Board_Page>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  void initState() {
    super.initState();
    _tabController =
        TabController(length: 9, vsync: this, initialIndex: widget.indexVal);
  }

  var scafoldKey = GlobalKey<ScaffoldState>();
  // ignore: prefer_final_fields, unused_field
  PageController _myPage = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
            length: 9,
            child: Scaffold(
                key: scafoldKey,
                drawer: NavDrwer(
                    uniqueCode: widget.userCode,
                    name: widget.UName.toString(),
                    email: widget.UEmail.toString()),
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/icon/icon-outline.png',
                          height: 50.0, width: 50.0),
                      Center(
                          child: RichText(
                              text: const TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "HaHu",
                            style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'Comfortaa',
                                fontSize: 16.0)),
                        TextSpan(
                            text: "Trendz",
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'Comfortaa',
                                fontSize: 16.0))
                      ]))),
                      SizedBox(width: 7.0),
                      Text('V 1.0.4', style: TextStyle(fontSize: 8.0))
                    ],
                  ),
                  actions: [
                    Container(
                      height: 92.0,
                      width: 350.0,
                      child: Row(children: <Widget>[
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15.0),
                          height: 70.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${widget.UName} ' +
                                    '(${DateFormat('E').format(DateTime.now())} ${DateTime.now().day} ${DateFormat('MMM').format(DateTime.now())})',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'Comfortaa',
                                    fontSize: 16.0),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          padding: EdgeInsets.symmetric(horizontal: 0.0),
                          height: 50,
                          minWidth: 10.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    Colors.green,
                                    Colors.greenAccent,
                                    Colors.lightGreen,
                                    Colors.lightGreenAccent
                                  ]),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Container(
                                padding: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: ClipOval(
                                  child: Image.network(
                                      'https://randomuser.me/api/portraits/men/78.jpg'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        )
                      ]),
                    ),
                  ],
                  bottom: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      tabAlignment: TabAlignment.center,
                      indicatorColor: Colors.green,
                      labelColor: Colors.black87,
                      dividerColor: Colors.transparent,
                      tabs: [
                        Tab(
                            child: Row(children: [
                          Icon(Icons.home_outlined),
                          SizedBox(
                            width: 6.0,
                          ),
                          Text('Dashboard')
                        ])),
                        Tab(
                            child: Row(children: [
                          Icon(Icons.grid_view),
                          SizedBox(
                            width: 6.0,
                          ),
                          Text('Grid View')
                        ])),
                        Tab(
                            child: Row(children: [
                          Icon(Icons.search),
                          SizedBox(
                            width: 6.0,
                          ),
                          Text('Search Participations')
                        ])),
                        Tab(
                            child: Row(children: [
                          Icon(Icons.document_scanner_outlined),
                          SizedBox(
                            width: 6.0,
                          ),
                          Text('Data Entries')
                        ])),
                        Tab(
                            child: Row(children: [
                          Icon(Icons.analytics_outlined),
                          SizedBox(
                            width: 6.0,
                          ),
                          Text('Analytics')
                        ])),
                        Tab(
                            child: Row(children: [
                          Icon(Icons.percent),
                          SizedBox(
                            width: 6.0,
                          ),
                          Text('Expense Manager')
                        ])),
                        Tab(
                            child: Row(children: [
                          Icon(Icons.person_outline),
                          SizedBox(
                            width: 6.0,
                          ),
                          Text('User Account Settings')
                        ])),
                        Tab(
                            child: Row(children: [
                          Icon(Icons.chat_outlined),
                          SizedBox(
                            width: 6.0,
                          ),
                          Text('Group Memebers')
                        ])),
                        Tab(
                            child: Row(children: [
                          Icon(Icons.book_outlined),
                          SizedBox(
                            width: 6.0,
                          ),
                          Text('About Us')
                        ]))
                      ]),
                ),
                body: TabBarView(controller: _tabController, children: <Widget>[
                  RefreshIndicator(
                    onRefresh: _handleRefresh,
                    color: Colors.white,
                    backgroundColor: Colors.blue,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: DashBoard_Tab(
                          UName: widget.UName,
                          UEmail: widget.UEmail,
                          userCode: widget.userCode),
                    ),
                  ),
                  RefreshIndicator(
                    onRefresh: _handleRefresh,
                    color: Colors.white,
                    backgroundColor: Colors.blue,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Grid_View_Tab(
                        UName: widget.UName,
                        UEmail: widget.UEmail,
                        userCode: widget.userCode,
                      ),
                    ),
                  ),
                  RefreshIndicator(
                    onRefresh: _handleRefresh,
                    color: Colors.white,
                    backgroundColor: Colors.blue,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Search_Partys_Tab(
                          UName: widget.UName,
                          UEmail: widget.UEmail,
                          UniqueCode: widget.userCode),
                    ),
                  ),
                  RefreshIndicator(
                    onRefresh: _handleRefresh,
                    color: Colors.white,
                    backgroundColor: Colors.blue,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Data_Entries_Tab(
                          UName: widget.UName,
                          UEmail: widget.UEmail,
                          userCode: widget.userCode),
                    ),
                  ),
                  RefreshIndicator(
                    onRefresh: _handleRefresh,
                    color: Colors.white,
                    backgroundColor: Colors.blue,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Analytics_tab(
                          UName: widget.UName,
                          UEmail: widget.UEmail,
                          UniqueCode: widget.userCode),
                    ),
                  ),
                  RefreshIndicator(
                    onRefresh: _handleRefresh,
                    color: Colors.white,
                    backgroundColor: Colors.blue,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: More_Status_Tab(
                          UName: widget.UName,
                          UEmail: widget.UEmail,
                          UniqueCode: widget.userCode),
                    ),
                  ),
                  RefreshIndicator(
                    onRefresh: _handleRefresh,
                    color: Colors.white,
                    backgroundColor: Colors.blue,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: User_Account_Tab(
                          UName: widget.UName,
                          UEmail: widget.UEmail,
                          UniqueCode: widget.userCode),
                    ),
                  ),
                  RefreshIndicator(
                    onRefresh: _handleRefresh,
                    color: Colors.white,
                    backgroundColor: Colors.blue,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Group_Up_Tab(
                          UName: widget.UName,
                          UEmail: widget.UEmail,
                          UniqueCode: widget.userCode),
                    ),
                  ),
                  RefreshIndicator(
                    onRefresh: _handleRefresh,
                    color: Colors.white,
                    backgroundColor: Colors.blue,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: About_Us_Tab(
                          UName: widget.UName,
                          UEmail: widget.UEmail,
                          UniqueCode: widget.userCode),
                    ),
                  )
                ]))));
  }

  Future<void> _handleRefresh() async {
    // Simulate network fetch or database query
    try {
      await Future.delayed(Duration(seconds: 2));
      // Update the list of items and refresh the UI
      setState(() {
        ConnectConstant.connect();
      });
    } catch (error) {
      // Handle the error, e.g., by displaying a snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to refresh: $error'),
        ),
      );
    }
  }
}
