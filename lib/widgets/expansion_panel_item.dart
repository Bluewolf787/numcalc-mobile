import 'package:flutter/material.dart';

class Item {
  Item({
    @required this.headerValue,
    @required this.expandedValue,
    this.isExpanded = false,
  });

  String headerValue;
  Widget expandedValue;
  bool isExpanded;
}