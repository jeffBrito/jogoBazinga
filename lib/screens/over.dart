import 'package:app/screens/home_page.dart';
import 'package:app/screens/start_game.dart';
import 'package:flutter/material.dart';

class Over extends StatelessWidget {
  const Over({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text('',
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
              'assets/images/gameover.png',
              width: 208,
              height: 208,
              filterQuality: FilterQuality.high,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text('Que Pena foi perdeu o jogo !',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18
              ),
            ),
            const SizedBox(
              height: 150,
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
                  backgroundColor: Colors.green
                ),
                child: const Text('Continuar o Jogo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                  ),
                ),
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
                  backgroundColor: Colors.amber
                ),
                child: const Text('Menu Principal',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}