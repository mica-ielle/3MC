import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:troismconsulting/config/responsive.dart';
import 'package:troismconsulting/config/size_config.dart';

class CardRetraitConsultant extends StatelessWidget {
  final String idRetrait;
  final String nomConsultant;
  final String nomClient;
  final String montant;
  final String dateDeDemande;

  const CardRetraitConsultant(
      {super.key,
      required this.idRetrait,
      required this.nomConsultant,
      required this.nomClient,
      required this.montant,
      required this.dateDeDemande});

  @override
  Widget build(BuildContext context) {
    void _refuserRetraitConsultantDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
// Créez un TextEditingController pour chaque champ de texte
          TextEditingController raisonController = TextEditingController();

          return AlertDialog(
              title: Text(
                'Refuser un retrait N°#$idRetrait',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          "Raison du rejet ",
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
                      controller: raisonController,
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.disabled_by_default_outlined),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          hintText: ''),
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
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow),
                    child: Text(
                      'Confirmer',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ]);
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 13, 7, 58),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Retrait N° #$idRetrait",
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 17,
                  decoration: TextDecoration.underline,
                )),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      // width: SizeConfig.screenWidth,
                      child: Container(
                        // width: Responsive.isMobile(context) ? null : Get.width,
                        child: DataTable(columns: const <DataColumn>[
                          DataColumn(
                              label: Text(
                            'Consultant',
                            style: TextStyle(color: Colors.yellow),
                          )),
                          DataColumn(
                              label: Text('Client',
                                  style: TextStyle(color: Colors.yellow))),
                          DataColumn(
                              label: Text('Montant',
                                  style: TextStyle(color: Colors.yellow))),
                          DataColumn(
                              label: Text('Offre concernée',
                                  style: TextStyle(color: Colors.yellow))),
                          DataColumn(
                              label: Text('Date de demande',
                                  style: TextStyle(color: Colors.yellow))),
                        ], rows: <DataRow>[
                          DataRow(cells: <DataCell>[
                            DataCell(Text(nomConsultant,
                                style: TextStyle(color: Colors.white))),
                            DataCell(Text(nomClient,
                                style: TextStyle(color: Colors.white))),
                            DataCell(Text(montant,
                                style: TextStyle(color: Colors.white))),
                            DataCell(Container(
                              // padding: EdgeInsets.only(left: 10),
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.yellow),
                              child: Center(
                                child: Text(
                                  "Voir l'offre",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                            DataCell(Text(dateDeDemande,
                                style: TextStyle(color: Colors.white))),
                          ]),
                        ]),
                      ),
                    ))),
            const Divider(),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: Text(
                    'Refuser le retrait',
                    style: TextStyle(color: Colors.yellow),
                  ),
                  onPressed: () {
                    // Navigator.of(context).pop();
                    _refuserRetraitConsultantDialog();
                  },
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                  child: Text(
                    'Valider le retrait',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    // Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
