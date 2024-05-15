// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:troismconsulting/components/textformfieldcomp.dart';
import 'package:troismconsulting/config/responsive.dart';
import 'package:troismconsulting/dashboard.dart';
import 'package:troismconsulting/dashboard_web.dart';
import 'package:troismconsulting/pages/login_mobile.dart';
import 'package:troismconsulting/pages/login_web.dart';

class CreateAccountPageWeb extends StatefulWidget {
  final TextEditingController nomController;
  final TextEditingController prenomController;
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController imageController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  CreateAccountPageWeb({
    Key? key,
    required this.nomController,
    required this.prenomController,
    required this.emailController,
    required this.usernameController,
    required this.imageController,
    required this.phoneController,
    required this.passwordController,
    required this.confirmPasswordController,
  }) : super(key: key);

  @override
  State<CreateAccountPageWeb> createState() => _CreateAccountPageWebState();
}

class _CreateAccountPageWebState extends State<CreateAccountPageWeb> {
  bool isPassword = true;
  String? _selectedpays;
  bool isLoading = false;
  final _isChecked = ValueNotifier<bool>(false);
  @override
  void dispose() {
    // Arrêter l'écoute des TextEditingController
    widget.usernameController.dispose();
    widget.passwordController.dispose();
    widget.confirmPasswordController.dispose();
    widget.emailController.dispose();
    widget.imageController.dispose();
    widget.nomController.dispose();
    widget.phoneController.dispose();
    widget.prenomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/chefsconsulting.jpeg"),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(247, 252, 3, 0.55),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.73,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(27)),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 170, right: 170),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 65),
                    child: Center(
                      child: Image.asset(
                        "assets/3M Consulting.png",
                        width: 200,
                        height: 35,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Create Your Account",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormFieldPers3(
                    hintext: "Nom",
                    isPass: false,
                    keyboardType: TextInputType.text,
                    putEye: false,
                    isfilled: true,
                    backgroundTextformfield: Colors.white,
                    width: 681,
                    heigth: 60,
                    border: const BorderSide(color: Colors.grey),
                    controller: widget.nomController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormFieldPers3(
                    hintext: "Prenom",
                    isPass: false,
                    keyboardType: TextInputType.text,
                    putEye: false,
                    isfilled: true,
                    backgroundTextformfield: Colors.white,
                    width: 681,
                    heigth: 60,
                    border: const BorderSide(color: Colors.grey),
                    controller: widget.prenomController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormFieldPers3(
                    hintext: "Email",
                    isPass: false,
                    keyboardType: TextInputType.emailAddress,
                    putEye: false,
                    isfilled: true,
                    backgroundTextformfield: Colors.white,
                    width: 681,
                    heigth: 60,
                    border: const BorderSide(color: Colors.grey),
                    controller: widget.emailController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormFieldPers3(
                    hintext: "Username",
                    isPass: false,
                    keyboardType: TextInputType.text,
                    putEye: false,
                    isfilled: true,
                    backgroundTextformfield: Colors.white,
                    width: 681,
                    heigth: 60,
                    border: const BorderSide(color: Colors.grey),
                    controller: widget.usernameController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormFieldPers4(
                    onImageSelected: (file) {
                      // Mettez à jour le contrôleur d'image ou effectuez d'autres actions nécessaires avec le fichier sélectionné
                      widget.imageController.text = file.path;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 15,
                    children: [
                      DropdownFormFieldPers1(
                        items: const [
                          "+93",
                          "+237",
                          "+355",
                          "+213",
                          "+1",
                          "+376",
                          "+244",
                          "+54",
                          "+374",
                          "+297",
                          "+247",
                          "+61",
                          "+43",
                          "+994",
                          "+973",
                          "+880",
                          "+375",
                          "+32",
                          "+501",
                          "+229",
                          "+975"
                        ],
                        hintext: "+237",
                        isfill: true,
                        fillColor: Colors.white,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedpays = newValue;
                          });
                        },
                        radiusforfield: BorderRadius.circular(20),
                        width: 85,
                        border: BorderSide(color: Colors.grey),
                      ),
                      TextFormFieldPers3(
                        controller: widget.phoneController,
                        hintext: "656155725",
                        isPass: false,
                        keyboardType: TextInputType.number,
                        putEye: false,
                        isfilled: true,
                        radiusforfield: BorderRadius.circular(10),
                        backgroundTextformfield: Colors.white,
                        width: 550,
                        border: BorderSide(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormFieldPers3(
                    hintext: "Password",
                    isPass: isPassword,
                    keyboardType: TextInputType.visiblePassword,
                    putEye: true,
                    isfilled: true,
                    backgroundTextformfield: Colors.white,
                    width: 681,
                    heigth: 60,
                    border: const BorderSide(color: Colors.grey),
                    controller: widget.passwordController,
                    typePassword: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormFieldPers3(
                    hintext: "Confirm Password",
                    isPass: isPassword,
                    keyboardType: TextInputType.visiblePassword,
                    putEye: true,
                    isfilled: true,
                    backgroundTextformfield: Colors.white,
                    width: 681,
                    heigth: 60,
                    border: const BorderSide(color: Colors.grey),
                    controller: widget.confirmPasswordController,
                    typePassword: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ValueListenableBuilder<bool>(
                        valueListenable: _isChecked,
                        builder: (context, isChecked, _) {
                          return Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) {
                                _isChecked.value = value!;
                              },
                              checkColor: Colors.white,
                              activeColor: Color.fromRGBO(97, 6, 133, 1));
                        },
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Flexible(
                        child: Text(
                          "I have read the ",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.pushReplacementNamed(
                          //     context, AppRoutes.login);
                        },
                        child: const Text(
                          "terms",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(97, 6, 133, 1)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      Responsive.isDesktop(context)
                          ? Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashboardWeb()))
                          : Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard()));
                      // setState(() {
                      //   isLoading = true;
                      // });
                      // BuildContext buildContext = context;
                      // if (widget.nomController.text.isEmpty ||
                      //     widget.prenomController.text.isEmpty ||
                      //     widget.emailController.text.isEmpty ||
                      //     widget.usernameController.text.isEmpty ||
                      //     widget.phoneController.text.isEmpty ||
                      //     widget.passwordController.text.isEmpty ||
                      //     widget.confirmPasswordController.text.isEmpty) {
                      //   showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return AlertDialog(
                      //         title: const Text('Erreur'),
                      //         content: const Text(
                      //             'Veuillez remplir tous les champs.'),
                      //         actions: <Widget>[
                      //           TextButton(
                      //             onPressed: () {
                      //               Navigator.of(context).pop();
                      //               setState(() {
                      //                 isLoading = false;
                      //               });
                      //             },
                      //             child: const Text('OK'),
                      //           ),
                      //         ],
                      //       );
                      //     },
                      //   );
                      //   return; // Arrête l'exécution de la fonction
                      // }
                      // // Vérification de la case à cocher
                      // if (!_isChecked.value) {
                      //   showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return AlertDialog(
                      //         title: const Text('Erreur'),
                      //         content: const Text(
                      //           'Veuillez accepter les termes et conditions de confidentialité.',
                      //         ),
                      //         actions: <Widget>[
                      //           TextButton(
                      //             onPressed: () {
                      //               Navigator.of(context).pop();
                      //               setState(() {
                      //                 isLoading = false;
                      //               });
                      //             },
                      //             child: const Text('OK'),
                      //           ),
                      //         ],
                      //       );
                      //     },
                      //   );
                      //   return; // Arrête l'exécution de la fonction
                      // }

                      // // Vérification de l'email
                      // RegExp emailRegex =
                      //     RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                      // if (!emailRegex.hasMatch(widget.emailController.text)) {
                      //   showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return AlertDialog(
                      //         title: const Text('Erreur'),
                      //         content: const Text(
                      //             'Veuillez entrer une adresse email valide.'),
                      //         actions: <Widget>[
                      //           TextButton(
                      //             onPressed: () {
                      //               Navigator.of(context).pop();
                      //               setState(() {
                      //                 isLoading = false;
                      //               });
                      //             },
                      //             child: const Text('OK'),
                      //           ),
                      //         ],
                      //       );
                      //     },
                      //   );
                      //   return; // Arrête l'exécution de la fonction
                      // }

                      // // Vérification des mots de passe
                      // if (widget.passwordController.text !=
                      //     widget.confirmPasswordController.text) {
                      //   showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return AlertDialog(
                      //         title: const Text('Erreur'),
                      //         content: const Text(
                      //             'Les mots de passe ne correspondent pas.'),
                      //         actions: <Widget>[
                      //           TextButton(
                      //             onPressed: () {
                      //               Navigator.of(context).pop();
                      //               setState(() {
                      //                 isLoading = false;
                      //               });
                      //             },
                      //             child: const Text('OK'),
                      //           ),
                      //         ],
                      //       );
                      //     },
                      //   );
                      //   return; // Arrête l'exécution de la fonction
                      // }

                      // try {
                      //   print('Firstname: ${widget.nomController.text}');
                      //   print('Lastname: ${widget.prenomController.text}');
                      //   print('Email: ${widget.emailController.text}');
                      //   print('Password: ${widget.passwordController.text}');
                      //   print('Phone: ${widget.phoneController.text}');
                      //   print('Username: ${widget.usernameController.text}');
                      //   print('Picture path: ${widget.imageController.text}');

                      //   var accountId = await registerUser(
                      //     User(
                      //       firstName: widget.nomController.text,
                      //       lastName: widget.prenomController.text,
                      //       email: widget.emailController.text,
                      //       password: widget.passwordController.text,
                      //       phonePrefix: _selectedpays!,
                      //       phone: widget.phoneController.text,
                      //       username: widget.usernameController.text,
                      //       picture: File(widget.imageController
                      //           .text), // Utilisez le fichier d'image sélectionné
                      //     ),
                      //     picture: widget.imageController.text.isNotEmpty
                      //         ? File(widget.imageController.text)
                      //         : null,
                      //   );

                      //   Navigator.pushNamed(context, AppRoutes.verifyAccount, arguments: {'accountId': accountId});
                      // } catch (e) {
                      //   if (e is FormatException) {
                      //     print('Erreur de format: $e');
                      //   } else if (e is HttpException) {
                      //     print('Erreur HTTP: $e');
                      //   } else {
                      //     print('Erreur inattendue: $e');
                      //   }
                      // } finally {
                      //   // Mettre à jour isLoading à false pour arrêter le CircularProgressIndicator
                      //   setState(() {
                      //     isLoading = false;
                      //   });
                      // }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      fixedSize: const Size(681, 60),
                      elevation: 0.0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    child: isLoading
                        ? CircularProgressIndicator(
                            color: Colors.black, strokeWidth: 4)
                        : const Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Flexible(
                        child: Text(
                          "You have Already An Account?",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w500),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Responsive.isDesktop(context)
                              ? Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPageWeb(
                                            usernameController:
                                                TextEditingController(),
                                            passwordController:
                                                TextEditingController(),
                                          )))
                              : Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPageMobile()));
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(97, 6, 133, 1)),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Color.fromRGBO(97, 88, 88, 0.78),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Or"),
                      ),
                      Expanded(
                        child: Divider(
                          color: Color.fromRGBO(97, 88, 88, 0.78),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      fixedSize: const Size(324, 55),
                      elevation: 0.0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          side: BorderSide(color: Colors.grey)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/google.png",
                          width: 22,
                          height: 22,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const Expanded(
                            child: Text(
                          "log in with google",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pop(context);
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.blue,
                  //     fixedSize: const Size(153, 46),
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(100)),
                  //   ),
                  //   child: const Text(
                  //     "Retour",
                  //     style: TextStyle(color: Colors.white, fontSize: 15),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
