import 'package:car_rental/Data/models/car.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final Car car;
  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Image.asset('assets/images/car.png'),
          Text(car.model),
        ],
      ),
    );
  }
}
