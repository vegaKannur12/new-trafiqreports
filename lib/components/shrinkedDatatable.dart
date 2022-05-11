// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:reports/components/customColor.dart';

// class ShrinkedDatatable extends StatefulWidget {
//   var decodd;

//   ShrinkedDatatable({
//     required this.decodd,
//   });

//   @override
//   State<ShrinkedDatatable> createState() => _ShrinkedDatatableState();
// }

// class _ShrinkedDatatableState extends State<ShrinkedDatatable> {
//   List<Map<String, dynamic>> newJson = [];
//   final rows = <DataRow>[];
//   String? behv;

//   List<String>? colName;
//   List<String> tableColumn = [];
//   List<String> behvr = [];
//   var jsondata;
//   Map<String, dynamic> mainHeader = {};
//   @override
//   void initState() {
//     String colsName;
//     super.initState();
//     print("widget.json---${jsondata}");
//     if (widget.decodd != null) {
//       jsondata = json.decode(widget.decodd);
//     } else {
//       print("null");
//     }
//     if (jsondata[0] != null) {
//       mainHeader = jsondata[0];
//     }
//     print("main header from init state---$mainHeader");

//     var list = jsondata[0].values.toList();
//     list.removeAt(0);
//     for (var item in list) {
//       tableColumn.add(item);
//     }

//     print("table column----$tableColumn");
//     jsondata.removeAt(0);
//     for (var item in jsondata) {
//       newJson.add(item);
//     }
//     newJson.forEach((item) => item..remove("rank"));
//     print("new json---$newJson");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10),
//         child: DataTable(
//           columnSpacing: 0,
//           headingRowHeight: 35,
//           dataRowHeight: 35,
//           decoration: BoxDecoration(color: P_Settings.datatableColor),
//           border: TableBorder.all(
//             color: P_Settings.datatableColor,
//           ),
//           dataRowColor:
//               MaterialStateColor.resolveWith((states) => P_Settings.color4),
//           columns: getColumns(tableColumn),
//           rows: getRowss(newJson),
//         ),
//       ),
//     );
//   }

//   List<DataColumn> getColumns(List<String> columns) {
//     // print("columns---${columns}");
//     String behv;
//     String colsName;
//     return columns.map((String column) {
//       // final isAge = column == columns[2];
//       colName = column.split('_');
//       colsName = colName![1];
//       behv = colName![0];
//       behvr.add(behv);
//       print('Behave --- $behvr');
//       // print(behvr);

//       // print(behv[1]);
//       print("column---${column}");
//       return DataColumn(
//         tooltip: colsName,
//         label: Container(
//           width: 100,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               colsName,

//               // textAlign: TextAlign.center,
//               textAlign: behv[1] == "L" ? TextAlign.left : TextAlign.right,
//             ),
//           ),
//         ),
//       );
//     }).toList();
//   }

//   ////////////////////////////////////////////
//   List<DataRow> getRowss(List<Map<String, dynamic>> rows) {
//     List<String> newBehavr = [];
//     print("rows---$rows");
//     return newJson.map((row) {
//       return DataRow(
//         cells: getCelle(row),
//       );
//     }).toList();
//   }

//   List<DataCell> getCelle(Map<String, dynamic> data) {
//     print("data--$data");
//     List<DataCell> datacell = [];
//     mainHeader.remove('rank');
//     print("main header---$mainHeader");

//     data.forEach(
//       (key, value) {
//         mainHeader.forEach(
//           (k, val) {
//             if (key == k) {
//               print("mainHeader[k][3] --${mainHeader[k][3]}");
//               datacell.add(
//                 DataCell(
//                   Container(
//                     // width:100,
//                     // width: mainHeader[k][3]==1?50:200,
//                     alignment: mainHeader[k][1] == "L"
//                         ? Alignment.centerLeft
//                         : Alignment.centerRight,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(value),
//                     ),
//                   ),
//                 ),
//               );
//             }
//           },
//         );
//       },
//     );
//     print(datacell.length);
//     return datacell;
//   }
// }
