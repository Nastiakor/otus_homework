import 'package:flutter/material.dart';
import 'app.dart';
import 'init_config.dart';

void main() {
  initConfig();
  registerRepositories();
  runApp(const MyApp());
}
