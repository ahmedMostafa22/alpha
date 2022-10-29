import 'package:alpha/modules/champ_rotation/models/champion.dart';
import 'package:flutter/material.dart';

class ChampionListItem extends StatelessWidget {
  const ChampionListItem({Key? key, required this.champion}) : super(key: key);
  final Champion champion;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .3,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(champion.imageUrl), fit: BoxFit.cover)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .3,
        color: Colors.black.withOpacity(.4),
        child: Center(
          child: Text(
            champion.name,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
