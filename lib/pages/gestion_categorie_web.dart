import 'package:flutter/material.dart';
import 'package:troismconsulting/components/appBarActionItem.dart';
import 'package:troismconsulting/components/sideMenu.dart';
import 'package:troismconsulting/config/responsive.dart';
import 'package:troismconsulting/config/size_config.dart';
import 'package:troismconsulting/style/colors.dart';
import 'package:intl/intl.dart';

class GestionCategorieWebPage extends StatefulWidget {
  GestionCategorieWebPage({super.key});

  @override
  State<GestionCategorieWebPage> createState() =>
      _GestionCategorieWebPageState();
}

class _GestionCategorieWebPageState extends State<GestionCategorieWebPage> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  List<Map<String, dynamic>> categories = [];

  void _ajouterCategorie() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
// Créez un TextEditingController pour chaque champ de texte
        TextEditingController titreController = TextEditingController();
        TextEditingController descriptionController = TextEditingController();

        return AlertDialog(
          title: Text('Ajouter une catégorie'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      "Nom de la catégorie ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "*",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: titreController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          titreController.clear();
                        },
                        icon: Icon(Icons.disabled_by_default_outlined),
                      ),
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      hintText: 'Titre de la catégorie'),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Description ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "*",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          descriptionController.clear();
                        },
                        icon: Icon(Icons.disabled_by_default_outlined),
                      ),
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      hintText: 'Description'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: Text(
                'Annuler',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              child: Text(
                'Enregistrer',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                if (titreController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty) {
                  setState(() {
                    categories.add({
                      'numero': categories.length + 1,
                      'titre': titreController.text,
                      'description': descriptionController.text,
// La description n'est pas affichée mais vous pouvez la stocker si nécessaire
                      'dateCreation':
                          DateFormat('dd/MM/yyyy').format(DateTime.now()),
                    });
                  });
                  Navigator.of(context).pop();
                } else {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.white,
                      content: Text(
                        'Un ou plusieurs champs sont vides !, Veuillez remplir tous les champs.',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w900),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _editerCategorieDialog(Map<String, dynamic> categorieData, int index) {
    TextEditingController titreController =
        TextEditingController(text: categorieData['titre']);
    TextEditingController descriptionController =
        TextEditingController(text: categorieData['description']);
// Ajoutez d'autres contrôleurs si nécessaire

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Éditer une catégorie',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Form(
            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Titre Catégorie;"),
                  TextFormField(
                    controller: titreController,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            titreController.clear();
                          },
                          icon: Icon(Icons.disabled_by_default_outlined),
                        ),
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        hintText: 'Titre de la catégorie'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Description Catégorie;"),
                  TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            descriptionController.clear();
                          },
                          icon: Icon(Icons.disabled_by_default_outlined),
                        ),
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        hintText: 'Description de la catégorie'),
                  ),
// Ajoutez d'autres champs de formulaire si nécessaire
                ],
              ),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(
                'Annuler',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              child: Text('Enregistrer', style: TextStyle(color: Colors.black)),
              onPressed: () {
                if (titreController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty) {
                  setState(() {
// Mettez à jour les données de la catégorie
                    categories[index] = {
                      'numero': categorieData['numero'],
                      'titre': titreController.text,
                      'description': descriptionController.text,
                      'dateCreation': categorieData['dateCreation'],

// Mettez à jour d'autres attributs si nécessaire
                    };
                  });
                  Navigator.of(context).pop();
                } else {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.white,
                      content: Text(
                        'Un ou plusieurs champs sont vides !, Veuillez remplir tous les champs.',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w900),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _supprimerCategorieDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Marketing Digital',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          content: Text(
            'Voulez-vous vraiment supprimer cette catégorie?',
            style: TextStyle(fontSize: 16),
          ),
          actions: <Widget>[
            Container(
              color: Colors.black,
              child: TextButton(
                child: Text(
                  'Annuler',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Container(
              color: Colors.yellow,
              child: TextButton(
                child: Text(
                  'Supprimer',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    categories.removeAt(index);
                  });
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

//  DateFormat('dd/MM/yyyy').format(DateTime.now()),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _drawerKey,
      drawer: const SizedBox(width: 250, child: SideMenu()),
      appBar: Responsive.isDesktop(context) || !Responsive.isDesktop(context)
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
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Gestion des catégories",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              hintText: 'Rechercher...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    20.0), // Bordures circulaires
                              ),
                              contentPadding:
                                  EdgeInsets.only(top: 20, left: 10),
                              enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.yellow,
                        ),
                        child: Center(
                            child: Text(
                          "Rechercher",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 17),
                        )),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    _ajouterCategorie();
                  },
                  child: Container(
                    height: 50,
                    width: 260,
                    color: Colors.yellow,
                    child: ListTile(
                      title: const Text(
                        'Nouvelle Catégorie',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      leading: IconButton(
                        icon: const Icon(
                          Icons.add_circle_rounded,
                          size: 30,
                        ),
                        onPressed: _ajouterCategorie,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      width: SizeConfig.screenWidth,
                      child: DataTable(
                        columns: const <DataColumn>[
                          DataColumn(label: Text('Numéro')),
                          DataColumn(label: Text('Titre Catégorie')),
                          DataColumn(label: Text('Crée le')),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows:
                            List<DataRow>.generate(categories.length, (index) {
                          return DataRow(
                            cells: <DataCell>[
                              DataCell(
                                  Text(categories[index]['numero'].toString())),
                              DataCell(Text(categories[index]['titre'])),
                              DataCell(Text(categories[index]['dateCreation'])),
                              DataCell(Row(
                                children: <Widget>[
                                  Container(
                                    height: 40,
                                    width: 40,
                                    color: Colors.grey.withOpacity(0.2),
                                    child: IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {
                                        // Logique pour éditer l'administrateur
                                        _editerCategorieDialog(
                                            categories[index], index);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    color: Colors.grey.withOpacity(0.2),
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          _supprimerCategorieDialog(index);
                                        }),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              )),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
