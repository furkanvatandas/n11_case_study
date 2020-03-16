import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n11casestudy/data/models/product_detail.dart';
import 'package:n11casestudy/resources/app_colors.dart';
import 'package:n11casestudy/screens/product_detail/product_detail_bloc/bloc.dart';
import 'package:n11casestudy/screens/product_detail/product_detail_bloc/product_detail_bloc.dart';
import 'package:n11casestudy/utils/extensions/extensions.dart';
import 'package:n11casestudy/widgets/animated_loading.dart';

class ProductDetailScreen extends StatelessWidget {
  Widget _buildAppBar() {
    return AppBar(
      title: Text("Ürün Detayı"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.camera_alt),
          onPressed: () {},
        )
      ],
    );
  }

  Future _showEditDialog(BuildContext context, String text) async {
    TextEditingController _controller = TextEditingController(text: text);
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Düzenle'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(border: OutlineInputBorder()),
            onChanged: (val) => _controller.text = val,
          ),
          actions: <Widget>[
            FlatButton(child: Text('Kapat'), onPressed: () => Navigator.of(context).pop()),
            FlatButton(child: Text('Güncelle'), onPressed: () => Navigator.of(context).pop(_controller.text)),
          ],
        );
      },
    );
  }

  Future _showPickerDialog(BuildContext context, {int value: 0}) async {
    int newValue = 0;
    // İstenilen max değer
    int maxValue = 111;
    int selectedIndex = value > maxValue ? 0 : value;
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Seç'),
          content: Container(
            height: 400.setWidth(),
            child: CupertinoPicker(
              itemExtent: 40,
              backgroundColor: Colors.transparent,
              scrollController: FixedExtentScrollController(initialItem: selectedIndex),
              children: List.generate(
                maxValue,
                (int i) => Container(
                  alignment: Alignment.center,
                  child: Text("$i", style: TextStyle(fontSize: 20, color: AppColors.greyDark)),
                ),
              ),
              onSelectedItemChanged: (int index) => newValue = index,
            ),
          ),
          actions: <Widget>[
            FlatButton(child: Text('Kapat'), onPressed: () => Navigator.of(context).pop()),
            FlatButton(child: Text('Güncelle'), onPressed: () => Navigator.of(context).pop(newValue)),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildImageSliderContent(List<Images> images) {
      return Container(
        height: ScreenUtil.screenHeightDp * .3,
        color: AppColors.white,
        child: CarouselSlider(
          items: List.generate(
            images.length,
            (index) => CachedNetworkImage(
              imageUrl: images[index].path,
              fit: BoxFit.contain,
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
      );
    }

    Widget _buildProductInfoContent(ProductDetailLoaded state) {
      return Column(
        children: <Widget>[
          Card(child: ListTile(title: Text("Ürün Kodu"), subtitle: Text("${state.productId}"))),
          Card(child: ListTile(title: Text("Mağaza Kodu"), subtitle: Text("${state.productSellerCode}"))),
          Card(child: ListTile(title: Text("Kategori"), subtitle: Text("${state.productCategory}"))),
          Card(
            child: ListTile(
              title: Text("Ürün Başlığı"),
              subtitle: Text("${state.productTitle}"),
              trailing: IconButton(
                icon: Icon(Icons.edit, color: AppColors.red),
                onPressed: () async {
                  String updatedTitle = await _showEditDialog(context, state.productTitle);
                  if (updatedTitle != null) {
                    BlocProvider.of<ProductDetailBloc>(context).add(UpdateProductTitle(updatedTitle));
                  }
                },
              ),
            ),
          ),
          Card(child: ListTile(title: Text("Ürün Alt Başlığı"), subtitle: Text("${state.productSubTitle}"))),
          Row(
            children: <Widget>[
              Expanded(child: Card(child: ListTile(title: Text("Satış Durumu"), subtitle: Text("${state.productSalesStatus}")))),
              Expanded(child: Card(child: ListTile(title: Text("Ürün Onayı"), subtitle: Text("${state.productStatus}")))),
            ],
          ),
          Card(
            child: ListTile(
              title: Text("Stok"),
              subtitle: Text("${state.productStock}"),
              trailing: IconButton(
                icon: Icon(Icons.edit, color: AppColors.red),
                onPressed: () async {
                  int updatedStock = await _showPickerDialog(context, value: state.productStock);
                  if (updatedStock != null) {
                    BlocProvider.of<ProductDetailBloc>(context).add(UpdateProductStock(updatedStock));
                  }
                },
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(child: Card(child: ListTile(title: Text("Fiyat"), subtitle: Text("${state.productPrice}")))),
              Expanded(child: Card(child: ListTile(title: Text("İndirim"), subtitle: Text("${state.productDiscounted}")))),
            ],
          ),
        ],
      );
    }

    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          builder: (context, state) {
            if (state is ProductDetailInitial) {
              BlocProvider.of<ProductDetailBloc>(context).add(FetchProductDetail());
              return Container();
            }
            if (state is ProductDetailLoading) {
              return AnimatedLoading();
            }
            if (state is ProductDetailLoaded) {
              return ListView(
                children: <Widget>[
                  _buildImageSliderContent(state.productDetail.details.images),
                  _buildProductInfoContent(state),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
