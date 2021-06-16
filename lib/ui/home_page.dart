import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numcalc_mobile/utils/size_config.dart';
import 'package:numcalc_mobile/widgets/button.dart';
import 'package:numcalc_mobile/widgets/close_dialog.dart';
import 'package:numcalc_mobile/widgets/input_field.dart';
import 'package:theme_provider/theme_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _editingController;

  String _dropdownValue = 'Decimal';
  List<String> _numberalSystems = ['Decimal', 'Binary', 'Octal', 'Hexadecimal'];

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

                ConvertButton(
                  onPressed: () {
                    setState(() {
                      _editingController.text =  'Button pressed';
                    });
                  }
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}