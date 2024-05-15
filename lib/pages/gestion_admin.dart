import 'package:flutter/material.dart';
import 'package:troismconsulting/components/appBarActionItem.dart';
import 'package:troismconsulting/components/sideMenu.dart';
import 'package:troismconsulting/config/responsive.dart';
import 'package:troismconsulting/config/size_config.dart';
import 'package:troismconsulting/style/colors.dart';
import 'package:intl/intl.dart';

class GestionAdminPage extends StatefulWidget {
  GestionAdminPage({super.key});

  @override
  State<GestionAdminPage> createState() => _GestionAdminPageState();
}

class _GestionAdminPageState extends State<GestionAdminPage> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  List<Map<String, dynamic>> admins = [];

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
    final Duration duration = Duration(seconds: 1);
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

  void _ajouterAdminDialog() {
    TextEditingController nomController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    String roleSelectionne = 'Utilisateur';
    bool isPasswordVisible = false;

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
                            "Email ",
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
                        controller: emailController,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                emailController.clear();
                              },
                              icon: Icon(Icons.disabled_by_default_outlined),
                            ),
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            hintText: 'Email'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Mot de passe ",
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
                        controller: passwordController,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                              icon: Icon(isPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            hintText: 'Mot de passe'),
                        obscureText: !isPasswordVisible,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Role ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      InputDecorator(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: roleSelectionne,
                            onChanged: (String? newValue) {
                              setState(() {
                                roleSelectionne = newValue!;
                              });
                            },
                            items: <String>[
                              'Administrateur',
                              'Utilisateur',
                              'super utilisateur'
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
                    emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty &&
                    roleSelectionne.isNotEmpty) {
                  setState(() {
                    admins.add({
                      'numero': admins.length + 1,
                      'nom': nomController.text,
                      'email': emailController.text,
                      'password': passwordController.text,
                      'role': roleSelectionne,
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

  void _supprimerAdminDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Supprimer un administrateur',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Text('Voulez-vous vraiment supprimer cet administrateur?'),
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
                  admins.removeAt(
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

  void _bloquerAdminDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Bloquer un administrateur',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Text('Voulez-vous vraiment Bloquer cet administrateur?'),
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
                'Bloquer',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _editerAdminDialog(Map<String, dynamic> adminData, int index) {
    TextEditingController nomController =
        TextEditingController(text: adminData['nom']);
    TextEditingController emailController =
        TextEditingController(text: adminData['email']);
    TextEditingController passwordController =
        TextEditingController(text: adminData['password']);
    String roleSelectionne = adminData['role'];
    bool isPasswordVisible = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Éditer un administrateur'),
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
                          "Email ",
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
                      controller: emailController,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              emailController.clear();
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
                    Row(
                      children: [
                        Text(
                          "Mot de passe ",
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
                      controller: passwordController,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            icon: Icon(isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          hintText: 'Mot de passe'),
                      obscureText: !isPasswordVisible,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Role ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    InputDecorator(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: roleSelectionne,
                            onChanged: (String? newValue) {
                              setState(() {
                                roleSelectionne = newValue!;
                              });
                            },
                            items: <String>[
                              'Administrateur',
                              'Utilisateur',
                              'super utilisateur'
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
                    emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty &&
                    roleSelectionne.isNotEmpty) {
                  setState(() {
// Mettez à jour les données de l'administrateur
                    admins[index] = {
                      'numero': adminData['numero'],
                      'nom': nomController.text,
                      'email': emailController.text,
                      'password': passwordController.text,
                      'role': roleSelectionne,
                      'dateCreation': adminData['dateCreation'],
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
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Gestion des Admins",
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
                _ajouterAdminDialog();
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
                    'Créer un admin',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: IconButton(
                    icon: const Icon(
                      Icons.add_circle_rounded,
                      size: 30,
                    ),
                    onPressed: _ajouterAdminDialog,
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
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('Role')),
                      DataColumn(label: Text('Date de Création')),
                      DataColumn(label: Text('Actions')),
                    ],
                    rows: List<DataRow>.generate(admins.length, (index) {
                      return DataRow(
                        cells: <DataCell>[
                          DataCell(Text(admins[index]['numero'].toString())),
                          DataCell(Text(admins[index]['nom'])),
                          DataCell(Text(admins[index]['email'])),
                          DataCell(Text(admins[index]['role'])),
                          DataCell(Text(admins[index]['dateCreation'])),
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
                                    _editerAdminDialog(admins[index], index);
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
                                  onPressed: () => _supprimerAdminDialog(index),
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
                                  onPressed: () => _bloquerAdminDialog(index),
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
