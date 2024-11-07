import 'package:car_rental/Data/models/car.dart';
import 'package:car_rental/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';

class CarListScreen extends StatelessWidget {
  CarListScreen({super.key});

  List<Car> carList = [
    Car("Toyota Corolla", 15.0, 50.0, 200.0,
        "assets/images/toyota_corolla.png"),
    Car("Honda Civic", 18.0, 47.0, 220.0, "assets/images/honda_civic.png"),
    Car("Ford Mustang", 30.0, 60.0, 150.0, "assets/images/ford_mustang.png"),
    Car("Tesla Model 3", 25.0, 0.0, 300.0,
        "assets/images/tesla_model_3.png"), // Assuming electric with no fuel capacity
    Car("BMW 3 Series", 28.0, 55.0, 180.0, "assets/images/bmw_3_series.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Car'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: carList.length,
        itemBuilder: (context, index) {
          return CarCard(car: carList[index]);
        },
      ),
    );
  }
}
