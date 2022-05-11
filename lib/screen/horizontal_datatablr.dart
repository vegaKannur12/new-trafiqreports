import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class HorizontalDatatable extends StatefulWidget {
  const HorizontalDatatable({Key? key}) : super(key: key);

  @override
  State<HorizontalDatatable> createState() => _HorizontalDatatableState();
}

class _HorizontalDatatableState extends State<HorizontalDatatable> {
  final jsondata = [
    {
      "rank": "0",
      "a": "TLN1_BillNo",
      "b": "TLN1_MRNo",
      "c": "TLN5_PatientName",
      "d": "CRY1_Amt",
      "e": "CRY1_Paid",
      "f": "CRY1_Bal",
      "g": "TLN1_Name",
      "h": "CRY1_Bal",
      "i": "TLN1_cgh",
      "j": "TLN1_kjdsj"
    },
    {
      "rank": "1",
      "a": "G202204027",
      "b": "TJAA1",
      "c": "PRATHYEESH MA",
      "d": "472.5",
      "e": "372.5",
      "f": "100",
      "g": "Anu",
      "h": "6859",
      "i": "CRcgh",
      "j": "jkkjsdsa"

      // "h": "6859"
    },
    {
      "rank": "1",
      "a": "G202204026",
      "b": "TJAA2",
      "c": "PRATHYEESH ",
      "d": "1697.5",
      "e": "1397.5",
      "f": "300",
      "g": "Graha",
      "h": "900",
      "i": "cgh",
      "j": "bsdjhdd"
    }
  ];

  List<Map<String, dynamic>> newJson = [];
  final rows = <DataRow>[];
  String? behv;

  List<String>? colName;
  List<String> tableColumn = [];
  List<String> behvr = [];

  Map<String, dynamic> mainHeader = {};

  @override
  void initState() {
    String colsName;
    super.initState();
    print("jsondata[0]---$jsondata[0]");
    mainHeader = jsondata[0];
    print("main header from init state---$mainHeader");
    var list = jsondata[0].values.toList();
    list.removeAt(0);
    for (var item in list) {
      tableColumn.add(item);
    }
    jsondata.removeAt(0);
    for (var item in jsondata) {
      newJson.add(item);
    }
    newJson.forEach((item) => item..remove("rank"));
    print("new json----${newJson}");
    // calculateSum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _getBodyWidget(),
    );
  }

  Widget _getBodyWidget() {
    return Container(
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 100,
        rightHandSideColumnWidth: 600,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        rightSideChildren: _generateRightHandSideColumnRow(),
        leftSideChildren: _generateFirstColumnRow(),
        // leftSideItemBuilder: _generateFirstColumnRow,
        //  rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: jsondata.length,
        rowSeparatorWidget: const Divider(
          color: Colors.black54,
          height: 1.0,
          thickness: 0.0,
        ),
      ),
      height: MediaQuery.of(context).size.height,
    );
  }

  //////////////////////////
  List<Widget> _getTitleWidget() {
    List<Widget> headers = [];
    String colsName;
    tableColumn.map((e) {
      colName = e.split('_');
      colsName = colName![1];
      headers.add(_getTitleItemWidget(colsName, 100));
    }).toList();
    return headers;
  }

  //////////////////////
  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

///////////////////////////////////////////////////////////////////
  List<Widget> _generateFirstColumnRow() {
    List<Widget> rows = [];
    newJson.map((row) {
      row.forEach((key, value) {
        if (key == "a") {
          rows.add(Container(
            child: Text(value),
            width: 40,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ));
        }
      });
    }).toList();
    return rows;
  }

  //////////////////////////
  List<Widget> _generateRightHandSideColumnRow() {
    List<Row> rows = [];
    List names=[];
    List<Widget> childerns = [];
    newJson.map((row) {
      childerns.clear();
      // rows.clear();
          names.clear();

      row.forEach((key, value) {
        if (key != "a") {
          names.add(value);
          childerns.add(
            Container(
               width: 60,
              height: 52,
              // padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(value)));
        }
      });
      print("names--${names}");
      print("children length---${childerns.length}");
      rows.add(
        Row(
        children: childerns,
      ));

      print("rowss-------${rows.length}");
    }).toList();
    return rows;
  }
////////////////////////////
  // List<Row> _generateRightHandSideColumnRow() {
  //   List<Row> rows = [];
  //   List<Widget> childerns = [];
  //   newJson.map((row) {

  //     print(row);
  //     childerns.clear();
  //     row.forEach((key, value) {
  //       if (key != "a") {
  //         childerns.add(Container(
  //             width: 60,
  //             height: 52,
  //             padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
  //             alignment: Alignment.centerLeft,
  //             child: Text(value)));
  //       }
  //     });
  //     print("children length---${childerns}");
  //     // rows.clear();
  //     rows.add(Row(
  //       children: childerns,
  //     ));
  //     print("rowss-------${rows}");
  //   }).toList();
  //   return rows;
  // }
}
