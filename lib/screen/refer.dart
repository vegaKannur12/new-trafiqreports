// import 'package:flutter/material.dart';
// import 'package:reports/components/datatableCompo.dart';

// class Test extends StatefulWidget {
//   const Test({Key? key}) : super(key: key);

//   @override
//   State<Test> createState() => _TestState();
// }

// class _TestState extends State<Test> {
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
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Center(
//         child: ElevatedButton(
//             child: Text("click"),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => DataTableCompo(
//                           jsondata: jsondata,
//                         )),
//               );
//             }),
//       )),
//     );
//   }
// }
