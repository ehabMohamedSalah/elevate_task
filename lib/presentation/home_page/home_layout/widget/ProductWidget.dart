import 'package:cached_network_image/cached_network_image.dart';
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../domain_layer/entity/productEntity.dart';

class ProductWidget extends StatelessWidget {

  ProductEntity product;
  ProductWidget(this.product);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(style: BorderStyle.solid,width: 1.2,color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  width: double.infinity,
                  height: 128.h,
                  fit: BoxFit.cover,
                  imageUrl: product.images?.first??"" ,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                Positioned(
                    top: 8,
                    right: 8,
                    child: SvgPicture.asset("assets/images/like.svg",))     ,
              ],
            ),
            Text(product.title??"",maxLines: 1,style: TextStyle(fontWeight: FontWeight.w700),),
            Text(product.description??"",maxLines: 2,style: TextStyle(fontWeight:FontWeight.w400),),
          SizedBox(height: 10,),
          Row(
            children: [
              Text("EGP ${getPriceAfterSale().toStringAsFixed(2)}"),
              SizedBox(width: 10,),
              Text("EGP ${product.price}",style:  TextStyle(
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.blue,
                decorationThickness: 2,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                overflow: TextOverflow.clip,
            ),),

            ],
          )

          ],
        ),
      ),
    );
  }
  double getPriceAfterSale() {
    return product.price! *
        (1 - (product.discountPercentage! / 100));
  }
}
