import 'package:counterpro/counterBloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final counterBloc = CounterBlock();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button',
            ),
            StreamBuilder(
              initialData: 0,
              stream:counterBloc.counterStream,
              builder: (context,snapshot){
                return Text(
                '${snapshot.data}',
                style: Theme.of(context).textTheme.headline4,
              );
              },
              
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){
             
              counterBloc.eventSink.add(CounterAction.Increment);
            },
            tooltip: 'Incrementbtn',
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 10,
          ),
           FloatingActionButton(
            onPressed: (){
             
              counterBloc.eventSink.add(CounterAction.Decrement);
            },
            tooltip: 'decrementBtn',
            child: Icon(Icons.remove)
          ),
          SizedBox(
            width: 10,
          ),
           FloatingActionButton(
            onPressed: (){
             
              counterBloc.eventSink.add(CounterAction.Reset);
            },
            tooltip: 'resetbutton',
            child: Icon(Icons.loop)
          ),
        ],
      ),
      
    );
  }
}
