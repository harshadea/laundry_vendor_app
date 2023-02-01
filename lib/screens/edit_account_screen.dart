import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditAccountScreen extends StatelessWidget {
  const EditAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context,
          hasBackButton: true,
          titleWidget: const Text('Edit account')),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top extra spaces
              AppGaps.hGap15,
              /* <---- Product picture ----> */
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
                            ))
                      ],
                    ),
                    AppGaps.hGap32,
                    CustomHorizontalDashedLineWidget(
                        color: AppColors.darkColor.withOpacity(0.1)),
                    AppGaps.hGap32,
                    Row(
                      children: [
                        Text('Store info',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(color: AppColors.primaryColor)),
                      ],
                    ),
                    AppGaps.hGap24,
                    /* <---- Edit your name ----> */
                    CustomTextFormField(
                        labelText: 'Store name',
                        hintText: 'Ecomik',
                        prefixIcon: SvgPicture.asset(
                            AppAssetImages.shopSVGLogoLine,
                            color: AppColors.bodyTextColor)),
                    AppGaps.hGap24,
                    /* <---- Edit your email address ----> */
                    CustomTextFormField(
                      isReadOnly: true,
                      labelText: 'Category',
                      hintText: 'Electronics',
                      prefixIcon: SvgPicture.asset(
                          AppAssetImages.menuSVGLogoLine,
                          color: AppColors.bodyTextColor),
                      suffixIcon: PopupMenuButton<int>(
                          padding: const EdgeInsets.only(right: 5),
                          position: PopupMenuPosition.under,
                          child: CustomIconButtonWidget(
                            fixedSize: const Size(20, 20),
                            child: SvgPicture.asset(
                                AppAssetImages.arrowDownSVGLogoLine,
                                height: 12,
                                color: AppColors.bodyTextColor),
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
                    /* <---- Edit your phone number ----> */
                    CustomTextFormField(
                        labelText: 'Phone',
                        hintText: '+8817 2729 2899',
                        textInputType: TextInputType.phone,
                        prefixIcon: SvgPicture.asset(
                            AppAssetImages.callingSVGLogoLine,
                            color: AppColors.bodyTextColor)),
                    AppGaps.hGap24,
                    /* <---- Edit your email address ----> */
                    CustomTextFormField(
                        labelText: 'Email',
                        hintText: 'contact@ecomic.mail',
                        prefixIcon: SvgPicture.asset(
                            AppAssetImages.messageBoxBorderSVGLogoLine,
                            color: AppColors.bodyTextColor)),
                    AppGaps.hGap24,
                    /* <---- Edit your location address ----> */
                    CustomTextFormField(
                        labelText: 'Location',
                        hintText: 'Green Street 738, NY, USA',
                        textInputType: TextInputType.streetAddress,
                        prefixIcon: SvgPicture.asset(
                            AppAssetImages.locationSVGLogoLine,
                            color: AppColors.bodyTextColor)),
                    AppGaps.hGap24,
                    /* <---- Edit opening and closing time row ----> */
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Expanded(
                          child: CustomTextFormField(
                              labelText: 'Opening time',
                              hintText: '8:00 am',
                              prefixIcon: AppGaps.emptyGap),
                        ),
                        AppGaps.wGap16,
                        Expanded(
                          child: CustomTextFormField(
                              labelText: 'Closing time',
                              hintText: '11:00 pm',
                              prefixIcon: AppGaps.emptyGap),
                        ),
                      ],
                    ),
                    AppGaps.hGap24,
                    /* <---- Add more options text button ----> */
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
        child: const Text('Update info'),
      )),
    );
  }
}
