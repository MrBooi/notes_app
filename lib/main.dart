import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_ddd_app/injection.dart';
import 'package:notes_ddd_app/presentation/core/app_widget.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(AppWidget());
}
