import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:n11casestudy/data/models/product_detail.dart';
import 'package:n11casestudy/data/repositories/product_detail_repository.dart';

import './bloc.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductDetailRepository productDetailRepository;

  ProductDetailBloc(this.productDetailRepository) : assert(productDetailRepository != null);

  ProductDetail productDetail;

  @override
  ProductDetailState get initialState => ProductDetailInitial();

  @override
  Stream<ProductDetailState> mapEventToState(ProductDetailEvent event) async* {
    if (event is FetchProductDetail) {
      yield ProductDetailLoading();
      try {
        productDetail = await productDetailRepository.getProductDetail();
        yield ProductDetailLoaded(productDetail: productDetail);
      } catch (error) {
        yield ProductDetailError(error.message);
      }
    }
    if (event is UpdateProductTitle) {
      productDetail.details.title = event.productTitle;
      yield ProductDetailLoaded(productDetail: productDetail);
    }
    if (event is UpdateProductStock) {
      productDetail.details.stock = event.productStock;
      yield ProductDetailLoaded(productDetail: productDetail);
    }
  }
}
