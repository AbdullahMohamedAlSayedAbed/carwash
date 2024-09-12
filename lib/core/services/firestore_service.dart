import 'dart:developer';

import 'package:carwash/core/error/exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'data_service.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String docuementId}) async {
    var data = await firestore.collection(path).doc(docuementId).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<List<Map<String, dynamic>>> fetchDataFromFirebase(
      String collectionPath) async {
    try {
      QuerySnapshot snapshot = await firestore.collection(collectionPath).get();
      return snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      log('Failed to fetch data from Firebase: $e');
      throw CustomException(message: '$e');
    }
  }
}
