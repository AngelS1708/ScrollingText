import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/services.dart';

class HorizontalScrolling extends StatefulWidget{
  final String text;
  final TextStyle textStyle;
  final double velocity;
  const HorizontalScrolling(
      {Key? key,
        required this.text,
        required this.textStyle,
        required this.velocity,
      })
      : super(key: key);

  @override
  HorizontalScrollingText createState() => HorizontalScrollingText();
}

class HorizontalScrollingText extends State<HorizontalScrolling> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Marquee(
                text: widget.text,
                style: widget.textStyle,
                velocity: widget.velocity,
                pauseAfterRound: Duration(seconds: 1),
                startPadding: 10.0,
                accelerationDuration: Duration(seconds: 1),
                accelerationCurve: Curves.linear,
                decelerationDuration: Duration(milliseconds: 500),
                decelerationCurve: Curves.easeOut,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0, top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  child: Text('Volver'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
