import 'package:better_player/better_player.dart';
import 'package:example/constants.dart';
import 'package:example/utils.dart';
import 'package:flutter/material.dart';

class BasicPlayerPage extends StatefulWidget {
  @override
  _BasicPlayerPageState createState() => _BasicPlayerPageState();
}

class _BasicPlayerPageState extends State<BasicPlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic player"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Basic player created with the simplest factory method. Shows video from URL.",
              style: TextStyle(fontSize: 16),
            ),
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer.network(
              'http://45.142.1.203:8080/live/play/YjJORVQyWjZPRTFSWXpSM1RXaFJOM1JrVjNCSFQzb3dZV2xDUXpCQ1FXRjNXRXBCTUdOaFUyZEVVVDA9/103481.mp4',
              betterPlayerConfiguration: BetterPlayerConfiguration(
                controlsConfiguration: BetterPlayerControlsConfiguration(
                  onBackButton: () {
                    Navigator.pop(context);
                  },
                ),
                autoDispose: true,
                allowedScreenSleep: true,
                handleLifecycle: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Next player shows video from file.",
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 8),
          FutureBuilder<String>(
            future: Utils.getFileUrl(Constants.fileTestVideoUrl),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.data != null) {
                return BetterPlayer.file(snapshot.data!);
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
