import 'package:flutter/material.dart';

class Question {
  String question;
  bool reponse;
  String explication;
  String imagePath;

  Question(
      {required this.question,
      required this.reponse,
      required this.explication,
      required this.imagePath});

  String getImage() => '$imagePath';
}

class Datas {
  List<Question> listeQuestions = [
    Question(
        question: 'La devise de la Belgique est l\'union fait la force',
        reponse: true,
        explication: '',
        imagePath: 'assets/belgique.jpg'),
    Question(
        question: 'La lune va finir par tomber sur terre à cause de la gravité',
        reponse: false,
        explication: 'Au contraire la lune s\'éloigne',
        imagePath: 'assets/lune.jpg'),
    Question(
        question: 'La Russie est plus grande en superficie que Pluton',
        reponse: true,
        explication: '',
        imagePath: 'assets/russie.jpg'),
    Question(
        question: 'Nyctalope est une race naine d\'antilope',
        reponse: false,
        explication: 'C’est une aptitude à voir dans le noir',
        imagePath: 'assets/nyctalope.jpg'),
    Question(
        question: 'Le Commodore 64 est l\’oridnateur de bureau le plus vendu',
        reponse: true,
        explication: '',
        imagePath: 'assets/commodore.jpg'),
    Question(
        question: 'Le nom du drapeau des pirates es black skull',
        reponse: false,
        explication: 'Il est appelé Jolly Roger',
        imagePath: 'assets/pirate.png'),
    Question(
        question: 'Haddock est le nom du chien Tintin',
        reponse: false,
        explication: 'C\'est Milou',
        imagePath: 'assets/tintin.jpg'),
    Question(
        question: 'La barbe des pharaons était fausse',
        reponse: true,
        explication: 'A l\'époque déjà ils utilisaient des postiches',
        imagePath: 'assets/pharaon.jpg'),
    Question(
        question:
            'Au Québec tire toi une bûche veut dire viens viens t\'asseoir',
        reponse: true,
        explication: 'La bûche, fameuse chaise de bucheron',
        imagePath: 'assets/buche.jpg'),
    Question(
        question: 'Le module lunaire Eagle de possédait de 4Ko de Ram',
        reponse: true,
        explication: 'Dire que je me plains avec mes 8GO de ram sur mon mac',
        imagePath: 'assets/eagle.jpg'),
  ];
}


// class QuestionModel extends StatefulWidget {
//   const QuestionModel({ Key? key }) : super(key: key);

//   @override
//   _QuestionModelState createState() => _QuestionModelState();
// }

// class _QuestionModelState extends State<QuestionModel> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }