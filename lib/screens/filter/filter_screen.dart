import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  final int productCount;

  const FilterScreen({Key key, this.productCount}) : super(key: key);

  Widget _buildAppBar() {
    return AppBar(
      title: Text("Filtrele"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        child: Center(
          child: Text(productCount != null ? "Ürün Sayısı: $productCount" : "Şu an işleminizi gerçekleştiremiyoruz."),
        ),
      ),
    );
  }
}
