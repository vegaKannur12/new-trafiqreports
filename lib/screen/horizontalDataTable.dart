// import 'package:flutter/material.dart';
// import 'package:horizontal_data_table/horizontal_data_table.dart';
// import 'package:provider/provider.dart';
// import 'package:reports/components/customDatePicker.dart';

// import '../components/customColor.dart';
// import '../controller/controller.dart';

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   HDTRefreshController _hdtRefreshController = HDTRefreshController();
//   TextEditingController _controller = TextEditingController();
//   List<String> listString = ["Main Heading", "level1", "level2"];
//   List<String> listShrinkData = ["F1", "F2", "F3"];
//   List<bool> visible = [];
//   List<bool> isExpanded = [];
//   static const int sortName = 0;
//   static const int sortStatus = 1;
//   bool isAscending = true;
//   int sortType = sortName;
//   bool isSearch = false;
//   // bool visible = true;
//   String searchKey = "";
//   bool isSelected = true;
//   bool buttonClicked = false;
//   bool qtyvisible = false;
//   @override
//   void initState() {
//     Provider.of<Controller>(context, listen: false).getReportApi();
//     _controller.clear();
//     super.initState();
//   }

//   toggle(int i) {
//     setState(() {
//       isExpanded[i] = !isExpanded[i];
//       visible[i] = !visible[i];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     String? type;
//     String? type1;
//     String? type2;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Column(children: [
//         // Text(widget._draweItems[_selectedIndex].title),
//         buttonClicked
//             ? Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     ConstrainedBox(
//                       constraints: BoxConstraints(
//                         minHeight: 20.0,
//                         minWidth: 80.0,
//                       ),
//                       child: SizedBox.shrink(
//                         child: InkWell(
//                           onTap: (() {
//                             // print("Icon button --${buttonClicked}");
//                             setState(() {
//                               buttonClicked = false;
//                             });
//                           }),
//                           child: Icon(Icons.calendar_month),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             : Consumer<Controller>(builder: (context, value, child) {
//                 // type = value.reportList![4]["report_elements"].toString();
//                 if (value.reportList != null && value.reportList!.isNotEmpty) {
//                   type = value.reportList![4]["report_elements"].toString();
//                   List<String> parts = type!.split(',');
//                   type1 = parts[0].trim(); // prefix: "date"
//                   type2 = parts[1].trim(); // prefix: "date"
//                 }
//                 {
//                   return Container(
//                     child: Container(
//                       height: size.height * 0.15,
//                       color: P_Settings.dateviewColor,
//                       child: Column(
//                         children: [
//                           Flexible(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Flexible(
//                                   child: Container(
//                                     width: size.width * 0.2,
//                                     height: size.height * 0.1,
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(16.0),
//                                       child: Center(
//                                         child: Row(
//                                           children: [],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 type1 != "F" && type2 != "T"
//                                     ? CustomDatePicker(dateType: "To Date")
//                                     : CustomDatePicker(dateType: "From Date "),
//                                 CustomDatePicker(dateType: "To Date"),
//                                 qtyvisible
//                                     ? SizedBox(
//                                         width: size.width * 0.2,
//                                         child: IconButton(
//                                           icon: const Icon(Icons.arrow_downward,
//                                               color: Colors.deepPurple),
//                                           onPressed: () {
//                                             setState(() {
//                                               qtyvisible = false;
//                                             });
//                                           },
//                                         ),
//                                       )
//                                     : SizedBox(
//                                         width: size.width * 0.2,
//                                         child: IconButton(
//                                           icon: const Icon(Icons.arrow_upward,
//                                               color: Colors.deepPurple),
//                                           onPressed: () {
//                                             setState(() {
//                                               qtyvisible = true;
//                                             });
//                                           },
//                                         ),
//                                       )
//                               ],
//                             ),
//                           ),
//                           Visibility(
//                             visible: qtyvisible,
//                             child: Row(
//                               children: [
//                                 Consumer<Controller>(
//                                     builder: (context, value, child) {
//                                   {
//                                     return Flexible(
//                                       child: Container(
//                                         alignment: Alignment.topRight,
//                                         height: size.height * 0.08,
//                                         width: size.width * 1,
//                                         child: Row(
//                                           children: [
//                                             Flexible(
//                                               child: ElevatedButton(
//                                                   onPressed: () {},
//                                                   child: Text(
//                                                       value.specialelements[0]
//                                                           ["label"])),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     );
//                                   }
//                                 })
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//               }),
//         Consumer<Controller>(builder: (context, value, child) {
//           {
//             return Container(
//               height: size.height * 0.2,
//               child: ListView.builder(
//                   itemCount: listString.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(5.0),
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 4, right: 4),
//                             child: Ink(
//                               decoration: BoxDecoration(
//                                 color: P_Settings.color5,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: ListTile(
//                                 onTap: () {},
//                                 title: Column(
//                                   children: [
//                                     Text(listString[index]),
//                                     Text('/report page flow'),
//                                   ],
//                                 ),
//                                 // trailing: IconButton(
//                                 //     icon: isExpanded[index]
//                                 //         ? Icon(
//                                 //             Icons.arrow_upward,
//                                 //             // actionIcon.icon,
//                                 //             size: 18,
//                                 //           )
//                                 //         : Icon(
//                                 //             Icons.arrow_downward,
//                                 //             // actionIcon.icon,
//                                 //             size: 18,
//                                 //           ),
//                                 //     onPressed: () {
//                                 //       toggle(index);
//                                 //     }),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: size.height * 0.004),
//                           Column(
//                             children: [
//                               Container(),
//                               Container(
//                                 height: 150,
//                                 child: _getBodyWidget(),
//                               ),
//                             ],
//                           ),
//                           // Visibility(
//                           //   visible: visible[index],
//                           //   child: _getBodyWidget(),
//                           // ),
//                           // Visibility(
//                           //     visible: isExpanded[index],
//                           //     child: datatable(context)),
//                         ],
//                       ),
//                     );
//                   }),
//               //  _getBodyWidget(),
//             );
//           }
//         })
//       ]),
//     );
//   }

//   Widget _getBodyWidget() {
//     return Container(
//       child: HorizontalDataTable(
//         leftHandSideColumnWidth: 100,
//         rightHandSideColumnWidth: 600,
//         isFixedHeader: true,
//         headerWidgets: _getTitleWidget(),
//         leftSideItemBuilder: _generateFirstColumnRow,
//         rightSideItemBuilder: _generateRightHandSideColumnRow,
//         itemCount: user.userInfo.length,
//         rowSeparatorWidget: const Divider(
//           color: Color.fromARGB(137, 189, 116, 116),
//           height: 1.0,
//           thickness: 0.0,
//         ),
//         leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
//         rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
//         verticalScrollbarStyle: const ScrollbarStyle(
//           thumbColor: Colors.yellow,
//           isAlwaysShown: true,
//           thickness: 4.0,
//           radius: Radius.circular(5.0),
//         ),
//         horizontalScrollbarStyle: const ScrollbarStyle(
//           thumbColor: Colors.red,
//           isAlwaysShown: true,
//           thickness: 4.0,
//           radius: Radius.circular(5.0),
//         ),
//         enablePullToRefresh: true,
//         refreshIndicator: const WaterDropHeader(),
//         refreshIndicatorHeight: 60,
//         onRefresh: () async {
//           //Do sth
//           await Future.delayed(const Duration(milliseconds: 500));
//           _hdtRefreshController.refreshCompleted();
//         },
//         enablePullToLoadNewData: true,
//         loadIndicator: const ClassicFooter(),
//         onLoad: () async {
//           //Do sth
//           await Future.delayed(const Duration(milliseconds: 500));
//           _hdtRefreshController.loadComplete();
//         },
//         htdRefreshController: _hdtRefreshController,
//       ),
//       height: MediaQuery.of(context).size.height,
//     );
//   }

//   List<Widget> _getTitleWidget() {
//     return [
//       TextButton(
//         style: TextButton.styleFrom(
//           padding: EdgeInsets.zero,
//         ),
//         child: _getTitleItemWidget(
//             'Name' + (sortType == sortName ? (isAscending ? '↓' : '↑') : ''),
//             100),
//         onPressed: () {
//           sortType = sortName;
//           isAscending = !isAscending;
//           user.sortName(isAscending);
//           setState(() {});
//         },
//       ),
//       TextButton(
//         style: TextButton.styleFrom(
//           padding: EdgeInsets.zero,
//         ),
//         child: _getTitleItemWidget(
//             'Status' +
//                 (sortType == sortStatus ? (isAscending ? '↓' : '↑') : ''),
//             100),
//         onPressed: () {
//           sortType = sortStatus;
//           isAscending = !isAscending;
//           user.sortStatus(isAscending);
//           setState(() {});
//         },
//       ),
//       _getTitleItemWidget('Phone', 200),
//       _getTitleItemWidget('Register', 100),
//       _getTitleItemWidget('Termination', 200),
//     ];
//   }

//   Widget _getTitleItemWidget(String label, double width) {
//     return Container(
//       child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
//       width: width,
//       height: 56,
//       padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//       alignment: Alignment.centerLeft,
//     );
//   }

//   Widget _generateFirstColumnRow(BuildContext context, int index) {
//     return Container(
//       child: Text(user.userInfo[index].name),
//       width: 100,
//       height: 52,
//       padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//       alignment: Alignment.centerLeft,
//     );
//   }

//   Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
//     return Row(
//       children: <Widget>[
//         Container(
//           child: Row(
//             children: <Widget>[
//               Icon(
//                   user.userInfo[index].status
//                       ? Icons.notifications_off
//                       : Icons.notifications_active,
//                   color:
//                       user.userInfo[index].status ? Colors.red : Colors.green),
//               Text(user.userInfo[index].status ? 'Disabled' : 'Active')
//             ],
//           ),
//           width: 100,
//           height: 52,
//           padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//           alignment: Alignment.centerLeft,
//         ),
//         Container(
//           child: Text(user.userInfo[index].phone),
//           width: 200,
//           height: 52,
//           padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//           alignment: Alignment.centerLeft,
//         ),
//         Container(
//           child: Text(user.userInfo[index].registerDate),
//           width: 100,
//           height: 52,
//           padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//           alignment: Alignment.centerLeft,
//         ),
//         Container(
//           child: Text(user.userInfo[index].terminationDate),
//           width: 200,
//           height: 52,
//           padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//           alignment: Alignment.centerLeft,
//         ),
//       ],
//     );
//   }
// }

// User user = User();

// class User {
//   List<UserInfo> userInfo = [];

//   void initData(int size) {
//     for (int i = 0; i < size; i++) {
//       userInfo.add(UserInfo(
//           "User_$i", i % 3 == 0, '+001 9999 9999', '2019-01-01', 'N/A'));
//     }
//   }

//   ///
//   /// Single sort, sort Name's id
//   void sortName(bool isAscending) {
//     userInfo.sort((a, b) {
//       int aId = int.tryParse(a.name.replaceFirst('User_', '')) ?? 0;
//       int bId = int.tryParse(b.name.replaceFirst('User_', '')) ?? 0;
//       return (aId - bId) * (isAscending ? 1 : -1);
//     });
//   }

//   ///
//   /// sort with Status and Name as the 2nd Sort
//   void sortStatus(bool isAscending) {
//     userInfo.sort((a, b) {
//       if (a.status == b.status) {
//         int aId = int.tryParse(a.name.replaceFirst('User_', '')) ?? 0;
//         int bId = int.tryParse(b.name.replaceFirst('User_', '')) ?? 0;
//         return (aId - bId);
//       } else if (a.status) {
//         return isAscending ? 1 : -1;
//       } else {
//         return isAscending ? -1 : 1;
//       }
//     });
//   }
// }

// class UserInfo {
//   String name;
//   bool status;
//   String phone;
//   String registerDate;
//   String terminationDate;

//   UserInfo(this.name, this.status, this.phone, this.registerDate,
//       this.terminationDate);
// }

// Widget shrinkedDataTable(BuildContext context) {
//   Size size = MediaQuery.of(context).size;
//   return Padding(
//     padding: const EdgeInsets.only(left: 6, right: 6),
//     child: SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Container(
//         width: size.width * 1.8,
//         // height: 90,
//         decoration: BoxDecoration(color: P_Settings.datatableColor),
//         child: DataTable(
//           headingRowHeight: 25,
//           dataRowHeight: 25,
//           dataRowColor:
//               MaterialStateColor.resolveWith((states) => P_Settings.color4),
//           columnSpacing: 2,
//           border: TableBorder.all(
//             color: P_Settings.datatableColor,
//           ),
//           columns: [
//             DataColumn(
//               label: Text('ID'),
//             ),
//             DataColumn(
//               label: Text('Name'),
//             ),
//             DataColumn(
//               label: Text('Code'),
//             ),
//             DataColumn(
//               label: Text('Quantity'),
//             ),
//             DataColumn(
//               label: Text('Amount'),
//             ),
//             DataColumn(
//               label: Text('Quantity'),
//             ),
//             DataColumn(
//               label: Text('Amount'),
//             ),
//           ],
//           rows: [
//             DataRow(cells: [
//               DataCell(Text('f1')),
//               DataCell(Text('f2')),
//               DataCell(Text('f3')),
//               DataCell(Text('f4')),
//               DataCell(Text('f5')),
//               DataCell(Text('f6')),
//               DataCell(Text('f7')),
//             ])
//           ],
//         ),
//       ),
//     ),
//   );
// }

// ////////////////////////////////////////////////////
// Widget datatable(BuildContext context) {
//   Size size = MediaQuery.of(context).size;
//   bool _isAscending = true;
//   return Padding(
//     padding: const EdgeInsets.only(left: 6, right: 6),
//     child: SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Container(
//         width: size.width * 1.8,
//         decoration: BoxDecoration(color: P_Settings.datatableColor),
//         child: DataTable(
//             sortAscending: _isAscending,
//             headingRowHeight: 30,
//             dataRowHeight: 30,
//             dataRowColor:
//                 MaterialStateColor.resolveWith((states) => P_Settings.color4),
//             border: TableBorder.all(
//               color: P_Settings.datatableColor,
//             ),
//             // headingRowColor: MaterialStateColor.resolveWith(
//             //     (states) => P_Settings.datatableColor),
//             columns: [
//               DataColumn(
//                 // onSort: (columnIndex, ascending) {},
//                 label: Text('ID'),
//               ),
//               DataColumn(
//                 label: Text('Name'),
//               ),
//               DataColumn(
//                 label: Text('Code'),
//               ),
//               DataColumn(
//                 label: Text('Quantity'),
//               ),
//               DataColumn(
//                 label: Text('Amount'),
//               ),
//               DataColumn(
//                 label: Text('Quantity'),
//               ),
//               DataColumn(
//                 label: Text('Amount'),
//               ),
//             ],
//             rows: [
//               DataRow(cells: [
//                 DataCell(Text('1')),
//                 DataCell(Text('knusha')),
//                 DataCell(Text('5644645')),
//                 DataCell(Text('3')),
//                 DataCell(Text('10')),
//                 DataCell(Text('3')),
//                 DataCell(Text('10')),
//               ]),
//               DataRow(cells: [
//                 DataCell(Text('1')),
//                 DataCell(Text('Anu')),
//                 DataCell(Text('5644645')),
//                 DataCell(Text('3')),
//                 DataCell(Text('19')),
//                 DataCell(Text('3')),
//                 DataCell(Text('10')),
//               ]),
//               DataRow(cells: [
//                 DataCell(Text('')),
//                 DataCell(Text('')),
//                 DataCell(Text('')),
//                 DataCell(Text('')),
//                 DataCell(Text('')),
//                 DataCell(Text('')),
//                 DataCell(Text('')),
//               ]),
//             ]),
//       ),
//     ),
//   );
// }
