import 'package:flutter/material.dart';
import 'package:exo_quizz/question_model.dart';

class Questions extends StatefulWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  List<Question> newList = Datas().listeQuestions;
  int scores = 0;
  int questionIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scores : ${scores.toString()}"),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Text(
                    "Question numéro $questionIndex/10",
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  newList[questionIndex - 1].question,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                Image.asset(newList[questionIndex - 1].imagePath),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () {
                        (newList[questionIndex - 1].reponse == false)
                            ? showMyDialog(
                                dialog: createAlert(
                                  true,
                                  newList[questionIndex - 1].reponse,
                                  newList[questionIndex - 1].explication,
                                ),
                              )
                            : showMyDialog(
                                dialog: createAlert(
                                false,
                                newList[questionIndex - 1].reponse,
                                newList[questionIndex - 1].explication,
                              ));
                      },
                      child: Text(
                        'Faux',
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      onPressed: () {
                        (newList[questionIndex - 1].reponse == true)
                            ? showMyDialog(
                                dialog: createAlert(
                                  true,
                                  newList[questionIndex - 1].reponse,
                                  newList[questionIndex - 1].explication,
                                ),
                              )
                            : showMyDialog(
                                dialog: createAlert(
                                false,
                                newList[questionIndex - 1].reponse,
                                newList[questionIndex - 1].explication,
                              ));
                      },
                      child: Text(
                        'Vrai',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  void updateScore() {
    setState(() {
      scores++;
    });
  }

  void updateIndex() {
    setState(() {
      questionIndex++;
    });
  }

  AlertDialog createAlert(bool status, bool res, String expli) {
    bool statusA = status;
    bool resA = res;
    String expliA = expli;

    (statusA == true)
        ? setState(() {
            updateScore();
          })
        : null;

    return AlertDialog(
      title: (resA == true) ? Text("C'est vrai") : Text("C'est faux"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          (statusA == true)
              ? Image.asset('assets/vrai.jpg')
              : Image.asset('assets/faux.jpg'),
          SizedBox(height: 10),
          (expliA == "")
              ? Text("")
              : Text(expliA, style: TextStyle(fontSize: 18)),
        ],
      ),
      actions: [
        (questionIndex == newList.length - 1)
            ? ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  });
                },
                child: const Text("Retour à l'accueil"))
            : ElevatedButton(
                onPressed: () {
                  setState(() {
                    updateIndex();
                    Navigator.of(context).pop();
                  });
                },
                child: const Text('Question suivante'))
      ],
    );
  }

  Future<void> showMyDialog({required Widget dialog}) async {
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext ctx) {
          return dialog;
        });
  }
}
