import 'package:ecomikstoreapp/models/fake_data.dart';
import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/my_wallet_screen_widgets.dart';
import 'package:flutter/material.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
        screenContext: context,
        titleWidget: const Text('Wallet'),
      ),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        child: CustomScrollView(slivers: [
          // Top extra spaces
          const SliverToBoxAdapter(child: AppGaps.hGap15),
          /* <---- Payment credit card illustration widget ----> */
          SliverToBoxAdapter(
              child: PaymentCardWidget(
                  child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Name',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(color: Colors.white.withOpacity(0.7))),
              AppGaps.hGap2,
              Text('Michel John Doe',
                  style: Theme.of(context).textTheme.button?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600)),
              AppGaps.hGap16,
              Text(
                '****    ****    ****    2382',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Colors.white),
              ),
              AppGaps.hGap16,
              Text('Balance',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(color: Colors.white.withOpacity(0.7))),
              AppGaps.hGap2,
              Text(r'$2373.00',
                  style: Theme.of(context).textTheme.button?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500)),
            ],
          ))),
          const SliverToBoxAdapter(child: AppGaps.hGap32),
          SliverToBoxAdapter(
              child: Text(
            'Recent transactions',
            style: Theme.of(context).textTheme.headline4,
          )),
          const SliverToBoxAdapter(child: AppGaps.hGap16),
          /* <---- Recent transaction list ----> */
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              /// Get recent transaction
              final recentTransaction = FakeData.recentTransactions[index];
              return RecentTransactionWidget(
                  recentTransaction: recentTransaction);
            },
            childCount: FakeData.recentTransactions.length,
          )),
          // Bottom extra spaces
          const SliverToBoxAdapter(child: AppGaps.hGap30),
        ]),
      ),
      /* <-------- Bottom bar --------> */
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
        child: CustomStretchedTextButtonWidget(
            buttonText: 'Send to bank',
            onTap: () {
              Navigator.pushNamed(context, AppPageNames.sendToBankScreen);
            }),
      ),
    );
  }
}
