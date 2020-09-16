import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.red),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int firstNum;
  int secondNum;
  String textToDisplay = '';
  String res;
  String operation;

  //creating btnclick

  void btnClicked(String btnVal) {
    if (btnVal == 'C') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'x' ||
        btnVal == '/') {
      firstNum = int.parse(textToDisplay);
      res = '';
      operation = btnVal;
    } else if (btnVal == '=') {
      secondNum = int.parse(textToDisplay);
      if (operation == '+') {
        res = (firstNum + secondNum).toString();
      }
      if (operation == '-') {
        res = (firstNum - secondNum).toString();
      }
      if (operation == 'x') {
        res = (firstNum * secondNum).toString();
      }
      if (operation == '/') {
        res = (firstNum ~/ secondNum).toString();
      }
    } else {
      res = int.parse(textToDisplay + btnVal).toString();
    }
    setState(() {
      textToDisplay = res;
    });
  }

  //creating a custom button
  Widget customButton(String btnVal) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => btnClicked(btnVal),
        child: Text(
          btnVal,
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caculator'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  textToDisplay,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                customButton('9'),
                customButton('8'),
                customButton('7'),
                customButton('+'),
              ],
            ),
            Row(
              children: [
                customButton('6'),
                customButton('5'),
                customButton('4'),
                customButton('-'),
              ],
            ),
            Row(
              children: [
                customButton('3'),
                customButton('2'),
                customButton('1'),
                customButton('x'),
              ],
            ),
            Row(
              children: [
                customButton('C'),
                customButton('0'),
                customButton('='),
                customButton('/'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
