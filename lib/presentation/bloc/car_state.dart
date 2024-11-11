part of 'car_bloc.dart';

abstract class CarState {}

class CarsLoadingState extends CarState{}
class CarsLoadedState extends CarState{

  final List<Car> cars;
  CarsLoadedState(this.cars);
}


class CarsErrorState extends CarState{
  final String error;
  CarsErrorState(this.error);
}
