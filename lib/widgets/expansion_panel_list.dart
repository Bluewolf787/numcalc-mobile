import 'package:flutter/material.dart';
import 'package:numcalc_mobile/widgets/expansion_panel_item.dart';

class ResultList extends StatelessWidget {
  const ResultList({
    Key key,
    @required this.data,
  }) : super(key: key);

  final List<Item> data;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {

      },     
    );
  }
}