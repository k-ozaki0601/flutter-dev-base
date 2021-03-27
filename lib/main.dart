import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_validation/base/model/label_value.dart';
import 'package:intl/intl.dart';
import 'package:sprintf/sprintf.dart';
import 'base/widget/widget.dart';
import 'base/model/label_value.dart';
import 'base/extensions/string.dart';

void main() {
  Intl.defaultLocale = 'ja_JP';
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("en"),
        const Locale("ja"),
      ],
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  LabelValue _radioSelected;
  List<LabelValue> _choices = [];
  String _selectedValue = "1";

  @override
  Widget build(BuildContext context) {
    List<LabelValue> genders = [];
    genders.add(LabelValue(
      label: "男",
      value: "1",
    ));
    genders.add(LabelValue(
      label: "女",
      value: "2",
    ));

    List<DropdownMenuItem<String>> dropdownItems = [];
    genders.forEach((element) {
      dropdownItems.add(DropdownMenuItem<String>(
        value: element.value,
        child: Text(element.label),
      ));
    });

    Map<String, TextEditingController> formControllers = {
      'required': TextEditingController(text: "hello"),
      'email': TextEditingController(text: 'ozaki@elseif.jp'),
      'numberText': TextEditingController(text: '1.25'),
      'positiveText': TextEditingController(text: '1'),
      'integerText': TextEditingController(text: '-100'),
      'digitText': TextEditingController(text: '10'),
      'alphanumText': TextEditingController(text: 'abc123'),
      'alphanumSymbolText': TextEditingController(text: 'abc123##'),
      'passwordText': TextEditingController(text: 'password'),
      'urlText': TextEditingController(text: 'https://www.yahoo.co.jp'),
      'dateText': TextEditingController(text: ''),
      'datepicker': TextEditingController(),
      'timepicker': TextEditingController(),
      'datetimePicker': TextEditingController(),
      'phoneText': TextEditingController(text: '09099999999'),
      'textarea': TextEditingController(text: 'aaa'),
    };

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(8),
            child: Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormFieldEx(
                  controller: formControllers['required'],
                  required: true,
                  decoration: InputDecoration(
                    hintText: 'required',
                    labelText: '必須項目',
                  ),
                ),
                EmailTextFormField(
                  controller: formControllers['email'],
                  decoration: InputDecoration(
                    hintText: 'email',
                    labelText: 'メールアドレス',
                  ),
                ),
                NumberTextFormField(
                  controller: formControllers['numberText'],
                  decoration: InputDecoration(
                    hintText: 'number',
                    labelText: '小数',
                  ),
                ),
                PositiveIntegerTextFormField(
                  controller: formControllers['positiveText'],
                  decoration: InputDecoration(
                    hintText: 'positive integer',
                    labelText: '正の数値',
                  ),
                ),
                IntegerTextFormField(
                  controller: formControllers['integerText'],
                  decoration: InputDecoration(
                    hintText: 'integer',
                    labelText: '整数',
                  ),
                ),
                DigitsTextFormField(
                  controller: formControllers['digitText'],
                  decoration: InputDecoration(
                    hintText: 'digits',
                    labelText: '数値',
                  ),
                ),
                AlphanumTextFormField(
                  controller: formControllers['alphanumText'],
                  decoration: InputDecoration(
                    hintText: 'alphanum',
                    labelText: '英数',
                  ),
                ),
                AlphanumSymbolTextFormField(
                  controller: formControllers['alphanumSymbolText'],
                  decoration: InputDecoration(
                    hintText: 'alphanum',
                    labelText: '英数記号',
                  ),
                ),
                PasswordTextFormField(
                  controller: formControllers['passwordText'],
                  decoration: InputDecoration(
                    hintText: 'password',
                    labelText: 'パスワード',
                  ),
                ),
                UrlTextFormField(
                  controller: formControllers['urlText'],
                  decoration: InputDecoration(
                    hintText: 'url',
                    labelText: 'URL',
                  ),
                ),
                DateTextFormField(
                  controller: formControllers['dateText'],
                  decoration: InputDecoration(
                    hintText: 'date',
                    labelText: 'Date',
                  ),
                ),
                DatepickerFormField(
                  decoration: InputDecoration(
                    hintText: 'date',
                    labelText: 'Datepickder-date',
                  ),
                ),
                DatepickerFormField(
                  mode: DateTimeFieldPickerMode.time,
                  decoration: InputDecoration(
                    hintText: 'time',
                    labelText: 'Datepicker-Time',
                  ),
                ),
                DatepickerFormField(
                  initialDatePickerMode: DatePickerMode.year,
                  mode: DateTimeFieldPickerMode.dateAndTime,
                  decoration: InputDecoration(
                    hintText: 'datetime',
                    labelText: 'Datepicker-DateTime',
                  ),
                ),
                PhoneTextFormField(
                  controller: formControllers['phoneText'],
                  decoration: InputDecoration(
                    labelText: 'phone number',
                  ),
                ),
                TextareaFormField(
                  controller: formControllers['textarea'],
                  decoration: InputDecoration(
                    hintText: 'textarea',
                    labelText: 'textarea',
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: ValidationBuilder().minLength(5).build(),
                  decoration: InputDecoration(
                    hintText: 'minLength',
                    labelText: '最小文字数',
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: ValidationBuilder().maxLength(5).build(),
                  decoration: InputDecoration(
                    hintText: 'maxLength',
                    labelText: '最大文字数',
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: ValidationBuilder().length(5, 10).build(),
                  decoration: InputDecoration(
                    hintText: 'length',
                    labelText: '最小文字数〜最大文字数',
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: ValidationBuilder().min(5).build(),
                  decoration: InputDecoration(
                    hintText: 'min',
                    labelText: '最小値',
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: ValidationBuilder().max(5).build(),
                  decoration: InputDecoration(
                    hintText: 'max',
                    labelText: '最大値',
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: ValidationBuilder().range(5, 10).build(),
                  decoration: InputDecoration(
                    hintText: 'min - max',
                    labelText: '最小値〜最大値',
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: ValidationBuilder().pattern(r'^\w+$').build(),
                  decoration: InputDecoration(
                    hintText: 'pattern',
                    labelText: '正規表現',
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: ValidationBuilder().equalto('password').build(),
                  decoration: InputDecoration(
                    hintText: 'equalto(password)',
                    labelText: '一致',
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: ValidationBuilder().gt(5).build(),
                  decoration: InputDecoration(
                    hintText: 'gt',
                    labelText: 'より大きい',
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: ValidationBuilder().gte(5).build(),
                  decoration: InputDecoration(
                    hintText: 'gte',
                    labelText: 'より大きい または 等しい',
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: ValidationBuilder().lt(5).build(),
                  decoration: InputDecoration(
                    hintText: 'lt',
                    labelText: 'より小さい',
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: ValidationBuilder().lte(5).build(),
                  decoration: InputDecoration(
                    hintText: 'lte',
                    labelText: 'より小さい または　等しい',
                  ),
                ),
                // InputDatePickerFormField(
                //   firstDate: DateTime(2019),
                //   lastDate: DateTime(2020, 12, 12),
                // ),
                RadioFormField(
                  selections: genders,
                  disabled: [],
                  defaultValue: "2",
                  onChange: (LabelValue selected) => setState(() {
                    _radioSelected = selected;
                  }),
                ),
                CheckboxFormField(
                  selections: genders,
                  defaultValues: ["1"],
                  disabled: ["1"],
                  onChange: (List<LabelValue> selected) => setState(() {
                    _choices = selected;
                  }),
                ),
                DropdownButtonFormFieldEx(
                  labelText: "性別",
                  items: dropdownItems,
                  value: _selectedValue,
                  onChanged: (newVal) {
                    setState(() {
                      _selectedValue = newVal;
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                  onPressed: () {
                    bool valid = _formKey.currentState.validate();
                    if (!valid) {
                      print('has error');
                      return;
                    }

                    formControllers.forEach((key, value) {
                      print(sprintf("%s = %s, %d, %f", [
                        key,
                        value.text,
                        value.text.toInt(),
                        value.text.toDouble()
                      ]));
                    });
                    print(sprintf("radio: %s", [_radioSelected.value]));
                    print('checkbox --');
                    _choices.forEach((element) {
                      print(element.value);
                    });
                    print(sprintf("dropdown: %s", [_selectedValue]));
                  },
                  child: Text('Do Validate!'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
