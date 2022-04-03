import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/bloc/cart/cart_bloc.dart';
import 'package:sample_app/bloc/filter_product/filter_product_bloc.dart';
import 'package:sample_app/bloc/product/product_bloc.dart';
import 'package:sample_app/routes.dart' as router;
import 'package:sample_app/views/themes/themes.dart';

void main() {
  // runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<ProductBloc>(
            create: (context) => ProductBloc()..add(LoadProducts()),
          ),
          BlocProvider<CartBloc>(
            create: (context) => CartBloc()..add(const ListCartItems())),
          BlocProvider<FilterProductBloc>(
              create: (context) =>FilterProductBloc(productBloc: BlocProvider.of<ProductBloc>(context))),
        ],
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sample App',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: router.Router.generateRoute,
        initialRoute: router.ScreenRoutes.toHomePage,
        theme: appThemeData[AppTheme.lightAppTheme]
        // ThemeData(
        //   primarySwatch: AppColors.kPrimaryColor,
        //   fontFamily: 'SFProDisplay',
        //   visualDensity: VisualDensity.adaptivePlatformDensity,
        //   // canvasColor: Colors.transparent, textSelectionTheme: TextSelectionThemeData(selectionColor: AppColors.orange),
        // ),
        );
  }
}
