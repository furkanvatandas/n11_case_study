import 'package:meta/meta.dart';
import 'package:n11casestudy/data/models/product_detail.dart';

@immutable
abstract class ProductDetailState {}

class ProductDetailInitial extends ProductDetailState {}

class ProductDetailEmpty extends ProductDetailState {}

class ProductDetailLoading extends ProductDetailState {}

class ProductDetailLoaded extends ProductDetailState {
  final ProductDetail productDetail;

  ProductDetailLoaded({@required this.productDetail});

  List<Images> get productImages => productDetail.details.images;

  int get productId => productDetail.details.id;

  String get productSellerCode => productDetail.details.sellerCode;

  String get productCategory => productDetail.details.categoryTree.map((val) => val.name).join(" > ");

  String get productTitle => productDetail.details.title;

  String get productSubTitle => productDetail.details.subTitle;

  String get productSalesStatus => productDetail.details.saleStatus.label;

  String get productStatus => productDetail.details.productStatus.label;

  int get productStock => productDetail.details.stock;

  String get productPrice => productDetail.details.price.cardinal.toString() + productDetail.details.price.currency;

  String get productDiscounted => productDetail.details.discounted ? "Var" : "Yok";
}

class ProductDetailError extends ProductDetailState {
  final String error;

  ProductDetailError(this.error);
}
