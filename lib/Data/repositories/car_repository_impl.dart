import 'package:car_rental/Data/data_sources/firebase_data_source.dart';
import 'package:car_rental/Data/models/car.dart';
import 'package:car_rental/domain/repositories/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseDataSource dataSource;
  CarRepositoryImpl({required this.dataSource});

  @override
  Future<List<Car>> fetchCars() {
    return dataSource.getCars();
  }
}
 