import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reports/components/customColor.dart';
import 'package:reports/controller/controller.dart';

class ExpandedDatatable extends StatefulWidget {
  List<Map<String, dynamic>> dedoded;
  String? level;
  ExpandedDatatable({required this.dedoded, this.level});
  @override
  State<ExpandedDatatable> createState() => _ExpandedDatatableState();
}

class _ExpandedDatatableState extends State<ExpandedDatatable> {
  List<Map<String, dynamic>> mapTabledata = [];
  List<String> tableColumn = [];
  List<String>? colName;
  // List<Map<String, dynamic>> newMp = [];
  Map<String, dynamic> valueMap = {};
  Map<String, dynamic> totMap = {};

  List<String>? rowName;

  @override
  void initState() {
    print("level---$widget.level");
    // TODO: implement initState
    super.initState();
    if (widget.dedoded != null) {
      // mapTabledata=widget.dedoded;
      // print("json data----${jsondata}");
      mapTabledata = widget.dedoded;
    } else {
      print("null");
    }
    print("widget.dedoded----${widget.dedoded}");
    if (widget.dedoded != null) {
      mapTabledata[0].forEach((key, value) {
        tableColumn.add(key);
      });
    }
    // calculateSum();
    // mapTabledata.add(totMap);
    // newMp.add(valueMap);
    print("tableColumn---${tableColumn}");
    // print("valueMap---${valueMap}");
    print("newMp---${mapTabledata}");
  }

  calculateSum() {
    for (var i = 0; i < tableColumn.length; i++) {
      double sum = 0;
      for (var item in mapTabledata) {
        item.forEach((key, value) {
          if (key == tableColumn[i]) {
            if (tableColumn[i][2] == "Y") {
              double valueStored = double.parse(value);
              sum = sum + valueStored;
              totMap[tableColumn[i]] = sum;
            } else {
              totMap[tableColumn[i]] = ' ';
            }
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 7,
        headingRowHeight: 35,
        dataRowHeight: 35,
        horizontalMargin: 5,
        decoration: BoxDecoration(color: P_Settings.l1totColor),
        border: TableBorder.all(
          color: P_Settings.datatableColor,
        ),
        columns: getColumns(tableColumn),
        rows: getRowss(mapTabledata),
      ),
    );
  }

  ////////////////////////////////////////////////////
  List<DataColumn> getColumns(List<String> columns) {
    String behv;
    String colsName;
    return columns.map((String column) {
      // final isAge = column == columns[2];
      colName = column.split('_');
      colsName = colName![1];
      behv = colName![0];
      print("column---${column}");
      return DataColumn(
        tooltip: colsName,
        label: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 60, maxWidth: 200),
          child: Padding(
            padding: behv[1] == "L"
                ? EdgeInsets.only(left: 0.2)
                : EdgeInsets.only(right: 0.2),
            child: Text(
              colsName,
              style: TextStyle(fontSize: 12),
              textAlign: behv[1] == "L" ? TextAlign.left : TextAlign.right,
            ),
          ),
        ),
      );
    }).toList();
  }

  ////////////////////////////////////////////////////////////
  List<DataRow> getRowss(List<Map<String, dynamic>> row) {
    int count = 0;

    List<DataRow> items = [];
    var itemList = mapTabledata;
    for (var r = 0; r < itemList.length; r++) {
      items.add(DataRow(
          color: r == itemList.length - 1
              ? MaterialStateProperty.all(P_Settings.l1totColor)
              : widget.level == "level1"
                  ? MaterialStateProperty.all(P_Settings.l1datatablecolor)
                  : widget.level == "level2"
                      ? MaterialStateProperty.all(P_Settings.l2datatablecolor)
                      : widget.level == "level3"
                          ? MaterialStateProperty.all(
                              P_Settings.l3datatablecolor)
                          : MaterialStateProperty.all(P_Settings.color4),
          cells: getCelle(itemList[r])));
    }
    return items;
  }

  /////////////////////////////////////////////////////////////////
  List<DataCell> getCelle(Map<String, dynamic> data) {
    String behv;
    String colsName;
    print("data--$data");
    List<DataCell> datacell = [];
    for (var i = 0; i < tableColumn.length; i++) {
      data.forEach((key, value) {
        if (tableColumn[i] == key) {
          rowName = tableColumn[i].split('_');
          colsName = rowName![1];
          behv = rowName![0];
          // print("column---${tableColumn[i]}");
          datacell.add(
            DataCell(
              Container(
                // width: 50,
                alignment: behv[1] == "L"
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Padding(
                  padding: behv[1] == "L"
                      ? EdgeInsets.only(left: 0.2)
                      : EdgeInsets.only(right: 0.2),
                  child: Text(
                    value.toString(),
                    style: TextStyle(fontSize: 11),
                  ),
                ),
              ),
            ),
          );
        }
      });
    }
    print(datacell.length);
    return datacell;
  }
}
