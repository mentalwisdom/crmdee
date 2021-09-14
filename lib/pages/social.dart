import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialPage extends StatelessWidget {
  final String lat = "25.3622";
  final String lng = "86.0835";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("social "),
      ),
      body: Column(
        children: [
          TextField(
            keyboardType:TextInputType.number
          ),
            TextField(
           
          ),
          IconButton(
              onPressed: () {
                _launchMap();
              },
              icon: Icon(Icons.map)),
          IconButton(
            onPressed: () async {
              //String url = "https://line.me/R/nv/settings/sticker";
              String url = "http://line.me/ti/g/P47bXv759F";
             
              if (await canLaunch(url)) {
                await launch(url, forceSafariVC: false);
              } else {
                throw "Couldn't launch URL";
              }
            },
            icon: Icon(Icons.social_distance),
          )
        ],
      ),
    );
  } //ef

  _launchMap() async {
    final String googleMapsUrl = "comgooglemaps://?center=$lat,$lng";
    final String appleMapsUrl = "https://maps.apple.com/?q=$lat,$lng";

    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    }
    if (await canLaunch(appleMapsUrl)) {
      await launch(appleMapsUrl, forceSafariVC: false);
    } else {
      throw "Couldn't launch URL";
    }
  }
}//ec

