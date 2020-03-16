///
/// https://javiercbk.github.io/json_to_dart/
///

class Summary {
  String status;
  String statusCode;
  int code;
  Dashboard dashboard;
  List<SalesReport> salesReport;

  Summary({this.status, this.statusCode, this.code, this.dashboard, this.salesReport});

  Summary.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    code = json['code'];
    dashboard = json['dashboard'] != null ? Dashboard.fromJson(json['dashboard']) : null;
    if (json['salesReport'] != null) {
      salesReport = List<SalesReport>();
      json['salesReport'].forEach((v) {
        salesReport.add(SalesReport.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['code'] = this.code;
    if (this.dashboard != null) {
      data['dashboard'] = this.dashboard.toJson();
    }
    if (this.salesReport != null) {
      data['salesReport'] = this.salesReport.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dashboard {
  OrderCounts orderCounts;
  ProductCounts productCounts;

  Dashboard({this.orderCounts, this.productCounts});

  Dashboard.fromJson(Map<String, dynamic> json) {
    orderCounts = json['orderCounts'] != null ? new OrderCounts.fromJson(json['orderCounts']) : null;
    productCounts = json['productCounts'] != null ? new ProductCounts.fromJson(json['productCounts']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderCounts != null) {
      data['orderCounts'] = this.orderCounts.toJson();
    }
    if (this.productCounts != null) {
      data['productCounts'] = this.productCounts.toJson();
    }
    return data;
  }
}

class OrderCounts {
  int acceptedCount;
  int theNewCount;
  int shippingCount;
  int shippedCount;

  OrderCounts({this.acceptedCount, this.theNewCount, this.shippingCount, this.shippedCount});

  OrderCounts.fromJson(Map<String, dynamic> json) {
    acceptedCount = json['acceptedCount'];
    theNewCount = json['theNewCount'];
    shippingCount = json['shippingCount'];
    shippedCount = json['shippedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['acceptedCount'] = this.acceptedCount;
    data['theNewCount'] = this.theNewCount;
    data['shippingCount'] = this.shippingCount;
    data['shippedCount'] = this.shippedCount;
    return data;
  }
}

class ProductCounts {
  int totalCount;
  int onSaleCount;
  int suspendedCount;
  int stockAlarmCount;
  int dueAlarmCount;
  int outOfStockCount;

  ProductCounts(
      {this.totalCount, this.onSaleCount, this.suspendedCount, this.stockAlarmCount, this.dueAlarmCount, this.outOfStockCount});

  ProductCounts.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    onSaleCount = json['onSaleCount'];
    suspendedCount = json['suspendedCount'];
    stockAlarmCount = json['stockAlarmCount'];
    dueAlarmCount = json['dueAlarmCount'];
    outOfStockCount = json['outOfStockCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    data['onSaleCount'] = this.onSaleCount;
    data['suspendedCount'] = this.suspendedCount;
    data['stockAlarmCount'] = this.stockAlarmCount;
    data['dueAlarmCount'] = this.dueAlarmCount;
    data['outOfStockCount'] = this.outOfStockCount;
    return data;
  }
}

class SalesReport {
  DateTime salesDate;
  double sales;
  DateTime matchDate;

  SalesReport({this.salesDate, this.sales, this.matchDate});

  SalesReport.fromJson(Map<String, dynamic> json) {
    salesDate = json['salesDate'] == null ? null : DateTime.parse(json['salesDate']);
    sales = json['sales'].toDouble();
    matchDate = json['matchDate'] == null ? null : DateTime.parse(json['matchDate']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['salesDate'] = this.salesDate;
    data['sales'] = this.sales;
    data['matchDate'] = this.matchDate;
    return data;
  }
}
