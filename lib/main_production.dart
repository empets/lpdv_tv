import 'package:flutter/material.dart';
import 'package:lpdv_tv/my_app.dart';
import 'package:media_kit/media_kit.dart';
import 'package:lpdv_tv/config/env.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  AppConfig.setup(Environment.production);
  runApp( MyApp());
}
