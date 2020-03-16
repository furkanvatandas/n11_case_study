///
/// https://javiercbk.github.io/json_to_dart/
///
class ProductDetail {
  String status;
  String statusCode;
  int code;
  Details details;

  ProductDetail({this.status, this.statusCode, this.code, this.details});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    code = json['code'];
    details = json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['code'] = this.code;
    if (this.details != null) {
      data['details'] = this.details.toJson();
    }
    return data;
  }
}

class Details {
  List<Images> images;
  int id;
  String sellerCode;
  List<CategoryTree> categoryTree;
  String title;
  String subTitle;
  SaleStatus saleStatus;
  SaleStatus productStatus;
  int stock;
  List<Skus> skus;
  String skuDefinitions;
  Price price;
  Price currencyAmount;
  bool onSale;
  bool discounted;
  bool hasIsbn;

  Details(
      {this.images,
      this.id,
      this.sellerCode,
      this.categoryTree,
      this.title,
      this.subTitle,
      this.saleStatus,
      this.productStatus,
      this.stock,
      this.skus,
      this.skuDefinitions,
      this.price,
      this.currencyAmount,
      this.onSale,
      this.discounted,
      this.hasIsbn});

  Details.fromJson(Map<String, dynamic> json) {
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    id = json['id'];
    sellerCode = json['sellerCode'];
    if (json['categoryTree'] != null) {
      categoryTree = new List<CategoryTree>();
      json['categoryTree'].forEach((v) {
        categoryTree.add(new CategoryTree.fromJson(v));
      });
    }
    title = json['title'];
    subTitle = json['subTitle'];
    saleStatus = json['saleStatus'] != null ? new SaleStatus.fromJson(json['saleStatus']) : null;
    productStatus = json['productStatus'] != null ? new SaleStatus.fromJson(json['productStatus']) : null;
    stock = json['stock'];
    if (json['skus'] != null) {
      skus = new List<Skus>();
      json['skus'].forEach((v) {
        skus.add(new Skus.fromJson(v));
      });
    }
    skuDefinitions = json['skuDefinitions'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    currencyAmount = json['currencyAmount'] != null ? new Price.fromJson(json['currencyAmount']) : null;
    onSale = json['onSale'];
    discounted = json['discounted'];
    hasIsbn = json['hasIsbn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['sellerCode'] = this.sellerCode;
    if (this.categoryTree != null) {
      data['categoryTree'] = this.categoryTree.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    data['subTitle'] = this.subTitle;
    if (this.saleStatus != null) {
      data['saleStatus'] = this.saleStatus.toJson();
    }
    if (this.productStatus != null) {
      data['productStatus'] = this.productStatus.toJson();
    }
    data['stock'] = this.stock;
    if (this.skus != null) {
      data['skus'] = this.skus.map((v) => v.toJson()).toList();
    }
    data['skuDefinitions'] = this.skuDefinitions;
    if (this.price != null) {
      data['price'] = this.price.toJson();
    }
    if (this.currencyAmount != null) {
      data['currencyAmount'] = this.currencyAmount.toJson();
    }
    data['onSale'] = this.onSale;
    data['discounted'] = this.discounted;
    data['hasIsbn'] = this.hasIsbn;
    return data;
  }
}

class Images {
  int id;
  String path;

  Images({this.id, this.path});

  Images.fromJson(Map<String, dynamic> json) {
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

class CategoryTree {
  int id;
  String name;

  CategoryTree({this.id, this.name});

  CategoryTree.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class SaleStatus {
  String value;
  String label;

  SaleStatus({this.value, this.label});

  SaleStatus.fromJson(Map<String, dynamic> json) {
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

class Skus {
  int id;
  int stock;
  String attributesNames;
  String title;
  Price price;

  Skus({this.id, this.stock, this.attributesNames, this.title, this.price});

  Skus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stock = json['stock'];
    attributesNames = json['attributesNames'];
    title = json['title'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stock'] = this.stock;
    data['attributesNames'] = this.attributesNames;
    data['title'] = this.title;
    if (this.price != null) {
      data['price'] = this.price.toJson();
    }
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
