import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';

import 'package:device_info/constants/constants.dart';
import 'package:device_info/network/network_response.dart';

import 'package:device_info/models/user.dart';
import 'package:device_info/models/order.dart';

enum CallType { get, post, put, delete }

class ApiCall {
   String url;
   NetworkResponse networkResponse;
   String body;
   CallType callType;
   BuildContext context;
 //  SharedPreferences sharedPreferences;
   ApiCall(this.callType, this.url, this.networkResponse, {this.body: "", this.context});

   // Perform network call
   Future<NetworkResponse> call() async {
     Map<String, String> headers = Map<String, String>();
     //sharedPreferences = await SharedPreferences.getInstance();
    // var usersession=sharedPreferences.getString( "userdata" ).toString();

     var usersession=null;

    /* if(usersession!='' && usersession!='null') {
        User userdata = User.fromJson(json.decode( sharedPreferences.getString( "userdata" ) ) ) as User;
     if (userdata?.token != null && userdata.token.length > 0) {
       headers['token'] = userdata.token;
      }
     }*/

     headers['Authorization'] = AUTHORIZATION;
     headers[HttpHeaders.acceptHeader] = "application/json";
     headers[HttpHeaders.contentTypeHeader] = "application/json";
     headers['useragent'] = useragent;
     // headers["Accept-Language"] = AppLocalizations.languageCode();

     try {
       var response;
       switch (callType) {
         case CallType.get:
           response = await http.get(Uri.parse(url), headers: headers);
           break;
         case CallType.delete:
           if(this.body != ""){
             http.Request req = http.Request("DELETE", Uri.parse("$url"));
             req.headers.addAll(headers);
             req.body = this.body;
             response  = await http.Client().send(req);
           }else{
             response = await http.delete(Uri.parse(url), headers: headers);
           }
           break;
         case CallType.post:
           response = await http.post(Uri.parse(url), body: this.body, headers: headers);
           break;
         case CallType.put:
           response = await http.put(Uri.parse(url), body: this.body, headers: headers);
           break;
       }


       networkResponse.httpStatusCode = response.statusCode;

       if (!kReleaseMode) {
         print('-----------------------------------');
         // TODO remove test code
         print("url: $url \nbody:${this.body}\nresponse:${response.body}\nstatuscode:${response.statusCode}\nresponseobject:${this.networkResponse.responseObject}");
         print('-----------------------------------');
       }





       if (networkResponse.httpStatusCode >= 200 && networkResponse.httpStatusCode < 300) {
         if (this.networkResponse.responseObject != null) {
               parse( response.body );
         }
        }else{


       }
       /*if (networkResponse.httpStatusCode >= 200 &&
           networkResponse.httpStatusCode < 300) {
         // If the call to the server was successful, parse the JSON on a background thread
         if (this.networkResponse.responseObject != null) {
           parse(response.body);
         }
       } else if (networkResponse.httpStatusCode == 400) {
         final responseJson = json.decode(response.body) as List;
         responseJson.forEach((badRequestJson) {
           NetworkBadRequestError badRequestError = NetworkBadRequestError();
           badRequestError.fromJson(badRequestJson);
           if (badRequestError.error == "password" &&
               badRequestError.message == 2) {
             networkResponse.httpStatusCode = kNetworkPasswordRegExpError;
           } else if (badRequestError.error == "email" &&
               badRequestError.message == 7) {
             networkResponse.httpStatusCode = kNetworkErrorEmailNotVerified;
           } else if (badRequestError.error == "chattime" &&
               badRequestError.message == 2) {
             networkResponse.httpStatusCode = kNetworkErrorChatTimeClosed;
           }
         });
       } else if (networkResponse.httpStatusCode == 401 &&
           !this.hasRefreshedToken) {
         // Refresh token
         final url = webserviceAdress + 'auth/token';
         UserToken userToken = await UserToken.current;
         if (userToken != null &&
             userToken.refreshToken != null &&
             userToken.refreshToken.length > 0) {
           String body = jsonEncode({'refreshToken': userToken.refreshToken});
           final objectToPopulate =
           NetworkResponse<UserToken>(responseObject: UserToken());
           NetworkResponse<UserToken> userTokenResponse = await NetworkCall(
               CallType.post, url, objectToPopulate,
               body: body, hasRefreshedToken: true)
               .call();

           if (userTokenResponse.httpStatusCode == 200) {
             await UserToken.saveToPreferences(userTokenResponse.responseObject);
             this.hasRefreshedToken = true;
             print("Successfully refreshed token, trying call again");
             return await call();
           } else {
             print("Failed to refreshed token");
             _logoutUser();
             return networkResponse;
           }
         } else {
           print("No token to refresh, this should not happen");
           // We had no refreshtoken
           _logoutUser();
           return networkResponse;
         }
       }*/
     } catch (e) {
       print("Exception in network call: $e");
       networkResponse.httpStatusCode = -1;
     }

     return networkResponse;
   }
   // Parse response
   void parse(String responseBody) {
     if (responseBody != null && responseBody.isNotEmpty) {
       final responseObject = json.decode(responseBody);
       networkResponse.responseObject.fromJson(responseObject);
     }
   }


}

class Api{
  static Future<NetworkResponse<UserResponse>> device({
    @required BuildContext context,
    @required imeiNumber,
    @required manufacturer,
    @required mode,
    @required srNo,
    @required brand,
    @required base,
    @required sdk,
    @required devId,
  }) async {
    final url = API_URL + 'device';
    String body = jsonEncode(
        {'imeiNumber': imeiNumber,'manufacturer': manufacturer,'mode': mode,'srNo': srNo,'brand': brand,'base': base,'sdk': sdk,'devId': devId});
    var objectToPopulate = new NetworkResponse(responseObject: UserResponse());
    final apiCall =  ApiCall(CallType.post, url, objectToPopulate, body: body);
    NetworkResponse<UserResponse> userResponse = await apiCall.call();
    return userResponse;
  }

  static Future<NetworkResponse<UserResponse>> register({
    @required BuildContext context,
     @required phonenumber,
    @required password,
    @required confirmpassword,
  }) async {
    final url = API_URL + 'users/register';
    String body = jsonEncode(
        {'phonenumber': phonenumber, 'password': password, 'confirmpassword': confirmpassword});
    var objectToPopulate = new NetworkResponse(responseObject: UserResponse());
    final apiCall =  ApiCall(CallType.post, url, objectToPopulate, body: body);
    NetworkResponse<UserResponse> userResponse = await apiCall.call();
    return userResponse;
  }
  static Future<NetworkResponse<UserResponse>> googlelogin({
    @required BuildContext context,
    @required email,
    @required name,
    @required googleid,
  }) async {
    final url = API_URL + 'users/googlelogin';
    String body = jsonEncode(
        {'email': email,'name': name,'googleid':googleid});
    var objectToPopulate = new NetworkResponse(responseObject: UserResponse());
    final apiCall =  ApiCall(CallType.post, url, objectToPopulate, body: body);
    NetworkResponse<UserResponse> userResponse = await apiCall.call();
    return userResponse;
  }
  static Future<NetworkResponse<UserResponse>> facebooklogin({
    @required BuildContext context,
    @required userid,
    @required token,
  }) async {
    final url = API_URL + 'users/facebooklogin';
    String body = jsonEncode(
        {'userid': userid,'token': token});
    var objectToPopulate = new NetworkResponse(responseObject: UserResponse());
    final apiCall =  ApiCall(CallType.post, url, objectToPopulate, body: body);
    NetworkResponse<UserResponse> userResponse = await apiCall.call();
    return userResponse;
  }

  static Future<NetworkResponse<UserResponse>> ActivateAccount({
    @required BuildContext context,
    @required userid,

  }) async {
    final url = API_URL + 'users/activate';
    String body = jsonEncode(
        {'userid': userid});
    var objectToPopulate = new NetworkResponse(responseObject: UserResponse());
    final apiCall =  ApiCall(CallType.post, url, objectToPopulate, body: body);
    NetworkResponse<UserResponse> userResponse = await apiCall.call();
    return userResponse;
  }


  static Future<NetworkResponse<UserResponse>> login({
    @required BuildContext context,
    @required phonenumber,
     @required firebasetoken,
    @required countrycode
   }) async {
    final url = API_URL + 'users/login';
    String body = jsonEncode(
        {'phonenumber': phonenumber,'firebasetoken':firebasetoken,'countrycode':countrycode});
    var objectToPopulate = new NetworkResponse(responseObject: UserResponse());
    final apiCall =  ApiCall(CallType.post, url, objectToPopulate, body: body);
    NetworkResponse<UserResponse> userResponse = await apiCall.call();
    return userResponse;
  }

  static Future<NetworkResponse<UserResponse>> forgotPassword({
    @required BuildContext context,
    @required email,
    @required password
  }) async {
    final url = API_URL + 'users/forgotpassword';
    String body = jsonEncode(
        {'email': email});
    var objectToPopulate = new NetworkResponse(responseObject: UserResponse());
    final apiCall =  ApiCall(CallType.post, url, objectToPopulate, body: body);
    NetworkResponse<UserResponse> userResponse = await apiCall.call();
    return userResponse;
  }

  static Future<NetworkResponse<UserResponse>> verifyToken({
    @required BuildContext context,
    @required phonenumber,
    @required resetpasswordtoken
  }) async {
    final url = API_URL + 'users/verifypasswordtoken';
    String body = jsonEncode(
        {'phonenumber': phonenumber, 'resetpasswordtoken': resetpasswordtoken});
    var objectToPopulate = new NetworkResponse(responseObject: UserResponse());
    final apiCall =  ApiCall(CallType.post, url, objectToPopulate, body: body);
    NetworkResponse<UserResponse> userResponse = await apiCall.call();
    return userResponse;
  }

  static Future<NetworkResponse<UserResponse>> resetPassword({
    @required BuildContext context,
    @required phonenumber,
    @required password,
    @required confirmpassword,
    @required resetpasswordtoken
  }) async {
    final url = API_URL + 'users/resetpassword';
    String body = jsonEncode(
        {'phonenumber': phonenumber, 'password': password, 'confirmpassword' : confirmpassword,'resetpasswordtoken': resetpasswordtoken});
    var objectToPopulate = new NetworkResponse(responseObject: UserResponse());
    final apiCall =  ApiCall(CallType.post, url, objectToPopulate, body: body);
    NetworkResponse<UserResponse> userResponse = await apiCall.call();
    return userResponse;
  }
  static Future<NetworkResponse<OrderResponse>> getOrder({@required orderType}) async {
    final url = API_URL + 'getorder/'+orderType;
    var objectToPopulate = new NetworkResponse(responseObject: OrderResponse());
    final apiCall =  ApiCall(CallType.get, url, objectToPopulate);
    NetworkResponse<OrderResponse> orderResponse = await apiCall.call();
    return orderResponse;
  }
  static Future<NetworkResponse<OrderResponse>> getOrders({@required orderType}) async {
    final url = API_URL + 'myorders/'+orderType;
    var objectToPopulate = new NetworkResponse(responseObject: OrderResponse());
    final apiCall =  ApiCall(CallType.get, url, objectToPopulate);
    NetworkResponse<OrderResponse> orderResponse = await apiCall.call();
    return orderResponse;
  }
  static Future<NetworkResponse<UserResponse>> verify({
  @required BuildContext context,
  @required phonenumber,
  @required countrycode,
  @required activationcode
  }) async {
    final url = API_URL + 'users/verify/';
    String body = jsonEncode(
        {'phonenumber': phonenumber, 'activationcode': activationcode, 'countrycode': countrycode});
    var objectToPopulate = new NetworkResponse(responseObject: UserResponse());
    final apiCall =  ApiCall(CallType.post, url, objectToPopulate, body: body);
    NetworkResponse<UserResponse> userResponse = await apiCall.call();
    return userResponse;
  }
  static Future<NetworkResponse<UserResponse>> resendPasswordcode({
    @required BuildContext context,
    @required phonenumber,
    @required countrycode
  }) async {
    final url = API_URL + 'users/resendpasswordcode/'+phonenumber;
    String body = jsonEncode(
        {'phonenumber': phonenumber, 'countrycode': countrycode});
    var objectToPopulate = new NetworkResponse(responseObject: UserResponse());
    final apiCall =  ApiCall(CallType.post, url, objectToPopulate, body: body);
    NetworkResponse<UserResponse> userResponse = await apiCall.call();
    return userResponse;
  }
  static Future<NetworkResponse<UserResponse>> resendcode({
    @required BuildContext context,
    @required phonenumber,
    @required countrycode,
    @required activationcode
  }) async {
    final url = API_URL + 'users/resendcode/'+phonenumber;
    String body = jsonEncode(
        {'phonenumber': phonenumber, 'countrycode':countrycode});
    var objectToPopulate = new NetworkResponse(responseObject: UserResponse());
    final apiCall =  ApiCall(CallType.post, url, objectToPopulate, body: body);
    NetworkResponse<UserResponse> userResponse = await apiCall.call();
    return userResponse;
  }
  static Future<NetworkResponse<OrderResponse>> createOrder({
    @required BuildContext context,
    @required phonenumber,
    @required details}) async {
    final url = API_URL + 'orders/create/';
    String body = jsonEncode(
        {'phonenumber': phonenumber, 'details': details});
    var objectToPopulate = new NetworkResponse(responseObject: OrderResponse());
    final apiCall =  ApiCall(CallType.post, url, objectToPopulate, body: body);
    NetworkResponse<OrderResponse> orderResponse = await apiCall.call();
    return orderResponse;
  }


  static Future<NetworkResponse<OrderResponse>> updateOrder({
    @required BuildContext context,
    @required orderid,
    @required status,
    }) async {
    final url = API_URL + 'orders/update/';
    String body = jsonEncode(
        {'orderid': orderid.toString(), 'status': status});
    var objectToPopulate = new NetworkResponse(responseObject: OrderResponse());
    final apiCall =  ApiCall(CallType.post, url, objectToPopulate, body: body);
    NetworkResponse<OrderResponse> orderResponse = await apiCall.call();
    return orderResponse;
  }

  static Future<NetworkResponse<UserResponse>> updateAvatar({
    @required BuildContext context,
    @required userid,
    @required image,
  }) async {
    final url = API_URL + 'users/updateavatar';
    String body = jsonEncode(
        {'userid': userid.toString(), 'image': image});
    var objectToPopulate = new NetworkResponse(responseObject: UserResponse());
    final apiCall =  ApiCall(CallType.post, url, objectToPopulate, body: body);
    NetworkResponse<UserResponse> userResponse = await apiCall.call();
    return userResponse;
  }
/*

  static Future<NetworkResponse<Null>> createAccount(
      {@required BuildContext context,
        @required email,
        @required password,
        @required username}) async {
    final url = API_URL + 'users';
    String body = jsonEncode(
        {'email': email, 'password': password, 'username': username});
    var userResponse = new NetworkResponse<Null>();
    final networkCall =
    NetworkCall(CallType.post, url, userResponse, body: body);
    userResponse = await networkCall.call();
    if (userResponse.httpStatusCode == 302) {
      userResponse.errorMessage =
          AppLocalizations.of(context).getText('user_already_exist');
    } else if (userResponse.httpStatusCode != 200) {
      userResponse.errorMessage =
          AppLocalizations.of(context).getText('something_went_wrong');
    }

    return userResponse;
  }
*/
}