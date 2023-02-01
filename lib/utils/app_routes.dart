import 'package:ecomikstoreapp/screens/add_product_screen.dart';
import 'package:ecomikstoreapp/screens/call_screen.dart';
import 'package:ecomikstoreapp/screens/chat_deliveryman_screen.dart';
import 'package:ecomikstoreapp/screens/congratulation_screen.dart';
import 'package:ecomikstoreapp/screens/delivery_info_map_screen.dart';
import 'package:ecomikstoreapp/screens/delivery_info_screen.dart';
import 'package:ecomikstoreapp/screens/edit_account_screen.dart';
import 'package:ecomikstoreapp/screens/edit_product_screen.dart';
import 'package:ecomikstoreapp/screens/home_navigator_screen.dart';
import 'package:ecomikstoreapp/screens/intro_screen.dart';
import 'package:ecomikstoreapp/screens/langauge_screen.dart';
import 'package:ecomikstoreapp/screens/my_wallet_screen.dart';
import 'package:ecomikstoreapp/screens/password_change_success_screen.dart';
import 'package:ecomikstoreapp/screens/password_recovery_screens/password_recovery_create_password_screen.dart';
import 'package:ecomikstoreapp/screens/password_recovery_screens/password_recovery_prompt_screen.dart';
import 'package:ecomikstoreapp/screens/password_recovery_screens/password_recovery_select_screen.dart';
import 'package:ecomikstoreapp/screens/password_recovery_screens/password_recovery_verification_screen.dart';
import 'package:ecomikstoreapp/screens/send_to_bank_screen.dart';
import 'package:ecomikstoreapp/screens/settings_screen.dart';
import 'package:ecomikstoreapp/screens/sign_in_screen.dart';
import 'package:ecomikstoreapp/screens/sign_up_screen.dart';
import 'package:ecomikstoreapp/screens/sign_up_success_screen.dart';
import 'package:ecomikstoreapp/screens/splash_screen.dart';
import 'package:ecomikstoreapp/screens/store_reviews_screen.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/screens/insight_screen.dart';
import 'package:flutter/material.dart';

/// This file contains app route generator
class AppRouteGenerator {
  /// This function generate routes corresponding to their pages with parameters
  /// (if used)
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final Object? argument = settings.arguments;
    switch (settings.name) {
      case AppPageNames.rootScreen:
      case AppPageNames.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppPageNames.introScreen:
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case AppPageNames.homeScreen:
        return MaterialPageRoute(
            builder: (_) => HomeNavigatorScreen(screenTabIndex: argument));
      case AppPageNames.signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case AppPageNames.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case AppPageNames.signUpSuccessScreen:
        return MaterialPageRoute(builder: (_) => const SignUpSuccessScreen());
      case AppPageNames.passwordChangeSuccessScreen:
        return MaterialPageRoute(
            builder: (_) => const PasswordChangSuccessScreen());
      case AppPageNames.passwordRecoveryPromptScreen:
        return MaterialPageRoute(
            builder: (_) => const PasswordRecoveryPromptScreen());
      case AppPageNames.passwordRecoveryVerificationScreen:
        return MaterialPageRoute(
            builder: (_) => const PasswordRecoveryVerificationScreen());
      case AppPageNames.passwordRecoverySelectScreen:
        return MaterialPageRoute(
            builder: (_) => const PasswordRecoverySelectScreen());
      case AppPageNames.passwordRecoveryCreateScreen:
        return MaterialPageRoute(
            builder: (_) => const PasswordRecoveryCreatePasswordScreen());
      case AppPageNames.settingsScreen:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case AppPageNames.languageScreen:
        return MaterialPageRoute(builder: (_) => const LanguageScreen());
      case AppPageNames.myWalletScreen:
        return MaterialPageRoute(builder: (_) => const MyWalletScreen());
      case AppPageNames.editAccountScreen:
        return MaterialPageRoute(builder: (_) => const EditAccountScreen());
      case AppPageNames.storeReviewsScreen:
        return MaterialPageRoute(builder: (_) => const StoreReviewsScreen());
      case AppPageNames.congratulationScreen:
        return MaterialPageRoute(builder: (_) => const CongratulationScreen());
      case AppPageNames.editProductScreen:
        return MaterialPageRoute(
            builder: (_) => EditProductScreen(product: argument));
      case AppPageNames.addProductScreen:
        return MaterialPageRoute(builder: (_) => const AddProductScreen());
      case AppPageNames.deliveryInfoScreen:
        return MaterialPageRoute(builder: (_) => const DeliveryInfoScreen());
      case AppPageNames.deliveryInfoMapScreen:
        return MaterialPageRoute(builder: (_) => const DeliveryInfoMapScreen());
      case AppPageNames.chatWithDeliverymanScreen:
        return MaterialPageRoute(builder: (_) => const ChatDeliverymanScreen());
      case AppPageNames.insightScreen:
        return MaterialPageRoute(builder: (_) => const InsightScreen());
      case AppPageNames.sendToBankScreen:
        return MaterialPageRoute(builder: (_) => const SendToBankScreen());
      case AppPageNames.callScreen:
        return MaterialPageRoute(builder: (_) => const CallScreen());
      default:
        // Open this page if wrong route address used
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                body: SafeArea(child: Center(child: Text('Page not found')))));
    }
  }
}
