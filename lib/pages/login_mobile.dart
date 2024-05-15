import 'package:flutter/material.dart';
import 'package:troismconsulting/components/textformfieldcomp.dart';
import 'package:troismconsulting/config/responsive.dart';
import 'package:troismconsulting/dashboard.dart';
import 'package:troismconsulting/dashboard_web.dart';
import 'package:troismconsulting/pages/sign_up_mobile.dart';

//interface de connexion pour les ecrans mobile
class LoginPageMobile extends StatefulWidget {
  const LoginPageMobile({super.key});

  @override
  State<LoginPageMobile> createState() => _LoginPageMobileState();
}

class _LoginPageMobileState extends State<LoginPageMobile> {
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 34, right: 34),
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
                Expanded(
                  child: Text(
                    "Login to your Account",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormFieldPers3(
              hintext: "Email",
              isPass: false,
              keyboardType: TextInputType.emailAddress,
              putEye: false,
              isfilled: true,
              backgroundTextformfield:
                  const Color.fromRGBO(217, 217, 217, 0.28),
              width: 336,
              heigth: 60,
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
              backgroundTextformfield:
                  const Color.fromRGBO(217, 217, 217, 0.28),
              width: 336,
              heigth: 60,
              typePassword: () {
                setState(() {
                  isPassword = !isPassword;
                });
              },
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {},
              child: const Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                      fontSize: 12.0, color: Color.fromRGBO(97, 6, 133, 1)),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                Responsive.isMobile(context)
                    ? Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Dashboard()))
                    : Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardWeb()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                fixedSize: const Size(335, 60),
                elevation: 0.0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              child: const Text(
                "Sign In",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              color: Color.fromRGBO(97, 88, 88, 0.78),
              indent: 50,
              endIndent: 50,
            ),
            const SizedBox(
              height: 15,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Or sign in with",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {},
              child: Center(
                  child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: Image.asset(
                  "assets/google.png",
                  width: 210,
                  height: 40,
                ),
              )),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Flexible(
                  child: Text(
                    "Don't have an account?",
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateAccountPageMobile()));
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
            )
          ],
        ),
      ),
    );
  }
}
