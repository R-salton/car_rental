import 'package:car_rental/Data/models/car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapDetails extends StatelessWidget {
  final Car car;
  final double longitude;
  final double latitude;

  const MapDetails({
    super.key,
    required this.car,
    required this.longitude,
    required this.latitude,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: Text(
          "Location",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(latitude, longitude),
              initialZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
              ),
            ],
          ),
          Positioned(bottom: 0, left: 0, right: 0, child: carDetailsCard(car))
        ],
      ),
    );
  }
}

Widget carDetailsCard(final Car car) {
  return SizedBox(
    height: 350,
    child: Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 10, spreadRadius: 0)
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                car.model,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.directions_car,
                    size: 24,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '> ${car.distance} km',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.battery_charging_full_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${car.fuelCapacity}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Features",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                featureIcons(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ ${car.pricePerHour * 24}/day",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.teal),
                      ),
                      onPressed: () {
                        //do some thing
                      },
                      child: Text(
                        "Book Now",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 40,
          right: 10,
          child: Image.asset(
            car.imageUrl,
            width: 200,
            height: 120,
          ),
        )
      ],
    ),
  );
}

Widget featureIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      featuredIcon(Icons.local_gas_station, "Diesel", "Common Rail"),
      featuredIcon(Icons.speed, "Acceleration", "0 - 100km/s"),
      featuredIcon(Icons.ac_unit, "Cold", "Temp Control")
    ],
  );
}

Widget featuredIcon(IconData icon, String label, String subtitle) {
  return Container(
    padding: EdgeInsets.all(5),
    width: 100,
    height: 100,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(10)),
    child: Column(
      children: [
        Icon(
          icon,
          size: 28,
        ),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          subtitle,
          style: TextStyle(
              color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
