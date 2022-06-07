import 'package:flutter/material.dart';
import 'package:history/storie.dart';  //importer la page storie.dart dès qu'on a saisi le nom de la classe
import 'package:history/storie2.dart';

Storie2 s2 = Storie2();
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, // supprime la banière de debug
    home: Scaffold(
      body: SafeArea(
          child: StoriesApp()),
    ),
  ),
  );
}

class StoriesApp extends StatefulWidget {
  const StoriesApp({Key? key}) : super(key: key);

  @override
  State<StoriesApp> createState() => _StoriesAppState();
}

class _StoriesAppState extends State<StoriesApp> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      // affichage de l'interface en colonne
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(         // permet de remplir les espaces disponible de mon écran
            flex: 4,                    //spéfie un pourcentage du remplissage des marges
            child: Center(        // on centre le texte, il sera en blanc
              child: Text(s2.getEnonce(),  //récupère l'énoncé de l'événement
              textAlign: TextAlign.center,  //texte centré
              style: TextStyle(
                fontSize: 20.0    //le texte est plus gros
              ),),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: ButtonStyle( //couleur du bouton en bleu
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  setState(() { //modifier l'état de l'app
                    s2.next(1);
                  });
                },
                child: Text(s2.getChoice1(),  //récupère la réponse 1
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Visibility(
                visible: s2.buttonVisibleOrNo(), //je fais appel à la focntion si le bouton est visible ou non pour la 2ème réponse
                child: TextButton(
                  style: ButtonStyle( //couleur du bouton en bleu
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {
                    setState(() { //modifier l'état de l'app
                      s2.next(2);
                    });
                  },
                  child: Text(s2.getChoice2(), //récupère la réponse 2
                    style: TextStyle(color: Colors.white), // couleur du texte
                  ),
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}


