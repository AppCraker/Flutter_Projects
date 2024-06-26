
import 'package:flutter/material.dart';
import 'package:harry_potter/app/services/remote_service.dart';
import 'package:provider/provider.dart';

import '../models/character_model.dart';
class CharacterController extends ChangeNotifier{

  bool isLoading = false;
  List<CharacterModel> characters = [];
  CharacterController(){
    fetchCharacters();
  }
  Future<void> fetchCharacters()async {
    isLoading = true;
    notifyListeners();

    characters = await RemoteServices.fetchCharacter();
    isLoading = false;
    notifyListeners();
  }


}