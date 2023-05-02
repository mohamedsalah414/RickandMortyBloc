import 'package:blocproject/constants/my_colors.dart';
import 'package:blocproject/data/model/character.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Results character;

  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColor.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.name,
          style: TextStyle(color: MyColor.myWhite),
        ),
        background: Hero(
            tag: character.id,
            child: Image.network(
              character.image,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
Widget characterInfo(String title,String value){
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            TextSpan(
              text: title,
              style: TextStyle(color: MyColor.myWhite,fontWeight: FontWeight.bold,fontSize: 18),
            ),TextSpan(
              text: value,
              style: TextStyle(color: MyColor.myWhite,fontWeight: FontWeight.normal,fontSize: 16),
            ),
          ]
        ));
}
Widget buildDivider(double endIndent){
    return Divider(
      color: MyColor.myYellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColor.myGrey,
        body: CustomScrollView(
          slivers: [
            buildSliverAppBar(),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo('species : ',character.species),
                      buildDivider(290),
                      characterInfo('status : ',character.status),
                      buildDivider(300),
                      characterInfo('origin : ',character.origin.name),
                      buildDivider(300),
                      characterInfo('location : ', character.location.name),
                      buildDivider(280), characterInfo('episode : ', character.episode.length.toString()),
                      buildDivider(280),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
                SizedBox(height: 500,)
              ]),
            ),
          ],
        ));
  }
}
