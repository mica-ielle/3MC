import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:troismconsulting/components/appBarActionItem.dart';
import 'package:troismconsulting/components/consultantCard.dart';
import 'package:troismconsulting/components/sideMenu.dart';
import 'package:troismconsulting/config/responsive.dart';
import 'package:troismconsulting/models/model_consultant.dart';
import 'package:troismconsulting/style/colors.dart';

class GestionConsultantWebPage extends StatefulWidget {
  GestionConsultantWebPage({super.key});

  @override
  State<GestionConsultantWebPage> createState() =>
      _GestionConsultantWebPageState();
}

class _GestionConsultantWebPageState extends State<GestionConsultantWebPage> {
  Consultant consultantExemple1 = Consultant(
    imageProfil: Image.asset(
        'assets/man.jpeg'), // Remplacez par le chemin de votre image
    iconeVerification: Icons.verified, // Icône pour la vérification
    iconeDevelopper: CupertinoIcons
        .chevron_left_slash_chevron_right, // Icône pour le développeur (optionnel)
    statutVerification: 'En attente de vérification', // Statut de vérification
    typeDevelopper: 'Javascript Developper', // Type de développeur (optionnel)
    nomConsultant: 'John Doe', // Nom du consultant
  );
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final Map<String, List<String>> categories = {
    'Consultant': [
      'Consultant verifié',
      'Consultant non verifié',
    ],
  };
  Widget _buildSubCategories(String category) {
    return Column(
      children: categories[category]!.map((subCategory) {
        return Container(
          margin: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ListTile(
            title: Text(subCategory),
            onTap: () {
// Logique pour gérer le tap sur une sous-catégorie
            },
          ),
        );
      }).toList(),
    );
  }

  bool _isFilterVisible = false;

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
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Liste des Consultants',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Container(
                  color: Colors.grey.withOpacity(0.2),
                  child: IconButton(
                    icon: Icon(
                      Icons.filter_list,
                    ),
                    onPressed: () {
                      setState(() {
                        _isFilterVisible =
                            !_isFilterVisible; // Affiche ou cache les filtres
                      });
                    },
                  ),
                ),
                title: Text('Filtres'),
              ),
              if (_isFilterVisible)
                ...categories.keys.map((category) {
                  return ExpansionTile(
                    title: Text(category),
                    leading: Icon(
                        Icons.category), // Remplacez par l'icône de votre choix
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Wrap(
                          spacing: 8.0, // Espace horizontal entre les chips
                          runSpacing:
                              4.0, // Espace vertical entre les lignes de chips
                          children: categories[category]!.map((subCategory) {
                            return Chip(
                              label: Text(subCategory),
                              backgroundColor: Colors.white,
                              shape: StadiumBorder(side: BorderSide()),
                              onDeleted: () {
                                // Logique pour gérer la suppression d'une sous-catégorie
                              },
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  );
                }).toList(),
              Row(
                children: [
                  Consultantcard(consultant: consultantExemple1),
                  SizedBox(
                    width: 20,
                  ),
                  Consultantcard(consultant: consultantExemple1),
                  SizedBox(
                    width: 20,
                  ),
                  Consultantcard(consultant: consultantExemple1),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
