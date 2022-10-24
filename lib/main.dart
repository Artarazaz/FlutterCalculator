import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //backgroundColor:
    // Colors.black;
    // ignore: dead_code

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vikav Calculator',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Vikav Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "%" ||
        buttonText == "X") {
      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already conatains a decimals");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "%") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(
    String buttonText,
    Color textColor,
    Color buttonColor,
  ) {
    return new Expanded(
      child: new OutlinedButton(
        // Padding: new EdgeInsets.all(24.0),
        child: new Text(
          buttonText,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: buttonColor,
          fixedSize: Size(80, 70),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000000.0),
          ),
          // ignore: deprecated_member_use
          primary: buttonColor,
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
    // ignore: dead_code
    return Scaffold(
        body: Padding(
      padding: new EdgeInsets.all(24.0),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title,
              style: TextStyle(
                color: Colors.white,
              )),
          backgroundColor: Colors.black,
        ),
        body: new Container(
            child: new Column(
          children: <Widget>[
            new Container(
                alignment: Alignment.centerRight,
                padding:
                    new EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                child: new Text(output,
                    style: new TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    ))),
            new Expanded(
              child: new Divider(),
            ),
            new Column(children: [
              new Row(children: [
                buildButton("7", Colors.black, Colors.grey),
                buildButton("8", Colors.black, Colors.grey),
                buildButton("9", Colors.black, Colors.grey),
                buildButton("%", Colors.black, Colors.orange)
              ]),
              new Row(children: [
                buildButton("4", Colors.black, Colors.grey),
                buildButton("5", Colors.black, Colors.grey),
                buildButton("6", Colors.black, Colors.grey),
                buildButton("X", Colors.black, Colors.orange)
              ]),
              new Row(children: [
                buildButton("1", Colors.black, Colors.grey),
                buildButton("2", Colors.black, Colors.grey),
                buildButton("3", Colors.black, Colors.grey),
                buildButton("-", Colors.black, Colors.orange)
              ]),
              new Row(children: [
                buildButton(".", Colors.black, Colors.grey),
                buildButton("0", Colors.black, Colors.grey),
                buildButton("00", Colors.black, Colors.grey),
                buildButton("+", Colors.black, Colors.orange)
              ]),
              new Row(children: [
                buildButton("C", Colors.white, (Colors.grey[850])!),
                buildButton("=", Colors.white, (Colors.grey[850])!),
              ])
            ])
          ],
        )));
  }
}
