import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location; // location name for the UI
  late String time;    // the time in that location
  String flag;    // URL to flag
  String url;   // location url for api endpoint Asia/Kolkata
  late bool isDaytime;   //true or false based on day or night

  WorldTime({ required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    Response response  = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    // print(data);

    String datetime = data['datetime'];
    String offsetHour = data['utc_offset'].substring(1,3);
    String offsetMin = data['utc_offset'].substring(4,6);
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offsetHour), minutes: int.parse(offsetMin)));

    //set time
    isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    time = DateFormat.jm().format(now);
  }
}

