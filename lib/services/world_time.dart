import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String time;
  String location;
  String url;
  String flag;
  bool isdaytime=true;
  WorldTime({this.flag,this.location,this.url});
  Future<void> getTime() async{
    try{
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset1 = data['utc_offset'].substring(1,3);
      String offset2 = data['utc_offset'].substring(4,6);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset1),minutes: int.parse(offset2)));
      isdaytime = now.hour>6 && now.hour<18 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('Caught Error : $e');
      time = 'Could not access time.';
    }
  }
}
