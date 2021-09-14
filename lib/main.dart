import 'package:crmdee/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'store.dart';

void main() {
  Store store1 = new Store();
  runApp(
    ChangeNotifierProvider(
      create: (context) => store1,
      child: Consumer<Store>(
        builder: (context, Store, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginPage(),
          theme: ThemeData(
            brightness: store1.darkMode ? Brightness.dark : Brightness.light,
          ),
        ),
      ),
    ),
  );
} //ef
 