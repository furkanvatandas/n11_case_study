import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

class BottomNavigationItemEnum {
  static const SUMMARY = 0;
  static const PRODUCT = 1;
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int currentTabIndex = BottomNavigationItemEnum.SUMMARY;

  @override
  HomeState get initialState => SummaryViewState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is TapBottomNavigationBar) {
      currentTabIndex = event.tabIndex;
      switch (currentTabIndex) {
        case BottomNavigationItemEnum.SUMMARY:
          yield (SummaryViewState());
          break;
        case BottomNavigationItemEnum.PRODUCT:
          yield (ProductViewState());
          break;
      }
    }
    if (event is SelectProduct) {
      currentTabIndex = BottomNavigationItemEnum.PRODUCT;
      yield (ProductViewState(productCount: event.productCount));
    }
  }
}
