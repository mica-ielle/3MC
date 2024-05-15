import 'package:flutter/material.dart';
import 'package:troismconsulting/components/appBarActionItem.dart';
import 'package:troismconsulting/components/sideMenu.dart';
import 'package:troismconsulting/config/responsive.dart';
import 'package:troismconsulting/config/size_config.dart';
import 'package:troismconsulting/style/colors.dart';

class PacksPage extends StatefulWidget {
  PacksPage({super.key});

  @override
  State<PacksPage> createState() => _GestionAdminPageState();
}

class _GestionAdminPageState extends State<PacksPage> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  List<Map<String, dynamic>> forfait = [];

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _animateScroll());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _animateScroll() {
    final double start = 0.0;
    final double end = _scrollController.position.maxScrollExtent;
// Animation sur une période de 2 secondes
    final Duration duration = Duration(milliseconds: 1500);
    final Curve curve = Curves.easeInOut;

// Animer le défilement de gauche à droite
    _scrollController
        .animateTo(
      end, // Défilement partiel pour indiquer qu'il y a plus de contenu
      duration: duration,
      curve: curve,
    )
        .then((_) {
// Animer le défilement de retour à la position initiale
      _scrollController.animateTo(
        start,
        duration: duration,
        curve: curve,
      );
    });
  }

  void _ajouterPacksDialog() {
    TextEditingController nomController = TextEditingController();
    TextEditingController prixLimiteController = TextEditingController();
    TextEditingController DescriptionController = TextEditingController();
    TextEditingController DureeController = TextEditingController();
    String renouvelableSelectionne = 'OUI';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Ajouter un forfait',
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
                      Row(
                        children: [
                          Text(
                            "Prix Limite ",
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
                        controller: prixLimiteController,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                prixLimiteController.clear();
                              },
                              icon: Icon(Icons.disabled_by_default_outlined),
                            ),
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            hintText: 'prix limite'),
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
                        controller: DescriptionController,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                DescriptionController.clear();
                              },
                              icon: Icon(Icons.disabled_by_default_outlined),
                            ),
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            hintText: 'description'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Durée(en mois) ",
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
                        controller: DureeController,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                DureeController.clear();
                              },
                              icon: Icon(Icons.disabled_by_default_outlined),
                            ),
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            hintText: 'durée'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Renouvelable",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      InputDecorator(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: renouvelableSelectionne,
                            onChanged: (String? newValue) {
                              setState(() {
                                renouvelableSelectionne = newValue!;
                              });
                            },
                            items: <String>[
                              'OUI',
                              'NON',
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
                if (nomController.text.isNotEmpty &&
                    prixLimiteController.text.isNotEmpty &&
                    DescriptionController.text.isNotEmpty &&
                    DureeController.text.isNotEmpty) {
                  setState(() {
                    forfait.add({
                      'numero': forfait.length + 1,
                      'nom': nomController.text,
                      'prix_limite': prixLimiteController.text,
                      'description': DescriptionController.text,
                      'duree': DureeController.text,
                      'renouvelable': renouvelableSelectionne,
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

  void _supprimerPacksDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Supprimer un forfait',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Text('Voulez-vous vraiment supprimer ce forfait?'),
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
                  forfait.removeAt(
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

  void _editerPacksDialog(Map<String, dynamic> forfaitData, int index) {
    TextEditingController nomController =
        TextEditingController(text: forfaitData['nom']);
    TextEditingController prixLimiteController =
        TextEditingController(text: forfaitData['prix_limite']);
    TextEditingController DescriptionController =
        TextEditingController(text: forfaitData['description']);
    TextEditingController DureeController =
        TextEditingController(text: forfaitData['duree']);

    String renouvelableSelectionne = forfaitData['renouvelable'];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Éditer un forfait'),
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
                    Row(
                      children: [
                        Text(
                          "Prix limite ",
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
                      controller: prixLimiteController,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              prixLimiteController.clear();
                            },
                            icon: Icon(Icons.disabled_by_default_outlined),
                          ),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          hintText: 'prix limite'),
                    ),
                    SizedBox(
                      height: 10,
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
                      controller: DescriptionController,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              DescriptionController.clear();
                            },
                            icon: Icon(Icons.disabled_by_default_outlined),
                          ),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          hintText: 'description'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Duree ",
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
                      controller: DureeController,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              DureeController.clear();
                            },
                            icon: Icon(Icons.disabled_by_default_outlined),
                          ),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          hintText: 'duree'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Renouvelable ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    InputDecorator(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: renouvelableSelectionne,
                            onChanged: (String? newValue) {
                              setState(() {
                                renouvelableSelectionne = newValue!;
                              });
                            },
                            items: <String>[
                              'OUI',
                              'NON',
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
                if (nomController.text.isNotEmpty &&
                    prixLimiteController.text.isNotEmpty &&
                    DescriptionController.text.isNotEmpty &&
                    DureeController.text.isNotEmpty) {
                  setState(() {
// Mettez à jour les données de l'administrateur
                    forfait[index] = {
                      'numero': forfaitData['numero'],
                      'nom': nomController.text,
                      'prix_limite': prixLimiteController.text,
                      'description': DescriptionController.text,
                      'duree': DureeController.text,
                      'renouvelable': renouvelableSelectionne,
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
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Gestion des forfaits",
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
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                _ajouterPacksDialog();
              },
              child: Container(
                height: 50,
                width: 260,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  title: const Text(
                    'Créer un forfait',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: IconButton(
                    icon: const Icon(
                      Icons.add_circle_rounded,
                      size: 30,
                    ),
                    onPressed: _ajouterPacksDialog,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Scrollbar(
              controller: _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(label: Text('Numéro')),
                      DataColumn(label: Text('Nom')),
                      DataColumn(label: Text('Prix limite(FCFA)')),
                      DataColumn(label: Text('Description')),
                      DataColumn(label: Text('Durée(mois)')),
                      DataColumn(label: Text('Renouvelable')),
                      DataColumn(label: Text('Actions')),
                    ],
                    rows: List<DataRow>.generate(forfait.length, (index) {
                      return DataRow(
                        cells: <DataCell>[
                          DataCell(Text(forfait[index]['numero'].toString())),
                          DataCell(Text(forfait[index]['nom'])),
                          DataCell(Text(forfait[index]['prix_limite'])),
                          DataCell(Text(forfait[index]['description'])),
                          DataCell(Text(forfait[index]['duree'])),
                          DataCell(Text(forfait[index]['renouvelable'])),
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
                                    _editerPacksDialog(forfait[index], index);
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
                                  onPressed: () => _supprimerPacksDialog(index),
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
                                    Icons.more_vert,
                                    color: Colors.red,
                                  ),
                                  onPressed: () => _supprimerPacksDialog,
                                ),
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
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _ajouterAdminDialog,
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.green,
      // ),
    );
  }
}
