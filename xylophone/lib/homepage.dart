import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AssetsAudioPlayer assetsAudioPlayer;
  final colors = [
    Colors.red,Colors.green,Colors.blue,Colors.yellow,
    Colors.deepOrange,Colors.deepPurple,Colors.pink
  ];
  @override
  void initState() {
    assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
    super.initState();
  }
  void play(int index) async {
    assetsAudioPlayer.open(
      Audio('assets/notes/${index + 1}.wav'),
      autoStart: true,
    );
  }
  
  Widget buildItem(int index){
    return Expanded(
        child: GestureDetector(
          onTap: ()=> play(index),
            child: Container(color: colors[index])
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Xylophone')),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          buildItem(0),
          buildItem(1),
          buildItem(2),
          buildItem(3),
          buildItem(4),
          buildItem(5),
          buildItem(6),
        ],
      ),
    );
  }
}
