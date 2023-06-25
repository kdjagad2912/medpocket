import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medpocket/src/api/company.dart';
import 'package:medpocket/src/components/layout/AppBar.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:medpocket/src/components/layout/company/CompanyList.dart';

class CompanySearch extends StatefulWidget {

  const CompanySearch({Key? key}) : super(key: key);

  @override
  State<CompanySearch> createState() => _CompanySearchState();
}

class _CompanySearchState extends State<CompanySearch> {
  final searchText = TextEditingController();
  late dynamic listData=[];
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Company Search",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SizedBox.expand(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      border: GradientBoxBorder(
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                            stops: const [
                              0,
                              0.5
                            ],
                            colors: [
                              themeData.primaryColor,
                              themeData.primaryColorDark
                            ]),
                        width: 1,
                      )),
                  child: CupertinoSearchTextField(
                    autofocus: true,
                    autocorrect: true,
                    controller: searchText,
                    backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.all(20),
                    onChanged: (query) => {
                      debugPrint("query $query"),
                      companySearch(query).then((value) => {
                        setState(() {
                          listData=value['data'];
                        })
                      })
                    },
                  ),
                ),
              ),
              Expanded(
                child:CompanyList(listData: listData,) ,
              )
              //
            ],
          ),
        ),
      ),
    );
  }
}
