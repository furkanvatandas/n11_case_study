import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:n11casestudy/data/models/product.dart';
import 'package:n11casestudy/data/repositories/product_repository.dart';

import './bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository productRepository;

  ProductBloc(this.productRepository) : assert(productRepository != null);

  @override
  ProductState get initialState => ProductInitial();

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is FetchProduct) {
      yield ProductLoading();
      try {
        Product product = await productRepository.getAllSummary();
        yield ProductLoaded(product: product);
      } catch (error) {
        yield ProductError(error.message);
      }
    }
  }
}
