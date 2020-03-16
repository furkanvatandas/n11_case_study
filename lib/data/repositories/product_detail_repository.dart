import 'package:n11casestudy/data/models/product_detail.dart';
import 'package:n11casestudy/data/providers/product_provider.dart';

class ProductDetailRepository {
  ProductProvider productProvider;

  ProductDetailRepository(this.productProvider);

  Future<ProductDetail> getProductDetail() async {
    return await productProvider.fetchProductDetail();
  }
}
