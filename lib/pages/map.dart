import 'package:crmdee/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class  MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store1 = Provider.of<Store>(context);
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: Container(),
    );
  }
}
