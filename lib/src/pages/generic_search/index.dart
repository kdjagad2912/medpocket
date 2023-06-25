import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medpocket/src/api/company.dart';
import 'package:medpocket/src/api/generic.dart';
import 'package:medpocket/src/components/layout/AppBar.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:medpocket/src/components/layout/company/CompanyList.dart';
import 'package:medpocket/src/components/layout/generic/GenericList.dart';

class GenericSearch extends StatefulWidget {

  const GenericSearch({Key? key}) : super(key: key);

  @override
  State<GenericSearch> createState() => _GenericSearchState();
}

class _GenericSearchState extends State<GenericSearch> {
  final searchText = TextEditingController();
  late dynamic listData=[];
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Generic Search",
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
                      genericSearch(query).then((value) => {
                        setState(() {
                          listData=value['data'];
                        })
                      })
                    },
                  ),
                ),
              ),
              Expanded(
                child:GenericList(listData: listData,) ,
              )
              //
            ],
          ),
        ),
      ),
    );
  }
}
