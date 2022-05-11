import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reports/controller/controller.dart';

class Homepage3 extends StatefulWidget {
  @override
  State<Homepage3> createState() => _Homepage3State();
}

class _Homepage3State extends State<Homepage3> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int _index = 0;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Consumer<Controller>(builder: (context, value, child) {
            {
              return Container(
                // color: P_Settings.datatableColor,
                height: size.height * 0.6,
                child: PageView.builder(
                  itemCount: value.specialelements.length,
                  controller: PageController(viewportFraction: 0.7),
                  onPageChanged: (int index) => setState(() => _index = index),
                  itemBuilder: (_, i) {
                    return Transform.scale(
                      scale: i == _index ? 1 : 0.9,
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                             value.specialelements[0]["label"],
                            style: TextStyle(fontSize: 32),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }),
          SizedBox(
            height: 200,
            // card height
            child: PageView.builder(
              itemCount: 10,
              controller: PageController(viewportFraction: 0.7),
              onPageChanged: (int index) => setState(() => _index = index),
              itemBuilder: (_, i) {
                return Transform.scale(
                  scale: i == _index ? 1 : 0.9,
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        "Card ${i + 1}",
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
