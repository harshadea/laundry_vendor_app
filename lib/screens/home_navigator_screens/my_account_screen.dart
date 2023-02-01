import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/my_account_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context,
          hasBackButton: false,
          titleWidget: const Text('My account')),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top extra spaces
              AppGaps.hGap15,
              /* <---- Profile picture, name, phone number, email address
                       ----> */
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        /* <---- Profile picture ----> */
                        CircleAvatar(
                          backgroundImage: Image.asset(
                            AppAssetImages.myAccountProfilePicture,
                          ).image,
                          radius: 64,
                        ),
                        /* <---- Small edit circle icon button ----> */
                        Positioned(
                            bottom: 7,
                            right: -3,
                            child: IconButton(
                              onPressed: () {
                                // Tapping on it goes to edit my account screen
                                Navigator.pushNamed(
                                    context, AppPageNames.editAccountScreen);
                              },
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
                                  AppAssetImages.editSVGLogoSolid,
                                  height: 14,
                                  width: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ))
                      ],
                    ),
                    AppGaps.hGap18,
                    /* <---- Profile name ----> */
                    Text(
                      'Samantha smith',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.button?.copyWith(),
                    ),
                    AppGaps.hGap8,
                    /* <---- Profile phone number ----> */
                    const Text('+1 283 390 390',
                        style: TextStyle(color: AppColors.bodyTextColor)),
                    AppGaps.hGap5,
                    /* <---- Profile email address ----> */
                    const Text('samanthasmith@gmail.com',
                        style: TextStyle(color: AppColors.bodyTextColor)),
                    AppGaps.hGap32,
                    CustomHorizontalDashedLineWidget(
                        color: AppColors.darkColor.withOpacity(0.1)),
                    AppGaps.hGap32,
                    /* <---- 'Insight' list tile button ----> */
                    CustomListTileMyAccountWidget(
                        text: 'Insight',
                        icon: SvgPicture.asset(
                          AppAssetImages.chartSVGLogoDualTone,
                          color: AppColors.primaryColor,
                          height: 24,
                          width: 24,
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppPageNames.insightScreen);
                        }),
                    AppGaps.hGap24,
                    /* <---- 'My wallet' list tile button ----> */
                    CustomListTileMyAccountWidget(
                        text: 'My wallet',
                        icon: SvgPicture.asset(
                          AppAssetImages.walletSVGLogoDualTone,
                          color: AppColors.primaryColor,
                          height: 24,
                          width: 24,
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppPageNames.myWalletScreen);
                        }),
                    AppGaps.hGap24,
                    /* <---- 'My reviews' list tile button ----> */
                    CustomListTileMyAccountWidget(
                        text: 'My reviews',
                        icon: SvgPicture.asset(
                          AppAssetImages.starBlowingSVGLogoDualTone,
                          color: AppColors.primaryColor,
                          height: 24,
                          width: 24,
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppPageNames.storeReviewsScreen);
                        }),
                    AppGaps.hGap24,
                    /* <---- 'Terms & conditions' list tile button ----> */
                    CustomListTileMyAccountWidget(
                        text: 'Terms & conditions',
                        icon: SvgPicture.asset(
                          AppAssetImages.noteSVGLogoDualTone,
                          color: AppColors.primaryColor,
                          height: 24,
                          width: 24,
                        ),
                        onTap: () {}),
                    AppGaps.hGap24,
                    /* <---- 'Setting' list tile button ----> */
                    CustomListTileMyAccountWidget(
                        text: 'Setting',
                        icon: SvgPicture.asset(
                          AppAssetImages.settingSVGLogoDualTone,
                          color: AppColors.primaryColor,
                          height: 24,
                          width: 24,
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppPageNames.settingsScreen);
                        }),
                    AppGaps.hGap24,
                    /* <---- 'Support' list tile button ----> */
                    CustomListTileMyAccountWidget(
                        text: 'Support',
                        icon: SvgPicture.asset(
                          AppAssetImages.sendSVGLogoDualTone,
                          color: AppColors.primaryColor,
                          height: 24,
                          width: 24,
                        ),
                        onTap: () {}),
                    AppGaps.hGap24,
                    /* <---- 'Sign out' list tile button ----> */
                    CustomListTileMyAccountWidget(
                        text: 'Sign out',
                        icon: SvgPicture.asset(
                          AppAssetImages.logoutSVGLogoDualTone,
                          color: AppColors.primaryColor,
                          height: 24,
                          width: 24,
                        ),
                        onTap: () {}),
                    // Bottom extra spaces
                    AppGaps.hGap30,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
