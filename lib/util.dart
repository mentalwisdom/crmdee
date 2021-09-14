import 'package:flutter/material.dart';

double hh(context) {
  return MediaQuery.of(context).size.height;
}

double ww(context) {
  return MediaQuery.of(context).size.width;
}

TSize(BuildContext context, dynamic value) {
  // 720 is medium screen height
  return (value / 720) * MediaQuery.of(context).size.height;
}
