import 'package:flutter/material.dart';
import 'package:troismconsulting/config/responsive.dart';

class notificationCard extends StatelessWidget {
  final String titreNotif;
  final String nomConcernantNotif;
  final String montantRetrait;
  final String moyenRetrait;
  final String dateRetrait;
  final String nomPageVers;
  final VoidCallback ontap;

  const notificationCard(
      {super.key,
      required this.titreNotif,
      required this.nomConcernantNotif,
      required this.montantRetrait,
      required this.moyenRetrait,
      required this.dateRetrait,
      required this.nomPageVers,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Responsive.isMobile(context)
                    ? Container(
                        height: 170,
                        width: MediaQuery.of(context).size.width / 50,
                        color: Colors.yellow,
                      )
                    : Container(
                        height: 170,
                        width: 10,
                        color: Colors.yellow,
                      ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    height: 180,
                    width: Responsive.isMobile(context)
                        ? MediaQuery.of(context).size.width
                        : MediaQuery.of(context).size.width * 2 / 3,
                    color: Color.fromARGB(5, 0, 50, 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.alarm,
                              color: Colors.yellow,
                              size: 30,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              titreNotif,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 9 / 10,
                          child: Text(
                            "Le consultant $nomConcernantNotif a effectué un retrait d'argent de $montantRetrait FCFA via $moyenRetrait le $dateRetrait",
                            style: TextStyle(),
                            // overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: ontap,
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 9 / 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(child: Text(nomPageVers)),
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(Icons.arrow_circle_right_outlined)
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
