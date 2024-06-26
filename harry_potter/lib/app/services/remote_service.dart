import 'package:dio/dio.dart';
import 'package:harry_potter/app/constants.dart';
import 'package:harry_potter/app/models/character_model.dart';

class RemoteServices{
  static var dio = Dio();
  
  static Future<List<CharacterModel>> fetchCharacter() async{
    
    var response = await dio.get(baseUrl);

    if(response.statusCode==200){
      final List<dynamic> data = response.data;
      return data.map((item)=> CharacterModel.fromJson(item)).toList();
    }
    else{
      throw Exception("failed to load character");
    }
  }
}