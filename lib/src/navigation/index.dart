import 'package:context_holder/context_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medpocket/src/app_state/AppState.dart';
import 'package:medpocket/src/pages/app_init/index.dart';
import 'package:medpocket/src/pages/auth/signin/index.dart';
import 'package:medpocket/src/pages/auth/verify/index.dart';
import 'package:medpocket/src/navigation/bottom_navigation/index.dart';
import 'package:medpocket/src/pages/brand_search/index.dart';
import 'package:medpocket/src/pages/company_search/index.dart';
import 'package:medpocket/src/pages/company_stockiest/index.dart';
import 'package:medpocket/src/pages/generic_search/index.dart';
import 'package:medpocket/src/pages/product_list_page/index.dart';
import 'package:medpocket/src/pages/stockiest_company/index.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../reducers/AppReducer.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [thunkMiddleware],
  );


  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        navigatorKey: ContextHolder.key,
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
          primaryColorDark: Colors.greenAccent,
          // primaryColor: Colors.deepOrangeAccent,
          // primaryColorDark: Colors.orangeAccent,

          // textTheme: TextTheme(
          //     bodySmall: GoogleFonts.oswald(
          //       color:Colors.re
          //     )
          // )
        ),
        initialRoute: '/',

        routes: {
          '/': (context) => const AppInit(),
          '/signin': (context) => const Signin(),
          '/verify': (context) => const VerifyOtp(),
          '/home': (context) => const BottomNavigation(),
          '/brand-search': (context) => const BrandSearch(),
          '/company-search': (context) => const CompanySearch(),
          '/generic-search': (context) => const GenericSearch(),
          '/company-stockiest': (context) => const CompanyStockiest(),
          '/stockiest-company': (context) => const StockiestCompany(),
          '/product': (context) => const ProductListPage(),
        },
      ),
    );
  }
}
