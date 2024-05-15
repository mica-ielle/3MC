import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:file_picker/file_picker.dart';

//widget reutilisable pour la textformfield avec des champs supplementaires comme le keyboardtype et le labeltext
class TextFormFieldPers1 extends StatelessWidget {
  bool isPass;
  String hintext;
  int? maxlenght;
  bool putEye;
  TextInputType keyboardType;
  String labeltext;
  TextEditingController? controller;
  Function? typePassword;
  Color colorlabel;
  Color backgroundTextformfield;
  BorderSide borderSidetextformfield;
  TextFormFieldPers1(
      {super.key,
      required this.isPass,
      required this.keyboardType,
      required this.labeltext,
      required this.hintext,
      this.controller,
      this.maxlenght,
      required this.putEye,
      this.typePassword,
      required this.backgroundTextformfield,
      required this.colorlabel,
      required this.borderSidetextformfield});

  @override
  Widget build(BuildContext context) {
    return Container(
        //margin: const EdgeInsets.only(left: 14, right: 14),

        child: Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            labeltext,
            style: TextStyle(
                fontFamily: 'popping', color: colorlabel, fontSize: 10),
          ),
        ),
        TextFormField(
          keyboardType: keyboardType,
          maxLength: maxlenght ?? 20,
          controller: controller,
          obscureText: isPass,
          validator: (value) {
            value = value!.trim();
            if (value.isEmpty) {
              return " veillez remplir ce champ";
            }
          },
          style: const TextStyle(color: Colors.black, letterSpacing: 1.2),
          decoration: InputDecoration(
              errorStyle: const TextStyle(height: 0),
              fillColor: backgroundTextformfield,
              filled: true,
              constraints: const BoxConstraints(minHeight: 15),
              suffixIcon: putEye
                  ? IconButton(
                      icon: const Icon(Icons.remove_red_eye),
                      onPressed: () {
                        typePassword!();
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: borderSidetextformfield,
              ),
              counterText: "",
              hintText: hintext,
              //contentPadding: const EdgeInsets.only(left: 90.0),
              hintStyle: const TextStyle(letterSpacing: 0.0, fontSize: 10)),
        ),
      ],
    ));
  }
}

//widget reutilisable pour la textformfield avec des champs supplementaires comme la possibilité  d'ajuster la longeur et la largeur et le labeltext
// ignore: must_be_immutable
class TextFormFieldPers2 extends StatelessWidget {
  bool isPass;
  String hintext;

  bool putEye;
  TextInputType keyboardType;
  String labeltext;
  TextEditingController? controller;
  Function? typePassword;
  Color? colorlabel;
  Color? backgroundTextformfield;

  bool? isfilled;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? heigth;
  final Decoration? boxDecoration;
  BorderRadius? radiusforfield;
  final EdgeInsetsGeometry? paddingforfield;
  TextFormFieldPers2({
    super.key,
    required this.isPass,
    required this.keyboardType,
    required this.labeltext,
    required this.hintext,
    this.controller,
    this.isfilled,
    required this.putEye,
    this.typePassword,
    this.backgroundTextformfield,
    this.colorlabel,
    this.margin,
    this.heigth,
    this.width,
    this.boxDecoration,
    this.radiusforfield,
    this.paddingforfield,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        width: width,
        height: heigth,
        decoration: boxDecoration,
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                labeltext,
                style: TextStyle(
                    fontFamily: 'Poppins', color: colorlabel, fontSize: 13),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: keyboardType,
              controller: controller,
              obscureText: isPass,
              validator: (value) {
                value = value!.trim();
                if (value.isEmpty) {
                  return " veillez remplir ce champ";
                }
              },
              style: const TextStyle(color: Colors.black, letterSpacing: 1.2),
              decoration: InputDecoration(
                  errorStyle: const TextStyle(height: 0),
                  fillColor: backgroundTextformfield,
                  filled: isfilled,
                  contentPadding: paddingforfield,
                  suffixIcon: putEye
                      ? IconButton(
                          icon: const Icon(Icons.remove_red_eye),
                          onPressed: () {
                            typePassword!();
                          },
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: radiusforfield ?? BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  counterText: "",
                  hintText: hintext,
                  //contentPadding: const EdgeInsets.only(left: 90.0),
                  hintStyle: const TextStyle(letterSpacing: 0.0, fontSize: 13)),
            ),
          ],
        ));
  }
}

//widget reutilisable pour la textformfield avec des champs supplementaires comme la possibilité  d'ajuster la longeur et la largeur et le labeltext
// ignore: must_be_immutable
class TextFormFieldPers3 extends StatelessWidget {
  bool isPass;
  String hintext;

  bool putEye;
  TextInputType keyboardType;
  TextEditingController? controller;
  Function? typePassword;

  Color? backgroundTextformfield;

  bool? isfilled;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? heigth;
  final Decoration? boxDecoration;
  BorderRadius? radiusforfield;
  final EdgeInsetsGeometry? paddingforfield;
  BorderSide? border;
  TextFormFieldPers3({
    super.key,
    required this.isPass,
    required this.keyboardType,
    required this.hintext,
    this.controller,
    this.isfilled,
    required this.putEye,
    this.typePassword,
    this.backgroundTextformfield,
    this.margin,
    this.heigth,
    this.width,
    this.boxDecoration,
    this.radiusforfield,
    this.paddingforfield,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        width: width,
        height: heigth,
        decoration: boxDecoration,
        child: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: keyboardType,
              controller: controller,
              obscureText: isPass,
              validator: (value) {
                value = value!.trim();
                if (value.isEmpty) {
                  return " veillez remplir ce champ";
                }
              },
              style: const TextStyle(color: Colors.black, letterSpacing: 1.2),
              decoration: InputDecoration(
                  errorStyle: const TextStyle(height: 0),
                  fillColor: backgroundTextformfield,
                  filled: isfilled,
                  contentPadding: paddingforfield,
                  suffixIcon: putEye
                      ? InkWell(
                          onTap: () {
                            typePassword!();
                          },
                          child: Image.asset("assets/oeil.png",
                              width: 19, height: 19),
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: radiusforfield ?? BorderRadius.circular(10),
                    borderSide: border ?? BorderSide.none,
                  ),
                  counterText: "",
                  hintText: hintext,
                  hintStyle: const TextStyle(letterSpacing: 0.0, fontSize: 13)),
            ),
          ],
        ));
  }
}

// widget reutilisable pour la liste deroulante de valeur
class DropdownFormFieldPers1 extends StatelessWidget {
  final List<String> items;
  final String hintext;

  final ValueChanged<String?> onChanged;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? heigth;
  final Decoration? boxDecoration;
  final BorderRadius? radiusforfield;
  final EdgeInsetsGeometry? paddingforfield;
  final bool? isfill;
  final Color? fillColor;
  BorderSide? border;

  DropdownFormFieldPers1({
    required this.items,
    required this.hintext,
    required this.onChanged,
    this.margin,
    this.heigth,
    this.width,
    this.boxDecoration,
    this.paddingforfield,
    this.radiusforfield,
    this.fillColor,
    this.isfill,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    String? dropdownValue;

    return Container(
      margin: margin,
      width: width,
      height: heigth,
      decoration: boxDecoration,
      child: Column(
        children: <Widget>[
          DropdownButtonFormField<String>(
            borderRadius: radiusforfield,
            padding: paddingforfield,
            value: dropdownValue,
            icon: const Icon(
              Icons.arrow_drop_down,
              size: 20,
            ),
            decoration: InputDecoration(
              filled: isfill,
              fillColor: fillColor,
              border: OutlineInputBorder(
                  //borderRadius: BorderRadius.circular(20),
                  borderSide: border ?? BorderSide.none),
              counterText: "",
              hintText: hintext,
              //contentPadding: const EdgeInsets.only(left: 90.0),
              hintStyle: const TextStyle(letterSpacing: 0.0, fontSize: 11),
            ),
            onChanged: onChanged,
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

//textfiormfield permettant d'uploader une image

class TextFormFieldPers4 extends StatefulWidget {
  final ValueChanged<File>? onImageSelected;

  const TextFormFieldPers4({Key? key, this.onImageSelected}) : super(key: key);

  @override
  _TextFormFieldPers4State createState() => _TextFormFieldPers4State();
}

class _TextFormFieldPers4State extends State<TextFormFieldPers4> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            final result = await FilePicker.platform.pickFiles();
            if (result != null) {
              final file = File(result.files.single.path!);
              setState(() {
                selectedImage = file;
              });
              widget.onImageSelected?.call(file);
            }
          },
          child: Text(
            'Upload Image',
            style: TextStyle(color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
        ),
        const SizedBox(height: 10),
        if (selectedImage != null)
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                border: const Border(
                    bottom:
                        BorderSide(color: Color.fromARGB(255, 107, 105, 105)),
                    top: BorderSide(color: Color.fromARGB(255, 107, 105, 105)),
                    left: BorderSide(color: Color.fromARGB(255, 107, 105, 105)),
                    right:
                        BorderSide(color: Color.fromARGB(255, 107, 105, 105))),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(selectedImage!.path.split('/').last),
            ),
          ),
      ],
    );
  }
}
