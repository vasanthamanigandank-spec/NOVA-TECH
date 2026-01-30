import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final _db = FirebaseFirestore.instance;

  Future<void> createAppointment(
      String patientId, String doctorId) async {
    await _db.collection('appointments').add({
      'patientId': patientId,
      'doctorId': doctorId,
      'status': 'pending',
      'createdAt': Timestamp.now(),
    });
  }
}
