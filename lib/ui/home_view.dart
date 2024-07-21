import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wirepay/service/fakedata.dart';
import 'package:wirepay/service/models/account_information_model.dart';
import 'package:wirepay/service/models/ai_transaction_model.dart';
import 'package:wirepay/service/models/balance_model.dart';
import 'package:wirepay/shared/app_colors.dart';
import 'package:wirepay/shared/app_text_style.dart';
import 'package:wirepay/shared/extension/num.dart';
import 'package:wirepay/shared/widgets/app_icons.dart';
import 'package:wirepay/shared/widgets/app_images.dart';
import 'package:wirepay/shared/widgets/app_spacing.dart';
import 'package:wirepay/shared/widgets/pay_button.dart';
import 'package:wirepay/shared/widgets/pay_text_button.dart';

import '../shared/widgets/pay_border.dart';
import '../shared/widgets/pay_section.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BalanceData> balances = [];
  List<AITransactionModel> aiTransactions = [];
  List<AccountInfoModel> accountInfo = [];
  void initialize() {
    balances = fakeBalanceData.map((e) => BalanceData.fromMap(e)).toList();
    aiTransactions =
        aiActionData.map((e) => AITransactionModel.fromMap(e)).toList();
    accountInfo =
        accountInfoData.map((e) => AccountInfoModel.fromMap(e)).toList();
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              AppSpacing.v8(),
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
                              style: AppTextStyle.semibold14.copyWith(
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
              Expanded(
                child: ListView(
                  children: [
                    PaySection(
                      header: 'My Accounts',
                      suffix: Row(
                        children: [
                          Text(
                            'Hide balance',
                            style: AppTextStyle.semibold14.copyWith(
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
                        height: 109.h,
                        child: ListView.separated(
                          itemCount: balances.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          separatorBuilder: (_, __) => AppSpacing.h10(),
                          itemBuilder: (_, index) {
                            final balance = balances[index];

                            return PayBorder(
                              width: 194.w,
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
                                    '${balance.currency}${balance.balance.withCurrency(balance.name)}',
                                    style: AppTextStyle.bold20.copyWith(
                                      fontFamily: AppTextStyle.fontAvenir,
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
                        PayButton(
                          buttonStyle: PayButtonStyle.circular,
                          expanded: false,
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.zero,
                          backgroundColor: AppColors.darkBackground,
                          textColor: AppColors.primary,
                          onPressed: () {},
                          child: const AppIcons(
                            icon: AppIconData.more,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    AppSpacing.v32(),
                    PaySection(
                      header: 'Get started',
                      suffix: SizedBox(
                        height: 18.h,
                        child: PayTextButton(
                          text: 'View all steps',
                          padding: EdgeInsets.zero,
                          buttonStyle: PayTextButtonStyle.underlined,
                          onPressed: () {},
                        ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Verify your identity, Miracle!',
                                        style: AppTextStyle.medium16,
                                      ),
                                      AppSpacing.v4(),
                                      Text(
                                        'Submit additional information to verify your identity.',
                                        style: AppTextStyle.regular14.copyWith(
                                          color: AppColors.darkTextLow,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const AppSpacing(h: 56),
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
                            AppSpacing.v8(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PayButton(
                                  height: 32,
                                  text: 'Verify identity',
                                  expanded: false,
                                  onPressed: () {},
                                ),
                                AppSpacing.h8(),
                                PayTextButton(
                                  textColor: AppColors.darkText,
                                  padding: EdgeInsets.zero,
                                  text: 'Dismiss',
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppSpacing.v16(),
                    PaySection(
                      header: 'Wirepay AI',
                      child: PayBorder(
                        child: ListView.separated(
                          itemCount: aiTransactions.length,
                          physics: const NeverScrollableScrollPhysics(),
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
                                transaction.operationType.toLowerCase() ==
                                    'debit';
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            transaction.name,
                                            style:
                                                AppTextStyle.medium16.copyWith(
                                              fontFamily:
                                                  AppTextStyle.fontAvenir,
                                            ),
                                          ),
                                          Text(
                                            transaction.description,
                                            style:
                                                AppTextStyle.regular12.copyWith(
                                              color: isPending
                                                  ? AppColors.orange
                                                  : AppColors.darkTextLow,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            isDebit
                                                ? '-${transaction.currency}${transaction.balance}'
                                                : '${transaction.currency}${transaction.balance}',
                                            style:
                                                AppTextStyle.medium16.copyWith(
                                              color: isDebit
                                                  ? AppColors.darkTextLow
                                                  : AppColors.darkGreen,
                                            ),
                                          ),
                                          if (isPending)
                                            Text(
                                              'Pending',
                                              style: AppTextStyle.regular12
                                                  .copyWith(
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
                    AppSpacing.v16(),
                    PaySection(
                      header: 'Account Information',
                      child: SizedBox(
                        height: 118.h,
                        child: ListView.separated(
                          itemCount: accountInfo.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          separatorBuilder: (_, __) => AppSpacing.h10(),
                          itemBuilder: (_, index) {
                            final info = accountInfo[index];

                            return PayBorder(
                              width: 264.w,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        info.title,
                                        style: AppTextStyle.bold16.copyWith(
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
                                                    backgroundImage:
                                                        AssetImage(e),
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
                                  const Spacer(),
                                  SizedBox(
                                    height: 18.h,
                                    child: PayTextButton(
                                      text: info.buttonText,
                                      padding: EdgeInsets.zero,
                                      suffixIcon: AppIconData.forwardArrow,
                                      buttonStyle:
                                          PayTextButtonStyle.underlined,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
