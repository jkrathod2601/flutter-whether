import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'location.dart';
const apkey='080e748701fcd9093ae62eef7d18cb71';
const wurl='https://samples.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> citywe(String cityname)async{

    String url='$wurl?q=$cityname&appid=$apkey';
    nethelp np=nethelp(url);
    var wrtdata=await np.getdata();
    return wrtdata;
  }
   Future<dynamic> getlocationweather()async{
    location d = location();
    await d.getlocation();
    nethelp net = nethelp(
        '$wurl?lat=${d.la}&lon=${d.lo}&appid=$apkey');
    var wdata =  await net.getdata();
    return wdata;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
