import 'package:app/src/shared_preferences_counter_store.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  CounterBloc _bloc;
  bool _isLoading;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    initBloc();
  }

  void initBloc() async {
    SharedPreferencesCounterStore _store =
        SharedPreferencesCounterStore(await SharedPreferences.getInstance());
    _bloc = await CounterBloc.fromStore(_store);
    _isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _isLoading? LinearProgressIndicator() : MyHomePage(
        title: 'Flutter Demo Home Page',
        counterBloc: _bloc,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final CounterBloc counterBloc;
  MyHomePage({Key key, this.title, this.counterBloc}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterBloc get bloc => widget.counterBloc;

  void _incrementCounter() {
    bloc.increment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<int>(
        stream: bloc.countStream,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          int _counter;
          if (!snapshot.hasData)
            _counter = 0;
          else
            _counter = snapshot.data;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
