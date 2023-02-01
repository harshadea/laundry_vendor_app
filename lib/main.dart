import 'package:ecomikstoreapp/utils/app_routes.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EcomikStoreApp());
}

class EcomikStoreApp extends StatelessWidget {
  const EcomikStoreApp({Key? key}) : super(key: key);

  // This widget is the root of this app.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecomik Store',
      onGenerateRoute: AppRouteGenerator.generateRoute,
      initialRoute: AppPageNames.rootScreen,
      theme: AppThemeData.appThemeData,
    );
  }
}
