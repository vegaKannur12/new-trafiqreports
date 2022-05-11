// import 'package:flutter/material.dart';
// //this is an external package for formatting date and time
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:reports/controller/controller.dart';

// class CustomDatePicker extends StatefulWidget {
//   String dateType;
//   CustomDatePicker({required this.dateType});
//   @override
//   State<CustomDatePicker> createState() => _CustomDatePickerState();
// }

// class _CustomDatePickerState extends State<CustomDatePicker> {
//   DateTime currentDate = DateTime.now();
//   String? formattedDate;
//   String? crntDateFormat;
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? pickedDate = await showDatePicker(
//         context: context,
//         initialDate: currentDate,
//         firstDate: currentDate.subtract(Duration(days: 0)),
//         lastDate: DateTime(2023));
//     if (pickedDate != null) {
//       setState(() {
//         currentDate = pickedDate;
//       });
//     } else {
//       print("please select date");
//     }
//     formattedDate = DateFormat('dd-MM-yyyy').3(currentDate);
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     crntDateFormat = DateFormat('dd-MM-yyyy').format(currentDate);
//     print(crntDateFormat);
//     // Provider.of<Controller>(context, listen: false).getReportApi();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       // width: double.infinity,
//       // color: Colors.grey[200],
//       width: size.width * 0.4,
//       height: size.height * 0.1,
//       child: Center(
//         child: Row(
//           // crossAxisAlignment: CrossAxisAlignment.center,
//           // mainAxisAlignment:MainAxisAlignment.center ,
//           children: [
//             IconButton(
//               onPressed: () {
//                 _selectDate(context);
//               },
//               icon: Icon(Icons.calendar_month),
//             ),
//             Consumer<Controller>(builder: (context, value, child) {
//               return widget.dateType == "From Date" 
//                   ? Container(
//                       child: formattedDate == null 
//                           ? Text(crntDateFormat.toString())
//                           : Text(formattedDate.toString()))
//                   : Container(
//                       child: formattedDate == null
//                           ? Text(crntDateFormat.toString())
//                           : Text(formattedDate.toString()));
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }
// //////////////////////////////
