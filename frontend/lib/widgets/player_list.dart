import 'package:flutter/material.dart';
import 'package:frontend/models/player_model.dart';

class PlayerList extends StatelessWidget {
  final PlayerModel player;
  const PlayerList({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
                      title: Text(player.name),
                      isThreeLine: true,
                      subtitle: Text(player.country),
                      leading: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    NetworkImage(player.imageUrl))),
                      ),
                    );
  }
}