import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medpocket/src/components/layout/company/CompanyCard.dart';
import 'package:medpocket/src/components/layout/generic/GenericCard.dart';

class GenericList extends StatefulWidget {
  final dynamic listData;
  const GenericList({Key? key, this.listData}) : super(key: key);

  @override
  State<GenericList> createState() => _GenericListState();
}

class _GenericListState extends State<GenericList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: widget.listData.length,
        addRepaintBoundaries: true,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return GenericCard(
            item: widget.listData[index],
          );
        });
  }
}
