
import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:device_info/network/api_component.dart';
import 'package:device_info/network/network_response.dart';

//import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info/models/user.dart';
class settings extends StatefulWidget {
  @override
  _settings createState() => _settings();
}

  class _settings extends  State<settings> with TickerProviderStateMixin  {
    bool  apiCall = false; // New variable
    User sessionuser;
    BuildContext ctx;
   // SharedPreferences sharedPreferences;
    AnimationController _controller;
  
    final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>( );
     Future<void> _getUserdata() async {
   // sharedPreferences = await SharedPreferences.getInstance();
    setState( () =>
    {
    //  sessionuser = User.fromJson(json.decode(sharedPreferences.getString( "userdata" ))) as User
    } );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  void initState() {
    _getUserdata();
    // TODO: implement initState
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
     //imagePicker.build(0xFFEE6969,0xFFFFFFFF,false);
  }
  @override
  Widget build(BuildContext context) {
    var userimage=(sessionuser==null)?'https://via.placeholder.com/300':(sessionuser.avatar!=null)?sessionuser.avatar:'https://via.placeholder.com/300';
    return Scaffold(
        key: scaffoldKey,
        appBar:null,
        body:Container(height: double.infinity,width: double.infinity,
        child: ListView(
            padding: EdgeInsets.zero,
            children:  <Widget>[
              Container(
                height: 203,
                decoration: BoxDecoration(gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Color.fromRGBO(151, 217, 225, 1),
                    Color.fromRGBO(94, 177, 191, 1)
                  ]
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.only(top:20),
                      child: CircleAvatar(
                      child: ClipOval(
                        child: Stack(
                          children: <Widget>[
                            Image.network(userimage,fit: BoxFit.cover),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              left: 0,
                              height: 33,
                              child: GestureDetector(
                                onTap: (){},
                                child: Container(
                                  height: 20,
                                  width: 30,
                                  color: Color.fromRGBO(0, 0, 0, .74),
                                  child: Center(
                                    child: Icon(Icons.photo_camera, color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //radius: 68.0,
                      minRadius: 50,
                      maxRadius: 50,
                    
                      // backgroundImage: NetworkImage('https://via.placeholder.com/300'),
                      backgroundColor: Colors.transparent,
                    ),
                    )
                    ,
                    Expanded(
                     // constraints: BoxConstraints(maxWidth: double.infinity-20),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(10)),
                      Text("Hello",style: TextStyle(color: Colors.white, fontSize: 14)),
                      Padding(padding: EdgeInsets.all(4)),
                      Text((sessionuser!=null && sessionuser.email!=null)?sessionuser.email:'',style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
                      softWrap: false,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis
                      )
                    ],),
                    )
                    
                  ],
                ),

              ),
              Container(
                decoration: BoxDecoration(color: Color.fromRGBO(243, 243, 243, 1)),
                constraints: BoxConstraints(minHeight: 400,maxHeight: double.infinity),
                height: MediaQuery.of(context).size.height-(203 + kBottomNavigationBarHeight+45 + MediaQuery.of(context).padding.top +  MediaQuery.of(context).padding.bottom   ),
                padding: EdgeInsets.all(16),
                child:Column(
                  children: <Widget>[
                    ListLink("Pricing",(){}),
                    ListLink("Partners",(){}),
                    ListLink("FAQ",(){}),
                    ListLink("Customer Service",(){}),
                    ListSeperator(),
                    ListLink("About ROA",(){}),
                    ListLink("Terms and Condtions",(){}),
                    ListValue("App Version","1.0"),
                  ],
                ),

              ),
              InkWell(child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                height: 45,
                decoration: BoxDecoration(color: Color.fromRGBO(243, 243, 243, 1)),
                child:Text("Sign Out",style: TextStyle(color: Colors.red,fontSize: 14,fontWeight: FontWeight.w500),textAlign: TextAlign.center,)
                ,
                ),
                onTap:doLogout,
              )
             

             
               
            ],
          ),
        )
    );
    // TODO: implement build
    throw UnimplementedError();
  }
  void doLogout(){
    final userModel = User(); userModel.logout(context);
  }
  Widget ListSeperator(){
    return Padding(padding: EdgeInsets.all(8));
  }
  Widget ListValue(String text, String value){
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 16),
            width: MediaQuery.of(context).size.width -62,
            child:Text(text,style: TextStyle(fontSize: 16,color: Colors.black),)
            ),
           Text(value,style: TextStyle(fontSize: 16,color: Colors.black),)
        ],
      );
  }
  Widget ListLink(String text, VoidCallback onTapped){
    return InkWell(
      child:
        Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 16),
            width: MediaQuery.of(context).size.width -52,
            child:Text(text,style: TextStyle(fontSize: 16,color: Colors.black),)
            ),
           Icon(Icons.keyboard_arrow_right,size: 20,),
        ],
      )
    );
  }

   @override
  Future<bool> userImage(File _image) async {
    print('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^');
    print(_image);
    print('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^');

    try {
      setState( () {
        apiCall = true;
      } );
      //FocusScope.of( context ).unfocus( );
      //Navigator.of(context, rootNavigator: true).pop('dialog');
      scaffoldKey.currentState.showSnackBar(
          new SnackBar( duration: new Duration( seconds: 1 ), content:
          new Row(
            children: <Widget>[
              new CircularProgressIndicator( ),
              new Text( "  Updating profile image..." )
            ],
          ),
          ) );

      NetworkResponse<UserResponse> usersresponse = await Api.updateAvatar(
        context: this.ctx,
        userid: sessionuser.id,
        image: 'data:image/png;base64,' +
            base64Encode(_image.readAsBytesSync()),
      );
      print('++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
      print(json.encode( usersresponse.responseObject.users[0]));
      print('++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
      if (usersresponse.responseObject.status == 'success') {
        var user = usersresponse.responseObject.users[0];
       // sharedPreferences.setString( "userdata", json.encode( user ) );
         scaffoldKey.currentState.showSnackBar( SnackBar(
            content: Text( usersresponse.responseObject.message ) ) );
        _getUserdata();
        
      /*  setState( () =>
        {
          //_ordersresponse = ordersupresponse,
          //_orders = ordersupresponse.responseObject.orders
        } );*/



        /*Future.delayed( const Duration( seconds: 1 ), () {
          Navigator.pushNamed( this.ctx, '/orders' );
        } );*/



      } else {
        scaffoldKey.currentState.showSnackBar( SnackBar(
            content: Text( usersresponse.responseObject.message ) ) );
      }
    }finally{
      setState(() {
        apiCall = false;
      });
    }

    /*setState(() {
      this._image = _image;
    });*/
  }
    
  }