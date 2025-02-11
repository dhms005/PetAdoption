import 'package:flutter_test/flutter_test.dart';
import 'package:petadoption/models/Pet.dart';

void main() {
  group('Pet Model Tests', () {
    test('Pet should be adoptable', () {
      final pet = Pet(name: 'Buddy', age: "2 years",isAdopted: false,gender: "Male",image: "https://images.javatpoint.com/list/images/list-of-pet-animals1.png",address: "Ahmedabad, Gujarat, India",price: "350");

      pet.adopt(); // Mark as adopted

      expect(pet.isAdopted, true); // Verify it's adopted
    });

    test('Pet name should be correct', () {
      final pet = Pet(name: 'Buddy', age: "2 years",isAdopted: false,gender: "Male",image: "https://images.javatpoint.com/list/images/list-of-pet-animals1.png",address: "Ahmedabad, Gujarat, India",price: "350");
      expect(pet.name, 'Buddy'); // Ensure name is correct
    });
  });
}