import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  /// Toggle value of hide password
  bool _toggleHidePassword = true;

  /// Toggle value of agree terms and conditions
  bool _toggleAgreeTermsConditions = false;

  @override
  Widget build(BuildContext context) {
    /// Get screen size
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      /* <-------- Empty appbar with back button --------> */
      appBar: CoreWidgets.appBarWidget(screenContext: context),
      /* <-------- Content --------> */
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppGaps.screenPaddingValue),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: HighlightAndDetailTextWidget(
                      isSpaceShorter: true,
                      slogan: 'Getting Started',
                      subtitle: 'Hello there, sign up to continue'),
                ),
                AppGaps.hGap24,
                /* <---- User full name text field ----> */
                CustomTextFormField(
                  labelText: 'Your name',
                  hintText: 'Your name',
                  prefixIcon:
                      SvgPicture.asset(AppAssetImages.profileSVGLogoLine),
                ),
                AppGaps.hGap24,
                /* <---- Email text field ----> */
                CustomTextFormField(
                  labelText: 'Email address',
                  hintText: 'contact@gmail.com',
                  prefixIcon:
                      SvgPicture.asset(AppAssetImages.messageSVGLogoLine),
                ),
                AppGaps.hGap24,
                /* <---- Password text field ----> */
                CustomTextFormField(
                  isPasswordTextField: _toggleHidePassword,
                  labelText: 'Password',
                  hintText: '********',
                  prefixIcon:
                      SvgPicture.asset(AppAssetImages.unlockSVGLogoLine),
                  suffixIcon: IconButton(
                      padding: EdgeInsets.zero,
                      visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                      color: Colors.transparent,
                      onPressed: () => setState(
                          () => _toggleHidePassword = !_toggleHidePassword),
                      icon: SvgPicture.asset(AppAssetImages.hideSVGLogoLine,
                          color: _toggleHidePassword
                              ? AppColors.bodyTextColor
                              : AppColors.primaryColor)),
                ),
                AppGaps.hGap24,
                /* <---- Terms and conditions CheckBox ----> */
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: screenSize.width < 458
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: Checkbox(
                            value: _toggleAgreeTermsConditions,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            onChanged: (value) => setState(() =>
                                _toggleAgreeTermsConditions = value ?? false)),
                      ),
                    ),
                    AppGaps.wGap16,
                    Expanded(
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Text('By signing up, I agree to the '),
                          CustomTightTextButtonWidget(
                              onTap: () {},
                              child: Text(
                                'Terms of service',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(color: AppColors.primaryColor),
                              )),
                          const Text(' and '),
                          CustomTightTextButtonWidget(
                              onTap: () {},
                              child: Text(
                                'Privacy policy',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(color: AppColors.primaryColor),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                // Bottom extra spaces
                AppGaps.hGap30,
              ],
            ),
          ),
        ),
      ),
      /* <-------- Bottom bar of sign up text --------> */
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /* <---- Sign up text button ----> */
            CustomStretchedTextButtonWidget(
                buttonText: 'Sign up',
                onTap: _toggleAgreeTermsConditions
                    ? () {
                        Navigator.pushNamed(
                            context, AppPageNames.signUpSuccessScreen);
                      }
                    : null),
            AppGaps.hGap19,
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Already have an account?',
                    style: TextStyle(color: AppColors.bodyTextColor)),
                AppGaps.wGap5,
                /* <---- Sign in TextButton ----> */
                CustomTightTextButtonWidget(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('Sign In',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(color: AppColors.primaryColor)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
