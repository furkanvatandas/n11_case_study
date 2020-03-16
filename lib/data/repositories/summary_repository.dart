import 'package:n11casestudy/data/models/summary.dart';
import 'package:n11casestudy/data/providers/product_provider.dart';

class SummaryRepository {
  ProductProvider productProvider;

  SummaryRepository(this.productProvider);

  Future<Summary> getAllSummary() async {
    return await productProvider.fetchAllSummary();
  }
}
