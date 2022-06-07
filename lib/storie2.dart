import 'package:history/storie.dart';

class Storie2 {
  // j'ai stocké toutes les étapes avec chaque réponse leur appartenant dans un tableau
  List<Question> stories = [
    Question(
        "Vous venez de crevez un pneu à St André. Vous n'avez pas de téléphone vous décidez de faire du stop. Une ford fiesta rouge s'arrête et le conducteur vous demande si vous voulez qu'il vous dépanne.",
        "Vous lui remerciez et vous montez dans la voiture",
        "Vous lui demandez s'il n'est pas un meurtrier avant !"
    ),

    Question(
        "Il acquiesce de la tête sans faire attention à la question.",
        "Au moins il est honnête. Vous montez ! ",
        "Attends, mais je sais comment changer un pneu voyons !"
    ),

    Question(
        "Lorsqu'il commence à conduire, il vous demande d'ouvrir la boite à gant. À l’intérieur, vous trouverez un couteau ensanglanté, deux doigts coupés et un CD de T-Matt.",
        "J'adore T-Matt, je lui donne le CD.",
        "C'est lui ou moi, je prends le couteau et je le poignarde."
    ),

    Question(
        "Woaw ! Quelle évasion !",
        "Recommencer !",
        ""
    ),

    Question(
        "En traversant la route du littoral, vous réfléchissez à la sagesse douteuse de poignarder quelqu’un pendant qu’il conduit une voiture dans laquelle vous êtes.",
        "Recommencer !",
        ""
    ),

    Question(
        "Vous vous faites un bon dalon et vous chantez le dernier son de T-matt ensemble. Il vous dépose à Cambaie et il vous demande si vous connaissez un bon endroit pour jeter un corps.",
        "Recommencer !",
        ""
    ),
  ];

  // il faut que je sache à partir de quelle étape je suis
  int numeroEtape = 0;

  // je veux récupéré la question actuelle et aussi je suis à quelle étape de ma storie
  // dans la question actuelle, il faut que je me pose la question : est-ce que je veux la question, la réponse 1 ou la 2
  String getEnonce() {  //je récupère le type de la question
    return stories[numeroEtape].enonce;
  }

  String getChoice1() {  //je récupère le type de la réponse1
    return stories[numeroEtape].reponse1;
  }

  String getChoice2() {  //je récupère le type de la réponse2
    return stories[numeroEtape].reponse2;
  }

  // récupérer la question suivante et les choix suivants, si par exemple j'appuie sur la réponse 1 ou 2
  // j'indique si j'ai choisi le choix 1 ou le choix 2
  void next(int choice) {
    if(numeroEtape == 0 && choice == 1) { //si je suis à l'étape 0 et j'ai choisi la réponse n°1
      //je passe à l'étape 2
      numeroEtape = 2;
    }
    else if(numeroEtape == 0 && choice == 2) {  //si je suis à l'étape 0 et j'ai choisi la réponse n°2
      //je passe à l'étape 1
      numeroEtape = 1;
    }
    else if(numeroEtape == 2 && choice == 1) {  //si je suis à l'étape 2 et j'ai choisi la réponse n°1
      //je passe à l'étape 5
      numeroEtape = 5;
    }
    else if(numeroEtape == 2 && choice == 2) {  //si je suis à l'étape 2 et j'ai choisi la réponse n°2
      //je passe à l'étape 4
      numeroEtape = 4;
    }
    else if(numeroEtape == 1 && choice == 1) {  //si je suis à l'étape 1 et j'ai choisi la réponse n°1
      //je passe à l'étape 1
      numeroEtape = 2;
    }
    else if(numeroEtape == 1 && choice == 2) {  //si je suis à l'étape 1 et j'ai choisi la réponse n°2
      //je passe à l'étape 3
      numeroEtape = 3;
    }
    else if(numeroEtape == 3 || numeroEtape == 4 || numeroEtape == 5 && choice == 1) {  //si je suis à l'étape 3 ou 4 ou 5, et j'ai choisi la réponse n°1
      //je passe à l'étape 0, je retourne au début
      numeroEtape = 0;
    }

    // cette fonction va renvoyer si le bouton est visible ou pas
    bool buttonVisibleOrNo() {
      if(numeroEtape == 0 || numeroEtape == 1 || numeroEtape == 2) {   //si je suis à l'étape 0 ou à l'étape 1 ou 2 alors le boiton est présent
        return true;
      } else { // sinon il renvoi false, il disparaît
        return false;
      }
    }

  }
  
}