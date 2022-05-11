import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reports/components/customColor.dart';
import 'package:reports/controller/controller.dart';

class SelectDate {
  DateTime currentDate = DateTime.now();
  // String? formattedDate;
  String? fromDate;
  String? toDate;
  String? crntDateFormat;
  String? specialField;

  Future selectDate(BuildContext context, String level, String filter_id,
      String old_filter_where_ids, String dateType) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(currentDate.year + 1),
        builder: (BuildContext context, Widget? child) {
          return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light().copyWith(
                    primary: level == "level1"
                        ? P_Settings.l1appbarColor
                        : level == "level2"
                            ? P_Settings.l2appbarColor
                            : level == "level3"
                                ? P_Settings.l3appbarColor
                                : null),
              ),
              child: child!);
        });
    if (pickedDate != null) {
      // setState(() {
      currentDate = pickedDate;
      // });
    } else {
      print("please select date");
    }
    if (dateType == "from date") {
      fromDate = DateFormat('dd-MM-yyyy').format(currentDate);
    }
    if (dateType == "to date") {
      toDate = DateFormat('dd-MM-yyyy').format(currentDate);
    }
    fromDate = fromDate == null
        ? Provider.of<Controller>(context, listen: false).fromDate.toString()
        : fromDate.toString();

    toDate = toDate == null
        ? Provider.of<Controller>(context, listen: false).todate.toString()
        : toDate.toString();

    // toDate = toDate == null
    //     ? Provider.of<Controller>(context, listen: false).todate.toString()
    //     : toDate.toString();

    Provider.of<Controller>(context, listen: false).setDate(fromDate!, toDate!);

    specialField = Provider.of<Controller>(context, listen: false).special;

    Provider.of<Controller>(context, listen: false).getSubCategoryReportList(
        specialField!,
        filter_id,
        fromDate!,
        toDate!,
        old_filter_where_ids,
        level);
  }

}
