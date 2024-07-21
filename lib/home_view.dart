import 'package:flutter/material.dart';
import 'package:wirepay/service/fakedata.dart';
import 'package:wirepay/service/models/account_information_model.dart';
import 'package:wirepay/service/models/ai_transaction_model.dart';
import 'package:wirepay/service/models/balance_model.dart';
import 'package:wirepay/shared/app_colors.dart';
import 'package:wirepay/shared/app_text_style.dart';
import 'package:wirepay/shared/widgets/app_icons.dart';
import 'package:wirepay/shared/widgets/app_images.dart';
import 'package:wirepay/shared/widgets/app_spacing.dart';
import 'package:wirepay/shared/widgets/pay_button.dart';
import 'package:wirepay/shared/widgets/pay_text_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BalanceData> balances = [];
  List<AITransactionModel> aiTransactions = [];
  List<AccountInfoModel> accountInfo = [];
  void getBalances() {
    balances = fakeBalanceData.map((e) => BalanceData.fromMap(e)).toList();
    aiTransactions =
        aiActionData.map((e) => AITransactionModel.fromMap(e)).toList();
    accountInfo =
        accountInfoData.map((e) => AccountInfoModel.fromMap(e)).toList();
  }

  @override
  void initState() {
    getBalances();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppImages(
                    path: AppImageData.user,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(42),
                          color: AppColors.darkBackground,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const AppIcons(
                              icon: AppIconData.gift,
                              size: 24,
                            ),
                            AppSpacing.h8(),
                            Text(
                              'Earn \$1',
                              style: AppTextStyle.bold14.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppSpacing.h16(),
                      const AppIcons(
                        icon: AppIconData.barcode,
                        size: 24,
                      ),
                      AppSpacing.h16(),
                      const AppIcons(
                        icon: AppIconData.notification,
                        size: 24,
                      ),
                    ],
                  ),
                ],
              ),
              AppSpacing.v16(),
              PaySection(
                header: 'My Accounts',
                suffix: Row(
                  children: [
                    Text(
                      'Hide balance',
                      style: AppTextStyle.medium14.copyWith(
                        color: AppColors.grey09,
                      ),
                    ),
                    AppSpacing.h10(),
                    const AppIcons(
                      icon: AppIconData.viewOff,
                      size: 24,
                    ),
                  ],
                ),
                child: SizedBox(
                  height: 115,
                  child: ListView.separated(
                    itemCount: balances.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    separatorBuilder: (_, __) => AppSpacing.h10(),
                    itemBuilder: (_, index) {
                      final balance = balances[index];

                      return PayBorder(
                        width: 194,
                        height: 115,
                        radius: 8,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AppImages(
                                  path: balance.icon,
                                  width: 32,
                                  height: 32,
                                ),
                                AppSpacing.h8(),
                                Text(
                                  balance.name,
                                  style: AppTextStyle.medium14,
                                ),
                              ],
                            ),
                            AppSpacing.v24(),
                            Text(
                              '${balance.currency}${balance.balance}',
                              style: AppTextStyle.extraBold20.copyWith(
                                fontFamily: AppTextStyle.fontFamilyTertiary,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: PayButton(
                      text: 'Send Money',
                      onPressed: () {},
                    ),
                  ),
                  AppSpacing.h8(),
                  Expanded(
                    child: PayButton(
                      backgroundColor: AppColors.darkBackground,
                      textColor: AppColors.primary,
                      text: 'Add Money',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const AppSpacing(v: 40),
              PaySection(
                header: 'Get started',
                suffix: PayTextButton(
                  text: 'View all steps',
                  buttonStyle: PayButtonStyle.underlined,
                  onPressed: () {},
                ),
                child: PayBorder(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Verify your identity, Miracle!',
                                  style: AppTextStyle.medium16.copyWith(
                                    fontFamily: AppTextStyle.fontFamilyTertiary,
                                  ),
                                ),
                                Text(
                                  'Submit additional information to verify your identity.',
                                  style: AppTextStyle.regular14.copyWith(
                                    fontFamily: AppTextStyle.fontFamilyTertiary,
                                    color: AppColors.darkTextLow,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AppSpacing.h24(),
                          const Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: 48,
                                width: 48,
                                child: CircularProgressIndicator(
                                  strokeWidth: 4,
                                  backgroundColor: AppColors.grey100,
                                  color: AppColors.primary,
                                  value: 0.35,
                                  strokeCap: StrokeCap.round,
                                ),
                              ),
                              AppIcons(
                                icon: AppIconData.securityUser,
                                size: 32,
                              ),
                            ],
                          ),
                        ],
                      ),
                      AppSpacing.v24(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PayButton(
                            text: 'Verify identity',
                            expanded: false,
                            onPressed: () {},
                          ),
                          AppSpacing.h8(),
                          PayTextButton(
                            textColor: AppColors.darkText,
                            text: 'Dismiss',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              PaySection(
                header: 'Wirepay AI',
                child: PayBorder(
                  child: ListView.separated(
                    itemCount: aiTransactions.length,
                    physics: const NeverScrollableScrollPhysics(),
                    // padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    separatorBuilder: (_, __) => const Divider(
                      color: AppColors.darkBorder,
                      thickness: 1,
                      height: 32,
                    ),
                    itemBuilder: (_, index) {
                      final transaction = aiTransactions[index];
                      final isPending =
                          transaction.status.toLowerCase() == 'pending';
                      final isDebit =
                          transaction.operationType.toLowerCase() == 'debit';
                      return Row(
                        children: [
                          const PayBorder(
                            padding: EdgeInsets.all(10),
                            radius: 200,
                            color: AppColors.lightGreen,
                            child: AppIcons(
                              icon: AppIconData.stash,
                              size: 32,
                            ),
                          ),
                          AppSpacing.h16(),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      transaction.name,
                                      style: AppTextStyle.medium16.copyWith(
                                        fontFamily:
                                            AppTextStyle.fontFamilyTertiary,
                                      ),
                                    ),
                                    Text(
                                      transaction.description,
                                      style: AppTextStyle.medium14.copyWith(
                                        color: isPending
                                            ? AppColors.orange
                                            : AppColors.darkTextLow,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      isDebit
                                          ? '-${transaction.currency}${transaction.balance}'
                                          : '${transaction.currency}${transaction.balance}',
                                      style: AppTextStyle.medium14.copyWith(
                                        color: isDebit
                                            ? AppColors.darkTextLow
                                            : AppColors.darkGreen,
                                      ),
                                    ),
                                    if (isPending)
                                      Text(
                                        'Pending',
                                        style: AppTextStyle.medium14.copyWith(
                                          color: AppColors.orange,
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              PaySection(
                header: 'Account Information',
                child: SizedBox(
                  height: 126,
                  child: ListView.separated(
                    itemCount: accountInfo.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    separatorBuilder: (_, __) => AppSpacing.h10(),
                    itemBuilder: (_, index) {
                      final info = accountInfo[index];

                      return PayBorder(
                        width: 264,
                        // height: 115,
                        // radius: 8,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  info.title,
                                  style: AppTextStyle.bold16.copyWith(
                                    //TODO:use diff font
                                    // fontFamily: AppTextStyle.fontFamilyTertiary,
                                    color: AppColors.grey10,
                                  ),
                                ),
                                Row(
                                  children: info.currencyIcons
                                      .map(
                                        (e) => Align(
                                          widthFactor: .7,
                                          child: CircleAvatar(
                                            radius: 12,
                                            backgroundColor: Colors.white,
                                            child: CircleAvatar(
                                              radius: 10,
                                              backgroundImage: AssetImage(e),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                            AppSpacing.v10(),
                            Text(
                              info.description,
                              style: AppTextStyle.medium10.copyWith(
                                color: AppColors.darkTextLow,
                              ),
                            ),
                            AppSpacing.v16(),
                            SizedBox(
                              height: 18,
                              child: PayTextButton(
                                text: info.buttonText,
                                padding: EdgeInsets.zero,
                                suffixIcon: AppIconData.forwardArrow,
                                buttonStyle: PayButtonStyle.underlined,
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class PayBorder extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final double? radius;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsets? padding;
  final Widget child;
  const PayBorder({
    super.key,
    this.width,
    this.height,
    this.color,
    this.radius,
    this.padding,
    this.borderRadius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 12),
        color: color ?? Colors.white,
      ),
      child: child,
    );
  }
}

class PaySection extends StatelessWidget {
  final Widget child;
  final Widget? suffix;
  final String header;
  const PaySection({
    super.key,
    required this.child,
    required this.header,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              header,
              style: AppTextStyle.semibold18.copyWith(
                color: AppColors.grey09,
                fontFamily: AppTextStyle.fontFamilySecondary,
              ),
            ),
            if (suffix != null) suffix!,
          ],
        ),
        AppSpacing.v16(),
        child,
        AppSpacing.v16(),
      ],
    );
  }
}
