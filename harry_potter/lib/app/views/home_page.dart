import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:harry_potter/app/controllers/character_controller.dart';
import 'package:harry_potter/app/views/detail_page.dart';
import 'package:provider/provider.dart';
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CharacterController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff003883),
        elevation: 0,
        title: Text(
          controller.isLoading?"Loading..." : "Characters",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),

      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          controller.isLoading? Center(
            child: CircularProgressIndicator(
              color: Color(0xff003883),
            ),
          ) : Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.characters.length,
                  itemBuilder: (context,index){
                    final character = controller.characters[index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailPage(characterModel: character,)));
                      },
                      child: Card(
                        elevation: 0,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Hero(
                                  tag: character.name!,
                                  child: ClipRRect(
                                     borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: character.image,
                                      height: 130,
                                      placeholder: (context,url)=> Center(
                                        child: CircularProgressIndicator(
                                          color: Color(0xff003883),
                                        ),
                                      ),
                                      errorWidget: (context,index,error)=> Icon(Icons.error),
                                    ),
                                  )
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    character.name,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(height: 8,),

                                  Text(
                                    character.house.toString(),
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black54,
                                    ),
                                    maxLines: 2,
                                  )
                                ],
                              )

                            ],
                          ),
                        ),
                      ),
                    );

          }
          ),
          )
        ],
      ),
    );
  }
}
