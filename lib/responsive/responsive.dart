

import 'package:flutter/material.dart' show MediaQuery;

double getResponsiveOnWidth(context) {
  return MediaQuery.of(context).size.width * 0.001;
}