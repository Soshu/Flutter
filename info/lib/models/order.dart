
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info/network/network_response.dart';
class OrderResponse extends ResponseObject{
  String status;
  int statuscode;
  String message;
  int count;
  List<Order> orders;
  @override
  fromJson(Map<String, dynamic> json) {
    status = json['status'] ;
    statuscode = json['statuscode'] ;
    message = json['message'];
    count = json['count'];
    var jsonList = json["orders"];
    orders = [];
    jsonList.forEach((jsonMap) {
      orders.add(Order.fromJson(jsonMap));
    });
   }
}

/// Model object for orders.
class Order {
  int id;
  String phonenumber;
  String details;
  String vendor;
  int status;
  String created_ts;
  String order_date;
  //SharedPreferences sharedPreferences;
  //Order({this.id, this.phonenumber, this.details,this.vendor, this.amount, this.currency, this.status, this.created_ts});

  Map<String, dynamic> toJson() =>
      {
        "id" : id,
        "phonenumber" : phonenumber,
        "details" : details,
        "vendor" : vendor,
         "status" : status,
        "created_ts" : created_ts,
        "order_date" : order_date
      };
  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    phonenumber = json['phonenumber'] as String;
    details = json['details'] as String;
    vendor = json['vendor'] as String;
    status = json['status'] as int;
    created_ts = json['created_ts'] as String;
    order_date = json['order_date'] as String;
  }
}
