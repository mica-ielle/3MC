import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:troismconsulting/components/textformfieldcomp.dart';
import 'package:troismconsulting/config/responsive.dart';
import 'package:troismconsulting/dashboard.dart';
import 'package:troismconsulting/dashboard_web.dart';
import 'package:troismconsulting/pages/login_mobile.dart';

class CreateAccountPageMobile extends StatefulWidget {
  const CreateAccountPageMobile({super.key});

  @override
  State<CreateAccountPageMobile> createState() =>
      _CreateAccountPageMobileState();
}

class _CreateAccountPageMobileState extends State<CreateAccountPageMobile> {
  bool isPassword = true;
  String? _selectedpays;
  final _isChecked = ValueNotifier<bool>(false);
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
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                "Create your Account",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
              backgroundTextformfield:
                  const Color.fromRGBO(217, 217, 217, 0.28),
              width: 336,
              heigth: 60,
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormFieldPers3(
              hintext: "Prenom",
              isPass: false,
              keyboardType: TextInputType.text,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  fillColor: const Color.fromRGBO(217, 217, 217, 0.28),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedpays = newValue;
                    });
                  },
                  radiusforfield: BorderRadius.circular(20),
                  heigth: 64,
                  width: 85,
                ),
                const SizedBox(
                  width: 1,
                ),
                TextFormFieldPers3(
                  hintext: "656155725",
                  isPass: false,
                  keyboardType: TextInputType.number,
                  putEye: false,
                  isfilled: true,
                  radiusforfield: BorderRadius.circular(1),
                  backgroundTextformfield:
                      const Color.fromRGBO(217, 217, 217, 0.28),
                  width: 175,
                  heigth: 60,
                ),
              ],
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
              height: 30,
            ),
            TextFormFieldPers3(
              hintext: "Confirm Password",
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
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                        text: 'I have read the  ',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      TextSpan(
                          text: 'terms',
                          style: const TextStyle(
                              color: Color.fromRGBO(97, 6, 133, 1),
                              fontSize: 14),
                          recognizer: TapGestureRecognizer()..onTap = () {}),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 12,
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
                "Sign up",
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
                "Or sign up with",
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
                const Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
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
            )
          ],
        ),
      ),
    );
  }
}
