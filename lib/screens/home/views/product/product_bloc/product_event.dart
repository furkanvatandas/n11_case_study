import 'package:meta/meta.dart';

@immutable
abstract class ProductEvent {}

class FetchProduct extends ProductEvent {
  @override
  List<Object> get props => [];
}
