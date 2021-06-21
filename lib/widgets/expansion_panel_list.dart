import 'package:flutter/material.dart';
import 'package:numcalc_mobile/utils/size_config.dart';
import 'package:numcalc_mobile/widgets/expansion_panel_item.dart';
import 'package:theme_provider/theme_provider.dart';

class ResultList extends StatelessWidget {
  const ResultList({
    Key key,
    @required this.visible,
    @required this.expansionCallback,
    @required this.data,
    @required this.onCopyPressed,
  }) : super(key: key);

  final bool visible;
  final Function(int, bool) expansionCallback;
  final List<Item> data;
  final Function onCopyPressed;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Visibility(
      visible: visible,
      child: Padding(
        padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 2, right: SizeConfig.widthMultiplier * 2),
        child: ExpansionPanelList(
          expansionCallback: expansionCallback,
          children: data.map<ExpansionPanel>((Item item) {
            return ExpansionPanel(
              backgroundColor: ThemeProvider.themeOf(context).data.scaffoldBackgroundColor,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(item.headerValue),
                  trailing: IconButton(
                    icon: Icon(Icons.copy),
                    onPressed: onCopyPressed,
                  ),
                );
              },
              body: ListTile(
                title: item.expandedValue,
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        ),
      ),
    );
  }
}