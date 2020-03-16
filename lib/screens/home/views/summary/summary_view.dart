import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n11casestudy/data/providers/product_provider.dart';
import 'package:n11casestudy/data/repositories/summary_repository.dart';
import 'package:n11casestudy/resources/app_colors.dart';
import 'package:n11casestudy/resources/app_text_styles.dart';
import 'package:n11casestudy/screens/home/home_bloc/bloc.dart';
import 'package:n11casestudy/screens/home/views/summary/summary_bloc/bloc.dart';
import 'package:n11casestudy/utils/extensions/extensions.dart';
import 'package:n11casestudy/widgets/animated_loading.dart';
import 'package:n11casestudy/widgets/info_container.dart';
import 'package:n11casestudy/widgets/vertical_bar_chart.dart';

class SummaryView extends StatelessWidget {
  Widget _buildHeader(String title, {String subTitle: ""}) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.all(16.setWidth()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("$title", style: AppTextStyles.xxLargeBold),
          Text("$subTitle", style: AppTextStyles.large),
        ],
      ),
    );
  }

  Widget _buildProductInfoContainer(String header, int count, {VoidCallback callback}) {
    return GestureDetector(
      child: Container(
        width: ScreenUtil.screenWidthDp * .5,
        child: InfoContainer(header: header, value: count),
      ),
      onTap: callback != null ? () => callback() : null,
    );
  }

  Widget _buildChart(List<VerticalBarChartModel> list) {
    return Container(
      width: ScreenUtil.screenWidthDp,
      height: ScreenUtil.screenHeightDp * .4,
      child: Card(color: AppColors.white, child: VerticalBarChart(list)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SummaryBloc(SummaryRepository(ProductProvider())),
      child: Container(
        child: BlocBuilder<SummaryBloc, SummaryState>(
          builder: (context, state) {
            if (state is SummaryInitial) {
              BlocProvider.of<SummaryBloc>(context).add(FetchSummary());
              return Container();
            }
            if (state is SummaryLoading) {
              return AnimatedLoading();
            }
            if (state is SummaryLoaded) {
              return ListView(
                children: <Widget>[
                  _buildHeader("Siparişler"),
                  _buildChart(state.orderList),
                  Wrap(
                    children: <Widget>[
                      _buildProductInfoContainer("Yeni Sipariş", state.theNewCount),
                      _buildProductInfoContainer("Kargoya Hazır", state.shippingCount),
                      _buildProductInfoContainer("Kargolanan", state.shippedCount),
                      _buildProductInfoContainer("Tamamlanan", state.acceptedCount),
                    ],
                  ),
                  _buildHeader("Ürünler", subTitle: "Toplam ${state.sumOfProduct} ürün bulunmaktadır"),
                  Wrap(
                    children: <Widget>[
                      _buildProductInfoContainer(
                        "Satışa Uygun",
                        state.onSaleCount,
                        callback: () => BlocProvider.of<HomeBloc>(context).add(SelectProduct(state.onSaleCount)),
                      ),
                      _buildProductInfoContainer(
                        "Beklemede",
                        state.suspendedCount,
                        callback: () => BlocProvider.of<HomeBloc>(context).add(SelectProduct(state.suspendedCount)),
                      ),
                      _buildProductInfoContainer(
                        "Stok 3 veya Altında",
                        state.stockAlarmCount,
                        callback: () => BlocProvider.of<HomeBloc>(context).add(SelectProduct(state.stockAlarmCount)),
                      ),
                      _buildProductInfoContainer(
                        "Stoku Tükenen",
                        state.outOfStockCount,
                        callback: () => BlocProvider.of<HomeBloc>(context).add(SelectProduct(state.outOfStockCount)),
                      ),
                    ],
                  ),
                ],
              );
            }
            if (state is SummaryError) {
              return Center(child: Text("${state.error}"));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
