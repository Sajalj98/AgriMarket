import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users_col');

  Future updateUserData(
      String name, DateTime dob, int gender, String address) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'dob': dob,
      'gender': gender,
      'address': address,
    });
  }

  // get users_col stream

}
