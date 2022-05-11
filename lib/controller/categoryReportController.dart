import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reports/service/myService.dart';
import 'package:http/http.dart' as http;

class CategoryReportController extends ChangeNotifier {
  String urlgolabl = Globaldata.apiglobal;
  List<Map<String,dynamic>> reportCategoryList=[];
  Future getCategoryReport() async {
    try {
      Uri url = Uri.parse("$urlgolabl/report_group_list.php");
      http.Response response = await http.post(
        url,
        // body: body,
      );
      var map = jsonDecode(response.body);
      //print(map);
      for (var item in map) {
        reportCategoryList.add(item);
      }

      print("report Category ${reportCategoryList}");
      notifyListeners();
    } catch (e) {
      print("e");
    }
  }
}
