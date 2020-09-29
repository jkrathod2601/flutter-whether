import 'package:geolocator/geolocator.dart';

class location {
  double la;
  double lo;
  Future<void> getlocation() async {
      Position position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      la=position.latitude;
      lo=position.longitude;
  }
}