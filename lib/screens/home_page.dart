import 'package:app/screens/rules_page.dart';
import 'package:app/screens/start_game.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    Size mySyze = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF272362),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: mySyze.width * 1,
               height: 220,
              child: Image.asset('assets/images/topo.png'),
            ),
            const SizedBox(
               height: 15,
            ),
            SizedBox(
               height: 165,
              child: Image.asset('assets/images/logo.png'),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text('Pedra, Papel, Tesoura, Largato e Spock',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600
              ),
            ),
            const SizedBox(
              height: 42,
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => StartGame()
                  ),
                );
              }, 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.turn_right
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Iniciar o Jogo',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(175, 42),
                backgroundColor: Colors.green,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> RulesPage())
                );
              }, 
              child: Row(
                children: [
                  Icon(
                    Icons.info
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  const Text('Regras do Jogo',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(175, 42),
                backgroundColor: Color.fromARGB(255, 126, 85, 190),
              ),
            )
          ],
        ),
      ),
    );
  }
}