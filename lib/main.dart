import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Clock',
      home: StopWatchPage(),
    );
  }
}

class StopWatchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StopWatchPageState();
  }
}

class _StopWatchPageState extends State<StopWatchPage> {
  Timer _timer;

  var time1 = '';
  var time2 = '';

  double time1Size = 120;
  double time2Size = 150;

  @override
  void initState() {
    super.initState();
    _start();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$time1',
                    style: TextStyle(fontSize: time1Size),
                  ),
                  Text(
                    '$time2',
                    style: TextStyle(fontSize: time2Size),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.all(50),
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            child: Icon(Icons.remove),
            onPressed: setTextSizeDown,
          ),
        ),
        Container(
          alignment: Alignment.bottomRight,
          margin: EdgeInsets.all(50),
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: setTextSizeUp,
            child: Icon(Icons.add),
          ),
        )
      ],
    );
  }

  void _start() {
    _timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
      setState(() {
        DateTime datetime = DateTime.now();
        time1 =
            "${datetime.year.toString()}/${datetime.month.toString().padLeft(2, '0')}/${datetime.day.toString().padLeft(2, '0')} - ${datetime.hour.toString().padLeft(2, '0')}:${datetime.minute.toString().padLeft(2, '0')}:${datetime.second.toString().padLeft(2, '0')}";
        time2 =
            "${datetime.second.toString().padLeft(2, '0')}.${datetime.millisecond.toString().padLeft(3, '0')}";
      });
    });
  }


  void setTextSizeUp() {
    time1Size += 10;
    time2Size += 10;
  }

  void setTextSizeDown() {
    time1Size -= 10;
    time2Size -= 10;
  }

}
