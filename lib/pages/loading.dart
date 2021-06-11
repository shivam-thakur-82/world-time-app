import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
    void setupWorldTime() async{
      WorldTime instance = WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'kolkata.jpg');
      await instance.getTime();
      Navigator.pushReplacementNamed(context, '/home',arguments : {
        'location': instance.location,
        'time': instance.time,
        'flag': instance.flag,
        'isdaytime': instance.isdaytime,
      }
      );
    }
      @override
      void initState() {
        super.initState();
        setupWorldTime();
      }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
            child: SpinKitRotatingCircle(
              color: Colors.black,
              size: 50.0,
            ),
        ),
      );
    }
}
