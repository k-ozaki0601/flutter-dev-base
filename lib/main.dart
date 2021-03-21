import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'base/validation/validator_builder.dart';
import 'base/widget/widget.dart';

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

  @override
  Widget build(BuildContext context) {
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
                  validationBuilder: ValidationBuilder().required(),
                  decoration: InputDecoration(
                    hintText: 'required',
                    labelText: '必須項目',
                  ),
                ),
                EmailTextFormField(
                  decoration: InputDecoration(
                    hintText: 'email',
                    labelText: 'メールアドレス',
                  ),
                ),
                NumberTextFormField(
                  decoration: InputDecoration(
                    hintText: 'number',
                    labelText: '小数',
                  ),
                ),
                PositiveIntegerTextFormField(
                  decoration: InputDecoration(
                    hintText: 'positive integer',
                    labelText: '正の数値',
                  ),
                ),
                IntegerTextFormField(
                  decoration: InputDecoration(
                    hintText: 'integer',
                    labelText: '整数',
                  ),
                ),
                DigitsTextFormField(
                  decoration: InputDecoration(
                    hintText: 'digits',
                    labelText: '数値',
                  ),
                ),
                AlphanumTextFormField(
                  decoration: InputDecoration(
                    hintText: 'alphanum',
                    labelText: '英数',
                  ),
                ),
                AlphanumSymbolTextFormField(
                  decoration: InputDecoration(
                    hintText: 'alphanum',
                    labelText: '英数記号',
                  ),
                ),
                PasswordTextFormField(
                  validationBuilder: ValidationBuilder().required(),
                  decoration: InputDecoration(
                    hintText: 'password',
                    labelText: 'パスワード',
                  ),
                ),
                UrlTextFormField(
                  decoration: InputDecoration(
                    hintText: 'url',
                    labelText: 'URL',
                  ),
                ),
                DateTextFormField(
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
                  decoration: InputDecoration(
                    labelText: 'phone number',
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
                InputDatePickerFormField(
                  firstDate: DateTime(2019),
                  lastDate: DateTime(2020, 12, 12),
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                  onPressed: () {
                    var valid = _formKey.currentState.validate();
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
