import 'package:meta/meta.dart';

@immutable
abstract class HomeState {}

class SummaryViewState extends HomeState {}

class ProductViewState extends HomeState {
  final int productCount;

  ProductViewState({this.productCount});
}
