import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tabbar/tabbar.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:yegobox/viewModel/dataModel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Sales extends StatefulWidget {
  @override
  _SalesState createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  var userData;

  int _index = 0;
  bool isLoading = false;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formState = new GlobalKey<FormState>();
  final controller = PageController();

  String formattedDate =
      DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
  var date = Jiffy().yMMMMd;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Sales',
          style: GoogleFonts.fredokaOne(
              color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Icon(
            Feather.upload,
            size: 16.0,
          ),
          SizedBox(
            width: 20.0,
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
              child: Icon(
                Feather.trending_up,
                size: 16.0,
              )),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Color(0xFFF6F6F6),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 7.0, 0.0, 0.0),
                        child: Center(
                          child: Text(
                            'Today,${date}',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 11.0,
                                    color: Color(0xFF1E96F0),
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 6.0),
                        child: Center(
                          child: Text("All device, vs same Day Previous Weak",
                              style: GoogleFonts.lato(
                                  fontSize: 11.0, fontWeight: FontWeight.bold)),
                        ),
                      )
                    ],
                  ),
                ),
                TabbarHeader(
                  controller: controller,
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                  tabs: [
                    Tab(
                      text: "1D",
                    ),
                    Tab(text: "1W"),
                    Tab(
                      text: "1M",
                    ),
                    Tab(
                      text: "3M",
                    ),
                    Tab(
                      text: "1Y",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabbarContent(
        controller: controller,
        children: <Widget>[
          Container(
            child: SingleChildScrollView(
                child: Container(
              child: Column(
                children: [
                  _salesCard("1", 4.0, 2.0, 0.3, 20.0),
                  _paymentType(30.0, 3, 0.45, 2.2)
                ],
              ),
            )),
          ),
          Container(
            child: SingleChildScrollView(
                child: Container(
              child: Column(
                children: [
                  _salesCard("1", 4.0, 2.0, 0.3, 20.0),
                  _paymentType(30.0, 3, 0.45, 2.2)
                ],
              ),
            )),
          ),
          Container(
            child: SingleChildScrollView(
                child: Container(
              child: Column(
                children: [
                  _salesCard("1", 4.0, 2.0, 0.3, 20.0),
                  _paymentType(30.0, 3, 0.45, 2.2)
                ],
              ),
            )),
          ),
          Container(
            child: SingleChildScrollView(
                child: Container(
              child: Column(
                children: [
                  _salesCard("1", 4.0, 2.0, 0.3, 20.0),
                  _paymentType(30.0, 3, 0.45, 2.2)
                ],
              ),
            )),
          ),
          Container(
            child: SingleChildScrollView(
                child: Container(
              child: Column(
                children: [
                  _salesCard("1", 4.0, 2.0, 0.3, 20.0),
                  _paymentType(30.0, 3, 0.45, 2.2)
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }

  Widget _salesCard(String grossSale, double averageSale, double refunds,
      double discount, double today) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("Gross Sale",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 12.0, color: Colors.grey[800]))),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text("Net Sales",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 12.0, color: Colors.grey[800]))),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Divider(
                color: Colors.grey[300],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(grossSale,
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.grey[800]))),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text("FRw ${averageSale}",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.grey[800]))),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("Sales",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 12.0, color: Colors.grey[800]))),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text("Average Sale",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 12.0, color: Colors.grey[800]))),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey[300],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text('FRw ${refunds}',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.grey[800]))),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text("FRw ${discount}",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.grey[800]))),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("Refunds",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 12.0, color: Colors.grey[800]))),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text("Discount & Camps",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 12.0, color: Colors.grey[800]))),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey[300],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Text("DAILY GROSS SALES",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 12.0, color: Colors.grey[800]))),
                  ),
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Entypo.dots_three_horizontal,
                        color: Color(0xFF1E96F0),
                      )),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("Today",
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            textStyle: TextStyle(
                                fontSize: 12.0, color: Colors.grey[800]))),
                  ),
                  Expanded(
                      flex: 1,
                      child: Text("Same Day Previous Week",
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                  color: Colors.grey[800])))),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("FRw ${today}",
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            textStyle: TextStyle(
                                fontSize: 15.0, color: Color(0xFF1E96F0)))),
                  ),
                  Expanded(
                      flex: 1,
                      child: Text("",
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Color(0xFF1E96F0))))),
                ],
              ),
              Container(
                  child: SfCartesianChart(series: <ChartSeries>[
                // Renders line chart
                LineSeries<SalesData, double>(
                    dataSource: chartData,
                    xValueMapper: (SalesData sales, _) => sales.times,
                    yValueMapper: (SalesData sales, _) => sales.sales),
              ]))
            ],
          ),
        ),
      ),
    );
  }
// payment type

  Widget _paymentType(double total, double other, double fees, double net) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 4,
                    child: Text("SALES BY PAYMENT TYPES",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: Colors.grey[800]))),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text("",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 12.0, color: Colors.grey[800]))),
                  ),
                ],
              ),
              SizedBox(height: 30.0,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text("Total Collected",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: Colors.grey[800]))),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text("FRw ${total}",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 12.0, color: Colors.grey[800]))),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Divider(
                color: Colors.grey[300],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text('Other',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 14.0, color: Colors.grey[800]))),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text("FRw ${other}",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: Colors.grey[800]))),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Divider(
                color: Colors.grey[300],
                height: 20.0,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text("Fees",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 14.0, color: Colors.grey[800]))),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text("FRw${fees}",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 14.0, color: Colors.grey[800]))),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey[300],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text('Net Total',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: Colors.grey[800]))),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text("FRw ${net}",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: Colors.grey[800]))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');

    return '$token';
  }

  getUser() async {
    SharedPreferences kubika = await SharedPreferences.getInstance();

    var user = kubika.getString('user');
    var username = json.decode(user);
    var usen = username['username'];

    return '$usen';
  }
}
