import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medpocket/src/components/layout/company/CompanyCard.dart';
import 'package:medpocket/src/components/layout/company/CompanyStockiestCard.dart';
import 'package:medpocket/src/components/layout/company/StockiestCompanyCard.dart';

class CompanyList extends StatefulWidget {
  final dynamic listData;
  final bool stockiest;
  final String type;
  const CompanyList({Key? key, this.listData,this.stockiest=false,this.type="company"}) : super(key: key);

  @override
  State<CompanyList> createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: widget.listData.length,
        addRepaintBoundaries: true,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return !widget.stockiest ?CompanyCard(
            item: widget.listData[index],
          ):(widget.type=='company')? CompanyStockiestCard(
            item: widget.listData[index],
          ): StockiestCompanyCard(
            item: widget.listData[index],
          );
        });
  }
}
