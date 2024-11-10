import 'package:car_rental/Data/models/location.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  final List<locationData> _locations = [];
  // Method to determine the current position
  Future<Position> _determinePosition() async {
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    // Request location permissions
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied.');
    }

    // Get the current position
    return await Geolocator.getCurrentPosition();
  }

  // Method to get and print the location

 void fetchLocation() async {
    try {
      Map<String, double> location = await getLocation();
      double latitude = location['latitude']!;
      double longitude = location['longitude']!;
      print('Latitude: $latitude, Longitude: $longitude');
    } catch (e) {
      print('Error fetching location: $e');
    }
  }

  Future<Map<String, double>> getLocation() async {
    try {
      Position position = await _determinePosition();
      // Return a map with latitude and longitude
      return {
        'latitude': position.latitude,
        'longitude': position.longitude,
      };
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to get location');
    }
  }



 
}
