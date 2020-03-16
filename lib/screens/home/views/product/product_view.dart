import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:n11casestudy/app.dart';
import 'package:n11casestudy/data/providers/product_provider.dart';
import 'package:n11casestudy/data/repositories/product_repository.dart';
import 'package:n11casestudy/resources/app_colors.dart';
import 'package:n11casestudy/screens/home/home_bloc/bloc.dart';
import 'package:n11casestudy/screens/home/views/product/product_bloc/bloc.dart';
import 'package:n11casestudy/screens/home/views/product/product_bloc/product_bloc.dart';
import 'package:n11casestudy/utils/extensions/extensions.dart';
import 'package:n11casestudy/widgets/animated_loading.dart';
import 'package:n11casestudy/widgets/product_list_item.dart';

class ProductView extends StatelessWidget {
  Widget _buildProductInfoContainer(int productCount) {
    return Container(
      color: AppColors.greyLight,
      alignment: Alignment.center,
      padding: EdgeInsets.all(16.setWidth()),
      child: Text(
        "Toplamda $productCount ürününüz bulunmaktadır.",
        maxLines: 2,
        overflow: TextOverflow.clip,
        style: TextStyle(color: AppColors.greyDark),
      ),
    );
  }

  Widget _buildFilterButton(BuildContext context) {
    return FlatButton(
      color: AppColors.white,
      child: Text("Filtrele", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0.setWidth()),
        side: BorderSide(color: AppColors.red),
      ),
      onPressed: () => Navigator.pushNamed(
        context,
        filterScreen,
        arguments: (BlocProvider.of<HomeBloc>(context).state as ProductViewState).productCount,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(ProductRepository(ProductProvider())),
      child: Container(
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductInitial) {
              BlocProvider.of<ProductBloc>(context).add(FetchProduct());
              return Container();
            }
            if (state is ProductLoading) {
              return Center(child: AnimatedLoading());
            }
            if (state is ProductLoaded) {
              return Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16.setWidth()),
                    height: 160.setHeight(),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(flex: 7, child: _buildProductInfoContainer(state.productCount)),
                        SizedBox(width: 8.setWidth()),
                        Expanded(flex: 3, child: _buildFilterButton(context)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.product.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductListItem(
                          productId: state.productId(index),
                          productSellerCode: state.productSellerCode(index),
                          productTitle: state.productTitle(index),
                          productPrice: state.productPrice(index),
                          productImgPath: state.productImgPath(index),
                          productStatus: state.productStatus(index),
                          productSellStatus: state.productSaleStatus(index),
                          voidCallback: () => Navigator.pushNamed(context, productDetailScreen),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            if (state is ProductError) {
              return Center(child: Text("${state.error}"));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
