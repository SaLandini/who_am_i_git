
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:who_am_i/src/information/containers/create_docs.dart';
import 'package:who_am_i/src/routes.dart';
/*components*/
import 'src/fingerprintAuth.dart';

void main() {
  runApp(MaterialApp(
      routes: {
        AppRoutes.HOME: (_) => FingerprintApp(),
        AppRoutes.CREATEDOCS: (_) => CreateDocs(),
      },
  ));
}
