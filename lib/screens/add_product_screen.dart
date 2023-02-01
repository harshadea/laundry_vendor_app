import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  /// Toggle value of out of stock of the new product
  bool _isOutOfStock = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context, titleWidget: const Text('Add product')),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top extra spaces
              AppGaps.hGap15,
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        /* <---- Product picture ----> */
                        const CircleAvatar(
                          backgroundColor: AppColors.lineShapeColor,
                          radius: 64,
                        ),
                        /* <---- Small camera circle icon button ----> */
                        Positioned(
                            bottom: 7,
                            right: -3,
                            child: IconButton(
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(
                                  minHeight: 34, minWidth: 34),
                              icon: Container(
                                height: 34,
                                width: 34,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primaryColor,
                                    border: Border.all(color: Colors.white)),
                                child: SvgPicture.asset(
                                  AppAssetImages.cameraSVGLogoSolid,
                                  height: 14,
                                  width: 14,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ],
                    ),
                    AppGaps.hGap18,
                    /* <---- Out of stock toggle button of the row ----> */
                    GestureDetector(
                      onTap: () =>
                          setState(() => _isOutOfStock = !_isOutOfStock),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Out of stock',
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(
                                    color: AppColors.bodyTextColor,
                                    fontWeight: FontWeight.w500),
                          ),
                          AppGaps.wGap8,
                          /* <---- Out of stock toggle button ----> */
                          FlutterSwitch(
                            value: _isOutOfStock,
                            width: 35,
                            height: 20,
                            toggleSize: 12,
                            activeColor: AppColors.primaryColor,
                            onToggle: (value) {
                              setState(() => _isOutOfStock = value);
                            },
                          ),
                        ],
                      ),
                    ),
                    AppGaps.hGap32,
                    CustomHorizontalDashedLineWidget(
                        color: AppColors.darkColor.withOpacity(0.1)),
                    AppGaps.hGap32,
                    Row(
                      children: [
                        Text('Item info',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(color: AppColors.primaryColor)),
                      ],
                    ),
                    AppGaps.hGap24,
                    /* <---- Product name ----> */
                    const CustomTextFormField(
                        labelText: 'Item title',
                        hintText: 'Item name here',
                        prefixIcon: AppGaps.emptyGap),
                    AppGaps.hGap24,
                    /* <---- Product category ----> */
                    CustomTextFormField(
                      isReadOnly: true,
                      labelText: 'Item category',
                      hintText: 'Choose category',
                      prefixIcon: AppGaps.emptyGap,
                      suffixIcon: PopupMenuButton<int>(
                          padding: const EdgeInsets.only(right: 5),
                          position: PopupMenuPosition.under,
                          child: CustomIconButtonWidget(
                            fixedSize: const Size(20, 20),
                            child: SvgPicture.asset(
                                AppAssetImages.arrowDownSVGLogoLine,
                                height: 12,
                                color: AppColors.primaryColor),
                          ),
                          itemBuilder: (context) => [
                                const PopupMenuItem<int>(
                                  value: 0,
                                  child: Text(
                                    'Headphone',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const PopupMenuItem<int>(
                                  value: 1,
                                  child: Text(
                                    'Camera',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const PopupMenuItem<int>(
                                  value: 2,
                                  child: Text(
                                    'Electronics',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ]),
                    ),
                    AppGaps.hGap24,
                    /* <---- Product price and stock ----> */
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Expanded(
                          child: CustomTextFormField(
                              labelText: 'Item price',
                              hintText: '0.00',
                              prefixIcon: Text('\$')),
                        ),
                        AppGaps.wGap16,
                        Expanded(
                          child: CustomTextFormField(
                              labelText: 'Stock',
                              hintText: '0',
                              prefixIcon: AppGaps.emptyGap),
                        ),
                      ],
                    ),
                    AppGaps.hGap24,
                    Row(
                      children: [
                        CustomTightTextButtonWidget(
                            onTap: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                    AppAssetImages.plusSVGLogoSolid,
                                    color: AppColors.primaryColor),
                                AppGaps.wGap4,
                                const Text('Add more options'),
                              ],
                            )),
                      ],
                    ),
                    // Bottom extra spaces
                    AppGaps.hGap30,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      /* <-------- Bottom bar --------> */
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
          child: CustomStretchedButtonWidget(
        onTap: () {},
        child: const Text('Add product'),
      )),
    );
  }
}
