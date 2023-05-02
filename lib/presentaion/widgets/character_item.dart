import 'package:blocproject/constants/my_colors.dart';
import 'package:blocproject/constants/strings.dart';
import 'package:blocproject/data/model/character.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Results results;

  const CharacterItem({Key? key, required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: MyColor.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, characterDetailsScreen,arguments: results),
        child: GridTile(
          child: Hero(
            tag: results.id,
            child: Container(
              color: MyColor.myGrey,
              child: results.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      height: double.infinity,
                      width: double.infinity,
                      placeholder: 'assets/images/99109-loading.gif',
                      image: results.image,
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/images/imageNotFound.jpg'),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black45,
            alignment: Alignment.bottomCenter,
            child: Text(
              results.name,
              style: TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: MyColor.myWhite,
                  fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
