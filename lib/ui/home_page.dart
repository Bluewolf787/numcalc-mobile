import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numcalc_mobile/utils/conversion_helper.dart';
import 'package:numcalc_mobile/utils/size_config.dart';
import 'package:numcalc_mobile/widgets/button.dart';
import 'package:numcalc_mobile/widgets/close_dialog.dart';
import 'package:numcalc_mobile/widgets/expansion_panel_item.dart';
import 'package:numcalc_mobile/widgets/expansion_panel_list.dart';
import 'package:numcalc_mobile/widgets/input_field.dart';
import 'package:numcalc_mobile/widgets/snackbar.dart';
import 'package:theme_provider/theme_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _editingController;

  String _dropdownValue = 'Decimal';
  List<String> _numberalSystems = ['Decimal', 'Binary', 'Octal', 'Hexadecimal'];

  bool _isResultVisibile = false;
  List<Item> _resultData = [];

  @override
  void initState() {
    super.initState();
    _editingController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () => showDialog(context: context, builder: (context) => CloseDialog()),
      child: Scaffold(
        backgroundColor: ThemeProvider.themeOf(context).data.scaffoldBackgroundColor,
        body: Builder(
          builder: (context) => NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowGlow();
              return false;
            },
            child: Center(
              widthFactor: SizeConfig.widthMultiplier * 100,
              heightFactor: SizeConfig.heightMultiplier * 100,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                clipBehavior: Clip.hardEdge,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    DropdownButton<String>(
                      value: _dropdownValue,
                      onChanged: (String newValue) {
                        setState(() {
                          _dropdownValue = newValue;                      
                        });
                      },
                      items: _numberalSystems.map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 30, 35, 30),
                      child: InputField(
                        controller: _editingController,
                        labelText: 'Convert from $_dropdownValue',
                        hintText: _dropdownValue,
                        onPressedClear: () {
                          setState(() {
                            _editingController.clear();
                            _isResultVisibile = false;
                          });
                        },
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 4),
                      child: ConvertButton(
                        onPressed: () {
                          String value = _editingController.text;

                          if (value == '') {
                            CustomSnackbar.show(context, 'Please enter a valid number');
                            return;
                          }

                          setState(() {
                            _resultData = ConversionHelper().init(context, _dropdownValue, value);
                            _isResultVisibile = true;
                          });
                        }
                      ),
                    ),
                    
                    ResultList(
                      visible: _isResultVisibile,
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _resultData[index].isExpanded = !isExpanded;
                        });
                      },
                      data: _resultData,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}