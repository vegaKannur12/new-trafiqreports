// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:reports/components/customColor.dart';
// import 'package:reports/components/shrinkedDatatable.dart';
// import 'package:reports/screen/homePage.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../components/datatableCompo.dart';

// class LevelOne extends StatefulWidget {
//   const LevelOne({Key? key}) : super(key: key);

//   @override
//   State<LevelOne> createState() => _LevelOneState();
// }

// class _LevelOneState extends State<LevelOne> {
//   final jsondata = [
//     {
//       "rank": "0",
//       "a": "TLN10_BillNo",
//       "b": "TLN10_MRNo",
//       "c": "TLN50_PatientName",
//       "d": "CRY10_Amt",
//       "e": "CRY10_Paid",
//       "f": "CRY10_Bal",
//       "g": "TLN10_Name",
//     },
//     {
//       "rank": "1",
//       "a": "G202204027",
//       "b": "TJAA2",
//       "c": "PRATHYEESH MAKRERI KANNUR",
//       "d": "472.5",
//       "e": "372.5",
//       "f": "100",
//       "g": "Anu",
//     },
//     {
//       "rank": "1",
//       "a": "G202204026",
//       "b": "TJAA2",
//       "c": "PRATHYEESH MAKRERI KANNUR",
//       "d": "1697.5",
//       "e": "1397.5",
//       "f": "300",
//       "g": "Graha",
//     }
//   ];
//   // late ValueNotifier<int> _selectedIndex = ValueNotifier(0);
//   List<Map<String, dynamic>> jsonList = [];
//   List<bool> visible = [];
//   List<bool> isExpanded = [];
//   var encoded;
//   List<Map<String, dynamic>> shrinkedData = [];
//   var encodedShrinkdata;
//   var decodd;
//   var decoddShrinked;
//   List<String> listString = ["Main Heading", "level1", "level2"];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     print("initstate");
//     // setSharedPreftojsondata();
//     // getShared();
//     encoded = json.encode(jsondata);

//     createShrinkedData();
//     // setSharedPreftoShrinkeddata();
//     print("jsondata----$jsondata");
//     // setList();
//     // getSharedShrinked();
//     isExpanded = List.generate(listString.length, (index) => false);
//     visible = List.generate(listString.length, (index) => true);
//     //  WidgetsBinding.instance!.addPostFrameCallback((_) => setList());
//   }

//   getShared() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     decodd = prefs.getString("json");
//     // decoddShrinked = prefs.getString("shrinked json");
//     print("decoded---${decodd}");
//     // print("decoddShrinked---${decoddShrinked}");
//   }

//   // getSharedShrinked()async{
//   //   SharedPreferences prefs1 = await SharedPreferences.getInstance();
//   //   decoddShrinked = prefs1.getString("shrinked json");
//   //   print("decoded- shrinkd--${decoddShrinked}");

//   // }

//   // setSharedPreftoShrinkeddata() async {
//   //   print("enterd into shared shrinked");
//   //   encodedShrinkdata = json.encode(shrinkedData);

//   //   SharedPreferences prefs1 = await SharedPreferences.getInstance();
//   //   print("encodedShrinkdata----${encodedShrinkdata}");

//   //   prefs1.setString("shrinked json", encodedShrinkdata);
//   //   print("added to shrinked shred prefs");

//   // }

//   setSharedPreftojsondata() async {
//     print("enterd into shared");
//     encoded = json.encode(jsondata);

//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     print("encoded---$encoded");
//     prefs.setString("json", encoded);
//     print("added to shred prefs");
//   }

//   createShrinkedData() {
//     shrinkedData.clear();
//     print("cleared---$shrinkedData");
//     shrinkedData.add(jsondata[0]);
//     shrinkedData.add(jsondata[jsondata.length - 1]);
//     print("shrinked data --${shrinkedData}");
//     encodedShrinkdata = json.encode(shrinkedData);
//   }

//   toggle(int i) {
//     print("json inside toggle --$jsonList");

//     setState(() {
//       isExpanded[i] = !isExpanded[i];
//       visible[i] = !visible[i];
//     });
//   }

//   setList() {
//     jsonList.clear();
//     jsondata.map((jsonField) {
//       jsonList.add(jsonField);
//     }).toList();
//     print("json list--${jsonList}");
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Order"),
//       ),
//       body: ListView.builder(
//           itemCount: listString.length,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Column(
//                 children: [
//                   Ink(
//                     decoration: BoxDecoration(
//                       color: P_Settings.color4,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: ListTile(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => HomePage()),
//                         );
//                       },
//                       title: Column(
//                         children: [
//                           Text(listString[index]),
//                           Text('/report page flow'),
//                         ],
//                       ),
//                       trailing: IconButton(
//                           icon: isExpanded[index]
//                               ? Icon(
//                                   Icons.arrow_upward,
//                                   size: 18,
//                                 )
//                               : Icon(
//                                   Icons.arrow_downward,
//                                   // actionIcon.icon,
//                                   size: 18,
//                                 ),
//                           onPressed: () {
//                             toggle(index);
//                             print("json-----${json}");
//                           }),
//                     ),
//                   ),
//                   SizedBox(height: size.height * 0.004),
//                   Visibility(
//                     visible: visible[index],
//                     child: DataTableCompo(decodd: encodedShrinkdata),
//                   ),
//                   Visibility(
//                     visible: isExpanded[index],
//                     child: DataTableCompo(decodd: encoded),
//                   ),
//                 ],
//               ),
//             );
//           }),
//     );
//   }
// }
