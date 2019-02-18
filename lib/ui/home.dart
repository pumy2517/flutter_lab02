import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<StatefulWidget> {
  List<String> _colors = <String>[
    '<Please select color>',
    'red',
    'green',
    'blue',
    'orange'
  ];
  String _color = '<Please select color>';
  final formats = {
    InputType.both: DateFormat("dd-MM-yyyy 'at' h:mma"),
    InputType.date: DateFormat('yyyy-MM-dd'),
    InputType.time: DateFormat("HH:mm"),
  };

  InputType inputType = InputType.both;
  bool editable = true;
  DateTime date;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Home"),
          ),
          body: ListView(
            children: <Widget>[
              InputDecorator(
                decoration: InputDecoration(
                  icon: const Icon(Icons.color_lens),
                  labelText: 'Color',
                ),
                isEmpty: _color == '',
                child: new DropdownButtonHideUnderline(
                  child: new DropdownButton(
                    value: _color,
                    isDense: true,
                    onChanged: (String newValue) {
                      setState(() {
                        _color = newValue;
                      });
                    },
                    items: _colors.map((String value) {
                      return new DropdownMenuItem(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              DateTimePickerFormField(
                inputType: inputType,
                format: formats[inputType],
                editable: editable,
                decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    labelText: 'Date/Time'),
                onChanged: (dt) => setState(() => date = dt),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
