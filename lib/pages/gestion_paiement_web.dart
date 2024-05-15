import 'package:flutter/material.dart';
import 'package:troismconsulting/components/appBarActionItem.dart';
import 'package:troismconsulting/components/cardRetraitConsultant.dart';
import 'package:troismconsulting/components/sideMenu.dart';
import 'package:troismconsulting/config/responsive.dart';
import 'package:troismconsulting/config/size_config.dart';
import 'package:troismconsulting/style/colors.dart';
import 'package:intl/intl.dart';

class GestionPaiementWebPage extends StatefulWidget {
  GestionPaiementWebPage({super.key});

  @override
  State<GestionPaiementWebPage> createState() => _GestionPaiementWebPageState();
}

class _GestionPaiementWebPageState extends State<GestionPaiementWebPage> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  List<Map<String, dynamic>> operateurs = [];

  void _editerOperateurDialog(Map<String, dynamic> operateurData, int index) {
    TextEditingController nomController =
        TextEditingController(text: operateurData['nom_operateur']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Éditer un opérateur'),
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Form(
              child: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          "Nom ",
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
                      controller: nomController,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              nomController.clear();
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
                if (nomController.text.isNotEmpty) {
                  setState(() {
// Mettez à jour les données de l'administrateur
                    operateurs[index] = {
                      'numero': operateurData['numero'],
                      'nom_operateur': nomController.text,
                      'dateCreation': operateurData['dateCreation'],
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

  void _supprimerOperateurDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Supprimer un opérateur',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Text('Voulez-vous vraiment supprimer cet opérateur?'),
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
                  operateurs.removeAt(
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

  void _ajouterOperateurDialog() {
    TextEditingController nomController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Créer un opérateur',
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
                            "Nom ",
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
                        controller: nomController,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                nomController.clear();
                              },
                              icon: Icon(Icons.disabled_by_default_outlined),
                            ),
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            hintText: 'Nom'),
                      ),
                      SizedBox(
                        height: 20,
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
                if (nomController.text.isNotEmpty) {
                  setState(() {
                    operateurs.add({
                      'numero': operateurs.length + 1,
                      'nom_operateur': nomController.text,
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Gestion des Opérateurs",
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
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 17),
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
                    width: SizeConfig.screenWidth,
                    child: DataTable(
                      columns: const <DataColumn>[
                        DataColumn(label: Text('Numéro')),
                        DataColumn(label: Text('Nom opérateur')),
                        DataColumn(label: Text('Crée le')),
                        DataColumn(label: Text('Actions')),
                      ],
                      rows: List<DataRow>.generate(operateurs.length, (index) {
                        return DataRow(
                          cells: <DataCell>[
                            DataCell(
                                Text(operateurs[index]['numero'].toString())),
                            DataCell(Text(operateurs[index]['nom_operateur'])),
                            DataCell(Text(operateurs[index]['dateCreation'])),
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
                                      _editerOperateurDialog(
                                          operateurs[index], index);
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
                                        _supprimerOperateurDialog(index);
                                      }),
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
                                        Icons.more_vert,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        //  _supprimerAdminDialog,
                                      }),
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
                  _ajouterOperateurDialog();
                },
                child: Container(
                  height: 50,
                  width: 260,
                  color: Colors.yellow,
                  child: ListTile(
                    title: const Text(
                      'Créer un opérateur',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: IconButton(
                      icon: const Icon(
                        Icons.add_circle_rounded,
                        size: 30,
                      ),
                      onPressed: _ajouterOperateurDialog,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  "Demande de retrait des consultants",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      decoration: TextDecoration.underline),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CardRetraitConsultant(
                idRetrait: "1012",
                nomConsultant: "Kameni",
                nomClient: "3MC",
                dateDeDemande: "10/12/2024",
                montant: "50.000F",
              ),
              SizedBox(
                height: 10,
              ),
              CardRetraitConsultant(
                idRetrait: "2346",
                nomConsultant: "jean pierre",
                nomClient: "3MC",
                dateDeDemande: "10/04/2024",
                montant: "250.000F",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
