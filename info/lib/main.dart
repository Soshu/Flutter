import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:device_info/common/theme.dart';
import 'package:device_info/locale/applocalizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:device_info/screens/info.dart';
import 'package:device_info/screens/splashscreen.dart';
//import 'package:shared_preferences/shared_preferences.dart';
String fieldcountrycode = '';
String appstatus = "";

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(RoaApp());
}

class RoaApp extends StatefulWidget {
  _RoaApp createState() => _RoaApp();
}


class _RoaApp extends State<RoaApp>  with WidgetsBindingObserver {
  bool  apiCall = false; // New variable

  final GlobalKey<FormState> _registerformKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>( );
  String _homeScreenText = "Waiting for token...";//need to remove later
  String _messageText = "Waiting for message...";//need to remove later
  BuildContext ctx;
  //SharedPreferences sharedPreferences;
  void initial() async {

   }
 // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  @override
  void initState() {
    super.initState( );
   WidgetsBinding.instance.addObserver(this);
    initial();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        print("ROAAPPstate in resumed");
        appstatus = "resumed";
        break;
      case AppLifecycleState.inactive:
        print("ROAAPPstate in inactive");
        appstatus = "inactive";
        break;
      case AppLifecycleState.paused:
        print("ROAAPPstate in paused");
        appstatus = "paused";
        break;
      case AppLifecycleState.detached:
        print("ROAAPPstate in detached");
        appstatus = "detached";
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    /*return MultiProvider(
      providers: [
      ],*/
      return MaterialApp(
          debugShowCheckedModeBanner: false,
        onGenerateTitle: (BuildContext context) =>
            AppLocalizations
                .of(context)
                .getText("app_name"),
        localizationsDelegates: [
          const AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          
        ],
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('sv', 'SE'),
        ],
        theme: appTheme,
        initialRoute: '/',
        routes: {
        // '/': (context) => dashboard(),
          //'/orders': (context) => qrcode(),
          '/': (context) => SplashScreen(),
		      '/info': (context) => MyInfo(),
        },
      );
   // );
  }

}

class roaStyleBase {
  static const roaPrimaryColor =  Color(0xFF81bbce);
  static const roaLabelColor =  Color(0xFF335b68);
    static const roasteelBlueColor =  Color(0xFF568899);
  static const lightBlueGreyColor = Color(0xFFcadee7);
  static const evergreenColor = Color(0xFF042a2b);
  static const blackColor = Color(0xFF000000);
  static const greyColor = Color.fromRGBO(216,216,216,1);
  static const evergreen = TextStyle(fontSize: 24,color:evergreenColor);
  static const welcome = TextStyle(fontSize: 24,color:roaPrimaryColor,fontWeight: FontWeight.normal);
  static const label = TextStyle(fontSize: 16,color:roaLabelColor,fontWeight: FontWeight.w400);
  static const text = TextStyle(fontSize: 16,color:roaPrimaryColor);
  static const steelblue = TextStyle(fontSize: 14,color:roasteelBlueColor);
  static const disabledStyle = TextStyle(fontSize: 14,color:Colors.black38);
  static const buttontext = TextStyle(fontSize: 18,color:Colors.white,decoration: TextDecoration.none);
  static const smalllabel = TextStyle(fontSize: 14,color:Colors.white,decoration: TextDecoration.none);
  static const ordertitle = TextStyle(fontSize: 16,color:evergreenColor,fontWeight: FontWeight.w500);
  static const ordertrailing = TextStyle(fontSize: 18,color:evergreenColor);
  static const appBarBorderColor = Color.fromRGBO( 131, 185, 203, 0.38);
  static const seperatorColor = Color.fromRGBO(191, 191, 191, 1);
  static const textstyle = TextStyle(fontSize: 16,color: Color(0xFF000000));
  static const placeholder = Color.fromRGBO(205,220,225,1);
}
/*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateAccountPage()));*/