import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numcalc_mobile/utils/size_config.dart';
import 'package:numcalc_mobile/widgets/button.dart';
import 'package:numcalc_mobile/widgets/close_dialog.dart';
import 'package:numcalc_mobile/widgets/expansion_panel_item.dart';
import 'package:numcalc_mobile/widgets/input_field.dart';
import 'package:numcalc_mobile/widgets/tables.dart';
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
  List<Item> resultData = [Item(headerValue: '-', expandedValue: BinaryTable(calculation: '-', rest: '-', interimResult: '-',)), Item(headerValue: '-', expandedValue: FourRowTable(powerCalc: '-', restCalc: '-', rest: '-', interimResult: '-',))];

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
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            width: SizeConfig.widthMultiplier * 100,
            height: SizeConfig.heightMultiplier * 100,
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
                      });
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 4),
                  child: ConvertButton(
                    onPressed: () {
                      setState(() {
                        _editingController.text =  'Button pressed';
                        _isResultVisibile = true;
                      });
                    }
                  ),
                ),
                
                Visibility(
                  visible: _isResultVisibile,
                  child: Padding(
                    padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 2, right: SizeConfig.widthMultiplier * 2),
                    child: ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          resultData[index].isExpanded = !isExpanded;           
                        });
                      },
                      children: resultData.map<ExpansionPanel>((Item item) {
                        return ExpansionPanel(
                          backgroundColor: ThemeProvider.themeOf(context).data.scaffoldBackgroundColor,
                          headerBuilder: (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text(item.headerValue),
                              trailing: IconButton(
                                icon: Icon(Icons.copy),
                                onPressed: () {
                                  print('COPYED');
                                },
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}