import 'package:n11casestudy/data/models/product.dart';
import 'package:n11casestudy/data/models/product_detail.dart';
import 'package:n11casestudy/data/models/summary.dart';
import 'package:n11casestudy/utils/api_call_handler.dart';

class ProductProvider {
  String baseUrl = "https://mfvn1.free.beeceptor.com";

  String summaryController = "/summary";
  String productController = "/product";
  String productDetailController = "/productDetail";

  Future<Summary> fetchAllSummary() async {
    String url = baseUrl + summaryController;
    Map<String, dynamic> responseMap = await ApiCallHandler().get(url);
    Summary summary = Summary.fromJson(responseMap);
    return summary;
  }

  Future<Product> fetchAllProduct() async {
    String url = baseUrl + productController;
    Map<String, dynamic> responseMap = await ApiCallHandler().get(url);
    Product product = Product.fromJson(responseMap);
    return product;
  }

  Future<ProductDetail> fetchProductDetail() async {
    String url = baseUrl + productDetailController;
    Map<String, dynamic> responseMap = await ApiCallHandler().get(url);
    ProductDetail productDetail = ProductDetail.fromJson(responseMap);
    return productDetail;
  }
}
