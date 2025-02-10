import 'package:equatable/equatable.dart';

abstract class PetEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPets extends PetEvent {}

class AdoptPet extends PetEvent {
  final String petName;
  AdoptPet(this.petName);
}
