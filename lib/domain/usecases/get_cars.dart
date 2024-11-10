import 'package:car_rental/Data/models/car.dart';
import 'package:car_rental/domain/repositories/car_repository.dart';

class GetCars {
  final CarRepository repository;
  GetCars(this.repository);

Future<List<Car>> call() async{

 return await repository.fetchCars();
}

}
