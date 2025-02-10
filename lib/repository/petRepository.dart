import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/pet.dart';

class PetRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Pet>> fetchPets() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('petList').get();
      return querySnapshot.docs.map((doc) => Pet.fromMap(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('Failed to load pets');
    }
  }
}