import 'package:ecomikstoreapp/models/fake_data.dart';
import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/products_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  /// toggle value of show search
  bool _showSearch = false;

  /// Currently selected tab index
  int _selectedTabIndex = 0;

  /// Tab titles
  final List<String> _tabNames = [
    'All items',
    'Headphones',
    'Camera',
    'Electronics',
  ];

  /* <-------- Initial state --------> */
  @override
  void initState() {
    _showSearch = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context,
          hasBackButton: false,
          titleWidget: const Text('My products'),
          actions: !_showSearch
              ? [
                  Center(
                    child: CustomIconButtonWidget(
                        onTap: () => setState(() => _showSearch = !_showSearch),
                        hasShadow: true,
                        child: SvgPicture.asset(
                          AppAssetImages.searchSVGLogoLine,
                          color: AppColors.darkColor,
                          height: 18,
                          width: 18,
                        )),
                  ),
                  AppGaps.wGap15,
                ]
              : null),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        /* <---- Cart item list ----> */
        child: CustomScrollView(
          slivers: [
            // Top extra spaces
            const SliverToBoxAdapter(child: AppGaps.hGap15),
            _showSearch
                /* <---- Search and filter button widget ----> */
                ? SliverToBoxAdapter(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /* <---- Search and filter button row ----> */
                      Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              /* <---- Search text field ----> */
                              Expanded(
                                  child: CustomTextFormField(
                                      hasShadow: true,
                                      hintText: 'Search item or store',
                                      prefixIcon: SvgPicture.asset(
                                          AppAssetImages.searchSVGLogoLine,
                                          color: AppColors.primaryColor))),
                              AppGaps.wGap8,
                              /* <---- Filter icon button ----> */
                              CustomIconButtonWidget(
                                fixedSize: const Size(60, 60),
                                hasShadow: true,
                                backgroundColor: AppColors.primaryColor,
                                child: SvgPicture.asset(
                                    AppAssetImages.filterSVGLogoLine,
                                    color: Colors.white),
                                onTap: () {},
                              ),
                            ],
                          ),
                          AppGaps.hGap24,
                        ],
                      ),
                    ],
                  ))
                : const SliverToBoxAdapter(),
            /* <---- Product category button row ----> */
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _tabNames.map((tabName) {
                      final index = _tabNames.indexOf(tabName);
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: TextButton(
                            onPressed: () =>
                                setState(() => _selectedTabIndex = index),
                            style: TextButton.styleFrom(
                                elevation: 10,
                                shadowColor: _selectedTabIndex == index
                                    ? AppColors.primaryColor.withOpacity(0.25)
                                    : Colors.black.withOpacity(0.05),
                                backgroundColor: _selectedTabIndex == index
                                    ? AppColors.primaryColor
                                    : Colors.white,
                                primary: _selectedTabIndex == index
                                    ? Colors.white
                                    : AppColors.darkColor,
                                padding: EdgeInsets.symmetric(
                                    vertical: 9,
                                    horizontal:
                                        _selectedTabIndex == index ? 24 : 20),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)))),
                            child: Text(
                              tabName,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            )),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: AppGaps.hGap24),
            /* <---- Product list ----> */
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                final myOrder = FakeData.myOrders[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ProductListTileWithOutOfStock(
                      isOutOfStock: myOrder.isOutOfStock,
                      productImage: myOrder.productImage,
                      productName: myOrder.name,
                      productItemNumber: 2,
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppPageNames.editProductScreen,
                            arguments: myOrder);
                      },
                      outOfStockGestureOnTap: () {
                        setState(
                            () => myOrder.isOutOfStock = !myOrder.isOutOfStock);
                      },
                      outOfStockToggleOnTap: (value) {
                        setState(() => myOrder.isOutOfStock = value);
                      }),
                );
              },
              childCount: FakeData.myOrders.length,
            )),
            // Bottom extra spaces
            const SliverToBoxAdapter(child: AppGaps.hGap30),
          ],
        ),
      ),
      /* <-------- Floating right side button --------> */
      floatingActionButton: CustomIconButtonWidget(
        onTap: () {
          // Go to add product screen
          Navigator.pushNamed(context, AppPageNames.addProductScreen);
        },
        fixedSize: const Size(62, 62),
        backgroundColor: AppColors.primaryColor,
        child: SvgPicture.asset(
          AppAssetImages.plusSVGLogoSolid,
          height: 24,
          width: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}
