import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:troismconsulting/config/responsive.dart';

class CardOffresBloquees extends StatelessWidget {
  final Image image;
  final String title;
  final String description;
  final String statut;
  final String budget;
  final String categorie;
  final IconData iconStatut;
  final String nbVue;
  final String nbPostulant;

  const CardOffresBloquees({
    super.key,
    required this.image,
    required this.title,
    required this.statut,
    required this.budget,
    required this.nbVue,
    required this.iconStatut,
    required this.nbPostulant,
    required this.description,
    required this.categorie,
  });

  @override
  Widget build(BuildContext context) {
    final commentaireController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 370,
            padding: const EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              color: const Color.fromARGB(255, 13, 7, 58),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Responsive.isDesktop(context)
                      ? Container(
                          height: 330,
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: image.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: image.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                  Responsive.isDesktop(context)
                      ? Container(
                          padding: const EdgeInsets.all(10),
                          height: 350,
                          width: MediaQuery.of(context).size.width / 2,
                          color: const Color.fromARGB(255, 13, 7, 58),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.yellow),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      iconStatut,
                                      color: Colors.red,
                                    ),
                                    Text(
                                      statut,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      " - ",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      budget,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      " - ",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      nbPostulant,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      " - ",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      nbVue,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                  ]),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                description,
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                      child: Text(
                                    "Catégorie :",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.yellow),
                                  )),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Center(
                                      child: Text(
                                    categorie,
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Text(
                                  "Commentaires :",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: commentaireController,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    hintText: "Commentaire",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          commentaireController.clear();
                                        },
                                        icon: Icon(
                                          Icons.highlight_remove_rounded,
                                          color: Colors.white,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.all(10),
                          height: 350,
                          width: MediaQuery.of(context).size.width,
                          color: const Color.fromARGB(255, 13, 7, 58),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.yellow),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    iconStatut,
                                    color: Colors.red,
                                  ),
                                  Text(
                                    statut,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    " - ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    budget,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    nbPostulant,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    " - ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    nbVue,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                description,
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                  child: Text(
                                "Catégorie :",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow),
                              )),
                              SizedBox(
                                height: 5,
                              ),
                              Center(
                                  child: Text(
                                categorie,
                                style: TextStyle(color: Colors.white),
                              )),
                              SizedBox(
                                height: 5,
                              ),
                              Center(
                                child: Text(
                                  "Commentaires :",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    hintText: "Commentaire",
                                    hintStyle: TextStyle(color: Colors.white),
                                    suffixIcon: Icon(
                                      Icons.highlight_remove_rounded,
                                      color: Colors.white,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                              ),
                            ],
                          ),
                        )
                ],
              ),
            ),
          ),
          Container(
              width: Get.width,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                color: const Color.fromARGB(255, 13, 7, 58),
              ),
              child: InkWell(
                onTap: () {},
                child: Responsive.isMobile(context)
                    ? Container(
                        height: 60,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.lock_open,
                              color: Colors.white,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Center(
                                child: Text(
                                  "Debloquer l'offre",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        height: 60,
                        width: Get.width / 2,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.lock_open,
                              color: Colors.white,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Center(
                                child: Text(
                                  "Debloquer l'offre",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              )),
        ],
      ),
    );
  }
}
