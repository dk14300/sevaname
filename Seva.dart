import 'package:flutter/material.dart';
import 'package:mahanandi/Model/SevaName.dart';

class Seva extends StatefulWidget {
  static String id ='Seva';
  @override
  _SevaState createState() => _SevaState();
}

class _SevaState extends State<Seva> {

  String dropdownValue = 'usa';
  String defaulthint = 'select text';

  String sevadetailtext;
  int buttonvaluetext;
  String value;
  List<SevaName> sevanames =
    [
    SevaName(sevaname:'india',sevadetail:'trail',buttonvalue: 234),
    SevaName(sevaname:'usa',sevadetail:'morning1',buttonvalue: 123),
    SevaName(sevaname:'france',sevadetail:'morning2',buttonvalue: 456),
    ];


  String buttonvalue() {
    for(var seva in sevanames) {
      if(seva.sevaname==dropdownValue) {
        buttonvaluetext = seva.buttonvalue;
        value = buttonvaluetext.toString();
        return value;
      }
    }
  }


  String sevatextdetail() {
    for(var seva in sevanames) {
      if(seva.sevaname==dropdownValue) {
        sevadetailtext = seva.sevadetail;
        return sevadetailtext;
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      body: Center(
        child :Column(children: <Widget>[
          DropdownButton<String>(
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.red, fontSize: 18),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String data) {
              setState(() {
                dropdownValue = data.sevaname;
                sevadetailtext = data.sevadetail;
                value = data.buttonvalue;
              });
            },
            items: sevanames.map<DropdownMenuItem<String>>((SevaName value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value.sevaname),
              );
            }).toList(),
          ),
          Text('Selected Item = ' + '$sevadetailtext',
              style: TextStyle
                (fontSize: 22,
                  color: Colors.black)),
          MaterialButton(
            child: Text('$value'),
            shape: Border.all(width: 2.0, color: Colors.redAccent),
            onPressed: (){
            },
          )
        ],),
      ),
    );
  }
}
