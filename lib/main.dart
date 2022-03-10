import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Form',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Form'),
//         ),
//         body: Center(
//           child: ChangeForm(),
//         ),
//       ),
//     );
//   }
// }


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      routes: <String, WidgetBuilder> {
        '/main': (BuildContext context) => new MainPage(),
        '/1': (BuildContext context) => new SubPage(),
        '/2': (BuildContext context) => new ChangeForm(),
      },
    );
  }
}
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: Center(
            child: new Text('Navigator')
        ),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('ようこそ'),
              RaisedButton(onPressed: () => Navigator.of(context).pushNamed("/1"), child: new Text('登録ページへ'),)
            ],
          ),
        ),
      ),
    );
  }
}
class SubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: Center(
            child: new Text('登録ページ')
        ),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('ありがとうございます'),
              RaisedButton(onPressed: () => Navigator.of(context).pushNamed('/2'), child: new Text('登録'),)
            ],
          ),
        ),
      ),
    );
  }
}
class ChangeForm extends StatefulWidget {
  @override
  _ChangeFormState createState() => _ChangeFormState();
}

class _ChangeFormState extends State<ChangeForm> {

  String _text = '';

  void _handleText(String e) {
    setState(() {
      _text = e;
    });
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "$_text",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500
                ),
              ),
              new TextField(
                enabled: true,
                // 入力数
                maxLength: 10,
                maxLengthEnforced: false,
                style: TextStyle(color: Colors.red),
                obscureText: false,
                maxLines:1 ,
                //パスワード
                onChanged: _handleText,
              ),
            ],
          ),
        )
    );
  }
}

