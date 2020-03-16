import 'package:n11casestudy/data/models/product.dart';
import 'package:n11casestudy/data/providers/product_provider.dart';

class ProductRepository {
  ProductProvider productProvider;

  ProductRepository(this.productProvider);

  Future<Product> getAllSummary() async {
    return await productProvider.fetchAllProduct();
  }
}
