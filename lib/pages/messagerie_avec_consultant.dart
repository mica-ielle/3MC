import 'package:flutter/material.dart';
import 'package:troismconsulting/models/model_consultant.dart';
import 'package:troismconsulting/models/model_message.dart';

class EcranMessagerie extends StatefulWidget {
  // final Consultant consultant;

  EcranMessagerie({super.key});

  @override
  _EcranMessagerieState createState() => _EcranMessagerieState();
}

class _EcranMessagerieState extends State<EcranMessagerie> {
  List<Message> messages = [];
  TextEditingController messageController = TextEditingController();

  void envoyerMessage(String texte) {
    if (texte.trim().isEmpty) return; // Ne rien faire si le texte est vide

    setState(() {
// Ajoutez le nouveau message à la liste des messages
      messages.add(Message(contenu: texte, estEnvoyeParUtilisateur: true));
      messageController.clear(); // Effacez le champ de texte après l'envoi
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messagerie'),
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
// Alignez les messages à droite si envoyés par l'utilisateur
              final alignement = message.estEnvoyeParUtilisateur
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start;
              return Row(
                crossAxisAlignment: alignement,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: message.estEnvoyeParUtilisateur
                          ? Colors.blue
                          : Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      message.contenu,
                      style: TextStyle(
                          color: message.estEnvoyeParUtilisateur
                              ? Colors.white
                              : Colors.white),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    hintText: 'Écrivez votre message ici...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () => envoyerMessage(messageController.text),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
