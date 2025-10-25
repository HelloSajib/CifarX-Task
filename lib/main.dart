
import 'package:cifarx_task/cifarx_app.dart';
import 'package:cifarx_task/config/service_locator/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  runApp(CifarXApp());
}
