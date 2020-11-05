import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../constantsInUse.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
final storage = FlutterSecureStorage();
class token_Service{

static Future call_token() async {
    var value = await storage.read(key: "jwt");
    var token = jsonDecode(value)['token'];
    var profile = json.decode(
        ascii.decode(
            base64.decode(base64.normalize(value.split(".")[1]))
        ));
   var data={};

    data['empkey'] = profile["employeekey"];
    data['OrganizationID'] = profile["OrganizationID"];
    return data;
  //  get_token(data);
  }
  get_token(data)
  {
    return data;
  }
}