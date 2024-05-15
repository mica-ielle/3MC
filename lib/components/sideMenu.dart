import 'package:flutter/material.dart';
import 'package:troismconsulting/config/responsive.dart';
import 'package:troismconsulting/config/size_config.dart';
import 'package:troismconsulting/dashboard.dart';
import 'package:troismconsulting/dashboard_web.dart';
import 'package:troismconsulting/pages/annonces.dart';
import 'package:troismconsulting/pages/annonces_web.dart';
import 'package:troismconsulting/pages/gestion_admin.dart';
import 'package:troismconsulting/pages/gestion_admin_web.dart';
import 'package:troismconsulting/pages/gestion_categorie.dart';
import 'package:troismconsulting/pages/gestion_categorie_web.dart';
import 'package:troismconsulting/pages/gestion_consultant.dart';
import 'package:troismconsulting/pages/gestion_consultant_web.dart';
import 'package:troismconsulting/pages/gestion_offres.dart';
import 'package:troismconsulting/pages/gestion_offres_web.dart';
import 'package:troismconsulting/pages/gestion_paiement.dart';
import 'package:troismconsulting/pages/gestion_paiement_web.dart';
import 'package:troismconsulting/pages/login_mobile.dart';
import 'package:troismconsulting/pages/login_web.dart';
import 'package:troismconsulting/pages/packs.dart';
import 'package:troismconsulting/pages/packs_web.dart';
import 'package:troismconsulting/style/colors.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsets.only(left: 20),
          width: 500,
          height: SizeConfig.screenHeight,
          decoration: const BoxDecoration(color: AppColors.secondaryBg),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 200,
                  padding: const EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/3M Consulting.png"))),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    Responsive.isMobile(context)
                        ? Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard()),
                          )
                        : Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashboardWeb()));
                  },
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Responsive.isMobile(context)
                                ? Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Dashboard()),
                                  )
                                : Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DashboardWeb()));
                          },
                          icon: const Icon(Icons.dashboard)),
                      const Text(
                        "Dashboard",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                ExpansionTile(
                  leading: const Icon(
                      Icons.admin_panel_settings), // Icône de gestionnaire
                  title: const Text(
                    'Administration',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  children: <Widget>[
                    ListTile(
                      title: const Text(
                        'gestion des catégories',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      onTap: () {
                        Responsive.isMobile(context)
                            ? Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        GestionCategoriePage()),
                              )
                            : Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        GestionCategorieWebPage()));
                      },
                    ),
                    ListTile(
                      title: const Text(
                        'gestion des admins',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      onTap: () {
                        Responsive.isMobile(context)
                            ? Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GestionAdminPage()),
                              )
                            : Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        GestionAdminWebPage()));
                      },
                    ),
                    ListTile(
                      title: const Text(
                        'gestion des offres',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      onTap: () {
                        Responsive.isMobile(context)
                            ? Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GestionOffrePage()),
                              )
                            : Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        GestionOffreWebPage()));
                      },
                    ),
                    ListTile(
                      title: const Text(
                        'gestion des paiements',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      onTap: () {
                        Responsive.isMobile(context)
                            ? Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        GestionPaiementPage()),
                              )
                            : Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        GestionPaiementWebPage()));
                      },
                    ),
                    ListTile(
                      title: const Text(
                        'gestion des consultants',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      onTap: () {
                        Responsive.isMobile(context)
                            ? Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        GestionConsultantPage()),
                              )
                            : Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        GestionConsultantWebPage()));
                      },
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Responsive.isMobile(context)
                        ? Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PacksPage()),
                          )
                        : Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PacksWebPage()));
                  },
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Responsive.isMobile(context)
                                ? Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PacksPage()),
                                  )
                                : Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PacksWebPage()));
                          },
                          icon: const Icon(Icons.money)),
                      const Text(
                        "Packs",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Responsive.isMobile(context)
                        ? Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AnnoncesPage()),
                          )
                        : Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AnnoncesWebPage()));
                  },
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Responsive.isMobile(context)
                                ? Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AnnoncesPage()),
                                  )
                                : Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AnnoncesWebPage()));
                          },
                          icon: const Icon(Icons.notifications)),
                      const Text(
                        "Annonces",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 80,
                ),
                InkWell(
                  onTap: () {
                    Responsive.isMobile(context)
                        ? Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPageMobile()))
                        : Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPageWeb(
                                usernameController: TextEditingController(),
                                passwordController: TextEditingController(),
                              ),
                            ));
                  },
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Responsive.isMobile(context)
                                ? Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LoginPageMobile()))
                                : Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPageWeb(
                                        usernameController:
                                            TextEditingController(),
                                        passwordController:
                                            TextEditingController(),
                                      ),
                                    ));
                          },
                          icon: const Icon(Icons.logout)),
                      const Text("Logout"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
