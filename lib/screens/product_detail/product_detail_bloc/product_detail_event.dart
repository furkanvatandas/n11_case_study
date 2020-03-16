import 'package:meta/meta.dart';

@immutable
abstract class ProductDetailEvent {}

class FetchProductDetail extends ProductDetailEvent {}

class UpdateProductTitle extends ProductDetailEvent {
  final String productTitle;

  UpdateProductTitle(this.productTitle);
}

class UpdateProductStock extends ProductDetailEvent {
  final int productStock;

  UpdateProductStock(this.productStock);
}
