import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:troismconsulting/components/appBarActionItem.dart';
import 'package:troismconsulting/components/sideMenu.dart';
import 'package:troismconsulting/config/responsive.dart';
import 'package:troismconsulting/style/colors.dart';
import 'package:intl/intl.dart';

class AnnoncesWebPage extends StatefulWidget {
  AnnoncesWebPage({super.key});

  @override
  State<AnnoncesWebPage> createState() => _AnnoncesWebPageState();
}

class _AnnoncesWebPageState extends State<AnnoncesWebPage> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  List<Map<String, dynamic>> annonces = [];

  void _ajouterAnnonceDialog() {
    TextEditingController titreController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    String categorieSelectionne = 'Catégorie 1';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Créer un administrateur',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Form(
                child: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            "Titre ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
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
                            hintText: 'Titre'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Description ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
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
                            hintText: 'Description'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Catégorie ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      InputDecorator(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: categorieSelectionne,
                            onChanged: (String? newValue) {
                              setState(() {
                                categorieSelectionne = newValue!;
                              });
                            },
                            items: <String>[
                              'Catégorie 1',
                              'Catégorie 2',
                              'Catégorie 3',
                              'Toutes les catégories',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
              ),
              child: Text(
                'Enregistrer',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                if (titreController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty) {
                  setState(() {
                    annonces.add({
                      '#': annonces.length + 1,
                      'titre': titreController.text,
                      'description': descriptionController.text,
                      'categorie': categorieSelectionne,
                      'datePublication':
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

  void _supprimerAnnonceDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Supprimer une annonce',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Text('Voulez-vous vraiment supprimer cette annonce ?'),
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
              child: Text(
                'Supprimer',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                setState(() {
                  annonces.removeAt(
                      index); // Mettez à jour la liste des administrateurs
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _editerAnnonceDialog(Map<String, dynamic> annonceData, int index) {
    TextEditingController titreController =
        TextEditingController(text: annonceData['titre']);
    TextEditingController descriptionController =
        TextEditingController(text: annonceData['description']);
    String categorieSelectionne = annonceData['categorie'];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Éditer une annonce'),
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Form(
              child: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          "Titre ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                          hintText: 'Nom'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "description ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                          hintText: 'Email'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Catégorie",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    InputDecorator(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: categorieSelectionne,
                            onChanged: (String? newValue) {
                              setState(() {
                                categorieSelectionne = newValue!;
                              });
                            },
                            items: <String>[
                              'Catégorie 1',
                              'Catégorie 2',
                              'Catégorie 3',
                              'Toutes les catégories',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ))
                  ],
                ),
              ),
            );
          }),
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
              child: Text(
                'Enregistrer',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                if (titreController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty) {
                  setState(() {
// Mettez à jour les données de l'administrateur
                    annonces[index] = {
                      'numero': annonceData['#'],
                      'titre': titreController.text,
                      'description': descriptionController.text,
                      'categorie': categorieSelectionne,
                      'datePublication': annonceData['datePublication'],
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
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Liste des annonces",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                          contentPadding: EdgeInsets.only(top: 20, left: 10),
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
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
                    )),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  width: Get.width,
                  child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(label: Text('#')),
                      DataColumn(label: Text('Titre')),
                      // DataColumn(label: Text('Image')),
                      DataColumn(label: Text('Image')),
                      DataColumn(label: Text('Description')),
                      DataColumn(label: Text('Catégorie')),
                      DataColumn(label: Text('Date de publication')),
                      DataColumn(label: Text('Actions')),
                    ],
                    rows: List<DataRow>.generate(annonces.length, (index) {
                      return DataRow(
                        cells: <DataCell>[
                          DataCell(Text(annonces[index]['#'].toString())),
                          DataCell(Text(annonces[index]['titre'])),
                          DataCell(Image.asset(
                            "assets/man.jpeg",
                            width: 50,
                          )),
                          DataCell(Text(annonces[index]['description'])),
                          DataCell(Text(annonces[index]['categorie'])),
                          DataCell(Text(annonces[index]['datePublication'])),
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
                                    _editerAnnonceDialog(
                                        annonces[index], index);
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
                                      _supprimerAnnonceDialog(index);
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
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                _ajouterAnnonceDialog();
              },
              child: Container(
                height: 55,
                width: 260,
                color: Colors.yellow,
                child: ListTile(
                  title: const Text(
                    'Ajouter une annonce',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: IconButton(
                      icon: const Icon(
                        Icons.add_circle_rounded,
                        size: 30,
                      ),
                      onPressed: () {}
                      //  _ajouterAdminDialog,
                      ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
