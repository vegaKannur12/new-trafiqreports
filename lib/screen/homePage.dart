import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reports/components/customColor.dart';
import 'package:reports/controller/controller.dart';
import 'package:reports/screen/level1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();
  Widget? appBarTitle;
  Icon actionIcon = Icon(Icons.search);
  late ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  DateTime currentFromDate = DateTime.now();
  DateTime currentToDate = DateTime.now();
  String? reportType;
  bool qtyvisible = false;
  String? formattedDate;
  String? crntFromDateFormat;
  String? crntToDateFormat;
  String? specialelement;
  String reportelements = "";
  String searchkey = "";
  bool isSearch = false;
  bool visible = true;
  String searchKey = "";
  bool isSelected = true;
  bool buttonClicked = false;
  List newList = [];
  String? fromDate;
  String? toDate;
  // int selectedIndex = 0;
  DateTime dateTime = DateTime.now(); //
  ////////////////////////////////////////////
  _onSelectItem(int index, String reportType1) {
    setState(() {
      _selectedIndex.value = index;
      reportType = reportType1;
    });
    Navigator.of(context).pop(); // close the drawer
  }

///////////////////////////////////////////////
// _getDrawerItemWidget(int pos) {
//     print("pos---${pos}");
//     switch (pos) {
//       case 0:
//         return new MainDashboard();
//       case 3:
//         return new OrderForm();
//     }
//   }
//////////////////////////////////
  Future _selectFromDate(BuildContext context, Size size) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(currentFromDate.year + 1),
        builder: (BuildContext context, Widget? child) {
          return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light()
                    .copyWith(primary: P_Settings.appbarColor),
              ),
              child: Container(width: size.width * 0.4, child: child!));
        });
    if (pickedDate != null) {
      setState(() {
        currentFromDate = pickedDate;
      });
    } else {
      print("please select date");
    }
    fromDate = DateFormat('dd-MM-yyyy').format(currentFromDate);
  }

/////////////////////////////////////////////////////////////////FConsumer
  Future _selectToDate(BuildContext context, Size size) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(currentToDate.year + 1),
        builder: (BuildContext context, Widget? child) {
          return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light()
                    .copyWith(primary: P_Settings.appbarColor),
              ),
              child: Container(width: size.width * 0.4, child: child!));
        });
    if (pickedDate != null) {
      setState(() {
        currentToDate = pickedDate;
      });
    } else {
      print("please select date");
    }
    toDate = DateFormat('dd-MM-yyyy').format(currentToDate);
  }

////////////////////////////////////////////////////////
  @override
  void initState() {
    // Provider.of<Controller>(context, listen: false).getCategoryReportList(rg_id)
    _controller.clear();
    DateTime currentD = DateTime(
        currentFromDate.year, currentFromDate.month - 1, currentFromDate.day);
    crntFromDateFormat = DateFormat('dd-MM-yyyy').format(currentD);
    crntToDateFormat = DateFormat('dd-MM-yyyy').format(currentToDate);
    super.initState();
    Provider.of<Controller>(context, listen: false).getCategoryReportList("1");
    reportType = Provider.of<Controller>(context, listen: false)
        .reportCategoryList[0]
        .values
        .elementAt(1);
  }

////////////////////////////////////////////////////
  void togle() {
    setState(() {
      visible = !visible;
    });
  }

//////////////////////////////////////////////////
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    List<Widget> drawerOpts = [];
    String? type;
    String? type1;
    String? type2;
    String? filter;
    String? filter1;

////////////////////////////////////////////////////////////
    for (var i = 0;
        i <
            Provider.of<Controller>(context, listen: false)
                .reportCategoryList
                .length;
        i++) {
      // var d =Provider.of<Controller>(context, listen: false).drawerItems[i];
      drawerOpts.add(Consumer<Controller>(builder: (context, value, child) {
        return ListTile(
            // leading: new Icon(d.icon),
            title: Text(
              value.reportCategoryList[i].values.elementAt(1),
              style: TextStyle(fontFamily: P_Font.kronaOne, fontSize: 17),
            ),
            selected: i == _selectedIndex.value,
            onTap: () {
              Provider.of<Controller>(context, listen: false)
                  .getCategoryReportList(
                      value.reportCategoryList[i].values.elementAt(0));
              _onSelectItem(i, value.reportCategoryList[i].values.elementAt(1));
              //  Provider.of<Controller>(context, listen: false).reportCategoryList.clear();
            });
      }));
    }
    /////////////////////////////////////////////////////////////////////
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: P_Settings.appbarColor,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () async {
                // Scaffold.of(context).openDrawer();
                await Provider.of<Controller>(context, listen: false)
                    .getCategoryReport();

                _scaffoldKey.currentState!.openDrawer();

                print("clicked");
              },
              icon: Icon(Icons.menu)),
          title: Text(reportType.toString()),
        ),

        ///////////////////////////////////////////////////////////////////
        drawer: Drawer(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.045,
              ),
              Container(
                height: size.height * 0.2,
                width: size.width * 1,
                color: P_Settings.color3,
                child: Row(
                  children: [
                    SizedBox(
                      height: size.height * 0.07,
                      width: size.width * 0.03,
                    ),
                    Icon(
                      Icons.list_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(width: size.width * 0.04),
                    Text(
                      "Categories",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Column(children: drawerOpts)
            ],
          ),
        ),
        body: Column(children: [
          buttonClicked
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 20.0,
                          minWidth: 80.0,
                        ),
                        child: SizedBox.shrink(
                          child: InkWell(
                            onTap: (() {
                              // print("Icon button --${buttonClicked}");
                              setState(() {
                                buttonClicked = false;
                              });
                            }),
                            child: Icon(Icons.calendar_month),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Consumer<Controller>(builder: (context, value, child) {
                  {
                    return Container(
                      child: Container(
                        height: size.height * 0.12,
                        color: P_Settings.dateviewColor,
                        child: Column(
                          children: [
                            Flexible(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Container(
                                      width: size.width * 0.01,
                                      height: size.height * 0.1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Center(
                                          child: Row(
                                            children: [],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  type1 != "F" && type2 != "T"
                                      ? Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  _selectFromDate(
                                                      context, size);
                                                },
                                                icon:
                                                    Icon(Icons.calendar_month)),
                                            fromDate == null
                                                ? InkWell(
                                                    onTap: () {
                                                      _selectFromDate(
                                                          context, size);
                                                    },
                                                    child: Text(
                                                        crntFromDateFormat
                                                            .toString()))
                                                : InkWell(
                                                    onTap: (() {
                                                      _selectFromDate(
                                                          context, size);
                                                    }),
                                                    child: Text(
                                                        fromDate.toString()))
                                          ],
                                        )
                                      : Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  _selectFromDate(
                                                      context, size);
                                                },
                                                icon:
                                                    Icon(Icons.calendar_month)),
                                            fromDate == null
                                                ? InkWell(
                                                    onTap: (() {
                                                      _selectFromDate(
                                                          context, size);
                                                    }),
                                                    child: Text(
                                                        crntFromDateFormat
                                                            .toString()))
                                                : InkWell(
                                                    onTap: () {
                                                      _selectFromDate(
                                                          context, size);
                                                    },
                                                    child: Text(
                                                        fromDate.toString()))
                                          ],
                                        ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            _selectToDate(context, size);
                                          },
                                          icon: Icon(Icons.calendar_month)),
                                      toDate == null
                                          ? InkWell(
                                              onTap: () {
                                                _selectToDate(context, size);
                                              },
                                              child: Text(
                                                  crntToDateFormat.toString()))
                                          : InkWell(
                                              onTap: () {
                                                _selectToDate(context, size);
                                              },
                                              child: Text(toDate.toString()))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                }),
          Consumer<Controller>(builder: (context, value, child) {
            {
              // if (value.isLoading == true) {
              //   return Center(
              //     child: CircularProgressIndicator(),
              //   );
              // }
              return Container(
                height: size.height * 0.7,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.reportList.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Ink(
                        height: size.height * 0.09,
                        decoration: BoxDecoration(
                          color: (index % 2 == 0)
                              ? P_Settings.datatableColor
                              : P_Settings.color4,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            minLeadingWidth: 10,
                            onTap: () async {
                              fromDate = fromDate == null
                                  ? crntFromDateFormat.toString()
                                  : fromDate.toString();
                              toDate = toDate == null
                                  ? crntToDateFormat.toString()
                                  : toDate.toString();
                              print("from date---$fromDate");
                              Provider.of<Controller>(context, listen: false)
                                  .fromDate = fromDate;
                              Provider.of<Controller>(context, listen: false)
                                  .todate = toDate;
                              filter =
                                  value.reportList[index]["filters"].toString();
                              reportelements = value.reportList[index]
                                      ["report_elements"]
                                  .toString();
                              print("specialelement...........$specialelement");
                              print("filter ..............$filter");
                              List<String> parts = filter!.split(',');
                              print("parts-----$parts");
                              filter1 = parts[0].trim();
                              print(
                                  "home page filtersss ..............$filter1");
                              String old_filter_where_ids = "0,";

                              String special_field2 =
                                  value.specialelements[0]["value"];
                              print(special_field2);
                              Provider.of<Controller>(context, listen: false)
                                  .getSubCategoryReportList(
                                      special_field2,
                                      filter1!,
                                      fromDate!,
                                      toDate!,
                                      old_filter_where_ids,
                                      "level1");
                              Provider.of<Controller>(context, listen: false)
                                  .setSpecialField("1");
                              // setState(() {
                              //   buttonClicked = true;
                              // });
                              Provider.of<Controller>(context, listen: false)
                                  .l1listForTable
                                  .clear();
                              Provider.of<Controller>(context, listen: false)
                                  .isSearch = false;
                              String homeTile =
                                  value.reportList[index].values.elementAt(1);
                              Future.delayed(Duration(milliseconds: 100), () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LevelOne(
                                      reportelements: reportelements,
                                      old_filter_where_ids:
                                          old_filter_where_ids,
                                      filter_id: filter1!,
                                      tilName: homeTile,
                                      filters: parts,
                                    ),
                                  ),
                                );
                              });
                            },
                            title: Column(
                              children: [
                                Text(
                                  value.reportList[index].values
                                      .elementAt(1)
                                      .toString(),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Text(
                                  value.reportList[index]['filter_names'],
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              );
            }
          })
        ]),
      ),
    );
  }
}
