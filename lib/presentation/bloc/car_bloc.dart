import 'package:bloc/bloc.dart';
import 'package:car_rental/Data/models/car.dart';
import 'package:car_rental/domain/usecases/get_cars.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetCars getCars;
  CarBloc({required this.getCars}) : super(CarsLoadingState()) {
    on<CarLoadingEvent>((event, emit) async {
      emit(CarsLoadingState());
      try {
        final cars = await getCars.call();
        emit(CarsLoadedState(cars));
      } catch (e) {
        emit(CarsErrorState(e.toString()));
      }
    });
  }
}
