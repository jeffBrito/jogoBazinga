import 'package:app/screens/home_page.dart';
import 'package:flutter/material.dart';

class ItemRules extends StatelessWidget {
  const ItemRules({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            const Text('Regras do Jogo',textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.amber,
                fontWeight: FontWeight.w600
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text('Quem chegar a 5 Pontos vence',textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 17
              )
            ),
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 95,
                  height: 95,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 90, 90, 90),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 1)
                      ),
                    ],
                   
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset('assets/images/tesoura.png'),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('Corta',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 95,
                  height: 95,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 90, 90, 90),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 1)
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset('assets/images/papel.png'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 95,
                  height: 95,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50)
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
                    padding: const EdgeInsets.all(10),
                    child: Image.asset('assets/images/papel.png'),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('Cobre',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 95,
                  height: 95,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50)
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
                    padding: const EdgeInsets.all(10),
                    child: Image.asset('assets/images/pedra.png'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 95,
                  height: 95,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50)
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
                    padding: const EdgeInsets.all(10),
                    child: Image.asset('assets/images/pedra.png'),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('Quebra',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 95,
                  height: 95,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50)
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
                    padding: const EdgeInsets.all(15),
                    child: Image.asset('assets/images/tesoura.png'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 95,
                  height: 95,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50)
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
                    padding: const EdgeInsets.all(15),
                    child: Image.asset('assets/images/largato.jpg'),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('Evenena',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 95,
                  height: 95,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50)
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right:5),
                    child: Image.asset('assets/images/spock.jpg'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 95,
                  height: 95,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50)
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
                    padding: const EdgeInsets.only(left: 5, right:5),
                    child: Image.asset('assets/images/spock.jpg'),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('Esmaga',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 95,
                  height: 95,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50)
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
                    padding: const EdgeInsets.all(15),
                    child: Image.asset('assets/images/tesoura.png'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 95,
                  height: 95,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50)
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
                    padding: const EdgeInsets.all(15),
                    child: Image.asset('assets/images/tesoura.png'),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('Decapita',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 95,
                  height: 95,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50)
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
                    padding: const EdgeInsets.all(15),
                    child: Image.asset('assets/images/largato.jpg'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 95,
                  height: 95,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50)
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
                    padding: const EdgeInsets.all(15),
                    child: Image.asset('assets/images/largato.jpg'),
                  ),
                ),
                const SizedBox(
                  width: 32
                ),
                const Text('Come',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                  ),
                ),
                const SizedBox(
                  width: 32,
                ),
                Container(
                  width: 95,
                  height: 95,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50)
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
                    padding: const EdgeInsets.all(15),
                    child: Image.asset('assets/images/papel.png'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 95,
                  height: 95,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50)
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
                    padding: const EdgeInsets.all(15),
                    child: Image.asset('assets/images/papel.png'),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('Desmente',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 95,
                  height: 95,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50)
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Image.asset('assets/images/spock.jpg'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 95,
                  height: 95,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50)
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
                    padding: const EdgeInsets.only(left:5,right: 5),
                    child: Image.asset('assets/images/spock.jpg'),
                  ),
                ),
                const SizedBox(
                  width: 32
                ),
                const Text('Destrói',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                  ),
                ),
                const SizedBox(
                  width: 32
                ),
                Container(
                  width: 95,
                  height: 95,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50)
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset('assets/images/pedra.png'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30
            ),
             const Text('E como Sempre:',textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 15
              ),
            ),
            const SizedBox(
              width: 32
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 95,
                  height: 95,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50)
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
                    padding: const EdgeInsets.all(15),
                    child: Image.asset('assets/images/pedra.png'),
                  ),
                ),
                const SizedBox(
                  width: 32
                ),
                const Text('Destrói',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                  ),
                ),
                const SizedBox(
                  width: 32
                ),
                Container(
                  width: 95,
                  height: 95,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50)
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset('assets/images/tesoura.png'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 45
            ),
            SizedBox(
              width: 90,
              height: 42,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=> const HomePage(),
                    )
                  );
                },
                child: Text('Voltar para o Menu Principal')
              ),
            )
          ],
      ),
    );
  }
}