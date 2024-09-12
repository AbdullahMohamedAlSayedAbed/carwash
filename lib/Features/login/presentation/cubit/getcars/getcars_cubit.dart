import 'package:carwash/Features/login/data/datasource/firebase_datasource.dart';
import 'package:carwash/Features/login/presentation/cubit/getcars/getcars_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCarsCubit extends Cubit<GetCarsState> {
  final FirebaseDataSource firebaseDataSource;

  GetCarsCubit(this.firebaseDataSource) : super(GetCarsLoading());

  Future<void> fetchCars() async {
    try {
      emit(GetCarsLoading());
      print("Fetching cars from Firestore...");

      final cars = await firebaseDataSource.getCars();

      print("Cars fetched successfully: $cars");

      if (cars.isNotEmpty) {
        emit(GetCarsSuccess(cars));
      } else {
        emit(GetCarsFailure('No cars found in Firestore'));
      }
    } catch (e) {
      print("Error fetching cars: $e");
      emit(GetCarsFailure('Failed to fetch cars: $e'));
    }
  }
}
