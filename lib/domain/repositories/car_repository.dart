import 'package:car_rental/Data/models/car.dart';

abstract class CarRepository{

  Future<List<Car>> fetchCars();
}