import 'package:car_rental/Data/models/car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDataSource {
  final FirebaseFirestore _firestore;

  FirebaseDataSource(this._firestore);

  Future<List<Car>> getCars() async {
    var snapshot = await _firestore.collection('cars').get();

    return snapshot.docs.map((doc) => Car.fromMap(doc.data())).toList();
  }
}
