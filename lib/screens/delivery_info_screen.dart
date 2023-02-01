import 'package:ecomikstoreapp/models/fake_data.dart';
import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeliveryInfoScreen extends StatelessWidget {
  const DeliveryInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context, titleWidget: const Text('Delivery info')),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
          child: CustomScrollView(
        slivers: [
          // Top extra spaces
          const SliverToBoxAdapter(child: AppGaps.hGap15),
          SliverToBoxAdapter(
              child: Text('Items',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: AppColors.primaryColor))),
          const SliverToBoxAdapter(child: AppGaps.hGap16),
          /* <---- Delivery product list ----> */
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              /// Single my order
              final myOrder = FakeData.myOrders[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CustomListTileWidget(
                    hasShadow: true,
                    paddingValue: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /* <---- Product image ----> */
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  image: myOrder.productImage,
                                  fit: BoxFit.cover)),
                        ),
                        AppGaps.wGap16,
                        /* <---- Order name and items number----> */
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                myOrder.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                              AppGaps.hGap5,
                              Text(
                                '2 items',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(color: AppColors.bodyTextColor),
                              ),
                            ],
                          ),
                        ),
                        AppGaps.wGap5,
                        /* <---- Price text ----> */
                        Text(
                          '\$${myOrder.price}',
                          style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )),
              );
            },
            childCount: FakeData.myOrders.length,
          )),
          const SliverToBoxAdapter(child: AppGaps.hGap24),
          const SliverToBoxAdapter(
              child:
                  Text('Notes', style: TextStyle(fontWeight: FontWeight.w500))),
          const SliverToBoxAdapter(child: AppGaps.hGap15),
          /* <---- Notes text field ----> */
          SliverToBoxAdapter(
              child: CustomTextFormField(
                  minLines: 1,
                  maxLines: 3,
                  hintText: 'Notes for user',
                  prefixIcon: SvgPicture.asset(AppAssetImages.editSVGLogoLine,
                      color: AppColors.bodyTextColor))),
          const SliverToBoxAdapter(child: AppGaps.hGap24),
          SliverToBoxAdapter(
              child: Text('Payment info',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: AppColors.primaryColor))),
          const SliverToBoxAdapter(child: AppGaps.hGap8),
          /* <---- Payment info box ----> */
          SliverToBoxAdapter(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(19, 15, 13, 17),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.all(AppComponents.defaultBorderRadius)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Sub total',
                              style: TextStyle(fontWeight: FontWeight.w500)),
                          Text(
                            '\$26.00',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      AppGaps.hGap16,
                      const CustomHorizontalDashedLineWidget(
                          color: AppColors.lineShapeColor),
                      AppGaps.hGap16,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Service fee',
                              style: TextStyle(fontWeight: FontWeight.w500)),
                          Text(
                            '\$26.00',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      AppGaps.hGap16,
                      const CustomHorizontalDashedLineWidget(
                          color: AppColors.lineShapeColor),
                      AppGaps.hGap16,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Amount to pay',
                              style: TextStyle(fontWeight: FontWeight.w500)),
                          Text(
                            '\$86.00',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      )
                    ],
                  ))),
          // Bottom extra spaces
          const SliverToBoxAdapter(child: AppGaps.hGap30),
        ],
      )),
      /* <-------- Bottom bar --------> */
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
          backgroundColor: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppGaps.hGap16,
              /* <---- Delivery man profile picture, name, designation row ----> */
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius: 24,
                      backgroundImage:
                          Image.asset(AppAssetImages.reviewer1Image).image),
                  AppGaps.wGap16,
                  /* <---- Delivery man name and designation column ----> */
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'George Anderson',
                          style: Theme.of(context).textTheme.button,
                        ),
                        AppGaps.hGap8,
                        const Text(
                          'Delivery partner assigned',
                          style: TextStyle(color: AppColors.bodyTextColor),
                        )
                      ],
                    ),
                  ),
                  /* <---- Delivery man call icon button ----> */
                  CustomIconButtonWidget(
                      onTap: () {},
                      child: SvgPicture.asset(
                          AppAssetImages.gpsUpArrowSVGLogoLine,
                          color: AppColors.primaryColor,
                          height: 24,
                          width: 24)),
                ],
              ),
              AppGaps.hGap24,
              CustomStretchedTextButtonWidget(
                  buttonText: 'Ready to deliver',
                  onTap: () {
                    // Go to delivery info map screen
                    Navigator.pushNamed(
                        context, AppPageNames.deliveryInfoMapScreen);
                  })
            ],
          )),
    );
  }
}
