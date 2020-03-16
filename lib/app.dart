import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:n11casestudy/data/providers/product_provider.dart';
import 'package:n11casestudy/data/repositories/product_detail_repository.dart';
import 'package:n11casestudy/screens/filter/filter_screen.dart';
import 'package:n11casestudy/screens/home/home_screen.dart';
import 'package:n11casestudy/screens/product_detail/product_detail_screen.dart';
import 'package:n11casestudy/screens/unknown/unknown_screen.dart';

import 'screens/filter/filter_bloc/filter_bloc.dart';
import 'screens/home/home_bloc/bloc.dart';
import 'screens/product_detail/product_detail_bloc/product_detail_bloc.dart';

const String homeScreen = '/';
const String filterScreen = '/filter';
const String productDetailScreen = '/productDetail';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: homeScreen,
      onGenerateRoute: (settings) => onGenerateRoute(settings),
    );
  }
}

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeScreen:
      return MaterialPageRoute(
        builder: (context) => BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
          child: HomeScreen(),
        ),
      );
      break;
    case productDetailScreen:
      return MaterialPageRoute(
        builder: (context) => BlocProvider<ProductDetailBloc>(
          create: (context) => ProductDetailBloc(ProductDetailRepository(ProductProvider())),
          child: ProductDetailScreen(),
        ),
      );
      break;
    case filterScreen:
      return MaterialPageRoute(
        builder: (context) => BlocProvider<FilterBloc>(
          create: (context) => FilterBloc(),
          child: FilterScreen(
            productCount: settings.arguments,
          ),
        ),
      );
      break;
    default:
      return MaterialPageRoute(builder: (context) => UnknownScreen());
  }
}
