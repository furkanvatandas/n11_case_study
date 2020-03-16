import 'package:flutter/material.dart';
import 'package:n11casestudy/resources/app_colors.dart';
import 'package:n11casestudy/resources/app_text_styles.dart';
import 'package:n11casestudy/utils/extensions/extensions.dart';

class InfoContainer extends StatelessWidget {
  final int value;
  final String header;

  const InfoContainer({Key key, this.header: "", this.value: 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.setWidth()),
            child: Text("$value", style: AppTextStyles.largeBold),
          ),
          SizedBox(height: 24.setWidth()),
          Container(
            color: AppColors.greyLight,
            padding: EdgeInsets.all(16.setWidth()),
            child: Text("$header", style: AppTextStyles.xxLarge),
          )
        ],
      ),
    );
  }
}
