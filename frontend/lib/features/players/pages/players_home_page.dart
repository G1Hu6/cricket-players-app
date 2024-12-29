import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/players/providers/players_provider.dart';
import 'package:frontend/models/player_model.dart';
import 'package:frontend/services/player_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:frontend/widgets/player_list.dart';
import 'package:frontend/widgets/shimmer_loading.dart';

class PlayersHomePage extends ConsumerStatefulWidget {
  const PlayersHomePage({super.key});

  @override
  ConsumerState<PlayersHomePage> createState() => _PlayersHomePageState();
}

class _PlayersHomePageState extends ConsumerState<PlayersHomePage> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    getPlayers();
    scrollController.addListener(loadNextData);
  }

  List<PlayerModel> allPlayers = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text(
            "All Players",
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
        ),
        body: RefreshIndicator(
            onRefresh: () async {
              //ref.refresh(playersProvider);
            },
            child: ListView.builder(
              itemCount: (allPlayers.isEmpty) ? 10 : allPlayers.length,
              physics: const AlwaysScrollableScrollPhysics(),
              controller: scrollController,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    (allPlayers.isNotEmpty)
                        ? PlayerList(player: allPlayers[index])
                        : const ShimmerLoading(),
                    if (index == allPlayers.length - 1 && isLoading)
                      const ShimmerLoading()
                    //   padding: const EdgeInsets.all(18),
                    //   child: SpinKitThreeBounce(
                    //     color: Theme.of(context).colorScheme.secondary,
                    //   ),
                    // )
                  ],
                );
              },
            )));
  }

  void loadNextData() async {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        allPlayers.length <= 50) {
      await getPlayers();
    }
  }

  Future<void> getPlayers() async {
    setState(() {
      isLoading = true;
    });
    List<PlayerModel> newLoadedData = await ref
        .read(playerServiceProvicer)
        .getAllPlayers(skip: allPlayers.length);
    await Future.delayed(const Duration(seconds: 2), () {});
    setState(() {
      isLoading = false;
      allPlayers.addAll(newLoadedData);
    });
  }
}

/*
playersList.when(
            data: (data) {
              return ListView.builder(
                itemCount: data.length,
                physics: const AlwaysScrollableScrollPhysics(),
                controller: scrollController,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data[index].name),
                    isThreeLine: true,
                    subtitle: Text(data[index].country),
                    leading: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(data[index].imageUrl))),
                    ),
                  );
                },
              );
            },
            error: (error, stackTrace) {
              log(stackTrace.toString());
              return Center(
                child: Text(error.toString()),
              );
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
          ),
*/