import 'package:meta/meta.dart';

@immutable
abstract class HomeEvent {}

class TapBottomNavigationBar extends HomeEvent {
  final int tabIndex;

  TapBottomNavigationBar(this.tabIndex);
}

class SelectProduct extends HomeEvent {
  final int productCount;

  SelectProduct(this.productCount);
}
