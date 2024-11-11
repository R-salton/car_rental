import 'package:car_rental/Data/data_sources/firebase_data_source.dart';
import 'package:car_rental/Data/repositories/car_repository_impl.dart';
import 'package:car_rental/domain/repositories/car_repository.dart';
import 'package:car_rental/domain/usecases/get_cars.dart';
import 'package:car_rental/presentation/bloc/car_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void initInjection() {
  try {
    getIt.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);
    getIt.registerLazySingleton<FirebaseDataSource>(
      () => FirebaseDataSource(
        getIt<FirebaseFirestore>(),
      ),
    );
    getIt.registerLazySingleton<CarRepository>(
      () => CarRepositoryImpl(
        dataSource: getIt<FirebaseDataSource>(),
      ),
    );

    getIt.registerFactory<GetCars>(
      () => GetCars(
        getIt<CarRepository>(),
      ),
    );

    getIt.registerFactory(
      () => CarBloc(
        getCars: getIt<GetCars>(),
      ),
    );
  } catch (e) {
    rethrow;
  }
}
