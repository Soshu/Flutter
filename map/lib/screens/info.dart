
import 'dart:async';
import 'dart:io';
import 'package:devices_map/locale/applocalizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
void main() {
  runApp(
    MaterialApp(
      title: 'Device info',
      home: MyInfo(),
    ),
  );
}

class MyInfo extends StatefulWidget {
  myinfo createState() => myinfo();
}

class myinfo extends State<MyInfo>{
  BuildContext? ctx;
  bool apiCall = false; // New variable
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  void initState() {
    super.initState();
  }
  


  
  @override
  Widget build(BuildContext context) {
    this.ctx= context;
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 7, left: 16),
                        child: Text(
                          AppLocalizations.of(context)!.getText("Battrey Info"),
                         // style: roaStyleBase.welcome,
                        ))
                  ],
                ),


                Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 50, bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                           /* SizedBox(
                                width: MediaQuery.of(context).size.width - 32,
                                child: ROARaisedBtn(
                                    AppLocalizations.of(context)
                                        .getText("Send Info"),
                                    (apiCall ? null : isValid() ? sendinfo : null))

                                
                                )*/
                          ],
                        )),

                  ],
                )
              ],
            ),
          ],
        ),
      ),
      
    );
  }

  //validations here
  bool isValid() {
    return true;
  }


















}
