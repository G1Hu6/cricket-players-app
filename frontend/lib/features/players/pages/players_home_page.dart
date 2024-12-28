import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/players/providers/players_provider.dart';

class PlayersHomePage extends ConsumerWidget {
  const PlayersHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playersList = ref.watch(playersProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("All Players"),

      ),
      body: RefreshIndicator(
         onRefresh: ()async{
            ref.refresh(playersProvider);
         },
         child: playersList.when(
        data: (data) {
          return ListView.builder(
           
            itemBuilder: (context, index) {
              
            },
          );
        }, 
        error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        }, 
        loading: () {
          return const CircularProgressIndicator();
        },
      ),
      )
    );
  }
}