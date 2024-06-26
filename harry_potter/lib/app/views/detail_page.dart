import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:harry_potter/app/models/character_model.dart';

class DetailPage extends StatelessWidget {
   DetailPage({super.key, required this.characterModel});

  CharacterModel characterModel;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff003883),
        elevation: 0,
        title: Text(
          characterModel.name,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
body: SingleChildScrollView(
  child: Column(
    children: [
      SizedBox(height: 26,),

      Hero(
          tag: characterModel.name!,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color:  Color(0xff003883).withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 5
                  )
                ]
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: characterModel.image,
                  height: 250,
                  placeholder: (context,url)=> Center(
                    child: CircularProgressIndicator(
                      color: Color(0xff003883),
                    ),
                  ),
                  errorWidget: (context,index,error)=> Icon(Icons.error),
                ),
              ),
            ),
          )
      ),

      SizedBox(
        height: 20,
      ),
      Text(
        characterModel.name,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
      ),

      SizedBox(height: 8,),

      Text(
        characterModel.actor,
        style: TextStyle(
          fontSize: 15,
          color: Colors.black54
        ),
      ),

      SizedBox(height: 8,),

      Text(
        characterModel.house.toString(),
        style: TextStyle(
            fontSize: 15,
            color: Colors.black54
        ),
      )
    ],
  ),
),

    );
  }
}
