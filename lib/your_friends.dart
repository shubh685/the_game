import 'package:flutter/material.dart';
import 'package:never_have_iever_game/Ready%20to%20Play.dart';
import 'package:never_have_iever_game/Subscription%20Plan.dart';

class Get_Friends extends StatelessWidget {
  const Get_Friends({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
               padding: const EdgeInsets.only(top: 65, right: 25),
               child: Align(
                alignment: Alignment.topRight,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>Ready_To_Play()));
                      },
                      child: Text("Skip", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)))),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 120),
               child: Center(
                 child: Container(
                   height: 115, width: 112,
                   decoration: BoxDecoration(
                     color: Colors.pink,
                     borderRadius: BorderRadius.circular(12)
                   ),
                   child: Icon(Icons.people_alt, color: Colors.white, size: 35),
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 35),
               child: Center(child: Text("Gather Your Friends", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold))),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 30),
               child: Center(
                 child: Text("The perfect game for parties, hangouts, and \n "
                     "\t \t \t getting to know each other better", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 65),
               child: Center(
                 child: InkWell(
                   onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => Vibes()));
                   },
                   child: Container(
                     height: size.height*0.072, width: size.width*0.8,
                     padding: EdgeInsets.only(left: 75),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(12),
                       color: Colors.pink,
                     ),
                     child: Row(
                       children: [
                         Text("Continue", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)), SizedBox(width: size.width*0.09),
                         Icon(Icons.chevron_right, color: Colors.white, size: 30 )
                       ],
                     ),
                   ),
                 ),
               ),
             )
          ],
        ),
      ),
    );
  }
}

class Vibes extends StatelessWidget {
  const Vibes({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 65, right: 25),
              child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Ready_To_Play()));
                      },
                      child: Text("Skip", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Center(
                child: Container(
                  height: 115, width: 112,
                  decoration: BoxDecoration(
                      color: Color(0xFF8E5BEF),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Icon(Icons.auto_awesome, color: Colors.white, size: 35),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Center(child: Text("Choose Your Vibe", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: Center(
                child: Text("From classic fun to spicy challenges - pick the"
                    "\t category that matches your mood", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 65),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Secrets()));
                  },
                  child: Container(
                    height: size.height*0.072, width: size.width*0.8,
                    padding: EdgeInsets.only(left: 75),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.pink,
                    ),
                    child: Row(
                      children: [
                        Text("Continue", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)), SizedBox(width: size.width*0.09),
                        Icon(Icons.chevron_right, color: Colors.white, size: 30 )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Secrets extends StatelessWidget {
  const Secrets({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 65, right: 25),
              child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Ready_To_Play()));
                    },
                      child: Text("Skip", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Center(
                child: Container(
                  height: 115, width: 112,
                  decoration: BoxDecoration(
                      color: Color(0xFFF7931E),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Icon(Icons.flash_on, color: Colors.white, size: 35),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Center(child: Text("Reveal Secrets", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 10),
              child: Center(
                child: Text("Take turns reading statements. Any one who's"
                    "  done it takes a sip or gets a point", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 65),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Play()));
                  },
                  child: Container(
                    height: size.height*0.072, width: size.width*0.8,
                    padding: EdgeInsets.only(left: 75),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.pink,
                    ),
                    child: Row(
                      children: [
                        Text("Continue", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)), SizedBox(width: size.width*0.09),
                        Icon(Icons.chevron_right, color: Colors.white, size: 30 )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Play extends StatelessWidget {
  const Play({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 65, right: 25),
              child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Ready_To_Play()));
                      },
                      child: Text("Skip", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Center(
                child: Container(
                  height: 115, width: 112,
                  decoration: BoxDecoration(
                      color: Color(0xFF14B88A),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Icon(Icons.star, color: Colors.white, size: 35),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Center(child: Text("Ready to Play?", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 15),
              child: Center(
                child: Text("No signup needed. Just pure, unfiltered fun with your favorite people", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 65),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Ready_To_Play()));
                  },
                  child: Container(
                    height: size.height*0.072, width: size.width*0.8,
                    padding: EdgeInsets.only(left: 75),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.pink,
                    ),
                    child: Row(
                      children: [
                        Text("Let's Play!", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)), SizedBox(width: size.width*0.09),
                        Icon(Icons.chevron_right, color: Colors.white, size: 30 )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}