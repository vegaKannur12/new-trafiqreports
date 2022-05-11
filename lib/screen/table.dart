import 'package:flutter/material.dart';

class Tablepgm extends StatefulWidget {
  const Tablepgm({Key? key}) : super(key: key);

  @override
  State<Tablepgm> createState() => _TablepgmState();
}

class _TablepgmState extends State<Tablepgm> {
  List<double> val=[100,100,100,50,50];
 
  var result;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     result = { 
      for (int i=0;i<val.length;i++) 
      i: FixedColumnWidth(val[i])
    };
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    print(width);
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter Table Example'),
          ),
          body: Center(
              child: Column(children: <Widget>[
            Flexible(
              // margin: EdgeInsets.all(20),
              child: Table(
                columnWidths: result,

                // defaultColumnWidth: FixedColumnWidth(120.0),
                border: TableBorder.all(
                    color: Colors.black, style: BorderStyle.solid, width: 2),
                children: [
                  TableRow(children: [
                    Column(children: [
                      Text('date', style: TextStyle(fontSize: 20.0))
                    ]),
                    Column(children: [
                      Text('billNo', style: TextStyle(fontSize: 20.0))
                    ]),
                    Column(children: [
                      Text('Name', style: TextStyle(fontSize: 20.0))
                    ]),
                    Column(children: [
                      Text('age', style: TextStyle(fontSize: 20.0))
                    ]),
                    Column(children: [
                      Text('age', style: TextStyle(fontSize: 20.0))
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [Text('10/12/2020')]),
                    Column(children: [Text('gfgf')]),
                    Column(children: [Text('anu')]),
                    Column(children: [Text('10')]),
                    Column(children: [Text('10')]),
                  ]),
                  TableRow(children: [
                    Column(children: [Text('10/12/2020')]),
                    Column(children: [Text('tdrtrd')]),
                    Column(children: [Text('appu')]),
                    Column(children: [Text('20')]),
                    Column(children: [Text('10')]),
                  ]),
                  TableRow(children: [
                    Column(children: [Text('10/12/2020')]),
                    Column(children: [Text('fxdf')]),
                    Column(children: [Text('gfgf')]),
                    Column(children: [Text('30')]),
                    Column(children: [Text('10')]),
                  ]),
                ],
              ),
            ),
          ]))),
    );
  }
}
