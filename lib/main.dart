import 'package:flutter/material.dart';
import 'package:lpdv_tv/my_app.dart';
import 'package:media_kit/media_kit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  runApp( MyApp());
}
