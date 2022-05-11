// import 'package:flutter/material.dart';

// import '../components/customColor.dart';

// class MyApp1 extends StatefulWidget {
//   @override
//   _MyApp1State createState() => _MyApp1State();
// }

// class _MyApp1State extends State<MyApp1> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text('Data Table'),
//           ),
//           body: Column(
//             children: [
//               Flexible(
//                 child: Container(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: DataTable(
//                       headingRowHeight: 50,
//                       dataRowHeight: 24,
//                       columnSpacing: 0,
//                       horizontalMargin: 0,
//                       border: TableBorder.all(
//                         color: P_Settings.datatableColor,
//                       ),
//                       columns: [
//                         DataColumn(label: Text('RollNo')),
//                         DataColumn(label: Text('RollNo')),
//                         DataColumn(label: Text('RollNo')),
//                         DataColumn(label: Text('Name')),
//                         DataColumn(label: Text('Class1')),
//                         DataColumn(label: Text('Class2')),
//                         DataColumn(label: Text('Class3')),
//                         DataColumn(label: Text('Class4')),
//                         DataColumn(label: Text('Class5')),
//                         // DataColumn(label: Text('Class6')),
//                       ],
//                       rows: [
//                         DataRow(cells: [
//                           DataCell(Text('1')),
//                           DataCell(Text('Arya')),
//                           DataCell(Text('Arya')),
//                           DataCell(Text('Arya')),
//                           DataCell(Text('6')),
//                           DataCell(Text('66')),
//                           DataCell(Text('566')),
//                           DataCell(Text('4566')),
//                           DataCell(Text('346')),
//                           // DataCell(Text('2436')),
//                         ]),
//                         DataRow(cells: [
//                           DataCell(Text('12')),
//                           DataCell(Text('Arya')),
//                           DataCell(Text('Arya')),
//                           DataCell(Text('John')),
//                           DataCell(Text('4336')),
//                           DataCell(Text('1236')),
//                           DataCell(Text('676')),
//                           DataCell(Text('7656')),
//                           DataCell(Text('566')),
//                           // DataCell(Text('4569')),
//                         ]),
//                         DataRow(cells: [
//                           DataCell(Text('42')),
//                           DataCell(Text('Arya')),
//                           DataCell(Text('Arya')),
//                           DataCell(Text('Tony')),
//                           DataCell(Text('4566')),
//                           DataCell(Text('4566')),
//                           DataCell(Text('456')),
//                           DataCell(Text('646')),
//                           DataCell(Text('4566')),
//                           // DataCell(Text('4568')),
//                         ]),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )),
//     );
//   }
// }
