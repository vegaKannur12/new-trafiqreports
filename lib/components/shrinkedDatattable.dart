import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:reports/components/customColor.dart';

class ShrinkedDatatable extends StatefulWidget {
  // Map<String, dynamic> map;
  var decodd;
  String level;

  ShrinkedDatatable({
    required this.decodd,
    required this.level,
  });

  @override
  State<ShrinkedDatatable> createState() => _ShrinkedDatatableState();
}

class _ShrinkedDatatableState extends State<ShrinkedDatatable> {
  List<String> tableColumn = [];
  Map<String, dynamic> valueMap = {};
  List<String>? colName;
  int i = 0;
  List<String>? rowName;
  Map<String, dynamic> mapTabledata = {};
  // var jsondata;

  List<Map<String, dynamic>> newMp = [];
  String? behv;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.decodd != null) {
      mapTabledata = json.decode(widget.decodd);
      // print("json data----${jsondata}");
    } else {
      print("null");
    }
    String element0 = mapTabledata.keys.elementAt(0);
    String element1 = mapTabledata.keys.elementAt(1);

    print("element0----${element0}");
    print("element1----${element1}");

    mapTabledata.remove(element0);
    mapTabledata.remove(element1);

    mapTabledata.forEach((key, value) {
      tableColumn.add(key);
      valueMap[key] = value;
    });
    newMp.add(valueMap);
    // print("tableColumn---${tableColumn}");
    // print("valueMap---${valueMap}");
    // print("newMp---${newMp}");
  }

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
            MaterialStateColor.resolveWith((states) => widget.level == "level1"
                ? P_Settings.l1datatablecolor
                : widget.level == "level2"
                    ? P_Settings.l2datatablecolor
                    : widget.level == "level3"
                        ? P_Settings.l3datatablecolor
                        : P_Settings.color4),
        columns: getColumns(tableColumn),
        rows: getRowss(newMp),
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    String behv;
    String colsName;
    return columns.map((String column) {
      // final isAge = column == columns[2];
      colName = column.split('_');
      colsName = colName![1];
      behv = colName![0];
      // print("column---${column}");
      return DataColumn(
        tooltip: colsName,
        label: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 60,
            maxWidth: 200
          ),
          child: Padding(
                  padding: EdgeInsets.all(0.8),

            // padding: behv[1] == "L"? EdgeInsets.only(left:0.3):EdgeInsets.only(right:0.3),
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
    return newMp.map((row) {
      return DataRow(
        cells: getCelle(row),
      );
    }).toList();
  }

  ///////////////////////////////////////////////////////////
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
                // width: 70,
                alignment: behv[1] == "L"
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.all(0.8),
                  // padding: behv[1] == "L"? EdgeInsets.only(left:0.3):EdgeInsets.only(right:0.3),
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
///////////////////////////////////////////////////////////////////////////////////////
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:reports/components/customColor.dart';
// import 'package:reports/controller/controller.dart';

// class ShrinkedDatatable extends StatefulWidget {
//   // Map<String, dynamic> map;
//   var decodd;
//   String level;
//   ShrinkedDatatable({required this.decodd, required this.level});

//   @override
//   State<ShrinkedDatatable> createState() => _ShrinkedDatatableState();
// }

// class _ShrinkedDatatableState extends State<ShrinkedDatatable> {
//   String? behv;
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Consumer<Controller>(
//         builder: ((context, value, child) {
//           return DataTable(
//             columnSpacing: 0,
//             headingRowHeight: 35,
//             dataRowHeight: 35,
//             decoration: BoxDecoration(color: P_Settings.datatableColor),
//             border: TableBorder.all(
//               color: P_Settings.datatableColor,
//             ),
//             dataRowColor: MaterialStateColor.resolveWith(
//                 (states) => widget.level == "level1"
//                     ? P_Settings.l1datatablecolor
//                     : widget.level == "level2"
//                         ? P_Settings.l2datatablecolor
//                         : widget.level == "level3"
//                             ? P_Settings.l3datatablecolor
//                             : P_Settings.color4),
//             columns: getColumns(value.tableColumn),
//             rows: getRowss(value.newMp),
//           );
//         }),
//       ),
//     );
//   }

//   List<DataColumn> getColumns(List<String> columns) {
//     String behv;
//     String colsName;
//     return columns.map((String column) {
//       // final isAge = column == columns[2];
//       Provider.of<Controller>(context, listen: false).colName = column.split('_');
//       colsName = Provider.of<Controller>(context, listen: false).colName![1];
//       behv = Provider.of<Controller>(context, listen: false).colName![0];
//       print("column---${column}");
//       return DataColumn(
//         tooltip: colsName,
//         label: Container(
//           width: 50,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               colsName,
//               style: TextStyle(fontSize: 12),
//               textAlign: behv[1] == "L" ? TextAlign.left : TextAlign.right,
//             ),
//           ),
//         ),
//       );
//     }).toList();
//   }

//   ////////////////////////////////////////////////////////////
//   List<DataRow> getRowss(List<Map<String, dynamic>> row) {
//     return Provider.of<Controller>(context, listen: false).newMp.map((row) {
//       return DataRow(
//         cells: getCelle(row),
//       );
//     }).toList();
//   }

//   ///////////////////////////////////////////////////////////
//   List<DataCell> getCelle(Map<String, dynamic> data) {
//     String behv;
//     String colsName;
//     print("data--$data");
//     // List<DataCell> datacell = [];
//     for (var i = 0; i < Provider.of<Controller>(context, listen: false).tableColumn.length; i++) {
//       data.forEach((key, value) {
//         if (Provider.of<Controller>(context, listen: false).tableColumn[i] == key) {
//           Provider.of<Controller>(context, listen: false).rowName = Provider.of<Controller>(context, listen: false).tableColumn[i].split('_');
//           colsName = Provider.of<Controller>(context, listen: false).rowName![1];
//           behv = Provider.of<Controller>(context, listen: false).rowName![0];
//           // print("column---${tableColumn[i]}");
//           Provider.of<Controller>(context, listen: false).datacell.add(
//             DataCell(
//               Container(
//                 width: 50,
//                 alignment: behv[1] == "L"
//                     ? Alignment.centerLeft
//                     : Alignment.centerRight,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     value.toString(),
//                     style: TextStyle(fontSize: 11),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         }
//       });
//     }
//     print(datacell.length);
//     return datacell;
//   }
// }

///////////////////////////////////////////////////////////////
// class ShrinkedDatatable extends StatelessWidget {
//   var decodd;
//   String level;
//   ShrinkedDatatable({required this.decodd, required this.level});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Consumer<Controller>(
//         builder: ((context, value, child) {
//           return DataTable(
//             columnSpacing: 0,
//             headingRowHeight: 35,
//             dataRowHeight: 35,
//             decoration: BoxDecoration(color: P_Settings.datatableColor),
//             border: TableBorder.all(
//               color: P_Settings.datatableColor,
//             ),
//             dataRowColor:
//                 MaterialStateColor.resolveWith((states) => level == "level1"
//                     ? P_Settings.l1datatablecolor
//                     : level == "level2"
//                         ? P_Settings.l2datatablecolor
//                         : level == "level3"
//                             ? P_Settings.l3datatablecolor
//                             : P_Settings.color4),
//             columns: getColumns(value.tableColumn, context),
//             rows: getRowss(value.newMp, context),
//           );
//         }),
//       ),
//     );
//   }

//   ////////////////////////////////////////////////////////////
//   List<DataColumn> getColumns(List<String> columns, BuildContext context) {
//     String behv;
//     String colsName;
//     return columns.map((String column) {
//       // final isAge = column == columns[2];
//       Provider.of<Controller>(context, listen: false).colName =
//           column.split('_');
//       colsName = Provider.of<Controller>(context, listen: false).colName![1];
//       behv = Provider.of<Controller>(context, listen: false).colName![0];
//       // print("column---${column}");
//       return DataColumn(
//         tooltip: colsName,
//         label: Container(
//           width: 50,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               colsName,
//               style: TextStyle(fontSize: 12),
//               textAlign: behv[1] == "L" ? TextAlign.left : TextAlign.right,
//             ),
//           ),
//         ),
//       );
//     }).toList();
//   }

//   ////////////////////////////////////////////////////////////
//   List<DataRow> getRowss(List<Map<String, dynamic>> row, BuildContext context) {
//     return Provider.of<Controller>(context, listen: false).newMp.map((row) {
//       return DataRow(
//         cells: getCelle(row, context),
//       );
//     }).toList();
//   }

//   ///////////////////////////////////////////////////////////
//   List<DataCell> getCelle(Map<String, dynamic> data, BuildContext context) {
//     String behv;
//     String colsName;
//     // print("data--$data");
//     List<DataCell> datacell = [];
//     for (var i = 0;
//         i < Provider.of<Controller>(context, listen: false).tableColumn.length;
//         i++) {
//       data.forEach((key, value) {
//         if (Provider.of<Controller>(context, listen: false).tableColumn[i] ==
//             key) {
//           Provider.of<Controller>(context, listen: false).rowName =
//               Provider.of<Controller>(context, listen: false)
//                   .tableColumn[i]
//                   .split('_');
//           colsName =
//               Provider.of<Controller>(context, listen: false).rowName![1];
//           behv = Provider.of<Controller>(context, listen: false).rowName![0];
//           // print("column---${tableColumn[i]}");
//           datacell.add(
//             DataCell(
//               Container(
//                 width: 50,
//                 alignment: behv[1] == "L"
//                     ? Alignment.centerLeft
//                     : Alignment.centerRight,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     value.toString(),
//                     style: TextStyle(fontSize: 11),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         }
//       });
//     }
//     print(datacell.length);
//     return datacell;
//   }
// }
