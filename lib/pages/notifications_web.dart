import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:troismconsulting/components/appBarActionItem.dart';
import 'package:troismconsulting/components/notificationCardOffre.dart';
import 'package:troismconsulting/components/notificationCardRetrait.dart';
import 'package:troismconsulting/components/sideMenu.dart';
import 'package:troismconsulting/config/responsive.dart';
import 'package:troismconsulting/pages/gestion_offres.dart';
import 'package:troismconsulting/pages/gestion_offres_web.dart';
import 'package:troismconsulting/pages/gestion_paiement.dart';
import 'package:troismconsulting/pages/gestion_paiement_web.dart';
import 'package:troismconsulting/style/colors.dart';

class NotificationsWebPage extends StatefulWidget {
  const NotificationsWebPage({super.key});

  @override
  State<NotificationsWebPage> createState() => _NotificationsWebPageState();
}

class _NotificationsWebPageState extends State<NotificationsWebPage> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _drawerKey,
      drawer: const SizedBox(width: 250, child: SideMenu()),
      appBar: !Responsive.isDesktop(context) || Responsive.isDesktop(context)
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
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Notifications",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              notificationCard(
                titreNotif: "Retrait d'argent",
                nomConcernantNotif: "Kouokam Loic",
                montantRetrait: "200 000",
                moyenRetrait: "Orange Money",
                dateRetrait: "12/12/2023",
                nomPageVers: "Gestion des paiements",
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GestionPaiementWebPage()));
                },
              ),
              SizedBox(
                height: 10,
              ),
              notificationCardOffre(
                titreNotif: "Offre expirée",
                numeroOffre: "3453",
                dateExpiration: "ce jour",
                nomPageVers: "Gestion des offres",
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GestionOffreWebPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
