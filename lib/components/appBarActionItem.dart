import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:troismconsulting/config/responsive.dart';
import 'package:troismconsulting/pages/notifications.dart';
import 'package:troismconsulting/pages/notifications_web.dart';
import 'package:troismconsulting/pages/profilPage.dart';
import 'package:troismconsulting/pages/profilPage_web.dart';
import 'package:troismconsulting/style/colors.dart';

class AppBarActionItems extends StatelessWidget {
  const AppBarActionItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // IconButton(
        //     icon: SvgPicture.asset(
        //       'assets/calendar.svg',
        //       width: 20,
        //     ),
        //     onPressed: () {}),
        SizedBox(width: 10),
        IconButton(
            icon: SvgPicture.asset('assets/ring.svg', width: 20.0),
            onPressed: () {
              Responsive.isMobile(context)
                  ? Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationsPage()))
                  : Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationsWebPage()));
            }),
        const SizedBox(width: 15),
        Row(children: [
          InkWell(
            onTap: () {
              Responsive.isMobile(context)
                  ? Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ProfilPage()))
                  : Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ProfilWebPage()));
            },
            child: CircleAvatar(
              radius: 17,
              backgroundImage: NetworkImage(
                'https://cdn.shopify.com/s/files/1/0045/5104/9304/t/27/assets/AC_ECOM_SITE_2020_REFRESH_1_INDEX_M2_THUMBS-V2-1.jpg?v=8913815134086573859',
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                Responsive.isMobile(context)
                    ? Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => ProfilPage()))
                    : Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfilWebPage()));
              },
              icon:
                  Icon(Icons.arrow_drop_down_outlined, color: AppColors.black))
        ]),
      ],
    );
  }
}
