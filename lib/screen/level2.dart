import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:reports/components/customColor.dart';
import 'package:reports/components/customDatePicker.dart';
import 'package:reports/components/customappbar.dart';
import 'package:reports/components/datatableCompo.dart';
import 'package:reports/components/expandedTable.dart';
import 'package:reports/components/selectDate.dart';
import 'package:reports/components/shrinkedDatattable.dart';
import 'package:reports/controller/controller.dart';
import 'package:reports/copy/level1.dart';
import 'package:reports/screen/homePage.dart';
import 'package:reports/screen/level1.dart';
import 'package:reports/screen/level3.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LevelTwo extends StatefulWidget {
  String hometileName;
  String level1tileName;
  String old_filter_where_ids;
  String filter_id;
  String tile;
  List<String> filters;
  String reportelement;
  LevelTwo(
      {required this.reportelement,
      required this.hometileName,
      required this.level1tileName,
      required this.old_filter_where_ids,
      required this.filter_id,
      required this.tile,
      required this.filters});
  @override
  State<LevelTwo> createState() {
    return _LevelTwoState();
  }
}

class _LevelTwoState extends State<LevelTwo> {
  String? old_filter_where_ids;
  List<Map<String, dynamic>> tablejson = [];
  String? specialField;
  Widget? appBarTitle;
  DateTime currentDate = DateTime.now();
  bool qtyvisible = false;
  String? formattedDate;
  String? fromDate;
  String? toDate;
  String? crntDateFormat;
  Icon actionIcon = Icon(Icons.search);
  String selected = "";
  // List<bool> visible = [];
  // List<bool> isExpanded = [];
  late ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  List<String> listString = ["Main Heading", "level1", "level2"];
  List<String> listShrinkData = ["F1", "F2", "F3"];

  String searchkey = "";
  bool isSearch = false;
  bool datevisible = true;

  bool isSelected = true;
  bool buttonClicked = false;

  List<Map<String, dynamic>> shrinkedData = [];
  List<Map<String, dynamic>> jsonList = [];
  var encoded;
  var decodd;
  var encodedShrinkdata;
  var decoddShrinked;
  final jsondata = [
    {
      "rank": "0",
      "a": "TLN10_BillNo",
      "b": "TLN10_MRNo",
      "c": "TLN50_PatientName",
      "d": "CRY10_Amt",
      "e": "CRY10_Paid",
      "f": "CRY10_Bal",
      "g": "TLN10_Name",
    },
    {
      "rank": "1",
      "a": "G202204027",
      "b": "TJAA2",
      "c": "PRATHYEESH MAKRERI KANNUR",
      "d": "472.5",
      "e": "372.5",
      "f": "100",
      "g": "Anu",
    },
    {
      "rank": "1",
      "a": "G202204026",
      "b": "TJAA2",
      "c": "PRATHYEESH MAKRERI KANNUR",
      "d": "1697.5",
      "e": "1397.5",
      "f": "300",
      "g": "Graha",
    }
  ];
  SelectDate selectD = SelectDate();
  String? dateFromShared;
  String? datetoShared;
  String? titleName;
  getShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    decodd = prefs.getString("json");
  }

  setSharedPreftojsondata() async {
    //print("enterd into shared");
    encoded = json.encode(jsondata);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    // print("encoded---$encoded");
    prefs.setString("json", encoded);
    // print("added to shred prefs");
  }

  _onSelectItem(int index, String reportType) {
    _selectedIndex.value = index;
    Navigator.of(context).pop(); // close the drawer
  }

  createShrinkedData() {
    shrinkedData.clear();
    // print("cleared---$shrinkedData");
    shrinkedData.add(jsondata[0]);
    shrinkedData.add(jsondata[jsondata.length - 1]);
    // print("shrinked data --${shrinkedData}");
    encodedShrinkdata = json.encode(shrinkedData);
  }

  // toggle(int i) {
  //   setState(() {
  //     isExpanded[i] = !isExpanded[i];
  //     visible[i] = !visible[i];
  //   });
  // }

  setList() {
    jsonList.clear();
    jsondata.map((jsonField) {
      jsonList.add(jsonField);
    }).toList();
    //print("json list--${jsonList}");
  }

/////////////////////////////////////////////////////////////////
  @override
  void initState() {
    //print("jsondata----$jsondata");
    super.initState();
    dateFromShared = Provider.of<Controller>(context, listen: false).fromDate;
    datetoShared = Provider.of<Controller>(context, listen: false).todate;
    specialField = Provider.of<Controller>(context, listen: false).special;

    crntDateFormat = DateFormat('dd-MM-yyyy').format(currentDate);
    print(crntDateFormat);
    // Provider.of<Controller>(context, listen: false).getReportApi();

    // print("initstate");
    setSharedPreftojsondata();
    getShared();
    createShrinkedData();
    print("tile from level1---${widget.level1tileName}");
    titleName = widget.hometileName + ' ' + '/' + ' ' + widget.level1tileName;
    print("tileName---${titleName}");
    selected = Provider.of<Controller>(context, listen: false).special!;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    List<Widget> drawerOpts = [];
    String? specialList;
    String? newlist;
    String? type;
    String? type1;
    String? type2;
    /////////////////////////////////////////////////////////////////////
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(
        //   // leading: IconButton(
        //   //     icon: Icon(Icons.arrow_back, color: Colors.white),
        //   //     onPressed: () {
        //   //       Navigator.of(context).pop();
        //   //       Navigator.popUntil(
        //   //           context, ModalRoute.withName("productdetailspage"));
        //   //     }),
        //   title: appBarTitle,
        //   // appBarTitle,
        //   actions: [
        //     IconButton(
        //
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: ValueListenableBuilder(
              valueListenable: _selectedIndex,
              builder:
                  (BuildContext context, int selectedValue, Widget? child) {
                return CustomAppbar(
                  title: " ",
                  level: 'level2',
                );
              }),
        ),
        ///////////////////////////////////////////////////////////////////

        body: InteractiveViewer(
          child: Column(
            children: [
              // Text(widget._draweItems[_selectedIndex].title),
              buttonClicked
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ConstrainedBox(
                            constraints: new BoxConstraints(
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
                        type = widget.reportelement;
                        List<String> parts = type!.split(',');
                        print("type..............$type");
                        type1 = parts[0].trim(); // prefix: "date"
                        type2 = parts[1].trim(); // prefix: "date"
                      }
                      {
                        return Container(
                          color: Colors.yellow,
                          // height: size.height * 0.27,
                          child: Container(
                            height: size.height * 0.14,
                            color: P_Settings.dateviewColor,
                            child: Column(
                              children: [
                                Flexible(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Container(
                                          width: size.width * 0.1,
                                        ),
                                      ),
                                      type1 == "F"
                                          ? Row(
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      selectD.selectDate(
                                                          context,
                                                          "level1",
                                                          widget.filter_id,
                                                          widget
                                                              .old_filter_where_ids,
                                                          "to date");
                                                    },
                                                    icon: const Icon(
                                                        Icons.calendar_month)),
                                                selectD.fromDate == null
                                                    ? InkWell(
                                                        onTap: (() {
                                                          selectD.selectDate(
                                                              context,
                                                              "level1",
                                                              widget.filter_id,
                                                              widget
                                                                  .old_filter_where_ids,
                                                              "to date");
                                                        }),
                                                        child: Text(Provider.of<
                                                                    Controller>(
                                                                context,
                                                                listen: false)
                                                            .fromDate
                                                            .toString()))
                                                    : InkWell(
                                                        onTap: () {
                                                          selectD.selectDate(
                                                              context,
                                                              "level1",
                                                              widget.filter_id,
                                                              widget
                                                                  .old_filter_where_ids,
                                                              "from date");
                                                        },
                                                        child: Text(selectD
                                                            .fromDate
                                                            .toString()))
                                              ],
                                            )
                                          : Row(
                                              children: [],
                                            ),
                                      type2 == "T"
                                          ? Row(
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      selectD.selectDate(
                                                          context,
                                                          "level1",
                                                          widget.filter_id,
                                                          widget
                                                              .old_filter_where_ids,
                                                          "from date");
                                                    },
                                                    icon: const Icon(
                                                        Icons.calendar_month)),
                                                selectD.fromDate == null
                                                    ? InkWell(
                                                        onTap: (() {
                                                          selectD.selectDate(
                                                              context,
                                                              "level1",
                                                              widget.filter_id,
                                                              widget
                                                                  .old_filter_where_ids,
                                                              "to date");
                                                        }),
                                                        child: Text(Provider.of<
                                                                    Controller>(
                                                                context,
                                                                listen: false)
                                                            .todate
                                                            .toString()))
                                                    : InkWell(
                                                        onTap: () {
                                                          selectD.selectDate(
                                                              context,
                                                              "level1",
                                                              widget.filter_id,
                                                              widget
                                                                  .old_filter_where_ids,
                                                              "from date");
                                                        },
                                                        child: Text(
                                                          selectD.toDate
                                                              .toString(),
                                                        ),
                                                      ),
                                              ],
                                            )
                                          : Row(
                                              children: [],
                                            ),
                                      qtyvisible
                                          ? SizedBox(
                                              width: size.width * 0.2,
                                              child: IconButton(
                                                color: P_Settings.l2appbarColor,
                                                icon: const Icon(
                                                    Icons.arrow_upward,
                                                    color: Colors.deepPurple),
                                                onPressed: () {
                                                  setState(() {
                                                    qtyvisible = false;
                                                  });
                                                },
                                              ),
                                            )
                                          : SizedBox(
                                              width: size.width * 0.2,
                                              child: IconButton(
                                                icon: const Icon(
                                                    Icons.arrow_downward,
                                                    color: Colors.deepPurple),
                                                onPressed: () {
                                                  setState(() {
                                                    qtyvisible = true;
                                                  });
                                                },
                                              ),
                                            )
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: qtyvisible,
                                  child: Row(
                                    children: [
                                      Consumer<Controller>(
                                          builder: (context, value, child) {
                                        {
                                          return Flexible(
                                            child: Container(
                                              alignment: Alignment.topRight,
                                              // color: P_Settings.datatableColor,
                                              height: size.height * 0.07,
                                              width: size.width * 1,
                                              child: Row(
                                                children: [
                                                  ListView.builder(
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    physics:
                                                        const PageScrollPhysics(),
                                                    itemCount: value
                                                        .specialelements.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5.0),
                                                        child: SizedBox(
                                                          width:
                                                              size.width * 0.3,
                                                          // height: size.height*0.001,
                                                          child: ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              // shape: StadiumBorder(),

                                                              primary: selected ==
                                                                      value.specialelements[
                                                                              index]
                                                                          [
                                                                          "value"]
                                                                  ? P_Settings
                                                                      .l2appbarColor
                                                                  : P_Settings
                                                                      .l2datatablecolor,

                                                              shadowColor:
                                                                  P_Settings
                                                                      .color4,
                                                              minimumSize:
                                                                  Size(10, 20),
                                                              maximumSize:
                                                                  Size(10, 20),
                                                            ),
                                                            onPressed: () {
                                                              specialField =
                                                                  value.specialelements[
                                                                          index]
                                                                      ["value"];
                                                              selected =
                                                                  value.specialelements[
                                                                          index]
                                                                      ["value"];
                                                              fromDate = fromDate ==
                                                                      null
                                                                  ? dateFromShared
                                                                      .toString()
                                                                  : fromDate
                                                                      .toString();

                                                              toDate = toDate ==
                                                                      null
                                                                  ? datetoShared
                                                                      .toString()
                                                                  : toDate
                                                                      .toString();

                                                              Provider.of<Controller>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .setDate(
                                                                      fromDate!,
                                                                      toDate!);

                                                              Provider.of<Controller>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .getSubCategoryReportList(
                                                                      specialField!,
                                                                      widget
                                                                          .filter_id,
                                                                      fromDate!,
                                                                      toDate!,
                                                                      widget
                                                                          .old_filter_where_ids,
                                                                      "level2");
                                                            },
                                                            child: Text(
                                                              value.specialelements[
                                                                      index]
                                                                  ["label"],
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }
                                      })
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    }),
              // SizedBox(
              //   height: size.height * 0.005,
              // ),
              Container(
                color: P_Settings.dateviewColor,
                height: size.height * 0.05,
                child: Row(
                  children: [
                    Flexible(child: Text(titleName.toString())),
                  ],
                ),
              ),
              // Provider.of<Controller>(context, listen: false).isSearch &&
              //         Provider.of<Controller>(context, listen: false)
              //                 .l2newList
              //                 .length ==
              //             0
              //     ? Container(
              //         alignment: Alignment.center,
              //         height: size.height * 0.6,
              //         child: Text(
              //           "No data Found!!!",
              //           style: TextStyle(fontSize: 20),
              //         ),
              //       )
              //     :
              Consumer<Controller>(builder: (context, value, child) {
                {
                  print(value.level2reportList.length);

                  if (value.isLoading == true) {
                    return Container(
                      height: size.height * 0.6,
                      child: SpinKitPouringHourGlassRefined(
                          color: P_Settings.l2appbarColor),
                    );
                  }
                  if (value.isSearch && value.l2newList.length == 0) {
                    return Container(
                      alignment: Alignment.center,
                      height: size.height * 0.6,
                      child: const Text(
                        "No data Found!!!",
                        style: const TextStyle(fontSize: 20),
                      ),
                    );
                  }
                  if (value.isSearch && value.l2newList.length > 0) {
                    return Container(
                      // color: P_Settings.datatableColor,
                      height: size.height * 0.71,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: value.l2newList.length,
                          itemBuilder: (context, index) {
                            var jsonEncoded =
                                json.encode(value.l2newList[index]);
                            // Provider.of<Controller>(context, listen: false)
                            //     .datatableCreation(jsonEncoded, "level2","shrinked");
                            if (index < 0 || index >= value.l2newList.length) {
                              return const Offstage();
                            }
                            // print("map---${value.reportSubCategoryList[index]}");
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  Ink(
                                    decoration: BoxDecoration(
                                      color: P_Settings.l2datatablecolor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ListTile(
                                      onTap: () {
                                        specialField = specialField == null
                                            ? "1"
                                            : specialField.toString();
                                        fromDate = fromDate == null
                                            ? dateFromShared.toString()
                                            : fromDate.toString();

                                        toDate = toDate == null
                                            ? datetoShared.toString()
                                            : toDate.toString();

                                        Provider.of<Controller>(context,
                                                listen: false)
                                            .setDate(fromDate!, toDate!);

                                        String filter1 =
                                            widget.filters[2].trim();
                                        print(
                                            "filtersss ..............$filter1");
                                        String cat_id = value
                                            .l2newList[index].values
                                            .elementAt(0);
                                        String old_filter_where_ids =
                                            widget.old_filter_where_ids +
                                                cat_id +
                                                ",";
                                        print(
                                            "old_filter_where_ids--${old_filter_where_ids}");

                                        Provider.of<Controller>(context,
                                                listen: false)
                                            .setSpecialField(specialField!);
                                        Provider.of<Controller>(context,
                                                listen: false)
                                            .getSubCategoryReportList(
                                                specialField!,
                                                filter1,
                                                fromDate!,
                                                toDate!,
                                                old_filter_where_ids,
                                                "level3");
                                        Provider.of<Controller>(context,
                                                listen: false)
                                            .l3listForTable
                                            .clear();
                                        Provider.of<Controller>(context,
                                                listen: false)
                                            .isSearch = false;
                                        String tileName = value
                                            .l2newList[index].values
                                            .elementAt(1);
                                        Provider.of<Controller>(context,
                                                listen: false)
                                            .newListClear("level2");
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => LevelThree(
                                                reportelemet: widget.reportelement,
                                                    hometileName:
                                                        widget.hometileName,
                                                    level1tileName:
                                                        widget.level1tileName,
                                                    level2tileName: tileName,
                                                    old_filter_where_ids:
                                                        old_filter_where_ids,
                                                    filter_id: filter1,
                                                    filters: widget.filters,
                                                  )),
                                        );
                                      },
                                      title: Center(
                                        child: Text(
                                          value.l2newList[index].values
                                                      .elementAt(1) !=
                                                  null
                                              ? value.l2newList[index].values
                                                  .elementAt(1)
                                              : "",
                                          // style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                      // subtitle:
                                      //     Center(child: Text('/report page flow')),
                                      trailing: IconButton(
                                          icon: Provider.of<Controller>(context,
                                                      listen: false)
                                                  .l2isExpanded[index]
                                              ? Icon(
                                                  Icons.arrow_upward,
                                                  size: 18,
                                                )
                                              : Icon(
                                                  Icons.arrow_downward,
                                                  // actionIcon.icon,
                                                  size: 18,
                                                ),
                                          onPressed: () {
                                            print("hiasjajds");
                                            Provider.of<Controller>(context,
                                                    listen: false)
                                                .toggleExpansion(
                                                    index, "level2");
                                            Provider.of<Controller>(context,
                                                    listen: false)
                                                .toggleData(index, "level2");
                                            String cat_id = value
                                                .l2newList[index].values
                                                .elementAt(0);
                                            old_filter_where_ids =
                                                widget.old_filter_where_ids +
                                                    cat_id;

                                            specialField = specialField == null
                                                ? "1"
                                                : specialField.toString();
                                            fromDate = fromDate == null
                                                ? Provider.of<Controller>(
                                                        context,
                                                        listen: false)
                                                    .fromDate
                                                    .toString()
                                                : fromDate.toString();

                                            toDate = toDate == null
                                                ? Provider.of<Controller>(
                                                        context,
                                                        listen: false)
                                                    .todate
                                                    .toString()
                                                : toDate.toString();

                                            Provider.of<Controller>(context,
                                                        listen: false)
                                                    .l2isExpanded[index]
                                                ? Provider.of<Controller>(
                                                        context,
                                                        listen: false)
                                                    .getExpansionJson(
                                                        specialField!,
                                                        widget.filter_id,
                                                        fromDate!,
                                                        toDate!,
                                                        old_filter_where_ids!,
                                                        '',
                                                        "level2",
                                                        index)
                                                : null;
                                            tablejson = Provider.of<Controller>(
                                                    context,
                                                    listen: false)
                                                .expndmapTabledata;

                                            print("tablejson --${tablejson}");

                                            print(
                                                "tablejson length---${tablejson.length}");

                                            // toggle(index);
                                            // print("json-----${json}");
                                          }),
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.004),
                                  Provider.of<Controller>(context,
                                              listen: false)
                                          .l2isExpanded[index]
                                      ? Consumer<Controller>(
                                          builder: (context, value, child) {
                                            return Visibility(
                                                visible:
                                                    value.l2isExpanded[index],
                                                child: value.istabLoading
                                                    ? Container(
                                                        height: 40,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: P_Settings
                                                              .l2appbarColor,
                                                        ),
                                                      )
                                                    : ExpandedDatatable(
                                                        dedoded: index >= 0
                                                            ? value.l2listForTable[
                                                                index]
                                                            : null,
                                                        level: "level2",
                                                      )
                                                // : Container()
                                                );
                                          },
                                        )
                                      : Visibility(
                                          visible: Provider.of<Controller>(
                                                  context,
                                                  listen: false)
                                              .l2visible[index],
                                          // child:Text("haiii")

                                          child: ShrinkedDatatable(
                                            decodd: jsonEncoded,
                                            level: "level2",
                                          ),
                                        ),
                                ],
                              ),
                            );
                          }),
                    );
                  }
                  return Container(
                    // color: P_Settings.datatableColor,
                    height: size.height * 0.69,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.isSearch
                            ? value.l2newList.length
                            : value.level2reportList.length,
                        itemBuilder: (context, index) {
                          var jsonEncoded =
                              json.encode(value.level2reportList[index]);
                          // Provider.of<Controller>(context, listen: false)
                          //     .datatableCreation(jsonEncoded, "level2","shrinked");
                          if (index < 0 ||
                              index >= value.level2reportList.length) {
                            return const Offstage();
                          }
                          // print("map---${value.reportSubCategoryList[index]}");
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                Ink(
                                  decoration: BoxDecoration(
                                    color: P_Settings.l2datatablecolor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListTile(
                                    onTap: () {
                                      specialField = specialField == null
                                          ? "1"
                                          : specialField.toString();
                                      fromDate = fromDate == null
                                          ? dateFromShared.toString()
                                          : fromDate.toString();

                                      toDate = toDate == null
                                          ? datetoShared.toString()
                                          : toDate.toString();

                                      Provider.of<Controller>(context,
                                              listen: false)
                                          .setDate(fromDate!, toDate!);

                                      String filter1 = widget.filters[2].trim();
                                      print("filtersss ..............$filter1");
                                      String cat_id = value
                                          .level2reportList[index].values
                                          .elementAt(0);
                                      String old_filter_where_ids =
                                          widget.old_filter_where_ids +
                                              cat_id +
                                              ",";
                                      print(
                                          "old_filter_where_ids--${old_filter_where_ids}");

                                      Provider.of<Controller>(context,
                                              listen: false)
                                          .setSpecialField(specialField!);
                                      Provider.of<Controller>(context,
                                              listen: false)
                                          .getSubCategoryReportList(
                                              specialField!,
                                              filter1,
                                              fromDate!,
                                              toDate!,
                                              old_filter_where_ids,
                                              "level3");
                                      Provider.of<Controller>(context,
                                              listen: false)
                                          .l3listForTable
                                          .clear();
                                      Provider.of<Controller>(context,
                                              listen: false)
                                          .isSearch = false;
                                      String tileName = value.l2newList.length >
                                              0
                                          ? value.l2newList[index].values
                                              .elementAt(1)
                                          : value.level2reportList[index].values
                                              .elementAt(1);
                                      Provider.of<Controller>(context,
                                              listen: false)
                                          .newListClear("level2");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LevelThree(
                                              reportelemet: widget.reportelement,
                                                  hometileName:
                                                      widget.hometileName,
                                                  level1tileName:
                                                      widget.level1tileName,
                                                  level2tileName: tileName,
                                                  old_filter_where_ids:
                                                      old_filter_where_ids,
                                                  filter_id: filter1,
                                                  filters: widget.filters,
                                                )),
                                      );
                                    },
                                    title: Center(
                                      child: Text(
                                        value.isSearch
                                            ? value.l2newList[index].values
                                                .elementAt(1)
                                            : value.level2reportList[index]
                                                        .values
                                                        .elementAt(1) !=
                                                    null
                                                ? value.level2reportList[index]
                                                    .values
                                                    .elementAt(1)
                                                : "",
                                        // style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    // subtitle:
                                    //     Center(child: Text('/report page flow')),
                                    trailing: IconButton(
                                        icon: Provider.of<Controller>(context,
                                                    listen: false)
                                                .l2isExpanded[index]
                                            ? Icon(
                                                Icons.arrow_upward,
                                                size: 18,
                                              )
                                            : Icon(
                                                Icons.arrow_downward,
                                                // actionIcon.icon,
                                                size: 18,
                                              ),
                                        onPressed: () {
                                          print("hiasjajds");
                                          Provider.of<Controller>(context,
                                                  listen: false)
                                              .toggleExpansion(index, "level2");
                                          Provider.of<Controller>(context,
                                                  listen: false)
                                              .toggleData(index, "level2");
                                          String cat_id = value
                                              .level2reportList[index].values
                                              .elementAt(0);
                                          old_filter_where_ids =
                                              widget.old_filter_where_ids +
                                                  cat_id;

                                          specialField = specialField == null
                                              ? "1"
                                              : specialField.toString();
                                          fromDate = fromDate == null
                                              ? Provider.of<Controller>(context,
                                                      listen: false)
                                                  .fromDate
                                                  .toString()
                                              : fromDate.toString();

                                          toDate = toDate == null
                                              ? Provider.of<Controller>(context,
                                                      listen: false)
                                                  .todate
                                                  .toString()
                                              : toDate.toString();

                                          Provider.of<Controller>(context,
                                                      listen: false)
                                                  .l2isExpanded[index]
                                              ? Provider.of<Controller>(context,
                                                      listen: false)
                                                  .getExpansionJson(
                                                      specialField!,
                                                      widget.filter_id,
                                                      fromDate!,
                                                      toDate!,
                                                      old_filter_where_ids!,
                                                      '',
                                                      "level2",
                                                      index)
                                              : null;
                                          tablejson = Provider.of<Controller>(
                                                  context,
                                                  listen: false)
                                              .expndmapTabledata;

                                          print("tablejson --${tablejson}");

                                          print(
                                              "tablejson length---${tablejson.length}");

                                          // toggle(index);
                                          // print("json-----${json}");
                                        }),
                                  ),
                                ),
                                SizedBox(height: size.height * 0.004),
                                Provider.of<Controller>(context, listen: false)
                                        .l2isExpanded[index]
                                    ? Consumer<Controller>(
                                        builder: (context, value, child) {
                                          return Visibility(
                                              visible:
                                                  value.l2isExpanded[index],
                                              child: value.istabLoading
                                                  ? Container(
                                                      height: 40,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: P_Settings
                                                            .l2appbarColor,
                                                      ),
                                                    )
                                                  : ExpandedDatatable(
                                                      dedoded: index >= 0
                                                          ? value.l2listForTable[
                                                              index]
                                                          : null,
                                                      level: "level2",
                                                    )
                                              // : Container()
                                              );
                                        },
                                      )
                                    : Visibility(
                                        visible: Provider.of<Controller>(
                                                context,
                                                listen: false)
                                            .l2visible[index],
                                        // child:Text("haiii")

                                        child: ShrinkedDatatable(
                                          decodd: jsonEncoded,
                                          level: "level2",
                                        ),
                                      ),
                              ],
                            ),
                          );
                        }),
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}

// ///////////////////////alert box for button click //////////////////////////////////////
