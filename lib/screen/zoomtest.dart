import 'package:flutter/material.dart';
import 'package:reports/components/customColor.dart';
import 'package:zoom_widget/zoom_widget.dart';


class ZoomableWidget extends StatefulWidget {
  @override
  _ZoomableWidgetState createState() => _ZoomableWidgetState();
}

class _ZoomableWidgetState extends State<ZoomableWidget> {
  Matrix4 matrix = Matrix4.identity();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(P_Settings.title),
      ),
      body: Zoom(
        doubleTapZoom: true,
        maxZoomWidth: 800,
        maxZoomHeight: 800,
        backgroundColor: Colors.white,
        onPositionUpdate: (Offset position) {
          print(position);
        },
        onScaleUpdate: (double scale, double zoom) {
          print("$scale  $zoom");
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              "Zoom Data",
              style: TextStyle(fontSize: 50),
            ),
          ),
        ),
      ),
    );
  }
}
