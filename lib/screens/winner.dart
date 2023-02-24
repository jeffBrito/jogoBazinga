import 'package:app/screens/home_page.dart';
import 'package:app/screens/start_game.dart';
import 'package:flutter/material.dart';

class Winner extends StatelessWidget {
  const Winner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text('PARABÉNS!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 40
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Image.asset(
              'assets/images/trofeu.png',
              width: 208,
              height: 208,
              filterQuality: FilterQuality.high,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text('Você é grande vencedor !',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18
              ),
            ),
            const SizedBox(
              height: 75,
            ),
            SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => StartGame()
                    )
                  );
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent
                ),
                child: const Text('Continuar o Jogo')
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) =>const HomePage()
                    )
                  );
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red
                ),
                child: const Text('Menu Principal')
              ),
            ),
          ],
        ),
      ),
    );
  }
}