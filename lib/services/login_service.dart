import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter_shared_preferences.dart/../managerworkOrder/manager_viewWorkOrder.dart';
import 'package:http/http.dart' as http;
import '../constantsInUse.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/sharedPref.dart';
final storage = FlutterSecureStorage();
class Service {
  static Future  login(username, password,tenantId) async {
    print(username);
    Map<String, dynamic> body = {'uname': username, 'pwd': password,'tid':tenantId};
    var jsonBody = json.encode(body);
    final http.Response response = await http.post(
        Url.url+"/authenticate_SuType", headers: {"Content-Type": "application/json"},
        body: jsonBody
    );
    var  responseBody = response.body;
    //int statusCode = response.statusCode;
    return responseBody;
  }
  static Future  firstname() async{
    var value = await storage.read(key: "jwt");
    var token = jsonDecode(value)['token'];
    var profile=json.decode(
        ascii.decode(
            base64.decode(base64.normalize(value.split(".")[1]))
        ));

     var empkey= profile["employeekey"];
     var OrganizationID= profile["OrganizationID"];
    SharedPreferences preferences = await SharedPreferences.getInstance();
    SharedPrefUtils.saveStr(empkey);
    preferences.setString('empkey', empkey);
    preferences.commit();
  //  preferences.setString('OrganizationID', OrganizationID);



    var url=(Url.api+"/allfacility_SuType?empkey=$empkey&OrganizationID=$OrganizationID");
    print("Login -------------------------url$url");
    final http.Response response= await http.get(url,headers: {'Authorization': token,"Content-Type": "application/json"});
    var  responseBody = response.body;
    var resBody = json.decode(response.body);
   print("-------------------------------------------------------------------------------------------------=================response$responseBody");
    var statusCode = response.statusCode;
   print("statuscode$statusCode");
   return resBody;
//    final responseJson = json.decode(response.body);
//    return responseJson;
  }
}

//makePostRequest() async {
//
//  final uri = 'http://httpbin.org/post';
//  final headers = {'Content-Type': 'application/json'};
//  Map<String, dynamic> body = {'id': 21, 'name': 'bob'};
//  String jsonBody = json.encode(body);
//  final encoding = Encoding.getByName('utf-8');
//
//  Response response = await post(
//    uri,
//    headers: headers,
//    body: jsonBody,
//    encoding: encoding,
//  );
//
//  int statusCode = response.statusCode;
//  String responseBody = response.body;
//}