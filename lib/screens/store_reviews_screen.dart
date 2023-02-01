import 'package:ecomikstoreapp/models/fake_data.dart';
import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/store_reviews_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreReviewsScreen extends StatelessWidget {
  const StoreReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context, titleWidget: const Text('Store reviews')),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        child: CustomScrollView(
          slivers: [
            // Top extra spaces
            const SliverToBoxAdapter(child: AppGaps.hGap15),
            /* <---- Review statistics card ----> */
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('4.8',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                              AppGaps.wGap5,
                              const Text('/5'),
                            ],
                          ),
                          AppGaps.hGap8,
                          const Text('Based on',
                              style: TextStyle(color: AppColors.bodyTextColor)),
                          AppGaps.hGap8,
                          const Text('Total 162 reviews',
                              style: TextStyle(color: AppColors.bodyTextColor)),
                          AppGaps.hGap16,
                          SizedBox(
                              height: 20,
                              child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) =>
                                    AppGaps.wGap2,
                                itemCount: 5,
                                itemBuilder: (context, index) =>
                                    SvgPicture.asset(
                                  AppAssetImages.starSVGLogoSolid,
                                  color: 4 >= (index + 1)
                                      ? AppColors.secondaryColor
                                      : AppColors.secondaryColor
                                          .withOpacity(0.5),
                                ),
                              ))
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        /* <---- 5 star progress bar ----> */
                        ReviewStarTextProgressBar(
                            starCount: 5, starProgressValue: (1 / 5) * 5),
                        AppGaps.hGap8,
                        /* <---- 4 star progress bar ----> */
                        ReviewStarTextProgressBar(
                            starCount: 4, starProgressValue: (1 / 5) * 4),
                        AppGaps.hGap8,
                        /* <---- 3 star progress bar ----> */
                        ReviewStarTextProgressBar(
                            starCount: 3, starProgressValue: (1 / 5) * 3),
                        AppGaps.hGap8,
                        /* <---- 2 star progress bar ----> */
                        ReviewStarTextProgressBar(
                            starCount: 2, starProgressValue: (1 / 5) * 2),
                        AppGaps.hGap8,
                        /* <---- 1 star progress bar ----> */
                        ReviewStarTextProgressBar(
                            starCount: 1, starProgressValue: (1 / 5) * 1),
                        AppGaps.hGap8,
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: AppGaps.hGap16),
            /* <---- 'User reviews' and its category dropdown menu ----> */
            SliverToBoxAdapter(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('User reviews',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  PopupMenuButton<int>(
                      padding: const EdgeInsets.only(right: 5),
                      position: PopupMenuPosition.under,
                      // icon: const Icon(Icons.more_vert_rounded, color: AppColors.darkColor),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Most useful',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(fontWeight: FontWeight.w500)),
                          SvgPicture.asset(
                              AppAssetImages.arrowDown2SVGLogoSolid,
                              color: AppColors.darkColor,
                              height: 12,
                              width: 12),
                        ],
                      ),
                      itemBuilder: (context) => [
                            const PopupMenuItem<int>(
                              value: 0,
                              child: Text(
                                'Newest',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const PopupMenuItem<int>(
                              value: 1,
                              child: Text(
                                'Oldest',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const PopupMenuItem<int>(
                              value: 2,
                              child: Text(
                                'Most relevant',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ])
                ],
              ),
            ),
            const SliverToBoxAdapter(child: AppGaps.hGap16),
            /* <---- User review list ----> */
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final review = FakeData.reviews[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: review.reviewerProfileImage,
                        radius: 24,
                      ),
                      AppGaps.wGap16,
                      Expanded(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            review.reviewerName,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          AppGaps.hGap5,
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  height: 20,
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) =>
                                        AppGaps.wGap2,
                                    itemCount: 5,
                                    itemBuilder: (context, index) =>
                                        SvgPicture.asset(
                                      AppAssetImages.starSVGLogoSolid,
                                      color: review.rating >= (index + 1)
                                          ? AppColors.secondaryColor
                                          : AppColors.secondaryColor
                                              .withOpacity(0.5),
                                    ),
                                  )),
                              Text(
                                review.reviewDateText,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(color: AppColors.bodyTextColor),
                              ),
                            ],
                          ),
                          AppGaps.hGap11,
                          Text(
                            review.reviewText,
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(color: AppColors.bodyTextColor),
                          )
                        ],
                      ))
                    ],
                  ),
                );
              }, childCount: FakeData.reviews.length),
            ),
            // Bottom extra spaces
            const SliverToBoxAdapter(child: AppGaps.hGap30),
          ],
        ),
      ),
    );
  }
}
