import 'package:flutter/material.dart';
import './counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterBloc _counterBloc1 = new CounterBloc();
  CounterBloc _counterBloc2 = new CounterBloc();
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _counterBloc1.stream,
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            );
          }
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _counterBloc1.increment,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ), 
          FloatingActionButton(
            onPressed: _counterBloc2.decrement,
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ), 
        ]
      )
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat
    );
  }

  @override
  void dispose() {
    _counterBloc1.dispose();
    super.dispose();
  }
}
