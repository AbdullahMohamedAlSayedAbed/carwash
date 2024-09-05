import 'package:carwash/Features/home/domin/repos/home_repo.dart';
import 'package:carwash/core/error/failures.dart';
import 'package:carwash/core/services/firestore_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final FireStoreService firebaseService;

  HomeRepoImpl({required this.firebaseService});
  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getAppointment() async {
    try {
      final data =
          await firebaseService.fetchDataFromFirebase("collectionPath");
      return right(data);
    } catch (e) {
      throw left(ServerFailure(e.toString()));
    }
  }
}
