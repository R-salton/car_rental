import 'package:car_rental/Data/carData.dart';
import 'package:car_rental/presentation/bloc/car_bloc.dart';
import 'package:car_rental/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose Your Car'),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: BlocBuilder<CarBloc, CarState>(
          builder: (context, state) {
            if (state is CarsLoadingState) {
              return Center(
                  child: Center(
                child: CircularProgressIndicator(
                  color: Colors.teal,
                ),
              ));
            } else if (state is CarsLoadedState) {
              return ListView.builder(
                itemCount: state.cars.length,
                itemBuilder: (context, index) {
                  return CarCard(car: state.cars[index]);
                },
              );
            } else if (state is CarsErrorState) {
              return Center(
                child: Text(state.error),
              );
            } else {
              return Center(
                child: Text("Something went wrong"),
              );
            }
          },
        ));
  }
}
