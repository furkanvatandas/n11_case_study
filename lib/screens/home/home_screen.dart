import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:n11casestudy/resources/app_colors.dart';
import 'package:n11casestudy/screens/home/views/product/product_view.dart';
import 'package:n11casestudy/screens/home/views/summary/summary_view.dart';

import 'home_bloc/bloc.dart';

class HomeScreen extends StatelessWidget {
  final String appTitle = "N11 SO APP";
  final String firstTab = "Özet";
  final String secondTab = "Ürün";

  Widget _buildAppBar() {
    return AppBar(title: Text(appTitle));
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.insert_chart), title: Text(firstTab)),
        BottomNavigationBarItem(icon: Icon(Icons.image), title: Text(secondTab)),
      ],
      selectedItemColor: AppColors.red,
      currentIndex: BlocProvider.of<HomeBloc>(context).currentTabIndex,
      onTap: (index) => BlocProvider.of<HomeBloc>(context).add(TapBottomNavigationBar(index)),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, allowFontScaling: false);
    Intl.defaultLocale = 'tr_TR';
    initializeDateFormatting('tr_TR', null);
    return Scaffold(
      appBar: _buildAppBar(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is SummaryViewState) return SummaryView();
          if (state is ProductViewState) return ProductView();
          return Container();
        },
      ),
      bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => _buildBottomNavigationBar(context),
      ),
    );
  }
}
