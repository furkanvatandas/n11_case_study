///
/// https://javiercbk.github.io/json_to_dart/
///
class Product {
  String status;
  String statusCode;
  int code;
  int productCount;
  List<Products> products;

  Product({this.status, this.statusCode, this.code, this.productCount, this.products});

  Product.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    code = json['code'];
    productCount = json['productCount'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['code'] = this.code;
    data['productCount'] = this.productCount;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int id;
  String title;
  String sellerCode;
  ProductStatus productStatus;
  ProductStatus saleStatus;
  Image image;
  Price price;
  Price currencyAmount;
  bool usedInCampaign;

  Products(
      {this.id,
      this.title,
      this.sellerCode,
      this.productStatus,
      this.saleStatus,
      this.image,
      this.price,
      this.currencyAmount,
      this.usedInCampaign});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    sellerCode = json['sellerCode'];
    productStatus = json['productStatus'] != null ? new ProductStatus.fromJson(json['productStatus']) : null;
    saleStatus = json['saleStatus'] != null ? new ProductStatus.fromJson(json['saleStatus']) : null;
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    currencyAmount = json['currencyAmount'] != null ? new Price.fromJson(json['currencyAmount']) : null;
    usedInCampaign = json['usedInCampaign'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['sellerCode'] = this.sellerCode;
    if (this.productStatus != null) {
      data['productStatus'] = this.productStatus.toJson();
    }
    if (this.saleStatus != null) {
      data['saleStatus'] = this.saleStatus.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    if (this.price != null) {
      data['price'] = this.price.toJson();
    }
    if (this.currencyAmount != null) {
      data['currencyAmount'] = this.currencyAmount.toJson();
    }
    data['usedInCampaign'] = this.usedInCampaign;
    return data;
  }
}

class ProductStatus {
  String value;
  String label;

  ProductStatus({this.value, this.label});

  ProductStatus.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['label'] = this.label;
    return data;
  }
}

class Image {
  int id;
  String path;

  Image({this.id, this.path});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['path'] = this.path;
    return data;
  }
}

class Price {
  double cardinal;
  String currency;

  Price({this.cardinal, this.currency});

  Price.fromJson(Map<String, dynamic> json) {
    cardinal = json['cardinal'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardinal'] = this.cardinal;
    data['currency'] = this.currency;
    return data;
  }
}
