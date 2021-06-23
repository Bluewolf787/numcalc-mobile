import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numcalc_mobile/utils/size_config.dart';
import 'package:numcalc_mobile/widgets/expansion_panel_item.dart';
import 'package:numcalc_mobile/widgets/snackbar.dart';
import 'package:theme_provider/theme_provider.dart';

class ResultList extends StatelessWidget {
  const ResultList({
    Key key,
    @required this.visible,
    @required this.expansionCallback,
    @required this.data,
  }) : super(key: key);

  final bool visible;
  final Function(int, bool) expansionCallback;
  final List<Item> data;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Visibility(
      visible: visible,
      child: Padding(
        padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 2, right: SizeConfig.widthMultiplier * 2),
        child: ExpansionPanelList(
          expansionCallback: expansionCallback,
          children: data?.map<ExpansionPanel>((Item item) {
            return ExpansionPanel(
              backgroundColor: ThemeProvider.themeOf(context).data.scaffoldBackgroundColor,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(item.headerValue),
                  subtitle: Text(item.subtitle),
                  trailing: IconButton(
                    icon: Icon(Icons.copy),
                    onPressed: () {
                      String copyText = item.headerValue.split(': ').last;
                      Clipboard.setData(ClipboardData(text: copyText));
                      CustomSnackbar.show(context, 'Copyed $copyText');
                    },
                  ),
                );
              },
              body: ListTile(
                title: item.expandedValue,
              ),
              isExpanded: item.isExpanded,
            );
          })?.toList() ?? [],
        ),
      ),
    );
  }
}