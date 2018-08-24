import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Calculator app',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.teal,

      ),
      home: new MyHomePage(title: 'Calculator App'),
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
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String _output = "";
  double num1=0.0;
  double num2=0.0;
  String op='';
  buttonPress(String text){
    if(text=="CLEAR"){
      text="0";
      _output = "";
      num1=0.0;
      num2=0.0;
      op='';
      
    }
    if(text=="+" ||text=="-" || text=="/" || text=="x" ){
      op=text;
      num1=double.parse(_output);
      text="0";
      _output="";
      output="";
      

    }
   if(text=="."){
      if(_output.contains(".")){
        print("Already added decimal point");
        return;
      }else{
        _output=_output+text;
      }
    }else if(text=="="){

     
      num2=double.parse(output);
      print(num2);
      switch(op){
        case "+":
          _output=(num1+num2).toString();
          break;
        case "-":
          _output=(num1-num2).toString();
          break;
        case "/":
          _output=(num1/num2).toString();
          break;
        case "x":
          _output=(num1*num2).toString();
          break;

      }
    }else{
      if(_output=="0"){
        _output="";
      }
      _output =_output+text;
    }
    print(_output);
    setState(() {
          output=_output;
        });
  }
  Widget buildButton(String text){
     return new Expanded(
          child: new OutlineButton(
               child : new Text(text,style:TextStyle(
                 fontSize:20.0,
                 fontWeight:FontWeight.bold
               )),
               onPressed: ()=>buttonPress(text),
               padding: new EdgeInsets.all(20.0),
               color: Colors.blue,
               textColor: Colors.green,
               
                ),
            );    
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Container( 
        alignment:Alignment.bottomRight,
        padding: new EdgeInsets.symmetric(
                vertical:24.0,
                horizontal:12.0
              ),
        
        child:new Column(
          
          children:<Widget>[
            Container (child: new Text(output,
            style :new TextStyle(
              
              fontSize: 48.0,
              fontWeight:FontWeight.bold
            
            ))),
            new Expanded(
              child:
                new Divider()
              
            ),
          new Column( 
            
            children:[
            new Row(
              children:[
            buildButton("1"),
            buildButton("2"),
            buildButton("3"),
            buildButton("/")
            ]),
            new Row(
              children:[
            buildButton("4"),
            buildButton("5"),
            buildButton("6"),
            buildButton("x")
            ]),
            new Row(
              children:[
            buildButton("7"),
            buildButton("8"),
            buildButton("9"),
            buildButton("-")
            ]),
            new Row(
              children:[
            buildButton("."),
            buildButton("0"),
            buildButton("00"),
            buildButton("+")
            ]),
            new Row(
              children:[

            buildButton("CLEAR"),
            buildButton("=")
          
            ])

          ]),
            
           
            ],
        )));
        
  }
}
