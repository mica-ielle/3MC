import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:troismconsulting/config/responsive.dart';
import 'package:troismconsulting/config/size_config.dart';
import 'package:troismconsulting/style/colors.dart';
import 'package:troismconsulting/style/style.dart';

class InfoCard extends StatelessWidget {
  final String? label;
  final IconData? icon1;
  final IconData? icon2;
  final String? pourcentage;
  final String? montant;
  final String? timing;
  final Color? colorIcon;

  const InfoCard(
      {super.key,
      this.label,
      this.timing,
      this.icon1,
      this.icon2,
      this.pourcentage,
      this.colorIcon,
      this.montant});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          minWidth: Responsive.isDesktop(context)
              ? 200
              : SizeConfig.screenWidth! / 2 - 40),
      padding: EdgeInsets.only(
          top: 20,
          bottom: 20,
          left: 20,
          right: Responsive.isMobile(context) ? 20 : 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
        ),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PrimaryText(text: label, color: AppColors.secondary, size: 16),
              Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: colorIcon?.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon1,
                    color: colorIcon,
                  )),
            ],
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 2,
          ),
          PrimaryText(
            text: montant,
            size: 25,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon2,
                color: Colors.blue,
              ),
              const SizedBox(
                width: 5,
              ),
              PrimaryText(
                text: pourcentage,
                size: 18,
                fontWeight: FontWeight.w700,
                color: Colors.blue,
              ),
              const SizedBox(
                width: 10,
              ),
              PrimaryText(
                text: timing,
                size: 15,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
