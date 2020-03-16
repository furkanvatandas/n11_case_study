import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:n11casestudy/resources/app_colors.dart';
import 'package:n11casestudy/utils/extensions/extensions.dart';

class ProductListItem extends StatelessWidget {
  final int productId;
  final String productTitle;
  final String productPrice;
  final String productImgPath;
  final String productStatus;
  final String productSellStatus;
  final String productSellerCode;
  final VoidCallback voidCallback;

  const ProductListItem({
    Key key,
    this.productId: 0,
    this.productTitle: "",
    this.productPrice: "",
    this.productImgPath: "",
    this.productStatus: "",
    this.productSellStatus: "",
    this.productSellerCode: "",
    this.voidCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              height: 300.setWidth(),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: CachedNetworkImage(
                        imageUrl: "$productImgPath",
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  VerticalDivider(width: 0),
                  Expanded(
                    flex: 7,
                    child: Container(
                      padding: EdgeInsets.all(16.setWidth()),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("$productSellerCode", style: TextStyle(color: AppColors.grey)),
                          Text("$productTitle", maxLines: 2, overflow: TextOverflow.ellipsis),
                          Text("$productPrice", style: TextStyle(color: AppColors.red)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(height: 0),
            Container(
              height: 100.setWidth(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.center,
                      color: AppColors.greyLight,
                      child: Text("$productId", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.greyDark)),
                    ),
                  ),
                  VerticalDivider(width: 0),
                  Expanded(
                    flex: 7,
                    child: Container(
                      padding: EdgeInsets.all(16.setWidth()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.check_circle_outline, color: AppColors.green, size: 64.setWidth()),
                              SizedBox(width: 8.setWidth()),
                              Text("$productStatus", style: TextStyle(color: AppColors.green)),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.check_circle_outline, color: AppColors.green, size: 64.setWidth()),
                              SizedBox(width: 8.setWidth()),
                              Text("$productSellStatus", style: TextStyle(color: AppColors.green)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
