import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:troismconsulting/config/responsive.dart';

class Profilcard extends StatefulWidget {
  final String nomProfil;
  final String email;
  final String password;

  const Profilcard({
    super.key,
    required this.nomProfil,
    required this.email,
    required this.password,
  });

  @override
  State<Profilcard> createState() => _ProfilcardState();
}

class _ProfilcardState extends State<Profilcard> {
  final ImagePicker picker = ImagePicker();
  XFile? image;

  Future<void> pickImage() async {
    final XFile? selectedImage =
        await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = selectedImage;
    });
  }

  void modifierProfil() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
// Créez un TextEditingController pour chaque champ de texte
        TextEditingController nomController = TextEditingController();
        TextEditingController emailController = TextEditingController();
        TextEditingController passwordController = TextEditingController();
        bool isPasswordVisible = false;

        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: Text('Modifier mon compte'),
            content: SingleChildScrollView(
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
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
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
                        hintText: 'Votre nom'),
                  ),
                  const SizedBox(
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
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
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
                        hintText: 'Votre email'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Nouveau mot de passe ",
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
                  const SizedBox(
                    height: 10,
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
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.isDesktop(context)
          ? MediaQuery.of(context).size.height * 0.8
          : MediaQuery.of(context).size.height * 0.81,
      width: Responsive.isDesktop(context)
          ? MediaQuery.of(context).size.width * 0.5
          : MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: getImage(),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button(),
                IconButton(
                  onPressed: () async {
                    image = await picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      image = image;
                    });
                  },
                  icon: Icon(
                    Icons.add_a_photo,
                    color: Colors.teal,
                    size: 30,
                  ),
                ),
                Container(
                  child: IconButton(
                    onPressed: () {
                      modifierProfil();
                    },
                    icon: Icon(
                      CupertinoIcons.pencil_circle_fill,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              widget.nomProfil,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
            ),
            const Divider(
              indent: 50,
              endIndent: 50,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Email :",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(widget.email)
              ],
            ),
            const Divider(
              indent: 50,
              endIndent: 50,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Mot de passe :",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(widget.password),
              ],
            ),
            const Divider(
              indent: 50,
              endIndent: 50,
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                child: Center(
                    child: Text(
                  "Supprimer mon compte",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }

  ImageProvider getImage() {
    if (image != null) {
      return FileImage(File(image!.path));
    }
    return AssetImage("assets/man.jpeg");
  }

  Widget button() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 40,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.black,
              Colors.blueAccent,
            ],
          ),
        ),
        child: Center(
          child: Text(
            "Upload",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
