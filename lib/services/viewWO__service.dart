import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../constantsInUse.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/workOrder.dart';

final storage = FlutterSecureStorage();

class viewWO_service {
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  static final String formatted = formatter.format(now);
  static var empkey = "6433";
  static var OrganizationID = "134";
  static var pageindex = "1";
  // print(formatted);

  static Future<List<workOrder>> wo_Service() async {
    print(formatted);
    var value = await storage.read(key: "jwt");
    var token = jsonDecode(value)['token'];
    var url = (Url.api +
        "/mob_page_viewDashboardWorkorder?viewdate=$formatted&employeekey=$empkey&OrganizationID=$OrganizationID&pageindex=$pageindex");
    print("url$url");
    final http.Response response = await http.get(url,
        headers: {'Authorization': token, "Content-Type": "application/json"});
    var responseBody = response.body;
    var resBody = json.decode(response.body);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((wo) => new workOrder.fromJson(wo)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
    print(
        "------------------------------------------=================response$responseBody");
    var statusCode = response.statusCode;
    print("statuscode$statusCode");
    return resBody;
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
