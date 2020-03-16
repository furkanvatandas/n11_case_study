import 'package:meta/meta.dart';
import 'package:n11casestudy/data/models/summary.dart';
import 'package:n11casestudy/widgets/vertical_bar_chart.dart';

abstract class SummaryState {
  const SummaryState();
}

class SummaryInitial extends SummaryState {}

class SummaryEmpty extends SummaryState {}

class SummaryLoading extends SummaryState {}

class SummaryLoaded extends SummaryState {
  final Summary summary;

  SummaryLoaded({@required this.summary});

  int get theNewCount => summary.dashboard.orderCounts.theNewCount;

  int get shippingCount => summary.dashboard.orderCounts.shippingCount;

  int get shippedCount => summary.dashboard.orderCounts.shippedCount;

  int get acceptedCount => summary.dashboard.orderCounts.acceptedCount;

  int get onSaleCount => summary.dashboard.productCounts.onSaleCount;

  int get suspendedCount => summary.dashboard.productCounts.suspendedCount;

  int get stockAlarmCount => summary.dashboard.productCounts.stockAlarmCount;

  int get outOfStockCount => summary.dashboard.productCounts.outOfStockCount;

  int get sumOfProduct => onSaleCount + suspendedCount + stockAlarmCount + outOfStockCount;

  List<VerticalBarChartModel> get orderList =>
      summary.salesReport.map((SalesReport val) => VerticalBarChartModel(val.matchDate, val.sales)).toList();
}

class SummaryError extends SummaryState {
  final String error;

  SummaryError(this.error);
}
