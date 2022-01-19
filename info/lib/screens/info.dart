
import 'dart:async';
import 'dart:io';
import 'dart:developer' as developer;
import 'package:device_info/models/devicecontact.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_info/main.dart';
import 'package:device_info/locale/applocalizations.dart';
import 'package:device_info/models/user.dart';
import 'package:device_info/common/controls.dart';
import 'package:device_info/network/api_component.dart';
import 'package:device_info/network/network_response.dart';
//import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:disk_space/disk_space.dart';
import 'package:system_info/system_info.dart';
import 'package:flutter/services.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:call_log/call_log.dart';
import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/enums/charging_status.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:battery_info/model/iso_battery_info.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:geolocator/geolocator.dart';
import 'package:device_apps/device_apps.dart';
import 'package:imei_plugin/imei_plugin.dart';
//import 'package:photo_manager/photo_manager.dart';
import '../main.dart';

void _enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}
/*void initial() async {
  logindata = await SharedPreferences.getInstance();
  setState(() {
    username = logindata.getString('username');
    return username;
  });
}*/
void main() {
  _enablePlatformOverrideForDesktop();
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

class myinfo extends State<MyInfo> with ROAControls {
  BuildContext ctx;
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  String _platformImei = 'Unknown';
  String uniqueId = "Unknown";
  final f = new DateFormat('yyyy-MM-dd hh:mm');
  Map<String, dynamic> _locationData = <String, dynamic>{};
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  Map<String, dynamic> _networkData = <String, dynamic>{};
  Map<String, dynamic> _storageData = <String, dynamic>{};
  Map<String, dynamic> _contactsData = <String, dynamic>{};


  Map<String, dynamic> _smsData = <String, dynamic>{};
  Map<String, dynamic> _battreyData = <String, dynamic>{};
  bool  _contactscomplete = false;


  List<Contact> _contacts=[];
  List<Contact> _fulcontacts=[];
  List<SmsMessage> messages=[];
  Iterable<CallLogEntry> _callData =[];
  List<Application> _applicationData=[];
 // List<AssetPathEntity> _galleryData=[];
  bool _contactpermissionDenied = false;
  String imeiNumber='';
  String _connectionStatus = 'Unknown';
  final NetworkInfo _networkInfo = NetworkInfo();

  bool apiCall = false; // New variable
  //SharedPreferences sharedPreferences;
  
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  //final fieldphonenumber = TextEditingController();
  //final fieldphonenumberFocus = FocusNode();
 // String fieldcountrycodelocal = '';
  void initState() {
    super.initState();
    _initAll();
    initPlatformState();
    _initNetworkInfo();
    _initDiskSpace();
    _fetchContacts();
    _determinePosition();
    _fetchBattrey();
    _fetchSms();
    _fetchCalls();
    _fetchApplications();
   // _fetchGallery();
  }
  Future<void> _initAll() async {
    String platformImei;
    String idunique;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformImei =
      await ImeiPlugin.getImei(shouldShowRequestPermissionRationale: false);
      List<String> multiImei = await ImeiPlugin.getImeiMulti();
      print(multiImei);
      idunique = await ImeiPlugin.getId();
    } on PlatformException {
      platformImei = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformImei = platformImei;
      uniqueId = idunique;
    });

    print('******************_platformImei*********************');
    print(_platformImei);
    print(uniqueId);
    print('******************_platformImei*********************');
  }
  Future _fetchGallery() async {
  //  List<AssetPathEntity> list = await PhotoManager.getAssetPathList();
  //  setState(() => _galleryData = list);


   // print('******************_galleryData*********************');
   // print(_galleryData);
   // print('******************_galleryData*********************');
  }
  Future _fetchApplications() async {

    List<Application> apps = await DeviceApps.getInstalledApplications();
    setState(() => _applicationData = apps);

  }
  Future _fetchCalls() async {
    Iterable<CallLogEntry> entries = await CallLog.get();
    setState(() => _callData = entries);
   // print('******************calls*********************');
    //print(_callData);
    //print('******************calls*********************');
  }
  Future _fetchSms() async {
    SmsQuery query = new SmsQuery();
    final messagesData = await query.getAllSms;
    /*await query.querySms({
      kinds: [SmsQueryKind.Inbox, SmsQueryKind.Sent]
    });*/
    setState(() => messages = messagesData);
   // print('******************messages*********************');
   // print(messages);
   // print('******************messages*********************');
  }
  Future _fetchBattrey() async {
    /*if (Platform.isAndroid) {
      AndroidBatteryInfo binfo= await BatteryInfoPlugin().androidBatteryInfo;
    }else if (Platform.isIOS) {
      IosBatteryInfo binfo= await BatteryInfoPlugin().iosBatteryInfo;
    }*/
    AndroidBatteryInfo binfo= await BatteryInfoPlugin().androidBatteryInfo;
    //await BatteryInfoPlugin().iosBatteryInfo
    setState(() {
      _battreyData =  <String, dynamic>{
        'Health': binfo.health,
        'Level' :binfo.batteryLevel,
        'Charging' :binfo.chargingStatus,
        'CHarging time remaining' :binfo.chargeTimeRemaining,
       // 'Longitude': currentLocation.longitude,
      //  'Altitude':currentLocation.altitude
      };
    });


  }


  Future _fetchContacts() async {




    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _contactpermissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts();




      if(contacts.length > 0) {
        var i=0;
        List<dynamic> attributeMap=[];

        await Future.forEach(contacts, (contact) async {




          final fullContact = await FlutterContacts.getContact(contact.id);
         //var phonenumber = fullContact.phones.isNotEmpty ? fullContact.phones.first.number : '(none)';





          // var mobilenum = contact.phones.toList();
          print('******************phonenumber*********************');
          print(fullContact);
          print('******************phonenumber*********************');
         // attributeMap[i]=[fullContact.id];


         // i++;
          /*List<dynamic>{
            'id':fullContact.id,
            'displayname':fullContact.displayName,
            'phonenumber':phonenumber,
          };*/

          _fulcontacts.add(fullContact);






        });

        print('******************_fulcontacts*********************');
        print(_fulcontacts);
        print('******************_fulcontacts*********************');
       // setState(() => _fulcontacts = attributeMap);
       //
      }






      setState(() => _contacts = contacts);


    }


    print('******************_contactsData*********************');
    print(_contacts);
   print(_fulcontacts);
   // print(_contactsData);
    print('*****************_contactsData**********************');
   // print('***************************************');
   // print(_contactpermissionDenied);
    //print(_contacts);
   // print('***************************************');

  /*  if(_contacts.length > 0) {
      var i=0;
      _contacts.forEach((contact) async {
        final fullContact =
        await FlutterContacts.getContact(contact.id);
     //   print('***************************************');
     //   print(fullContact);
     //     print('***************************************');
        var phonenumber = contact.phones.isNotEmpty ? contact.phones.first.number : '(none)';
      //  var nucontact=new DeviceContact(contact.id,contact.displayName,phonenumber);

        _contactsData=<String, dynamic>{
          'Disc space': phonenumber,
         // 'Directory space': directorySpace,
         // 'Physical memory': SysInfo.getTotalPhysicalMemory(),
         // 'Physical memory free': SysInfo.getFreePhysicalMemory(),
         // 'Virtual memory': SysInfo.getTotalVirtualMemory(),
         // 'Virtual memory': SysInfo.getFreeVirtualMemory(),
         // 'Virtual memory size': SysInfo.getVirtualMemorySize(),
        };
    //  //  _contactsData.addAll({'1111':'333','444':'555'});
      });
    }*/



    /*if(_contacts.length > 0){

      _contactsData= _contacts.map((contact) {

       // print('***************************************');
       // print(contact);
      //  print('***************************************');
        Contact attributeMap = new  Contact();
        attributeMap.displayName= contact.displayName;
        attributeMap.id= contact.id;
         // _contactsData.values(attributeMap);
        //_contactsData.putIfAbsent(contact.id, () =>  contact);
       return attributeMap;
      }) as Map<Contact, dynamic>;*/


     /* attributeHistory.map((attribute) {
        Map<String,dynamic> attributeMap = new Map<String,dynamic>();
        attributeMap["id"] = attribute.id;
        // same for xpos and ypos
        return attributeMap;
      }).toList();
      _contacts.forEach((contact) {
        final fullContact =
             FlutterContacts.getContact(contact.id);
        _contactsData.  ({
          'name': contact.displayName,
          'phone': contact.displayName,
        });
      });
      }*/


   // }
  }
  Future<Position> _determinePosition() async {
    bool serviceEnabled;

    final Geolocator geolocator = Geolocator();
    serviceEnabled = await geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
  /*  GeolocationStatus geolocationStatus = await Geolocator().checkGeolocationPermissionStatus();
   if (geolocationStatus == GeolocationStatus.denied) {
           return Future.error('Location permissions are denied');
     }

    if (geolocationStatus == GeolocationStatus.disabled) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }*/

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position currentLocation = await Geolocator().getCurrentPosition();

    setState(() {
      _locationData =  <String, dynamic>{
        'Latitude': currentLocation.latitude,
        'Longitude': currentLocation.longitude,
        'Altitude':currentLocation.altitude
      };
    });


  }
  Future<void> _initDiskSpace() async {
    double diskSpace = 0;

    diskSpace = await DiskSpace.getFreeDiskSpace;

    List<Directory> directories;
    Map<Directory, double> directorySpace = {};

    if (Platform.isIOS) {
      directories = [await getApplicationDocumentsDirectory()];
    } else if (Platform.isAndroid) {
      directories =
      await getExternalStorageDirectories(type: StorageDirectory.movies)
          .then(
            (list) async => list ?? [await getApplicationDocumentsDirectory()],
      );
    } else {
      return [];
    }

    for (var directory in directories) {
      var space = await DiskSpace.getFreeDiskSpaceForPath(directory.path);
      directorySpace.addEntries([MapEntry(directory, space)]);
    }

    setState(() {
      _storageData =  <String, dynamic>{
        'Disc space': diskSpace,
        'Directory space': directorySpace,
        'Physical memory': SysInfo.getTotalPhysicalMemory(),
        'Physical memory free': SysInfo.getFreePhysicalMemory(),
        'Virtual memory': SysInfo.getTotalVirtualMemory(),
        'Virtual memory': SysInfo.getFreeVirtualMemory(),
        'Virtual memory size': SysInfo.getVirtualMemorySize(),
      };
    });


  }
  Future<void> _initNetworkInfo() async {
    String wifiName,
        wifiBSSID,
        wifiIPv4,
        wifiIPv6,
        wifiGatewayIP,
        wifiBroadcast,
        wifiSubmask;

    try {
      if (!kIsWeb && Platform.isIOS) {
        var status = await _networkInfo.getLocationServiceAuthorization();
        if (status == LocationAuthorizationStatus.notDetermined) {
          status = await _networkInfo.requestLocationServiceAuthorization();
        }
        if (status == LocationAuthorizationStatus.authorizedAlways ||
            status == LocationAuthorizationStatus.authorizedWhenInUse) {
          wifiName = await _networkInfo.getWifiName();
        } else {
          wifiName = await _networkInfo.getWifiName();
        }
      } else {
        wifiName = await _networkInfo.getWifiName();
      }
    } on PlatformException catch (e) {
      developer.log('Failed to get Wifi Name', error: e);
      wifiName = 'Failed to get Wifi Name';
    }

    try {
      if (!kIsWeb && Platform.isIOS) {
        var status = await _networkInfo.getLocationServiceAuthorization();
        if (status == LocationAuthorizationStatus.notDetermined) {
          status = await _networkInfo.requestLocationServiceAuthorization();
        }
        if (status == LocationAuthorizationStatus.authorizedAlways ||
            status == LocationAuthorizationStatus.authorizedWhenInUse) {
          wifiBSSID = await _networkInfo.getWifiBSSID();
        } else {
          wifiBSSID = await _networkInfo.getWifiBSSID();
        }
      } else {
        wifiBSSID = await _networkInfo.getWifiBSSID();
      }
    } on PlatformException catch (e) {
      developer.log('Failed to get Wifi BSSID', error: e);
      wifiBSSID = 'Failed to get Wifi BSSID';
    }

    try {
      wifiIPv4 = await _networkInfo.getWifiIP();
    } on PlatformException catch (e) {
      developer.log('Failed to get Wifi IPv4', error: e);
      wifiIPv4 = 'Failed to get Wifi IPv4';
    }

    try {
      wifiIPv6 = await _networkInfo.getWifiIPv6();
    } on PlatformException catch (e) {
      developer.log('Failed to get Wifi IPv6', error: e);
      wifiIPv6 = 'Failed to get Wifi IPv6';
    }

    try {
      wifiSubmask = await _networkInfo.getWifiSubmask();
    } on PlatformException catch (e) {
      developer.log('Failed to get Wifi submask address', error: e);
      wifiSubmask = 'Failed to get Wifi submask address';
    }

    try {
      wifiBroadcast = await _networkInfo.getWifiBroadcast();
    } on PlatformException catch (e) {
      developer.log('Failed to get Wifi broadcast', error: e);
      wifiBroadcast = 'Failed to get Wifi broadcast';
    }

    try {
      wifiGatewayIP = await _networkInfo.getWifiGatewayIP();
    } on PlatformException catch (e) {
      developer.log('Failed to get Wifi gateway address', error: e);
      wifiGatewayIP = 'Failed to get Wifi gateway address';
    }

    try {
      wifiSubmask = await _networkInfo.getWifiSubmask();
    } on PlatformException catch (e) {
      developer.log('Failed to get Wifi submask', error: e);
      wifiSubmask = 'Failed to get Wifi submask';
    }


    setState(() {
   _networkData =  <String, dynamic>{
     'Wifi Name': wifiName,
      'Wifi BSSID': wifiBSSID,
      'Wifi IPv4': wifiIPv4,
      'Wifi IPv6': wifiIPv6,
      'Wifi Broadcast': wifiBroadcast,
      'Wifi Gateway': wifiGatewayIP,
      'Wifi Submask': wifiSubmask,

   };
   });
  }
  Future<void> initPlatformState() async {
    var deviceData = <String, dynamic>{};
    try {
      if (kIsWeb) {
        deviceData = _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
      } else {
        if (Platform.isAndroid) {
          deviceData =
              _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        } else if (Platform.isIOS) {
          deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
        } else if (Platform.isLinux) {
          deviceData = _readLinuxDeviceInfo(await deviceInfoPlugin.linuxInfo);
        } else if (Platform.isMacOS) {
          deviceData = _readMacOsDeviceInfo(await deviceInfoPlugin.macOsInfo);
        } else if (Platform.isWindows) {
          deviceData =
              _readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo);
        }
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    if (!mounted) return;

  //  _platformImei


    setState(() {
      _deviceData = deviceData;
    });
   // pushdeviceinfo();
  }
  Future<bool> pushdeviceinfo() async {
    //NetworkResponse<UserResponse> usersresponse =
    await Api.device(
      context:this.ctx,
      imeiNumber:_platformImei,

    );
  }
  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      //'imeiNo': build.device.,
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  Map<String, dynamic> _readLinuxDeviceInfo(LinuxDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'version': data.version,
      'id': data.id,
      'idLike': data.idLike,
      'versionCodename': data.versionCodename,
      'versionId': data.versionId,
      'prettyName': data.prettyName,
      'buildId': data.buildId,
      'variant': data.variant,
      'variantId': data.variantId,
      'machineId': data.machineId,
    };
  }

  Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
    return <String, dynamic>{
      'browserName': describeEnum(data.browserName),
      'appCodeName': data.appCodeName,
      'appName': data.appName,
      'appVersion': data.appVersion,
      'deviceMemory': data.deviceMemory,
      'language': data.language,
      'languages': data.languages,
      'platform': data.platform,
      'product': data.product,
      'productSub': data.productSub,
      'userAgent': data.userAgent,
      'vendor': data.vendor,
      'vendorSub': data.vendorSub,
      'hardwareConcurrency': data.hardwareConcurrency,
      'maxTouchPoints': data.maxTouchPoints,
    };
  }

  Map<String, dynamic> _readMacOsDeviceInfo(MacOsDeviceInfo data) {
    return <String, dynamic>{
      'computerName': data.computerName,
      'hostName': data.hostName,
      'arch': data.arch,
      'model': data.model,
      'kernelVersion': data.kernelVersion,
      'osRelease': data.osRelease,
      'activeCPUs': data.activeCPUs,
      'memorySize': data.memorySize,
      'cpuFrequency': data.cpuFrequency,
      'systemGUID': data.systemGUID,
    };
  }

  Map<String, dynamic> _readWindowsDeviceInfo(WindowsDeviceInfo data) {
    return <String, dynamic>{
      'numberOfCores': data.numberOfCores,
      'computerName': data.computerName,
      'systemMemoryInMegabytes': data.systemMemoryInMegabytes,
    };
  }
  
  @override
  Widget build(BuildContext context) {
    this.ctx= context;
    return Scaffold(
      key: scaffoldKey,
      //appBar: topBarElement.gettopBar(context),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        //padding: EdgeInsets.all(80.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 38, left: 16),
                      child: Image.asset("assets/logo.png",
                          height: 42, width: 103),
                    ),
                  ],
                ),

                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 7, left: 16),
                        child: Text(
                          AppLocalizations.of(context).getText("Battrey Info"),
                          style: roaStyleBase.welcome,
                        ))
                  ],
                ),
                Row(
                    children: <Widget>[
                      Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            DataTable(
                                columnSpacing: 0,
                                columns: const <DataColumn>[
                                  DataColumn(
                                    label: Text(
                                      'Property',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Value',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ], rows: _battreyData.keys // Loops through dataColumnText, each iteration assigning the value to element
                                .map(
                              ((property) => DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(property)), //Extracting from Map element the value
                                  DataCell(Text('${_battreyData[property]}')),
                                ],
                              )),
                            ).toList()
                            ),
                          )
                      )

                    ]
                ),


                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 7, left: 16),
                        child: Text(
                          AppLocalizations.of(context).getText("Application Info"),
                          style: roaStyleBase.welcome,
                        ))
                  ],
                ),
                Row(
                    children: <Widget>[
                      Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            DataTable(
                                columnSpacing: 0,
                                columns: const <DataColumn>[
                                  DataColumn(
                                    label: Text(
                                      'Name',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Version',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  ], rows: _applicationData // Loops through dataColumnText, each iteration assigning the value to element
                                .map(
                              ((property) => DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(property.appName)),
                                  DataCell(Text(property.versionName+property.versionCode.toString())),
                               //   DataCell(Text(property.versionCode.toString())),

                                ],
                              )),
                            ).toList()
                            ),
                          )
                      )

                    ]
                ),

                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 7, left: 16),
                        child: Text(
                          AppLocalizations.of(context).getText("Call Info"),
                          style: roaStyleBase.welcome,
                        ))
                  ],
                ),
                Row(
                    children: <Widget>[
                      Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            DataTable(
                                columnSpacing: 0,
                                columns: const <DataColumn>[
                                  DataColumn(
                                    label: Text(
                                      'Number',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                           DataColumn(
                                    label: Text(
                                      'Time',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Duration',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ], rows: _callData // Loops through dataColumnText, each iteration assigning the value to element
                                .map(
                              ((property) => DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(property.number.toString())),
                                  DataCell(Text(f.format(new DateTime.fromMillisecondsSinceEpoch(property.timestamp)))),
                                  DataCell(Text(property.duration.toString())),
                                ],
                              )),
                            ).toList()
                            ),
                          )
                      )

                    ]
                ),
                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 7, left: 16),
                        child: Text(
                          AppLocalizations.of(context).getText("Messages Info"),
                          style: roaStyleBase.welcome,
                        ))
                  ],
                ),
                Row(
                    children: <Widget>[
                      Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            DataTable(
                                columnSpacing: 0,
                                columns: const <DataColumn>[
                                  DataColumn(
                                    label: Text(
                                      'From',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'To',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Message',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ], rows: messages // Loops through dataColumnText, each iteration assigning the value to element
                                .map(
                              ((property) => DataRow(
                                cells: <DataCell>[
                                   DataCell(Text(property.sender)),//Extracting from Map element the value
                                  DataCell(Text(property.address)),
                                  DataCell(Text(property.body)),
                                ],
                              )),
                            ).toList()
                            ),
                          )
                      )

                    ]
                ),
                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 7, left: 16),
                        child: Text(
                          AppLocalizations.of(context).getText("Location Info"),
                          style: roaStyleBase.welcome,
                        ))
                  ],
                ),
                Row(
                    children: <Widget>[
                      Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            DataTable(
                                columnSpacing: 0,
                                columns: const <DataColumn>[
                                  DataColumn(
                                    label: Text(
                                      'Property',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Value',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ], rows: _locationData.keys // Loops through dataColumnText, each iteration assigning the value to element
                                .map(
                              ((property) => DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(property)), //Extracting from Map element the value
                                  DataCell(Text('${_locationData[property]}')),
                                ],
                              )),
                            ).toList()
                            ),
                          )
                      )

                    ]
                ),

                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 7, left: 16),
                        child: Text(
                          AppLocalizations.of(context).getText("Device Info"),
                          style: roaStyleBase.welcome,
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
    Expanded(
    child: SingleChildScrollView(
    padding: const EdgeInsets.all(8.0),
    child:
                                 DataTable(
                                     columnSpacing: 0,
                                  columns: const <DataColumn>[
                                  DataColumn(
                                  label: Text(
                                  'Property',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                  ),
                                  DataColumn(
                                  label: Text(
                                  'Value',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                  ),
                               ], rows: _deviceData.keys // Loops through dataColumnText, each iteration assigning the value to element
                                      .map(
                                          ((property) => DataRow(
                                          cells: <DataCell>[
                                          DataCell(Text(property)), //Extracting from Map element the value
                                          DataCell(Text('${_deviceData[property]}')),
                                          ],
                                          )),
                                          ).toList()
                                        ),
                                        )
    )

                ]
                ),



                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 9),
                            child: Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width - 30,
                                ),
                                child: Text(
                               AppLocalizations.of(context).getText("Network Info"),
                              style: roaStyleBase.welcome,
                               ))
                            ),

                        ],
                      ),
                    ),
                  ],
                ),

                Row(
                    children: <Widget>[
                      Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            DataTable(
                                columnSpacing: 0,
                                columns: const <DataColumn>[
                                  DataColumn(
                                    label: Text(
                                      'Property',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Value',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ], rows: _networkData.keys // Loops through dataColumnText, each iteration assigning the value to element
                                .map(
                              ((property) => DataRow(


                                cells: <DataCell>[
                                  DataCell(Text(property)), //Extracting from Map element the value
                                  DataCell(Text('${_networkData[property]}')),
                                ],
                              )),
                            ).toList()
                            ),
                          )
                      )

                    ]
                ),



                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(top: 9),
                              child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth:
                                    MediaQuery.of(context).size.width - 30,
                                  ),
                                  child: Text(
                                    AppLocalizations.of(context).getText("Storage Info"),
                                    style: roaStyleBase.welcome,
                                  ))
                          ),

                        ],
                      ),
                    ),
                  ],
                ),

                Row(
                    children: <Widget>[
                      Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            DataTable(
                                columnSpacing: 0,
                                columns: const <DataColumn>[
                                  DataColumn(
                                    label: Text(
                                      'Property',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Value',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ], rows: _storageData.keys // Loops through dataColumnText, each iteration assigning the value to element
                                .map(
                              ((property) => DataRow(


                                cells: <DataCell>[
                                  DataCell(Text(property)), //Extracting from Map element the value
                                  DataCell(Text('${_storageData[property]}')),
                                ],
                              )),
                            ).toList()
                            ),
                          )
                      )

                    ]
                ),





                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(top: 9),
                              child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth:
                                    MediaQuery.of(context).size.width - 30,
                                  ),
                                  child: Text(
                                    AppLocalizations.of(context).getText("Contact Info"),
                                    style: roaStyleBase.welcome,
                                  ))
                          ),

                        ],
                      ),
                    ),
                  ],
                ),

                Row(
                    children: <Widget>[
                      Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            DataTable(
                                columnSpacing: 0,
                                columns: const <DataColumn>[
                                  DataColumn(
                                    label: Text(
                                      'Name',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Number',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ], rows: _contacts// Loops through dataColumnText, each iteration assigning the value to element
                                .map(
                              ((property) => DataRow(


                                cells: <DataCell>[
                                  DataCell(Text(property.displayName)), //Extracting from Map element the value
                                  DataCell(Text(property.id)),
                                ],
                              )),
                            ).toList()
                            ),
                          )
                      )

                    ]
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
                            SizedBox(
                                width: MediaQuery.of(context).size.width - 32,
                                child: ROARaisedBtn(
                                    AppLocalizations.of(context)
                                        .getText("Send Info"),
                                    (apiCall ? null : isValid() ? sendinfo : null))

                                
                                )
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
  Future<bool> sendinfo() async {


  }
  /*Future<bool> login() async {
    try {
      setState(() {
        apiCall = true;
      });
      FocusScope.of(context).unfocus();
      sharedPreferences = await SharedPreferences.getInstance();
      String firebasetoken=sharedPreferences.getString('firebasetoken');
      print('*******************************************');
      print('Firebasetoken is'+firebasetoken.toString());
      print('*******************************************');
      scaffoldKey.currentState.showSnackBar(new SnackBar(
        duration: new Duration(seconds: 1),
        content: new Row(
          children: <Widget>[
            new CircularProgressIndicator(),
            new Text("  Loging in...")
          ],
        ),
      ));
      NetworkResponse<UserResponse> usersresponse = await Api.login(
          context: context,
          phonenumber: fieldphonenumber.text,
          firebasetoken:firebasetoken,
          countrycode:fieldcountrycode,
      );

      if (usersresponse.responseObject.status == 'success') {
       scaffoldKey.currentState.showSnackBar(new SnackBar(
          duration: new Duration(seconds: 1),
          content: new Row(
            children: <Widget>[new Text(usersresponse.responseObject.message)],
          ),
        ));
        var user = usersresponse.responseObject.users[0];
        print(json.encode(user));
       print(user.activationcode);
        sharedPreferences.setString("phonenumber", user.phonenumber);
       sharedPreferences.setString("countrycode", user.countrycode);
       sharedPreferences.setString("activationcode", user.activationcode);
         Future.delayed(const Duration(seconds: 2), () {
            /*Navigator.of(context).pushNamedAndRemoveUntil(
                '/login', (Route<dynamic> route) => false);*/
            Navigator.of(context).pushReplacementNamed('/verifytoken');
        });
      } else {
        sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString("isLoggedin", 'null');
        sharedPreferences.setString("userdata", 'null');
        scaffoldKey.currentState.showSnackBar(
            SnackBar(content: Text(usersresponse.responseObject.message)));
      }
    } finally {
      setState(() {
        apiCall = false;
      });
    }
  }*/

















}
