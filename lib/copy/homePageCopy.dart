// // import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:reports/components/customColor.dart';
// import 'package:reports/components/customDatePicker.dart';
// import 'package:reports/components/customappbar.dart';
// import 'package:reports/controller/controller.dart';
// import 'package:reports/screen/level1Sample.dart';

// class HomePage extends StatefulWidget {
//   // final _draweItems = [
//   //   new DrawerItem("sales report ", Icons.report),
//   //   new DrawerItem("purchase report", Icons.report),
//   //   new DrawerItem("sales report", Icons.report)
//   // ];
//   // HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() {
//     return new _HomePageState();
//   }
// }

// class _HomePageState extends State<HomePage> {
//   late ValueNotifier<int> _selectedIndex = ValueNotifier(0);
//   late ValueNotifier<bool> buttonClicked = ValueNotifier(false);

//   String searchkey = "";
//   bool isSearch = false;

//   bool isSelected = true;
//   // bool buttonClicked = false;
//   // List<String> purchseItems = ["level 1", "level 2", "level3"];
//   // List<String> salesItems = ["level 1", "level 2", "level3"];
//   // List<String> sales2Items = ["level 1", "level 2", "level3"];

//   // List<Map<String, dynamic>>? newList = [];

//   _onSelectItem(int index, String reportType) {
//     print("report  ---${reportType}");
//     _selectedIndex.value = index;
//     Provider.of<Controller>(context, listen: false)
//         .getReportApi();
//     Navigator.of(context).pop(); // close the drawer
//   }

//   @override
//   Widget build(BuildContext context) {
//     //////////////////////////////////////////
//     List<Widget> drawerOpts = [];

//     for (var i = 0;
//         i < Provider.of<Controller>(context, listen: false).drawerItems.length;
//         i++) {
//       // var d =Provider.of<Controller>(context, listen: false).drawerItems[i];
//       drawerOpts.add(Consumer<Controller>(builder: (context, value, child) {
//         return ListTile(
//             // leading: new Icon(d.icon),
//             title: new Text(
//               value.drawerItems[i],
//               style: TextStyle(fontFamily: P_Font.kronaOne, fontSize: 17),
//             ),
//             selected: i == _selectedIndex,
//             onTap: () {
//               _onSelectItem(i, value.drawerItems[i]);
//               // Navigator.push(
//               //                 context,
//               //                 MaterialPageRoute(builder: (context) => Level1Sample()),
//               //               );
//             });
//       }));
//     }
//     /////////////////////////////////////////////////////////////////////
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       // appBar: AppBar(title: Text(widget._draweItems[_selectedIndex].title)),
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(60),
//         child: CustomAppbar(
//             title: Provider.of<Controller>(context, listen: false)
//                 .drawerItems[_selectedIndex.value]),
//       ),

//       ///////////////////////////////////////////////////////////////////
//       drawer: Drawer(
//         child: new Column(
//           children: <Widget>[
//             Container(
//               height: size.height * 0.2,
//               color: P_Settings.color3,
//             ),
//             Column(children: drawerOpts)
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           // Text(widget._draweItems[_selectedIndex].title),
//           buttonClicked.value
//               ? Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       ConstrainedBox(
//                         constraints: new BoxConstraints(
//                           minHeight: 20.0,
//                           minWidth: 80.0,
//                         ),
//                         child: SizedBox.shrink(
//                             child: InkWell(
//                                 onTap: (() {
//                                   print("Icon button --${buttonClicked}");

//                                   buttonClicked.value = false;
//                                 }),
//                                 child: Icon(Icons.calendar_month))),
//                       ),
//                     ],
//                   ),
//                 )
//               : Container(
//                   height: size.height * 0.2,
//                   color: P_Settings.dateviewColor,
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           CustomDatePicker(dateType: "From Date"),
//                           CustomDatePicker(dateType: "To Date"),
//                         ],
//                       ),
//                       // Padding(
//                       //   padding: const EdgeInsets.all(10.0),
//                       //   child: Row(
//                       //     mainAxisAlignment: MainAxisAlignment.end,
//                       //     children: [
//                       //       ElevatedButton(
//                       //         onPressed: () {},
//                       //         child: Text("View"),
//                       //       ),
//                       //     ],
//                       //   ),
//                       // )
//                     ],
//                   ),
//                 ),
//           Consumer<Controller>(builder: (context, value, child) {
//             {
//               return Container(
//                 // color: P_Settings.datatableColor,
//                 height: size.height * 0.6,
//                 child: ListView.builder(
//                   itemCount: value.reportItems.length,
//                   itemBuilder: ((context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Ink(
//                         height: size.height * 0.09,
//                         decoration: BoxDecoration(
//                           color: (index % 2 == 0)
//                               ? P_Settings.datatableColor
//                               : P_Settings.color4,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: ListTile(
//                             // contentPadding: EdgeInsets.zero,
//                             // dense: true,
//                             minLeadingWidth: 10,
//                             onTap: () {
//                               buttonClicked.value = true;

//                               print(buttonClicked);
//                             },
//                             title: Text(
//                               value.reportItems[index],
//                               // overflow: TextOverflow.ellipsis,
//                               // softWrap: true,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   }),
//                 ),
//               );
//             }
//           })
//         ],
//       ),
//     );
//   }
// }

// /////////////////////////////////////////////////////////////
// // class DrawerItem {
// //   String title;
// //   IconData icon;
// //   DrawerItem(this.title, this.icon);
// // }


// //////////////////////////////////////////////////////////