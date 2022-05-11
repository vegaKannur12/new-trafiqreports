import 'package:flutter/material.dart';

class PhotosList extends StatefulWidget {
  final List photos =[];

  // PhotosList({required Key key, required this.photos})
      // : assert(photos != null),
      //   super(key: key);

  @override
  _PhotosListState createState() => _PhotosListState();
}

class _PhotosListState extends State<PhotosList> {
  @override
  Widget build(BuildContext context) {
    return bodyData();
  }

  Widget bodyData() => DataTable(
      sortColumnIndex: 1,
      sortAscending: true,
      columns: <DataColumn>[
        DataColumn(
          label: Text("Company Name"),
          onSort: (_, __) {
            setState(() {
              widget.photos.sort((a, b) => a.data["quote"]["companyName"]
                  .compareTo(b.data["quote"]["companyName"]));
            });
          },
        ),
        DataColumn(
          label: Text("Dividend Yield"),
          onSort: (_, __) {
            setState(() {
              widget.photos.sort((a, b) => a.data["stats"]["dividendYield"]
                  .compareTo(b.data["stats"]["dividendYield"]));
            });
          },
        ),
        DataColumn(
          label: Text("IEX Bid Price"),
          onSort: (_, __) {
            setState(() {
              widget.photos.sort((a, b) => a.data["quote"]["iexBidPrice"]
                  .compareTo(b.data["quote"]["iexBidPrice"]));
            });
          },
        ),
        DataColumn(
          label: Text("Latest Price"),
          onSort: (_, __) {
            setState(() {
              widget.photos.sort((a, b) => a.data["stats"]["latestPrice"]
                  .compareTo(b.data["stats"]["latestPrice"]));
            });
          },
        ),
      ],
      rows: widget.photos
          .map(
            (photo) => DataRow(
              cells: [
                DataCell(
                  Text('${photo.data["quote"]["companyName"] ?? ""}'),
                ),
                DataCell(
                  Text("Dividend Yield:"
                      '${photo.data["stats"]["dividendYield"] ?? ""}'),
                ),
                DataCell(
                  Text("Last Price:"
                      '${photo.data["quote"]["iexBidPrice"] ?? ""}'),
                ),
                DataCell(
                  Text("Last Price:"
                      '${photo.data["stats"]["latestPrice"] ?? ""}'),
                ),
              ],
            ),
          )
          .toList());
}
