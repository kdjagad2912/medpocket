import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medpocket/src/api/brand.dart';
import 'package:medpocket/src/components/layout/AppBar.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:medpocket/src/components/layout/brand/BrandList.dart';

class BrandSearch extends StatefulWidget {
  const BrandSearch({Key? key}) : super(key: key);

  @override
  State<BrandSearch> createState() => _BrandSearchState();
}

class _BrandSearchState extends State<BrandSearch> {
  final searchText = TextEditingController();
  late dynamic listData = [];
  late dynamic args = null;
  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        args = ModalRoute.of(context)?.settings.arguments;
      });
      debugPrint("args $args");
      if (args != null) {
        debugPrint("args1 $args");
        if (args['company']!=null) {
          brandSearchByCompany(args['company']['ID']).then((value) => {
                setState(() {
                  listData = value['data'];
                })
              });
        }
        if (args['generic']!=null) {
          brandSearchByGeneric(args['generic']['generic']).then((value) => {
            setState(() {
              listData = value['data'];
            })
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    getSearchBox() {
      if (args == null) {
        return Padding(
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
                brandSearch(query).then((value) => {
                      setState(() {
                        listData = value['data'];
                      })
                    })
              },
            ),
          ),
        );
      } else {
        return Container();
      }
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: (args == null) ? "Brand Search" :(args!=null && args['company']!=null)? args['company']['Name']:args['generic']['generic'],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SizedBox.expand(
          child: Column(
            children: [
              getSearchBox(),
              Expanded(
                child: BrandList(
                  listData: listData,
                ),
              )
              //
            ],
          ),
        ),
      ),
    );
  }
}
