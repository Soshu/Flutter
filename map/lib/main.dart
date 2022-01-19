import 'package:flutter/material.dart';
import 'package:devices_map/locale/applocalizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:devices_map/common/theme.dart';
import 'package:devices_map/screens/info.dart';
void main() {
  runApp(MapApp());
}

class MapApp extends StatefulWidget {
  _MapApp createState() => _MapApp();
}

class _MapApp extends State<MapApp>  with WidgetsBindingObserver {
  bool  apiCall = false; // New variable
  final GlobalKey<FormState> _registerformKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>( );
  void initial() async {

   }

  @override
  void initState() {
    super.initState( );
    initial();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        print("MapAppstate in resumed");
       // appstatus = "resumed";
        break;
      case AppLifecycleState.inactive:
        print("MapAppstate in inactive");
        //appstatus = "inactive";
        break;
      case AppLifecycleState.paused:
        print("MapAppstate in paused");
        //appstatus = "paused";
        break;
      case AppLifecycleState.detached:
        print("MapAppstate in detached");
       // appstatus = "detached";
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
                .of(context)!
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
	      '/': (context) => MyInfo(),
        },
      );
  }

}