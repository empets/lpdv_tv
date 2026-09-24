import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';

import 'package:lpdv_tv/config/env.dart';
import 'package:lpdv_tv/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  AppConfig.setup(Environment.staging);
  runApp( MyApp());
}
