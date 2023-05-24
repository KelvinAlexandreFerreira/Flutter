import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/maestry.dart';

import 'difficulty.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Task(this.nome, this.foto, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  int maestryLevel = 0;

  bool assetOrNetwork() {
    if (widget.foto.contains('http')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(children: [
        Maestry(maestryLevel: maestryLevel),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.black26,
                    ),
                    width: 72,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: assetOrNetwork()
                          ? Image.asset(
                              widget.foto,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              widget.foto,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          widget.nome,
                          style: const TextStyle(
                            fontSize: 24,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Difficulty(
                        difficultyLevel: widget.dificuldade,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 52,
                    width: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          nivel++;
                          defineMaestryLevel();
                        });
                        //print(nivel);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Icon(Icons.arrow_drop_up),
                          Text(
                            'UP',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    width: 200,
                    child: LinearProgressIndicator(
                      color: Colors.white,
                      value: (widget.dificuldade > 0) ? difficultByLevel() : 1,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Nivel: $nivel',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }

  double difficultByLevel() => (nivel / widget.dificuldade) / 10;

  void defineMaestryLevel() {
    if ((difficultByLevel() == 1) &&
        (maestryLevel <= Maestry.maxMaestryLevel)) {
      maestryLevel++;
      nivel = 0;
    }
  }
}
