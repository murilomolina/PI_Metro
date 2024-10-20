import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:metro_web/src/app.dart';

void main() async {
  await dotenv.load(fileName: ".env"); // Carregando o arquivo .env
  runApp(const App());
}