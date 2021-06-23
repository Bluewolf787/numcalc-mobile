import 'package:flutter/material.dart';

class Item {
  Item({
    @required this.headerValue,
    @required this.expandedValue,
    @required this.subtitle,
    this.isExpanded = false,
  });

  String headerValue;
  Widget expandedValue;
  String subtitle;
  bool isExpanded;
}