import 'package:car_rental/Data/data_sources/get_location.dart';
import 'package:car_rental/Data/models/car.dart';
import 'package:car_rental/presentation/pages/map_details.dart';
import 'package:car_rental/presentation/widgets/car_card.dart';
import 'package:car_rental/presentation/widgets/more_card.dart';
import 'package:flutter/material.dart';

class CarDetails extends StatefulWidget {
  final List<Car> moreCars;
  final Car clickedCar;

  const CarDetails(
      {super.key, required this.clickedCar, required this.moreCars});

  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;
  final LocationService locationService = LocationService();
  double? latitude;
  double? longitude;

  @override
  void initState() {
    setState(() {
      _getLocation();
    });

    _animationController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _animation =
        Tween<double>(begin: 1.0, end: 1.5).animate(_animationController!)
          ..addListener(() {
            setState(() {});
          });
    _animationController!.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.dispose();
  }

  Future<void> _getLocation() async {
    try {
      Map<String, double> location = await locationService.getLocation();
      latitude = location['latitude']!;
      longitude = location['longitude']!;

      print("${location['latitude']}");
    } catch (e) {
      print('Error fetching location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            SizedBox(
              width: 5,
            ),
            Text(
              "Information",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarCard(
              car: widget.clickedCar,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                          color: Color(0xffF3F3F3),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 5,
                              color: Colors.black12,
                            )
                          ]),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/user.png'),
                            radius: 50,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Salton Sadev',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$4,320',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapDetails(
                                      longitude: longitude!,
                                      latitude: latitude!,
                                      car: widget.clickedCar,
                                    )));
                      },
                      child: Container(
                        height: 170,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 5,
                                color: Colors.black12,
                              )
                            ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Transform.scale(
                            scale: _animation!.value,
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/images/maps.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.all(20),
                child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          MoreCard(car: widget.moreCars[index]),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
