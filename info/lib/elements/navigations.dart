//import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
class navigations{
  //SharedPreferences sharedPreferences;
  bool  apiCall = false; // New variable
  int tabindex=1;
   PreferredSizeWidget gettopBar(BuildContext context,{bool tabs,int tabindex}){

     if(tabs==true) {
       return new AppBar(
         title: const Text( 'ROA' ),
         backgroundColor: Colors.white,
         bottomOpacity: 0.0,
         bottom: TabBar(
         tabs: [
             Tab(icon: Icon(Icons.settings), text: "Settings",),
             Tab(icon: Icon(Icons.shopping_cart), text: "Orders"),
            // Tab(icon: Icon(Icons.add_shopping_cart), text: "Create Order"),
         ],
         ),
         actions: <Widget>[
             // overflow menu
           PopupMenuButton<int>(
             itemBuilder: (context) => [
               PopupMenuItem(
                 value: 1,
                 child: Text("Logout"),
               ),
             ],
             initialValue: 1,
             onCanceled: () {
               print("You have canceled the menu.");
             },
             onSelected: (value) {
               if(value==1){
                   logout(context);

               }
               print("value:$value");
             },
             icon: Icon(Icons.list),
           ),
         ],

       );

     }else {
       return new AppBar(
         title: const Text( 'ROA' ),
         backgroundColor: Colors.white,
         bottomOpacity: 0.0,
         elevation: 0.0,
         /* bottom: new TabBar(
          //  controller: controller,
            tabs: <Tab>[
              new Tab(icon: new Icon(Icons.arrow_forward)),
              new Tab(icon: new Icon(Icons.arrow_downward)),
              new Tab(icon: new Icon(Icons.arrow_back)),
            ]
        )*/
       );
     }
  }
   PreferredSizeWidget getbottomBar(){
     return new AppBar(
       title: const Text( 'ROA' ),
       // backgroundColor: Colors.grey,
       /* bottom: new TabBar(
          //  controller: controller,
            tabs: <Tab>[
              new Tab(icon: new Icon(Icons.arrow_forward)),
              new Tab(icon: new Icon(Icons.arrow_downward)),
              new Tab(icon: new Icon(Icons.arrow_back)),
            ]
        )*/
     );
   }

  Future<bool> logout(BuildContext context) async {
  //  sharedPreferences = await SharedPreferences.getInstance();
  //  sharedPreferences.setString("isLoggedin", null.toString());
  //  sharedPreferences.setString("userdata", '');
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
    //Navigator.pushNamed( context, '/login' );
  }
}
/*
class topBar extends StatefulWidget {
  @override
  _topBar createState() => _topBar();
}

class _topBar extends  State<topBar> {
  final Item item;

  //const _AddButton({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);

    return FlatButton(
      onPressed: cart.items.contains(item) ? null : () => cart.add(item),
      splashColor: Theme.of(context).primaryColor,
      child: cart.items.contains(item)
          ? Icon(Icons.check, semanticLabel: 'ADDED')
          : Text('ADD'),
    );
  }
}*/