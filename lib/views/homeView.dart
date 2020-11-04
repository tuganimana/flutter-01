import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:yegobox/views/salesView.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 2.0,
                shrinkWrap: true,
                mainAxisSpacing: 10.0,
                children: [
                  _salesCard(context, 'Sales'),
                  _salesCard(context, 'Sales'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _salesCard(BuildContext context, String title) {
    return Center(
      child: SizedBox(
        height: 120, // card height
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => Sales()),
            );
          },
          child: Card(
            elevation: 6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
            child: Center(
                child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
                  child: Center(
                    child: Icon(
                      AntDesign.swap,
                      color: Colors.teal,
                      size: 20.0,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                          color: Colors.grey),
                    ),
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
