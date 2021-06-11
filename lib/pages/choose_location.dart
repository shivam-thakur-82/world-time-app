import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> loc = [
    WorldTime(url:'America/New York',location:'New York',flag:'new york.jpg'),
    WorldTime(url:'America/Chicago',location:'Chicago',flag:'chicago.jpg'),
    WorldTime(url:'Europe/London',location:'London',flag:'london.jpg'),
    WorldTime(url:'Asia/Singapore',location:'Singapore',flag:'singapore.jpg'),
    WorldTime(url:'Aisa/Kolkata',location: 'Kolkata',flag:'kolkata.jpg')
  ];
  void updateTime (index) async{
    WorldTime instance = loc[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isdaytime': instance.isdaytime,
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        title: Text('Choose Your Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: loc.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(loc[index].location),
            ),
          );
        }
      ),
    );
  }
}
