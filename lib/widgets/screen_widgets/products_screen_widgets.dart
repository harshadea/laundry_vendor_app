import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ProductListTileWithOutOfStock extends StatelessWidget {
  const ProductListTileWithOutOfStock({
    Key? key,
    required this.isOutOfStock,
    required this.productImage,
    required this.productName,
    required this.productItemNumber,
    this.outOfStockGestureOnTap,
    required this.outOfStockToggleOnTap,
    this.onTap,
  }) : super(key: key);

  final bool isOutOfStock;
  final ImageProvider<Object> productImage;
  final String productName;
  final int productItemNumber;
  final void Function()? onTap;
  final void Function()? outOfStockGestureOnTap;
  final void Function(bool) outOfStockToggleOnTap;

  @override
  Widget build(BuildContext context) {
    return CustomListTileWidget(
        onTap: onTap,
        hasShadow: true,
        darkerShadow: isOutOfStock,
        paddingValue: const EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image:
                      DecorationImage(image: productImage, fit: BoxFit.cover)),
            ),
            AppGaps.wGap16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  AppGaps.hGap8,
                  Text(
                    '$productItemNumber items',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  AppGaps.hGap8,
                  GestureDetector(
                    onTap: outOfStockGestureOnTap,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Out of stock',
                          style: Theme.of(context).textTheme.caption?.copyWith(
                              color: AppColors.bodyTextColor,
                              fontWeight: FontWeight.w500),
                        ),
                        AppGaps.wGap8,
                        /* <---- Remember me toggle button ----> */
                        FlutterSwitch(
                          value: isOutOfStock,
                          width: 35,
                          height: 20,
                          toggleSize: 12,
                          activeColor: AppColors.primaryColor,
                          onToggle: outOfStockToggleOnTap,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
