import 'dart:convert';

import 'package:crmdee/model/result.dart';
import 'package:crmdee/pages/api.dart';
import 'package:crmdee/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store1 = Provider.of<Store>(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              IconButton(
                onPressed: () async {
                  Result result = await Api.loginHttp(
                    userName: "user1@localhost.com",
                    password: "1234",
                  );

                  var map = json.decode(result.data);
                  String token = map['token'];

                  store1.setToken(token);
                  //move to Home Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                icon: Icon(Icons.login),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
