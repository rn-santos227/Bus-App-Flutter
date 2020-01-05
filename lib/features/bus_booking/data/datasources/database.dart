

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({
    this.uid
  });

  //collection reference
  final CollectionReference usersCollection = Firestore.instance.collection('users');

  Future updateUserData(String name, String address, String contact) async {
    return await usersCollection.document(uid).setData({
      'name': name,
      'address': address,
      'contact': contact
    });
  }

  Stream<QuerySnapshot> get users {
    return usersCollection.snapshots();
  }
}
