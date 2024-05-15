import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:troismconsulting/components/appBarActionItem.dart';
import 'package:troismconsulting/components/barChart.dart';
import 'package:troismconsulting/components/header.dart';
import 'package:troismconsulting/components/infoCard.dart';
import 'package:troismconsulting/components/sideMenu.dart';
import 'package:troismconsulting/config/responsive.dart';
import 'package:troismconsulting/config/size_config.dart';
import 'package:troismconsulting/style/colors.dart';
import 'package:troismconsulting/style/style.dart';

class DashboardWeb extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  DashboardWeb({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _drawerKey,
      drawer: const SizedBox(width: 250, child: SideMenu()),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                  onPressed: () {
                    _drawerKey.currentState?.openDrawer();
                  },
                  icon: Icon(Icons.menu, color: AppColors.black)),
              actions: [
                AppBarActionItems(),
              ],
            )
          : PreferredSize(
              preferredSize: Size.zero,
              child: SizedBox(),
            ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 0,
                child: SideMenu(),
              ),
            Expanded(
                flex: 14,
                child: SafeArea(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Header(),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 4,
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth,
                          child: const Wrap(
                              spacing: 20,
                              runSpacing: 20,
                              alignment: WrapAlignment.spaceBetween,
                              children: [
                                InfoCard(
                                  label: "Total visiteur",
                                  icon1: CupertinoIcons.person_2,
                                  icon2: Icons.bar_chart,
                                  pourcentage: "8.5%",
                                  timing: "depuis hier",
                                  colorIcon: Colors.yellow,
                                  montant: "40,689",
                                ),
                                InfoCard(
                                  label: "Total abonné",
                                  icon1: CupertinoIcons.person_2,
                                  icon2: Icons.bar_chart,
                                  pourcentage: "0.5%",
                                  timing: "depuis une semaine",
                                  colorIcon: Colors.yellow,
                                  montant: "20,346",
                                ),
                                InfoCard(
                                  label: "Projet réalisé",
                                  icon1: CupertinoIcons.graph_circle,
                                  icon2: Icons.bar_chart,
                                  pourcentage: "4.3%",
                                  timing: "depuis hier",
                                  colorIcon: Colors.green,
                                  montant: "500k Fcfa",
                                ),
                                InfoCard(
                                  label: "Total visiteurs",
                                  icon1: CupertinoIcons
                                      .arrow_counterclockwise_circle,
                                  icon2: Icons.bar_chart,
                                  pourcentage: "1.8%",
                                  timing: "depuis hier",
                                  colorIcon: Colors.red,
                                  montant: "2040",
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PrimaryText(
                                    text: 'Détail abonnement',
                                    size: 25,
                                    fontWeight: FontWeight.w800),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 3,
                        ),
                        Container(
                          height: 180,
                          child: BarChartCopmponent(),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 5,
                        ),
                      ],
                    ),
                  ),
                )),
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 4,
                child: SafeArea(
                  child: Container(
                    width: double.infinity,
                    height: SizeConfig.screenHeight,
                    decoration: BoxDecoration(color: AppColors.secondaryBg),
                    child: SingleChildScrollView(
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      child: Column(
                        children: [
                          AppBarActionItems(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
