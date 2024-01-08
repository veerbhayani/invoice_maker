import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:invoice_maker/models/models.dart';
import 'package:invoice_maker/screens/splash_screen.dart';
import 'package:invoice_maker/styles/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await loadCompanyDataFromSharedPreferences();
  await loadDetailsFromSharedPreferences();
  runApp(
    const MyApp(),
  );
}

Future<void> loadCompanyDataFromSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Populate the controller with data from SharedPreferences
  controller.companyName.value = prefs.getString('companyName') ?? "";
  controller.companyAddress.value = prefs.getString('companyAddress') ?? "";
  controller.companyAddress2.value = prefs.getString('companyAddress2') ?? "";
  controller.companyAddress3.value = prefs.getString('companyAddress3') ?? "";
  controller.companyGSTNo.value = prefs.getString('companyGSTNo') ?? "";
  controller.companyEmail.value = prefs.getString('companyEmail') ?? "";
  controller.companyNumber.value = prefs.getString('companyNumber') ?? "";
  controller.selectedImagePath.value =
      prefs.getString('selectedImagePath') ?? "";
  controller.initialTaxValue.value = prefs.getInt('companyTax') ?? 0;
}

Future<void> loadDetailsFromSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Load products list
  List<String>? productsJson = prefs.getStringList('productsList');
  if (productsJson != null) {
    controller.productsList = productsJson
        .map((productJson) => Products.fromJson(json.decode(productJson)))
        .toList();
  }

  // Load customers list
  List<String>? customersJson = prefs.getStringList('customersList');
  if (customersJson != null) {
    controller.customersList = customersJson
        .map((customerJson) => Customer.fromJson(json.decode(customerJson)))
        .toList();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.fadeIn,
      darkTheme: ThemeData(
          brightness: Brightness.dark, appBarTheme: const AppBarTheme()),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
