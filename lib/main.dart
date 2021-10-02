import 'package:flutter/material.dart';
import 'package:spacex_app/src/app.dart';
import 'package:spacex_app/src/repository/repository.dart';

void main() {
  Repository repository = Repository();
  runApp(App(repository: repository));
}
