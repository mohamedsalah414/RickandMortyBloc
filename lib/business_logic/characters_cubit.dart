import 'package:bloc/bloc.dart';
import 'package:blocproject/data/model/character.dart';
import 'package:blocproject/data/repository/character_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Results> results = [];
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

   List<Results> getAllCharacters()  {
     charactersRepository.getAllCharacters().then((results) {
       emit(CharactersLoaded(results));
       this.results = results;
     });
     return results;
   }
}
