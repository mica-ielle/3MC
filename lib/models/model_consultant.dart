import 'package:flutter/material.dart';

class Consultant {
  final Image imageProfil;
  final String nomConsultant;
  final IconData iconeVerification;
  final IconData? iconeDevelopper;
  final String statutVerification;
  final String? typeDevelopper;

  const Consultant(
      {required this.imageProfil,
      required this.iconeVerification,
      this.iconeDevelopper,
      required this.statutVerification,
      this.typeDevelopper,
      required this.nomConsultant});
// Autres attributs nécessaires
}
