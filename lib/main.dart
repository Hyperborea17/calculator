import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title:'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home:MyCalculatorApp(),
    );
  }
}
class MyCalculatorApp extends StatefulWidget
{
  @override
  _MyCalculatorAppState createState() => _MyCalculatorAppState();

}
class _MyCalculatorAppState extends State<MyCalculatorApp>
{
  int firnum;
  int secondnum;
  String textToplay="";
  String res;
  String operationtoperform;

  void btnclicked(String btntext){
    if(btntext=="C"){
      textToplay="";
      firnum=0;
      secondnum=0;
      res="";
    }
    else if(btntext=="+"||btntext=="-"||btntext=="x"||btntext=="/")
      {
        firnum=int.parse(textToplay);
        res="";
        operationtoperform=btntext;
      }
    else if(btntext=="=") {
      secondnum = int.parse(textToplay);
      if (operationtoperform == "+") {
        res = (firnum + secondnum).toString();
      }
      if (operationtoperform == "-") {
        res = (firnum - secondnum).toString();
      }
      if (operationtoperform == "x") {
        res = (firnum*secondnum).toString();
      }
      if (operationtoperform == "/") {
        res = (firnum / secondnum).toString();
      }

    }
    else {
      res = int.parse(textToplay + btntext).toString();
    }
    setState(() {
      textToplay = res;
    });
  }
  Widget custombutton(String btnVal){
    return Expanded(
      child:OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => btnclicked(btnVal),
        child: Text("$btnVal",
          style: TextStyle(fontSize: 25.0,),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator App'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child:Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child:Text("$textToplay",
                  style:TextStyle(fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  color: Colors.black87,),),

              ),
            ),

            Row(
              children: <Widget>[
              custombutton("9"),
                custombutton("8"),
                custombutton("7"),
                custombutton("+"),
              ],

            ),
            Row(
              children: <Widget>[
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("-"),
              ],

            ),
            Row(
              children: <Widget>[
                custombutton("3"),
                custombutton("2"),
                custombutton("1"),
                custombutton("x"),
              ],

            ),
            Row(
              children: <Widget>[
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),
              ],

            ),
          ],
        ),
      ),
    );
  }

}