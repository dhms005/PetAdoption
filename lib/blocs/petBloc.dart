import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/blocs/petEvent.dart';
import 'package:petadoption/blocs/petState.dart';
import 'package:petadoption/repository/petRepository.dart';
import '../models/pet.dart';

class PetBloc extends Bloc<PetEvent, PetState> {
  final PetRepository petRepository;

  PetBloc(this.petRepository) : super(PetInitial()) {
    on<FetchPets>(_onFetchPets);
    on<AdoptPet>(_onAdoptPet);
  }

  Future<void> _onFetchPets(FetchPets event, Emitter<PetState> emit) async {
    emit(PetLoading());
    try {
      final pets = await petRepository.fetchPets();
      emit(PetLoaded(pets));
    } catch (e) {
      emit(PetError("Failed to load pets"));
    }
  }

  void _onAdoptPet(AdoptPet event, Emitter<PetState> emit) {
    if (state is PetLoaded) {
      final pets = (state as PetLoaded).pets.map((pet) {
        if (pet.name == event.petName) {
          return Pet(
            name: pet.name,
            age: pet.age,
            image: pet.image,
            isAdopted: true,
            price: pet.price,
          );
        }
        return pet;
      }).toList();

      emit(PetLoaded(pets));
    }
  }
}
