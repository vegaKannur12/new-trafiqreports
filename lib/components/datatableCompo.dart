///////////////////////////////////////////
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:reports/components/customColor.dart';
// import 'package:auto_size_text/auto_size_text.dart';

class DataTableCompo extends StatefulWidget {
  var decodd;
  String? type;
  DataTableCompo({this.decodd, this.type});

  @override
  State<DataTableCompo> createState() => _DataTableCompoState();
}

class _DataTableCompoState extends State<DataTableCompo> {
  List<Map<String, dynamic>> newJson = [];
  final rows = <DataRow>[];
  String? behv;
  Map<String, dynamic> total = {};

  List<String>? colName;
  List<String> tableColumn = [];
 
  var jsondata;
  Map<String, dynamic> mainHeader = {};

  @override
  void initState() {
    String colsName;
    super.initState();
    if (widget.decodd != null) {
      jsondata = json.decode(widget.decodd);
      print("json data----${jsondata}");
    } else {
      print("null");
    }

    if (jsondata[0] != null) {
      mainHeader = jsondata[0];
    }
    print("main header from init state---$mainHeader");

    var list = jsondata[0].values.toList();
    list.removeAt(0);
    for (var item in list) {
      tableColumn.add(item);
    }

    print("table column----$tableColumn");
    jsondata.removeAt(0);
    for (var item in jsondata) {
      newJson.add(item);
    }

    newJson.forEach((item) => item..remove("rank"));
    print("new json---$newJson");
    if (widget.type == "expaded") {
      calculateSum();

      newJson.add(total);
      print("new json after total calculation ${newJson}");
    }
  }

  /////////////////////////////////////////////
  calculateSum() {
    Map map = {};
    double valueStored;
    // print("main header---${mainHeader}");
    mainHeader.forEach((key, value) {
      double sum = 0;
      // print("key---${key}");
      for (var i = 0; i < newJson.length; i++) {
        map = newJson[i];
        print("map----${map}");
        map.forEach((k, val) {
          if (k == key) {
            // print("mainheader[k][3]----${mainHeader[key][2]}");
            if (mainHeader[key][2] == "Y") {
              valueStored = double.parse(val);
              // print("valueStored--${valueStored}");
              sum = sum + valueStored;
              // print("sum----${sum}");
              total[k] = sum;
            } else {
              total[k] = "";
            }
          }
        });
      }
    });
    print("tootal map----${total}");
  }

  ////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 0,
        headingRowHeight: 35,
        dataRowHeight: 35,
        decoration: BoxDecoration(color: P_Settings.datatableColor),
        border: TableBorder.all(
          color: P_Settings.datatableColor,
        ),
        dataRowColor:
            MaterialStateColor.resolveWith((states) => P_Settings.color4),
        columns: getColumns(tableColumn),
        rows: getRowss(newJson),
      ),
    );
  }

  /////////////////////////////////////////////
  List<DataColumn> getColumns(List<String> columns) {
    String behv;
    String colsName;
    return columns.map((String column) {
      // final isAge = column == columns[2];
      colName = column.split('_');
      colsName = colName![1];
      behv = colName![0];
      // behvr.add(behv);
      // print('Behave --- $behvr');
      // // print(behvr);

      // print(behv[1]);
      print("column---${column}");
      return DataColumn(
        tooltip: colsName,
        label: Container(
          width: 80,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              colsName,style: TextStyle(fontSize: 12),
              textAlign: behv[1] == "L" ? TextAlign.left : TextAlign.right,
            ),
          ),
        ),
      );
    }).toList();
  }

  ////////////////////////////////////////////
  List<DataRow> getRowss(List<Map<String, dynamic>> rows) {
    List<String> newBehavr = [];
    print("rows---$rows");
    return newJson.map((row) {
      return DataRow(
        cells: getCelle(row),
      );
    }).toList();
  }
/////////////////////////////////////////////

  List<DataCell> getCelle(Map<String, dynamic> data) {
    print("data--$data");
    List<DataCell> datacell = [];
    mainHeader.remove('rank');
    print("main header---$mainHeader");

    data.forEach(
      (key, value) {
        mainHeader.forEach(
          (k, val) {
            if (key == k) {
              print("mainHeader[k][3] --${mainHeader[k][3]}");
              datacell.add(
                DataCell(
                  Container(
                    // constraints: BoxConstraints(
                    //   // minWidth: 50,
                    //   maxWidth: 300,
                    //   // minHeight: 20,
                    //   maxHeight: 50
                    // ),
                    // width:100,
                    // width: mainHeader[k][3]==1?50:200,
                    alignment: mainHeader[k][1] == "L"
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(value.toString(),style: TextStyle(fontSize: 11),),
                    ),
                  ),
                ),
              );
            }
          },
        );
      },
    );
    print(datacell.length);
    return datacell;
  }
}
////////////////////////////////////////////////////////////
