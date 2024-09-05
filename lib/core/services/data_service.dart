abstract class DatabaseService {
  Future<Map<String, dynamic>> getData({
    required String path,
    required String docuementId,
  });
  Future<List<Map<String, dynamic>>> fetchDataFromFirebase(
      String collectionPath);
}
