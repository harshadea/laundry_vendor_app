import 'package:ecomikstoreapp/screens/home_navigator_screens/products_screen.dart';
import 'package:ecomikstoreapp/screens/home_navigator_screens/home_screen.dart';
import 'package:ecomikstoreapp/screens/home_navigator_screens/my_account_screen.dart';
import 'package:ecomikstoreapp/screens/home_navigator_screens/orders_screen.dart';
import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/home_navigator_screen_widgets.dart';
import 'package:flutter/material.dart';

class HomeNavigatorScreen extends StatefulWidget {
  /// The parameter variable argument holds screen index number to show that tab
  /// screen initially.
  final Object? screenTabIndex;
  const HomeNavigatorScreen({Key? key, this.screenTabIndex}) : super(key: key);

  @override
  State<HomeNavigatorScreen> createState() => _HomeNavigatorScreenState();
}

class _HomeNavigatorScreenState extends State<HomeNavigatorScreen> {
  /// Current page index
  int _currentPageIndex = 0;

  /// Tabbed screen widget of selected tab
  Widget _nestedScreenWidget = const Scaffold();

  /* <-------- Select current page index initially --------> */
  void _setCurrentPageIndex(Object? argument) {
    if (argument != null) {
      if (argument is int) {
        _currentPageIndex = argument;
      }
    }
  }

  /* <-------- Select current tab screen --------> */
  void _setCurrentTab() {
    const int homeScreenIndex = 0;
    const int cartScreenIndex = 1;
    const int ordersScreenIndex = 2;
    const int accountScreenIndex = 3;
    switch (_currentPageIndex) {
      case homeScreenIndex:
        _nestedScreenWidget = const HomeScreen();
        break;
      case cartScreenIndex:
        _nestedScreenWidget = const ProductsScreen();
        break;
      case ordersScreenIndex:
        _nestedScreenWidget = const OrdersScreen();
        break;
      case accountScreenIndex:
        _nestedScreenWidget = const MyAccountScreen();
        break;
      default:
        // Invalid page index set tab to dashboard screen
        _nestedScreenWidget = const HomeScreen();
    }
  }

  /* <---- Initial state ----> */
  @override
  void initState() {
    _setCurrentPageIndex(widget.screenTabIndex);
    _setCurrentTab();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.shadeColor2,
      /* <-------- Content --------> */
      body: _nestedScreenWidget,
      /* <-------- Bottom tab bar --------> */
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        child: CustomBottomNavigationBar(
          selectedIndex: _currentPageIndex,
          curve: Curves.easeOutBack,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          backgroundColor: Colors.white,
          itemCornerRadius: 10,
          showElevation: false, // use this to remove appBar's elevation
          onItemSelected: (selectedPageIndex) => setState(() {
            // Set current index and tab screen
            _currentPageIndex = selectedPageIndex;
            _setCurrentTab();
          }),
          items: [
            CustomBottomNavigationBarItem(
              svgAssetIconName: AppAssetImages.homeSVGLogoLine,
              labelText: 'Home',
              width: 100,
              inactiveColor: AppColors.bodyTextColor,
            ),
            CustomBottomNavigationBarItem(
              svgAssetIconName: AppAssetImages.boxSVGLogoLine,
              labelText: 'Products',
              width: 115,
              inactiveColor: AppColors.bodyTextColor,
            ),
            CustomBottomNavigationBarItem(
              svgAssetIconName: AppAssetImages.taskSVGLogoLine,
              labelText: 'Orders',
              width: 100,
              inactiveColor: AppColors.bodyTextColor,
            ),
            CustomBottomNavigationBarItem(
              svgAssetIconName: AppAssetImages.profileSVGLogoLine,
              labelText: 'Account',
              width: 110,
              inactiveColor: AppColors.bodyTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
