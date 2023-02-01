import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/settings_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  /// Toggle value of notification
  bool _toggleNotification = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context, titleWidget: const Text('Settings')),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top extra spaces
              AppGaps.hGap15,
              Text('Preference', style: Theme.of(context).textTheme.headline4),
              AppGaps.hGap16,
              /* <---- 'Country' List Tile ----> */
              SettingsListTileWidget(
                  titleText: 'Country',
                  valueWidget: const SettingsValueTextWidget(text: 'USA'),
                  onTap: () {}),
              AppGaps.hGap16,
              /* <---- 'Currency' List Tile ----> */
              SettingsListTileWidget(
                  titleText: 'Currency',
                  valueWidget: const SettingsValueTextWidget(text: 'USD'),
                  onTap: () {}),
              AppGaps.hGap16,
              /* <---- 'Language' List Tile ----> */
              SettingsListTileWidget(
                  titleText: 'Language',
                  valueWidget: const SettingsValueTextWidget(text: 'English'),
                  onTap: () {
                    Navigator.pushNamed(context, AppPageNames.languageScreen);
                  }),
              /* <---- Section space ----> */
              AppGaps.hGap32,
              Text('Application setting',
                  style: Theme.of(context).textTheme.headline4),
              AppGaps.hGap16,
              /* <---- 'Notification' List Tile ----> */
              SettingsListTileWidget(
                  titleText: 'Popup notification',
                  showRightArrow: false,
                  valueWidget: FlutterSwitch(
                    value: _toggleNotification,
                    width: 35,
                    height: 20,
                    toggleSize: 12,
                    activeColor: AppColors.primaryColor,
                    onToggle: (value) =>
                        setState(() => _toggleNotification = value),
                  ),
                  onTap: () => setState(
                      () => _toggleNotification = !_toggleNotification)),
              /* <---- Section space ----> */
              AppGaps.hGap32,
              Text('Support', style: Theme.of(context).textTheme.headline4),
              AppGaps.hGap16,
              /* <---- 'Help center' List Tile ----> */
              SettingsListTileWidget(titleText: 'Help center', onTap: () {}),
              AppGaps.hGap16,
              /* <---- 'Terms & conditions' List Tile ----> */
              SettingsListTileWidget(
                  titleText: 'Terms & conditions', onTap: () {}),
              // Bottom extra spaces
              AppGaps.hGap30,
            ],
          ),
        ),
      ),
    );
  }
}
