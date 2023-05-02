import 'package:blocproject/data/model/character.dart';
import 'package:blocproject/data/web_services/character_web_services.dart';

class CharactersRepository{
 final CharacterWebServices characterWebServices;

  CharactersRepository(this.characterWebServices);


 Future<List<Results>> getAllCharacters() async {
   final List<Map<String, dynamic>> characters = await characterWebServices.getAllCharacters();
   return List<Results>.from(characters.map((x) => Results.fromJson(x)));

 }
}