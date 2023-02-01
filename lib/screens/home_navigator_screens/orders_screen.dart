import 'package:ecomikstoreapp/models/fake_data.dart';
import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/my_orders_screen_widgets.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  /// New orders or past order tab selected toggle value
  bool _isPastOrderSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context,
          hasBackButton: false,
          titleWidget:
              Text(_isPastOrderSelected ? 'Past orders' : 'New orders')),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top extra spaces
            AppGaps.hGap10,
            /* <---- 'New orders' and 'Past orders' tab button ----> */
            Container(
              height: 82,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(22))),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /* <---- Product review tab button ----> */
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomTabToggleButtonWidget(
                          text: 'New orders',
                          isSelected: !_isPastOrderSelected,
                          onTap: () =>
                              setState(() => _isPastOrderSelected = false)),
                    ),
                  ),
                  AppGaps.wGap5,
                  /* <---- Product description tab button ----> */
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomTabToggleButtonWidget(
                          text: 'Past orders',
                          isSelected: _isPastOrderSelected,
                          onTap: () =>
                              setState(() => _isPastOrderSelected = true)),
                    ),
                  )
                ],
              ),
            ),
            /* <---- Order list ----> */
            Expanded(
                child: ListView.separated(
              padding: const EdgeInsets.only(top: 16, bottom: 30),
              separatorBuilder: (context, index) => AppGaps.hGap16,
              itemCount: 3,
              itemBuilder: (context, index) {
                /// Single order
                final myOrder = FakeData.myOrders[index];
                return CustomListTileWidget(
                    paddingValue: const EdgeInsets.all(16),
                    onTap: () {
                      // Tapping on it goes to order status screen
                      Navigator.pushNamed(
                          context, AppPageNames.deliveryInfoScreen);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  image: myOrder.productImage,
                                  fit: BoxFit.cover)),
                        ),
                        AppGaps.wGap16,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      myOrder.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  AppGaps.hGap5,
                                  Text(
                                    '\$${myOrder.price}',
                                    style: const TextStyle(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              AppGaps.hGap8,
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Expanded(
                                    child: Text(
                                      '30 Sep 2021, 11:59am',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  AppGaps.hGap5,
                                  Text(
                                    'Cash on delivery',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.bodyTextColor),
                                  ),
                                ],
                              ),
                              AppGaps.hGap8,
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Expanded(
                                    child: Text(
                                      'Order num: 20308',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Item 3',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      AppGaps.wGap36,
                                      OrderStatusWidget(
                                          orderStatus: myOrder.orderStatus),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ));
              },
            )),
          ],
        ),
      ),
    );
  }
}
