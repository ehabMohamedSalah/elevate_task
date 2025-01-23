import 'package:cached_network_image/cached_network_image.dart';
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain_layer/entity/productEntity.dart';

class ProductWidget extends StatelessWidget {

  ProductEntity product;
  ProductWidget(this.product);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(style: BorderStyle.solid,width: 2,color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          CachedNetworkImage(
            width: double.infinity,
            height: 128.h,
            fit: BoxFit.cover,
            imageUrl: product.images?.first??"" ,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ],
      ),
    );
  }
}
