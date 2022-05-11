import 'package:flutter/material.dart';

class MyApp1 extends StatefulWidget {
  @override
  _TableExample createState() => _TableExample();
}

class _TableExample extends State {
  double custFontSize = 10;
    void changeFontSize() async{
    setState(() {
      custFontSize+=2;
    });
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print("Screen Height ... ${height}");
    print("Screen width ... ${width}");
    
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Table'),
        ),
        body: Center(
          child: InteractiveViewer(
            boundaryMargin: EdgeInsets.all(80),
            minScale: 0.1,
            maxScale: 4,
            child: Column(children: [
              Flexible(
                // flex: 6,
                child: Container(
                  height: height*0.1,
                  width: width*1,
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IntrinsicWidth(
                      child: Table(
                        defaultVerticalAlignment: TableCellVerticalAlignment.top,
                        columnWidths: const {
                          // 0:FixedColumnWidth(100),
                          // 0: FlexColumnWidth(size.width * 0.0025), 
                          // 1: FlexColumnWidth(size.width * 0.002),
                          // 2: FlexColumnWidth(size.width * 0.004),
                          // 3: FlexColumnWidth(size.width * 0.0015),
                          // 0: IntrinsicColumnWidth(),
                        },
                    
                        // defaultColumnWidth: FixedColumnWidth(120.0),
                        border: TableBorder.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 2),
                        children: [
                          TableRow(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              children: [
                                Column(children: const [
                                  FittedBox(
                                      fit: BoxFit.fill, child: Text('Amount',style: TextStyle(fontSize: 15),))
                                ]),
                                Column(children: [
                                  FittedBox(
                                      fit: BoxFit.fill, child: Text('total',style: TextStyle(fontSize: 15)))
                                ]),
                                Column(children: [
                                  FittedBox(
                                    fit: BoxFit.fill,
                                    child: Text('Amount',style: TextStyle(fontSize: 15)),
                                  )
                                ]),
                                Column(children: [
                                  FittedBox(
                                      fit: BoxFit.fill, child: Text('balance',style: TextStyle(fontSize: 15)))
                                ]),
                                Column(children: [
                                  FittedBox(
                                      fit: BoxFit.fill, child: Text('advance',style: TextStyle(fontSize: 15)))
                                ]),
                                Column(children: [
                                  FittedBox(
                                      fit: BoxFit.fill, child: Text('Amount',style: TextStyle(fontSize: 15)))
                                ]),
                                Column(children: [
                                  FittedBox(
                                      fit: BoxFit.fill, child: Text('total ',style: TextStyle(fontSize: 15)))
                                ]),
                                Column(children: [
                                  FittedBox(
                                      fit: BoxFit.fill, child: Text('Amount',style: TextStyle(fontSize: 15)))
                                ]),
                                Column(children: [
                                  FittedBox(
                                      fit: BoxFit.fill, child: Text('balance',style: TextStyle(fontSize: 15)))
                                ]),
                                Column(children: [
                                  FittedBox(
                                      fit: BoxFit.fill, child: Text('advance',style: TextStyle(fontSize: 15)))
                                ]),
                              ]),
                          TableRow(children: [
                            Column(children: [
                              FittedBox(fit: BoxFit.fill, child: Text('234',style: TextStyle(fontSize: 10)))
                            ]),
                            Column(children: [
                              FittedBox(fit: BoxFit.fill, child: Text('46546',style: TextStyle(fontSize: 10)))
                            ]),
                            Column(children: [
                              FittedBox(fit: BoxFit.fill, child: Text('232',style: TextStyle(fontSize: 10)))
                            ]),
                            Column(children: [
                              FittedBox(fit: BoxFit.fill, child: Text('2022',style: TextStyle(fontSize: 10)))
                            ]),
                            Column(children: [
                              FittedBox(fit: BoxFit.fill, child: Text('6786',style: TextStyle(fontSize: 10)))
                            ]),
                            Column(children: [
                              FittedBox(fit: BoxFit.fill, child: Text('234',style: TextStyle(fontSize: 10)))
                            ]),
                            Column(children: [
                              FittedBox(fit: BoxFit.fill, child: Text('46546',style: TextStyle(fontSize: 10)))
                            ]),
                            Column(children: [
                              FittedBox(fit: BoxFit.fill, child: Text('232',style: TextStyle(fontSize: 10)))
                            ]),
                            Column(children: [
                              FittedBox(fit: BoxFit.fill, child: Text('2022',style: TextStyle(fontSize: 10)))
                            ]),
                            Column(children: [
                              FittedBox(fit: BoxFit.fill, child: Text('6786',style: TextStyle(fontSize: 10)))
                            ]),
                            // Column(children: [Text('35543')]),
                          ]),
                          TableRow(children: [
                            Column(children: [
                              FittedBox(fit: BoxFit.fill, child: Text('789',style: TextStyle(fontSize: 10)))
                            ]),
                            Column(children: [
                              FittedBox(
                                  fit: BoxFit.scaleDown, child: Text('7897',style: TextStyle(fontSize: 10)))
                            ]),
                            Column(children: [
                              FittedBox(fit: BoxFit.fill, child: Text('23425',style: TextStyle(fontSize: 10)))
                            ]),
                            Column(children: [
                              FittedBox(fit: BoxFit.fill, child: Text('798',style: TextStyle(fontSize: 10)))
                            ]),
                            Column(children: [
                              FittedBox(fit: BoxFit.fill, child: Text('2434',style: TextStyle(fontSize: 10)))
                            ]),
                            Column(children: [
                              FittedBox(fit: BoxFit.fill, child: Text('789',style: TextStyle(fontSize: 10)))
                            ]),
                            Column(children: [
                              FittedBox(
                                  fit: BoxFit.scaleDown, child: Text('7897',style: TextStyle(fontSize: 10)))
                            ]),
                            Column(children: [
                              FittedBox(fit: BoxFit.fill, child: Text('23425',style: TextStyle(fontSize: 10)))
                            ]),
                            Column(children: [
                              FittedBox(fit: BoxFit.fill, child: Text('798',style: TextStyle(fontSize: 10)))
                            ]),
                            Column(children: [
                              FittedBox(fit: BoxFit.fill, child: Text('2434',style: TextStyle(fontSize: 10)))
                            ]),
                            // Column(children: [Text('345')]),
                          ]),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
