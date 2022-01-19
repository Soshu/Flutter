
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:device_info/constants/constants.dart';
import 'package:device_info/network/network_response.dart';
//import 'package:shared_preferences/shared_preferences.dart';
class UserResponse extends ResponseObject{
  String status;
  int statuscode;
  String message;
  int count;
  List<User> users;
  @override
  fromJson(Map<String, dynamic> json) {
    status = json['status'] ;
    statuscode = json['statuscode'] ;
    message = json['message'];
    count = json['count'];
    var jsonList = json["users"];
    users = [];
    jsonList.forEach((jsonMap) {
      users.add(User.fromJson(jsonMap));
    });
  }
}
@immutable
class User {
  int id;
  String email;
  String countrycode;
  String phonenumber;
  String firstname;
  String lastname;
  String token;
  int onboarding;
  String activationcode;
  String resetpasswordtoken;
  int status;
  String avatar;
 // SharedPreferences sharedPreferences;
  User({this.id, this.email, this.countrycode, this.phonenumber, this.firstname, this.lastname, this.token, this.onboarding, this.activationcode, this.resetpasswordtoken, this.status, this.avatar});


  Map<String, dynamic> toJson() =>
      {
       "id" : id,
       "email" : email,
        "countrycode" : countrycode,
        "phonenumber" : phonenumber,
       "firstname" : firstname,
       "lastname" : lastname,
       "token" : token,
        "onboarding" : onboarding,
        "activationcode": activationcode,
        "resetpasswordtoken" :resetpasswordtoken,
        "status" : status,
        "avatar" : avatar
       };

  //check local and then make api call here users/isloggedin/id/token
  FutureOr<String> verifyLogin() async {
    var userdata=null;
    // sharedPreferences = await SharedPreferences.getInstance();
   // var userdata = sharedPreferences.getString( "userdata" );
   // var isLoggedin = sharedPreferences.getString( "isLoggedin" );

    //if(isLoggedin=='null'){
     // return null.toString();
   // }else{
   //   return userdata;
   // }
  }
  dynamic isLoggedin(BuildContext context) async {
    final usermodel = User( );
    //sharedPreferences = await SharedPreferences.getInstance();
    var isLoggedin = await usermodel.verifyLogin();
   // var isOpen =openRoutes.contains(ModalRoute.of(context).settings.name).toString();
  //  var isInitiated = sharedPreferences.getString( "isInitiated" );
        isLoggedin=isLoggedin.toString();
    print('*****************************************');
    print("Route is: "+ModalRoute.of(context).settings.name);
   // print("Initiated: "+isInitiated.toString());
    print("Logged in: "+isLoggedin);
   // print("isopen: "+isOpen);
    print('*****************************************');

    if(isLoggedin=="null"){ //not logged in but on internal pages
      print('--------------------------');
      print('not logged in');
      print('--------------------------');

/*
       if(isInitiated.toString()=="null"){
         //Navigator.of(context).pushNamedAndRemoveUntil('/', ModalRoute.withName('/onboarding'));
         //Navigator.pushNamed( context, '/onboarding' );
         Navigator.of(context).pushReplacementNamed('/onboarding');
       }else {
         //Navigator.of(context).pushNamedAndRemoveUntil('/', ModalRoute.withName('/login'));
         //Navigator.pushNamed( context, '/login' );
         Navigator.of(context).pushReplacementNamed('/login');
       }*/

    }else{ //logged in trying to access open pages
      print('--------------------------');
      print('logged in');
      print('--------------------------');


      User sessioninfo= User.fromJson(json.decode(isLoggedin)) as User;
      if(sessioninfo.status==0){
        Navigator.of(context).pushReplacementNamed('/login');
          //Navigator.pushNamed(context, '/login');
      }
      Navigator.of(context).pushReplacementNamed('/orders');
      //Navigator.pushNamed(context,'/orders');
      //Navigator.popUntil(context, ModalRoute.withName('/onboarding'));
      //Navigator.popUntil(context,'/login');
      //Navigator.popAndPushNamed(context, '/orders');
    }
  }

  Future<bool> logout(BuildContext context) async {
    /*sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("isLoggedin", null.toString());
    sharedPreferences.setString("userdata", '');
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);*/
   //Navigator.pushNamed( context, '/login' );
  }

   User.fromJson(Map<String, dynamic> json) {
     id = json['id'] as int;
     email = json['email'] as String;
     countrycode = json['countrycode'] as String;
     phonenumber = json['phonenumber'] as String;
     firstname = json['firstname'] as String;
     lastname = json['lastname'] as String;
     token = json['token'] as String;
     onboarding = json['onboarding'] as int;
     activationcode = json['activationcode'] as String;
     resetpasswordtoken = json['resetpasswordtoken'] as String;
     status = json['status'] as int;
     avatar = json['avatar'] as String;
   }
}
