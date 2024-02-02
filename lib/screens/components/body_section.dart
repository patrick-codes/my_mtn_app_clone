import 'package:flutter/material.dart';
import 'package:my_mtn_app/helpers/helpers_export.dart';

import '../../shared/color_constants.dart';
import '../widgets/balance_row.dart';
import '../widgets/reusable_widgets.dart';

enum BalanceType { airtime, data, broadband, sms }

enum QuickAccessType { data, just4U, momo, mashup }

// map the quick access type to the corresponding string value
extension QuickAccessTypeExtension on QuickAccessType {
  String get name {
    switch (this) {
      case QuickAccessType.data:
        return 'Data Bundle';
      case QuickAccessType.just4U:
        return 'Just4U';
      case QuickAccessType.momo:
        return 'Send MoMo';
      case QuickAccessType.mashup:
        return 'Mashup';
      default:
        return '';
    }
  }
}

class BodySection extends StatelessWidget {
  const BodySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.88,
      decoration: const BoxDecoration(
        color: ColorConstants.kbackground,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            20.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: const BalanceRow(),
            ),
            5.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: (15.w)),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.6,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  buildBalanceCard(
                    balanceType: BalanceType.airtime.name,
                    amount: 'GHS 0.00',
                    icon: Icons.phone_in_talk_rounded,
                  ),
                  buildBalanceCard(
                    balanceType: BalanceType.data.name,
                    amount: '0.00 GB',
                    icon: Icons.data_usage_outlined,
                  ),
                  buildBalanceCard(
                    balanceType: BalanceType.sms.name,
                    amount: '0.00 SMS',
                    icon: Icons.email_outlined,
                  ),
                  buildBalanceCard(
                    balanceType: BalanceType.broadband.name,
                    amount: 'GET CONNECTED',
                    icon: Icons.wifi_rounded,
                  ),
                ],
              ),
            ),
            40.height,
            Text(
              "Showing balances as at Jan 30 2024; 2:42:34 PM",
              style: TextStyle(
                fontSize: 13.h,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
            20.height,
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 30.h,
              ),
              decoration: const BoxDecoration(
                color: ColorConstants.kbackground2,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: crossStart,
                children: [
                  Row(
                    mainAxisAlignment: mainSpaceBetween,
                    children: [
                      Text(
                        'Quick access',
                        style: TextStyle(
                          fontSize: 20.h,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      buildViewAllBtn(),
                    ],
                  ),
                  20.height,
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 14,
                    childAspectRatio: 2.9,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      buildQuickAccessCard(
                        type: QuickAccessType.data.name,
                      ),
                      buildQuickAccessCard(
                        type: QuickAccessType.data.name,
                      ),
                      buildQuickAccessCard(
                        type: QuickAccessType.data.name,
                      ),
                      buildQuickAccessCard(
                        type: QuickAccessType.data.name,
                      ),
                    ],
                  ),
                  40.height,
                  Text(
                    'Pulse Offers and Loyalty',
                    style: TextStyle(
                      fontSize: 20.h,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildQuickAccessCard({required String type}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: const Color(0xFF323232),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.phone_in_talk_rounded,
            color: Colors.black,
            size: 20.h,
          ),
        ),
        5.width,
        Text(
          type,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.0,
            fontSize: 16.h,
          ),
        ),
      ]),
    );
  }

  buildBalanceCard(
      {required String balanceType,
      required String amount,
      required IconData icon}) {
    return Container(
      padding: EdgeInsets.only(
        top: 10.w,
        left: 2.w,
        right: 2.w,
        bottom: 2.h,
      ),
      decoration: BoxDecoration(
        color: ColorConstants.kprimary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: mainSpaceBetween,
        crossAxisAlignment: crossStart,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 15.h,
                ),
                5.width,
                Text(
                  balanceType.toUpperCase(),
                  style: TextStyle(
                    fontSize: 15.h,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 5.h,
            ),
            decoration: const BoxDecoration(
                color: ColorConstants.kbackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                )),
            child: Column(
              crossAxisAlignment: crossStart,
              children: [
                Text(
                  amount,
                  style: TextStyle(
                    fontSize:
                        balanceType == BalanceType.broadband.name ? 15.h : 18.h,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Divider(color: Colors.grey.withOpacity(0.2)),
                if (balanceType == BalanceType.broadband.name) ...[
                  Text(
                    "CLICK HERE",
                    style: TextStyle(
                      fontSize: 12.h,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ] else
                  Text(
                    "BONUS :",
                    style: TextStyle(
                      fontSize: 12.h,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
