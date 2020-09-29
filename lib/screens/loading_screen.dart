import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getlocation();
  }
  void getlocation() async {
    var wdata= await WeatherModel().getlocationweather();

    Navigator.push(context,MaterialPageRoute(builder:(context)
    {
      return LocationScreen(locationweather:wdata);
    }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child:SpinKitDoubleBounce(
            color: Colors.black,
            size: 100,
          ),
        ),
    );
  }
}
