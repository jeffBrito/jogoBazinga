import 'package:app/screens/home_page.dart';
import 'package:app/screens/over.dart';
import 'package:app/screens/winner.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class StartGame extends StatefulWidget {
  StartGame({super.key});

  @override
  State<StartGame> createState() => _StartGameState();
}

class _StartGameState extends State<StartGame> {

   int numero = 0;
    int seuJogo = 0;
    int jogoApp = 0;
    int rodada = 0;
    int roboP = 0;
    int voceP = 0;
    String image = 'assets/images/vazio.jpg';
  
    void iniciarJogo(int jogo){
      setState(() {
        numero = Random().nextInt(5);
        rodada++;
        if(numero == 0){
          image = 'assets/images/pedra.png';
        }else if(numero == 1){
          image = 'assets/images/papel.png';
        }else if(numero  == 2){
          image = 'assets/images/tesoura.png';
        }else if(numero == 3){
          image = 'assets/images/largato.jpg';
        }else if(numero  == 4){
          image = 'assets/images/spock.jpg';
        }

        if(roboP >= 5 ){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => const Over(),
            )
          );
        }else if(voceP >= 5){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => const Winner(),
            )
          );
        }else{
          switch(jogo){
            case 0:
              if(numero == 1){
                roboP++;
              }else if(numero == 2){
                voceP++;
              }else if(numero == 3){
                voceP++;
              }else if(numero == 4){
                roboP++;
              }

              break;
              case 1:
              if(numero == 0){
                voceP++;
              }else if(numero == 2){
                roboP++;
              }else if(numero == 3){
                roboP++;
              }else if(numero == 4){
                voceP++;
              }
              break;
              case 2:
              if(numero == 0){
                roboP++;
              }else if(numero == 1){
                voceP++;
              }else if(numero == 3){
                voceP++;
              }else if(numero == 4){
                roboP++;
              }
              break;
              case 3:
              if(numero == 0){
                roboP++;
              }else if(numero == 1){
                voceP++;
              }else if(numero == 2){
                roboP++;
              }else if(numero == 4){
                voceP++;
              }
              break;
              case 4:
              if(numero == 0){
                voceP++;
              }else if(numero == 1){
                roboP++;
              }else if(numero == 2){
                voceP++;
              }else if(numero == 3){
                roboP++;
              }
              break;
          }
        }
      });
    }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF272362),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Text('Escolha uma Jogada',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TextButton(
                      onPressed: (){
                        seuJogo = 0;
                        iniciarJogo(seuJogo);
                      }, 
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 90, 90, 90),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: Offset(0, 1)
                            )
                          ]
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Image.asset('assets/images/pedra.png'),
                        ),
                      )
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    TextButton(
                      onPressed: (){
                        seuJogo = 1;
                        iniciarJogo(seuJogo);
                      }, 
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 90, 90, 90),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: Offset(0, 1)
                            )
                          ]
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Image.asset('assets/images/papel.png'),
                        ),
                      )
                    ),
                     const SizedBox(
                      width: 1,
                    ),
                    TextButton(
                      onPressed: (){
                        seuJogo = 2;
                        iniciarJogo(seuJogo);
                      }, 
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 90, 90, 90),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: Offset(0, 1)
                            )
                          ]
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Image.asset('assets/images/tesoura.png'),
                        ),
                      )
                    ),
                     const SizedBox(
                      width: 1,
                    ),
                    TextButton(
                      onPressed: (){
                        seuJogo = 3;
                        iniciarJogo(seuJogo);
                      }, 
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 90, 90, 90),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: Offset(0, 1)
                            )
                          ]
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Image.asset('assets/images/largato.jpg'),
                        ),
                      )
                    ),
                    TextButton(
                      onPressed: (){
                        seuJogo = 4;
                        iniciarJogo(seuJogo);
                      }, 
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 90, 90, 90),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: Offset(0, 1)
                            )
                          ]
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 5,right:5),
                          child: Image.asset('assets/images/spock.jpg'),
                        ),
                      )
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Escolha do Robô',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
              TextButton(
                onPressed: (){}, 
                child: Container(
                  width: 110,
                  height: 110,
                  decoration: const BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(70),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 90, 90, 90),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 1)
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(21),
                    child: Image.asset(image),
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              const Text('RODADA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text('$rodada',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text('PLACAR',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children:  [
                      Text(roboP.toString(),
                        style: const TextStyle(
                          color: Colors.redAccent,
                          fontSize: 52,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                     const Text('Rôbo',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 65,
                  ),
                  Column(
                    children: [
                      Text(voceP.toString(),
                        style: const TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 52,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      const Text('Você',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              SizedBox(
                height: 42,
                width: 185,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red
                  ),
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      )
                    );
                  }, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.exit_to_app),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Sair do Jogo',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500    
                        ),
                      ),
                    ],
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}