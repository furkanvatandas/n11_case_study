import 'package:meta/meta.dart';
import 'package:n11casestudy/data/models/product.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductEmpty extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final Product product;

  ProductLoaded({@required this.product});

  int productId(index) => product.products[index].id;

  int get productCount => product.productCount;

  String productTitle(index) => product.products[index].title;

  String productImgPath(index) => product.products[index].image.path;

  String productSellerCode(index) => product.products[index].sellerCode;

  String productStatus(index) => product.products[index].productStatus.label;

  String productSaleStatus(index) => product.products[index].saleStatus.label;

  String productPrice(index) => product.products[index].price.cardinal.toString() + product.products[index].price.currency;

  @override
  List<Object> get props => [product];
}

class ProductError extends ProductState {
  final String error;

  ProductError(this.error);
}
