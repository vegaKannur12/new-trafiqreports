import 'package:flutter/material.dart';
import 'package:reports/components/customColor.dart';
import 'package:reports/screen/homePage.dart';

class Level1Sample extends StatefulWidget {
  const Level1Sample({Key? key}) : super(key: key);

  @override
  State<Level1Sample> createState() => _Level1SampleState();
}

class _Level1SampleState extends State<Level1Sample> {
  List<bool> visible = [];
  List<bool> isExpanded = [];
  Icon actionIcon = Icon(Icons.arrow_downward);
  List<String> listString = ["Main Heading", "level1", "level2"];
  List<String> listShrinkData = ["F1", "F2", "F3"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isExpanded = List.generate(listString.length, (index) => false);
    visible = List.generate(listString.length, (index) => true);
    // visible = true;
    // for (int i = 10; i < listString.length; i++) {
    //   isExpanded.add(false);
    //   visible.add(false);
    // }
  }

  toggle(int i) {
    setState(() {
      isExpanded[i] = !isExpanded[i];
      visible[i] = !visible[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Order"),
      ),
      body: ListView.builder(
          itemCount: listString.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    child: Ink(
                      decoration: BoxDecoration(
                        color: P_Settings.color4,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        title: Column(
                          children: [
                            Text(listString[index]),
                            Text('/report page flow'),
                          ],
                        ),
                        trailing: IconButton(
                            icon: isExpanded[index]
                                ? Icon(
                                    Icons.arrow_upward,

                                    // actionIcon.icon,
                                    size: 18,
                                  )
                                : Icon(
                                    Icons.arrow_downward,
                                    // actionIcon.icon,
                                    size: 18,
                                  ),
                            onPressed: () {
                              toggle(index);
                            }),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.005),
                  Visibility(
                    visible: visible[index],
                    child: shrinkedDataTable(listShrinkData),
                  ),
                  Visibility(visible: isExpanded[index], child: datatable()),
                ],
              ),
            );
          }),
    );
  }

  Widget shrinkedDataTable(List<String> listShrinkData) {
    return Padding(
      padding: const EdgeInsets.only(left:6, right: 6),
      child: Container(
        decoration: BoxDecoration(color: P_Settings.datatableColor),
        // width: 650,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(

            headingRowColor: MaterialStateColor.resolveWith((states) {return P_Settings.rowcolor;},),
            dataRowHeight: 28,
            headingRowHeight: 28,
            columns: [
              DataColumn(label: Text("A")),
              DataColumn(label: Text("B")),
              DataColumn(label: Text("C")),
              DataColumn(label: Text("D")),
              DataColumn(label: Text("E")),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('f1')),
                DataCell(Text('f2')),
                DataCell(Text('f3')),
                DataCell(Text('f4')),
                DataCell(Text('f5')),
              ])
            ],
          ),
        ),
      ),
    );
  }

  ////////////////////////////////////////
  Widget datatable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left:6, right: 6),
        child: Container(
          width: 650,
          decoration: BoxDecoration(color: P_Settings.datatableColor),
          child: DataTable(
              border: TableBorder.all(
                  // color: P_Settings.datatableColor,
                  ),
              // headingRowColor: MaterialStateColor.resolveWith(
              //     (states) => P_Settings.datatableColor),
              columns: [
                DataColumn(
                  label: Text('ID'),
                ),
                DataColumn(
                  label: Text('Name'),
                ),
                DataColumn(
                  label: Text('Code'),
                ),
                DataColumn(
                  label: Text('Quantity'),
                ),
                DataColumn(
                  label: Text('Amount'),
                ),
                DataColumn(
                  label: Text('Quantity'),
                ),
                DataColumn(
                  label: Text('Amount'),
                ),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Anusha')),
                  DataCell(Text('5644645')),
                  DataCell(Text('3')),
                  DataCell(Text('10')),
                  DataCell(Text('3')),
                  DataCell(Text('10')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Anu')),
                  DataCell(Text('5644645')),
                  DataCell(Text('3')),
                  DataCell(Text('19')),
                  DataCell(Text('3')),
                  DataCell(Text('10')),
                ]),
                DataRow(cells: [
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                ]),
              ]),
        ),
      ),
    );
  }
}
