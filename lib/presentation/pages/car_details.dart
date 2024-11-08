import 'package:car_rental/Data/models/car.dart';
import 'package:car_rental/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({super.key});

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
      body: Column(
        children: [
          CarCard(
            car: Car("Toyota Corolla", 15.0, 50.0, 200.0,
                "assets/images/toyota_corolla.png"),
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
                          backgroundImage: AssetImage('assets/images/user.png'),
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
                  child: Container(
                    height: 170,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/maps.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 5,
                            color: Colors.black12,
                          )
                        ]),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
