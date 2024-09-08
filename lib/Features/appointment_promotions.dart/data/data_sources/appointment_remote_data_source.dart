import 'package:carwash/Features/appointment_promotions.dart/data/models/appointment_model.dart';
import 'package:carwash/Features/appointment_promotions.dart/domin/entities/appointment_entity.dart';
import 'package:carwash/constants.dart';
import 'package:carwash/core/functions/save_appontiment.dart';
import 'package:carwash/core/services/firestore_service.dart';

class AppointmentRemoteDataSource {
  final FireStoreService firestore;

  AppointmentRemoteDataSource({required this.firestore});

  Future<List<AppointmentEntity>> getAppointment() async {
    final querySnapshot = await firestore.fetchDataFromFirebase('appointment');
    List<AppointmentEntity> appointments = getAppointmentList(querySnapshot);
    saveAppointmentData(appointments, kAppointmentBox);
    return appointments; // Corrected from 'products' to 'appointments'
  }

  List<AppointmentEntity> getAppointmentList(List<Map<String, dynamic>> data) {
    List<AppointmentEntity> appointments = [];
    for (var appointmentMap in data) {
      appointments.add(AppointmentModel.fromFirestore(appointmentMap, appointmentMap['id']));
    }
    return appointments;
  }
}
