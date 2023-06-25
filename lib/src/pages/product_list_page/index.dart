import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medpocket/src/api/brand.dart';
import 'package:medpocket/src/api/product.dart';
import 'package:medpocket/src/components/layout/AppBar.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:medpocket/src/components/layout/brand/BrandList.dart';
import 'package:medpocket/src/components/layout/product/ProductList.dart';

class ProductListPage extends StatefulWidget {

  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final searchText = TextEditingController();
  late dynamic listData=[];
  late dynamic args;



  @override
  initState(){
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        args = ModalRoute.of(context)?.settings.arguments;
        productSearchByBrand(args['brand']).then((value) => {
          setState((){
            listData=value['data'];
          })
        });
      });

    });

  }
  @override
  Widget build(BuildContext context) {

    ThemeData themeData = Theme.of(context);


    return Scaffold(
      appBar: CustomAppBar(
        title: args['brand'],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SizedBox.expand(
          child: Column(
            children: [

              Expanded(
                child:ProductList(listData: listData,) ,
              )
              //
            ],
          ),
        ),
      ),
    );
  }
}
