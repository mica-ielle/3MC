import 'package:flutter/material.dart';
import 'package:troismconsulting/config/responsive.dart';

class notificationCardOffre extends StatelessWidget {
  final String numeroOffre;
  final String titreNotif;

  final String dateExpiration;
  final String nomPageVers;
  final VoidCallback ontap;

  const notificationCardOffre(
      {super.key,
      required this.nomPageVers,
      required this.ontap,
      required this.numeroOffre,
      required this.dateExpiration,
      required this.titreNotif});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Container(
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
                    height: 160,
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
                              "L'offre N°$numeroOffre est arrivée à expiration $dateExpiration"),
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
