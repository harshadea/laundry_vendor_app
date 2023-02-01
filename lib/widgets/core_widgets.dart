import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Custom padded body widget for scaffold
class CustomScaffoldBodyWidget extends StatelessWidget {
  final Widget child;
  const CustomScaffoldBodyWidget({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppGaps.screenPaddingValue),
      child: child,
    );
  }
}

/// Custom padded bottom bar widget for scaffold
class CustomScaffoldBottomBarWidget extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  const CustomScaffoldBottomBarWidget(
      {Key? key, required this.child, this.backgroundColor, this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppGaps.bottomNavBarPadding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}

/// Custom TextButton stretches the width of the screen with small elevation
/// shadow
class CustomStretchedTextButtonWidget extends StatelessWidget {
  final String buttonText;
  final void Function()? onTap;
  const CustomStretchedTextButtonWidget({
    Key? key,
    this.onTap,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
              onPressed: onTap,
              style: TextButton.styleFrom(
                  elevation: onTap == null ? 0 : 10,
                  shadowColor: AppColors.primaryColor.withOpacity(0.25),
                  primary: Colors.white,
                  backgroundColor: onTap == null
                      ? AppColors.primaryColor.withOpacity(0.15)
                      : AppColors.primaryColor,
                  minimumSize: const Size(30, 62),
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(AppComponents.defaultBorderRadius))),
              child: Text(buttonText,
                  style: onTap == null
                      ? const TextStyle(color: Colors.white)
                      : null)),
        ),
      ],
    );
  }
}

/// Custom TextButton stretches the width of the screen with small elevation
/// shadow with custom child widget
class CustomStretchedButtonWidget extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  const CustomStretchedButtonWidget({
    Key? key,
    this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
              onPressed: onTap,
              style: TextButton.styleFrom(
                  elevation: 10,
                  shadowColor: AppColors.primaryColor.withOpacity(0.25),
                  primary: Colors.white,
                  backgroundColor: onTap == null
                      ? AppColors.bodyTextColor
                      : AppColors.primaryColor,
                  minimumSize: const Size(30, 62),
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(AppComponents.defaultBorderRadius))),
              child: child),
        ),
      ],
    );
  }
}

/// Custom toggle button of tab widget
class CustomTabToggleButtonWidget extends StatelessWidget {
  final bool isSelected;
  final String text;
  final void Function()? onTap;
  const CustomTabToggleButtonWidget(
      {Key? key, required this.isSelected, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      animationDuration: Duration.zero,
      color: isSelected ? AppColors.primaryColor : Colors.transparent,
      elevation: isSelected ? 10 : 0,
      shadowColor: isSelected ? AppColors.primaryColor.withOpacity(0.25) : null,
      borderRadius: const BorderRadius.all(Radius.circular(18)),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .button
                ?.copyWith(color: isSelected ? Colors.white : null),
          ),
        ),
      ),
    );
  }
}

/// Minus, counter, plus buttons row for product cart counter.
class PlusMinusCounterRow extends StatelessWidget {
  final void Function()? onRemoveTap;
  final String counterText;
  final void Function()? onAddTap;
  const PlusMinusCounterRow({
    Key? key,
    required this.onRemoveTap,
    required this.counterText,
    required this.onAddTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 86,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomIconButtonWidget(
              backgroundColor: AppColors.shadeColor1,
              borderRadiusRadiusValue: const Radius.circular(6),
              fixedSize: const Size(24, 24),
              onTap: onRemoveTap,
              child: SvgPicture.asset(
                AppAssetImages.minusSVGLogoSolid,
                color: AppColors.bodyTextColor,
                height: 12,
                width: 12,
              )),
          AppGaps.wGap10,
          Expanded(
            child: Center(
              child: Text(
                counterText,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 12, color: AppColors.darkColor),
              ),
            ),
          ),
          AppGaps.wGap10,
          CustomIconButtonWidget(
              backgroundColor: AppColors.primaryColor,
              borderRadiusRadiusValue: const Radius.circular(6),
              fixedSize: const Size(24, 24),
              onTap: onAddTap,
              child: SvgPicture.asset(
                AppAssetImages.plusSVGLogoSolid,
                color: Colors.white,
                height: 12,
                width: 12,
              )),
        ],
      ),
    );
  }
}

/// Custom TextFormField configured with Theme.
class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPasswordTextField;
  final bool hasShadow;
  final bool isReadOnly;
  final BoxConstraints prefixIconConstraints;
  final TextInputType? textInputType;
  final BoxConstraints suffixIconConstraints;
  final TextEditingController? controller;
  final int? minLines;
  final int maxLines;
  final void Function()? onTap;
  const CustomTextFormField({
    Key? key,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.isPasswordTextField = false,
    this.hasShadow = false,
    this.prefixIconConstraints =
        const BoxConstraints(maxHeight: 48, maxWidth: 48),
    this.suffixIconConstraints =
        const BoxConstraints(maxHeight: 48, maxWidth: 48),
    this.isReadOnly = false,
    this.textInputType,
    this.controller,
    this.minLines,
    this.maxLines = 1,
    this.onTap,
    this.initialValue,
  }) : super(key: key);

  /// TextField widget
  Widget textFormFieldWidget() {
    return SizedBox(
      height: (maxLines > 1 || (minLines ?? 1) > 1) ? null : 62,
      child: TextFormField(
        controller: controller,
        onTap: onTap,
        readOnly: isReadOnly,
        obscureText: isPasswordTextField,
        keyboardType: textInputType,
        initialValue: initialValue,
        minLines: minLines,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          prefix: AppGaps.wGap10,
          prefixIconConstraints: prefixIconConstraints,
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: prefixIcon,
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          suffixIconConstraints: suffixIconConstraints,
          suffix: AppGaps.wGap10,
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: suffixIcon,
                )
              : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // If label text is not null, then show label as a separate Text widget
    // wrapped inside column widget.
    // Else, just return the TextFormField widget.
    if (labelText != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label text
          Text(labelText!,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          AppGaps.hGap8,
          // Text field
          hasShadow
              ? PhysicalModel(
                  color: Colors.transparent,
                  elevation: 10,
                  shadowColor: Colors.black.withOpacity(0.25),
                  child: textFormFieldWidget(),
                )
              : textFormFieldWidget(),
        ],
      );
    } else {
      // Text field
      return hasShadow
          ? PhysicalModel(
              color: Colors.transparent,
              elevation: 10,
              shadowColor: Colors.black.withOpacity(0.25),
              child: textFormFieldWidget())
          : textFormFieldWidget();
    }
  }
}

class CustomRadioWidget extends StatelessWidget {
  final Object value;
  final Object? groupValue;
  final Function(Object?) onChanged;
  const CustomRadioWidget(
      {Key? key,
      required this.value,
      required this.groupValue,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: Radio<Object>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}

/// Custom IconButton widget various attributes
class CustomIconButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final Border? border;
  final Widget child;
  final Color backgroundColor;
  final Size fixedSize;
  final Radius borderRadiusRadiusValue;
  final bool isCircleShape;
  final bool hasShadow;
  const CustomIconButtonWidget(
      {Key? key,
      this.onTap,
      required this.child,
      this.backgroundColor = Colors.white,
      this.fixedSize = const Size(40, 40),
      this.borderRadiusRadiusValue = const Radius.circular(14),
      this.border,
      this.isCircleShape = false,
      this.hasShadow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: fixedSize.height,
      width: fixedSize.width,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          shape: isCircleShape ? BoxShape.circle : BoxShape.rectangle,
          borderRadius:
              isCircleShape ? null : BorderRadius.all(borderRadiusRadiusValue),
          border: border),
      child: Material(
        color: backgroundColor,
        shape: isCircleShape ? const CircleBorder() : null,
        shadowColor: hasShadow ? Colors.black.withOpacity(0.4) : null,
        elevation: hasShadow ? 8 : 0,
        borderRadius:
            isCircleShape ? null : BorderRadius.all(borderRadiusRadiusValue),
        child: InkWell(
          onTap: onTap,
          customBorder: isCircleShape ? const CircleBorder() : null,
          borderRadius: BorderRadius.all(borderRadiusRadiusValue),
          child: Center(child: child),
        ),
      ),
    );
  }
}

/// Custom large text button widget
class CustomLargeTextButtonWidget extends StatelessWidget {
  final bool isSmallScreen;
  final void Function()? onTap;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  const CustomLargeTextButtonWidget({
    Key? key,
    this.onTap,
    required this.text,
    this.backgroundColor = AppColors.primaryColor,
    this.textColor = Colors.white,
    this.isSmallScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
            fixedSize:
                isSmallScreen ? const Size(140, 55) : const Size(175, 65),
            primary: textColor,
            visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity),
            backgroundColor: backgroundColor,
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(AppComponents.defaultBorderRadius))),
        child: Text(text));
  }
}

/// Raw list tile does not have a background color
class CustomRawListTileWidget extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  final Radius? borderRadiusRadiusValue;
  const CustomRawListTileWidget({
    Key? key,
    required this.child,
    this.onTap,
    this.borderRadiusRadiusValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: borderRadiusRadiusValue != null
          ? BorderRadius.all(borderRadiusRadiusValue!)
          : null,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadiusRadiusValue != null
            ? BorderRadius.all(borderRadiusRadiusValue!)
            : null,
        child: child,
      ),
    );
  }
}

class CustomListTileWidget extends StatelessWidget {
  final bool hasShadow;
  final bool darkerShadow;
  final double elevation;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final Widget child;
  final EdgeInsets paddingValue;
  final BorderRadius borderRadius;
  const CustomListTileWidget(
      {Key? key,
      required this.child,
      this.onTap,
      this.paddingValue = const EdgeInsets.all(AppGaps.screenPaddingValue),
      this.onLongPress,
      this.borderRadius =
          const BorderRadius.all(AppComponents.defaultBorderRadius),
      this.hasShadow = false,
      this.elevation = 10,
      this.darkerShadow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: hasShadow ? elevation : 0,
      shadowColor: darkerShadow
          ? Colors.black.withOpacity(0.3)
          : Colors.black.withOpacity(0.05),
      borderRadius: borderRadius,
      child: Material(
        color: Colors.white,
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          onLongPress: onLongPress,
          child: Container(
            alignment: Alignment.topLeft,
            padding: paddingValue,
            decoration: BoxDecoration(borderRadius: borderRadius),
            child: child,
          ),
        ),
      ),
    );
  }
}

class CustomHorizontalDashedLineWidget extends StatelessWidget {
  const CustomHorizontalDashedLineWidget({
    Key? key,
    this.height = 1,
    this.color = Colors.black,
  }) : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 4.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}

class CustomVerticalDashedLineWidget extends StatelessWidget {
  const CustomVerticalDashedLineWidget({
    Key? key,
    this.width = 1,
    this.color = Colors.black,
  }) : super(key: key);
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxHeight = constraints.constrainWidth();
        const dashHeight = 4.0;
        final dashWidth = width;
        final dashCount = (boxHeight / (2 * dashHeight)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.vertical,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}

/// Credit card widget with 3 shadows towards bottom
class PaymentCardWidget extends StatelessWidget {
  final Widget child;
  const PaymentCardWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 232,
      alignment: Alignment.topCenter,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Positioned.fill(child: Container(alignment: Alignment.topCenter)),
          Container(
            height: 208,
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(left: 32, right: 32, top: 24),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
          ),
          Container(
            height: 208,
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(left: 16, right: 16, top: 12),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.3),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
          ),
          Container(
            height: 208,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                    image: Image.asset(AppAssetImages.paymentCardAbstractShape,
                            cacheHeight: 163,
                            cacheWidth: 163,
                            height: 163,
                            width: 163)
                        .image,
                    alignment: Alignment.topRight)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

class HighlightAndDetailTextWidget extends StatelessWidget {
  final String slogan;
  final String subtitle;
  final bool isSpaceShorter;
  const HighlightAndDetailTextWidget({
    Key? key,
    required this.slogan,
    required this.subtitle,
    this.isSpaceShorter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(slogan,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline3),
        isSpaceShorter ? AppGaps.hGap8 : AppGaps.hGap16,
        Text(subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: AppColors.bodyTextColor, overflow: TextOverflow.clip)),
      ],
    );
  }
}

class WishlistItemButtonWidget extends StatelessWidget {
  final bool isWishlisted;
  final void Function()? onTap;
  const WishlistItemButtonWidget({
    Key? key,
    required this.isWishlisted,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity),
      icon: SvgPicture.asset(
        AppAssetImages.heartSVGLogoSolid,
        color: isWishlisted
            ? AppColors.primaryColor
            : AppColors.darkColor.withOpacity(0.15),
      ),
    );
  }
}

/// Custom TextButton widget which is very tight to child text
class CustomTightTextButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  const CustomTightTextButtonWidget({
    Key? key,
    this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity)),
        child: child);
  }
}

class CustomGridSingleItemWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Color backgroundColor;
  final Color? borderColor;
  final BorderRadius borderRadius;
  final void Function()? onTap;
  const CustomGridSingleItemWidget({
    Key? key,
    this.onTap,
    this.backgroundColor = Colors.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.padding = const EdgeInsets.all(7.5),
    required this.child,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
              borderRadius: borderRadius,
              border:
                  borderColor != null ? Border.all(color: borderColor!) : null),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}

/// This class contains functions that return a widget
class CoreWidgets {
  static AppBar appBarWidget(
      {required BuildContext screenContext,
      Widget? titleWidget,
      Widget? leading,
      List<Widget>? actions,
      bool hasBackButton = true}) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      leading: hasBackButton
          ? Center(
              child: CustomIconButtonWidget(
                  onTap: () {
                    Navigator.pop(screenContext);
                  },
                  hasShadow: true,
                  child: SvgPicture.asset(
                    AppAssetImages.arrowLeftSVGLogoLine,
                    color: AppColors.darkColor,
                    height: 18,
                    width: 18,
                  )),
            )
          : leading,
      title: titleWidget,
      actions: actions,
    );
  }
}
