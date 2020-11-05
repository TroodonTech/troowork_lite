import 'package:flutter/material.dart';
import 'managerdash/managerlanding.dart';
import 'login/login.dart';
import 'managerworkOrder/workorderlanding.dart';

final routes = {
  '/login':         (BuildContext context) => new Login(),
  '/mdash':         (BuildContext context) => new Managerdash(),
  '/mwlanding':      (BuildContext context)=> new WorkOrder(),
  '/' :             (BuildContext context) => new Login(),
};