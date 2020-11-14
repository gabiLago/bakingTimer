import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementer() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

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
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            CustomRaw(
              callback: _incrementCounter,
              icon: Icons.plus_one,
            ),
            CustomRaw(
              callback: _decrementer,
              icon: Icons.exposure_minus_1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class CustomRaw extends StatefulWidget {
  CustomRaw({
    this.callback,
    this.icon,
    this.width = 56.0,
    this.height = 56.0,
  });
  final Function callback;
  final IconData icon;
  final double width;
  final double height;

  @override
  _CustomRawState createState() => _CustomRawState();
}

class _CustomRawState extends State<CustomRaw> {
  bool _buttonPressed = false;
  bool _loopActive = false;
  int _counter = 0;

  void _increaseCounterWhilePressed() async {
    // make sure that only one loop is active
    int millis;

    if (_loopActive) {
      return;
    }

    _loopActive = true;

    while (_buttonPressed) {
      // do your thing
      _counter++;
      millis = 200;
      if (_counter > 10) millis = 100;
      if (_counter > 15) millis = 1;
      widget.callback();

      // wait a bit
      await Future.delayed(
        Duration(milliseconds: millis),
      );
    }

    _loopActive = false;
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (details) {
        _buttonPressed = true;
        _increaseCounterWhilePressed();
      },
      onPointerUp: (details) {
        _buttonPressed = false;
      },
      child: Material(
        type: MaterialType.button,
        elevation: 6.0,
        shape: CircleBorder(),
        color: Colors.orange,
        child: InkResponse(
          highlightColor: Colors.black38,
          containedInkWell: true,
          enableFeedback: true,
          onTap: () {},
          customBorder: CircleBorder(),
          child: SizedBox(
            width: widget.width,
            height: widget.height,
            child: Icon(widget.icon),
          ),
        ),
      ),
    );
  }
}
