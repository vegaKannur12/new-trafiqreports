/////////////////////////using api////////////////////
///class DataTableWidget extends StatelessWidget {

//       List results=[] ;
//        intState((){
//          super.iniState();
//             this.getSale();
//  })
// Future<String> getData () async {

// var response = await http.get(
//   "$saleUrl/?format=json",

// );
// setState(() {
//   var dataConvertedToJson = 
// json.decode(utf8.decode(response.bodyBytes));
//   results = dataConvertedToJson['results'];
// });
//  print('${results.length}');
//   return "successful";
//  }
//   DataRow _getDataRow(result) {
//     return DataRow(
//       cells: <DataCell>[
//         DataCell(Text(data["text1"])),
//         DataCell(Text(data["text2"])),
//         DataCell(Text(data["text3"])),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DataTable(
//       columns: [
//         DataColumn(label: Text('Patch')),
//         DataColumn(label: Text('Version')),
//         DataColumn(label: Text('Ready')),
//       ],
//       rows: List.generate(
//           results.length, (index) => _getDataRow(results[index])),
//     );
//   }
// }/////
//////////////////////////////////////////////////
// class TableModel {
//   TableModel(this.headerData, this.rowData);
//   List<String> headerData;
//   List<List<String>> rowData;

//   factory TableModel.fromJson(Map<String, dynamic> json) {
//     return TableModel(
//       json['DayEnd'][0]["Headers"].split('´').toList(),
//       buildRowData(json),
//     );
//   }
// }

// List<List<String>> buildRowData(Map<String, dynamic> json){
//   List<List<String>> rowDataCollection = [];
//   json['DayEnd'][0]["DataList"].forEach((rows){
//     rowDataCollection.add(rows['Data'].split('´').toList());
//   });

//   return rowDataCollection;
// }
////////////////////////////////////
// Future<void> generateList() async {
//     String responseBody = await rootBundle.loadString("assets/data.json");
//     var list = await json.decode(responseBody).cast<Map<String, dynamic>>();
//     return await list
//         .map<TableModel>((json) => TableModel.fromJson(json))
//         .toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             appBar: AppBar(
//               title: Text('DataTable'),
//             ),
//             body: FutureBuilder(
//               future: generateList(),
//               builder: (context, snapShot) {
//                 if (snapShot.data == null ||
//                     snapShot.connectionState == ConnectionState.waiting ||
//                     snapShot.hasError ||
//                     snapShot.data.length == 0) {
//                   return Container(
//                     child: Center(child: CircularProgressIndicator()),
//                   );
//                 } else {
//                   return ListView.builder(
//                       shrinkWrap: true,
//                       scrollDirection: Axis.vertical,
//                       itemCount: snapShot.data.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         final TableModel table = snapShot.data[index];
//                         return SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: DataTable(
//                             columns: table.headerData.map<DataColumn>((e) {
//                               var columnName = e;
//                               TextAlign align;
//                               if (columnName.contains('<')) {
//                                 align = TextAlign.start;
//                                 columnName = columnName.replaceAll('<', '');
//                               } else if (columnName.contains('>')) {
//                                 align = TextAlign.end;
//                                 columnName = columnName.replaceAll('>', '');
//                               } else {
//                                 align = TextAlign.center;
//                               }

//                               return DataColumn(
//                                   label: Text(
//                                 columnName,
//                                 textAlign: align,
//                               ));
//                             }).toList(),
//                             rows: table.rowData.map<DataRow>((e) {
//                               return DataRow(
//                                   cells: e
//                                       .map<DataCell>((e) => DataCell(Text(e)))
//                                       .toList());
//                             }).toList(),
//                           ),
//                         );
//                       });
//                 }
//               },
//             )));
  // }