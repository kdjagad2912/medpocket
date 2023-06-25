import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medpocket/src/components/layout/CircleWrapper.dart';
import 'package:medpocket/src/components/layout/DashboardTile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    List<Widget> dashboardLinks = [
      DashboardTile(
          icon: const Icon(
            Icons.branding_watermark,
            size: 60,
          ),
          label: "Brand Search",
          onClick: () {
            Navigator.pushNamed(context, '/brand-search');
          }),
      DashboardTile(
          icon: const Icon(
            Icons.home_filled,
            size: 60,
          ),
          label: "Company Search",
          onClick: () {
            Navigator.pushNamed(context, '/company-search');
          }),
      DashboardTile(
          icon: Icon(
            Icons.medical_information_outlined,
            size: 60,
          ),
          label: "Generic Search",
          onClick: () {
            Navigator.pushNamed(context, '/generic-search');
          }),
      DashboardTile(
          icon: Icon(
            Icons.home_repair_service,
            size: 60,
          ),
          label: "Company To Stockist",
          onClick: () {
            Navigator.pushNamed(context, '/company-stockiest');
          }),
      DashboardTile(
          icon: Icon(
            Icons.store,
            size: 60,
          ),
          label: "Stockist To Company",
    onClick: () {
    Navigator.pushNamed(context, '/stockiest-company');
    }),
      DashboardTile(
          icon: Icon(
            Icons.medical_information,
            size: 60,
          ),
          label: "Chemist & Druggist",
          onClick: () {}),
      DashboardTile(
          icon: Icon(
            Icons.add,
            size: 60,
          ),
          label: "Add Stockist",
          onClick: () {}),
      DashboardTile(
          icon: Icon(
            Icons.add_comment_outlined,
            size: 60,
          ),
          label: "Add Product",
          onClick: () {}),
      DashboardTile(
          icon: Icon(
            Icons.production_quantity_limits,
            size: 60,
          ),
          label: "My Orders",
          onClick: () {}),
      DashboardTile(
          icon: Icon(
            Icons.shopping_cart,
            size: 60,
          ),
          label: "My Cart",
          onClick: () {}),
    ];
    return GridView.count(
      padding: EdgeInsets.all(20),
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: dashboardLinks,
    );
  }
}
