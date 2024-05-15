import 'package:flutter/material.dart';
import 'package:troismconsulting/components/textformfieldcomp.dart';
import 'package:troismconsulting/config/responsive.dart';
import 'package:troismconsulting/dashboard.dart';
import 'package:troismconsulting/dashboard_web.dart';
import 'package:troismconsulting/pages/sign_up_mobile.dart';
import 'package:troismconsulting/pages/sign_up_web.dart';

//interface pour les pages web
class LoginPageWeb extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  LoginPageWeb(
      {super.key,
      required this.usernameController,
      required this.passwordController});

  @override
  State<LoginPageWeb> createState() => _LoginPageWebState();
}

class _LoginPageWebState extends State<LoginPageWeb> {
  bool isPassword = true;

  @override
  void dispose() {
    // Arrêter l'écoute des TextEditingController
    widget.usernameController.dispose();
    widget.passwordController.dispose();
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
                mainAxisAlignment: MainAxisAlignment.start,
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormFieldPers3(
                    hintext: "username",
                    isPass: false,
                    keyboardType: TextInputType.text,
                    putEye: false,
                    isfilled: true,
                    backgroundTextformfield: Colors.white,
                    controller: widget.usernameController,
                    width: 681,
                    heigth: 60,
                    border: const BorderSide(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 30,
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
                      // BuildContext buildContext = context;
                      // final username = widget.usernameController.text;
                      // final password = widget.passwordController.text;

                      // // Appel du service d'authentification

                      // if (password.isEmpty ||
                      //     username.isEmpty) {
                      //   showDialog(
                      //     context: context,
                      //     builder: (context) => AlertDialog(
                      //       title: const Text('Erreur de connexion'),
                      //       content:
                      //           const Text('veillez remplir tous les champs.'),
                      //       actions: [
                      //         TextButton(
                      //           onPressed: () => Navigator.pop(context),
                      //           child: const Text('OK'),
                      //         ),
                      //       ],
                      //     ),
                      //   );
                      // }

                      // final isSuccess =
                      //     await AuthService.login(username, password);
                      // if (isSuccess) {
                      //   print('Firstname: $username');
                      //   print('Lastname: $password');

                      //   Navigator.pushReplacementNamed(context, AppRoutes.home);
                      // } else {
                      //   // ignore: use_build_context_synchronously
                      //   showDialog(
                      //     context: context,
                      //     builder: (context) => AlertDialog(
                      //       title: const Text('Erreur de connexion'),
                      //       content: const Text(
                      //           "nom d'tutilisateur ou mot de passe incorect"),
                      //       actions: [
                      //         TextButton(
                      //           onPressed: () => Navigator.pop(context),
                      //           child: const Text('OK'),
                      //         ),
                      //       ],
                      //     ),
                      //   );
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
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
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
                          "Don't have an account?",
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
                                      builder: (context) =>
                                          CreateAccountPageWeb(
                                              nomController:
                                                  TextEditingController(),
                                              prenomController:
                                                  TextEditingController(),
                                              emailController:
                                                  TextEditingController(),
                                              passwordController:
                                                  TextEditingController(),
                                              phoneController:
                                                  TextEditingController(),
                                              confirmPasswordController:
                                                  TextEditingController(),
                                              usernameController:
                                                  TextEditingController(),
                                              imageController:
                                                  TextEditingController())))
                              : Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CreateAccountPageMobile()));
                        },
                        child: const Text(
                          "Sign Up",
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
