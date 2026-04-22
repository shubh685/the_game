import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:never_have_iever_game/screen1.dart';
import 'package:never_have_iever_game/t_text.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ready_To_Play extends StatefulWidget {
  Ready_To_Play({super.key,});

  @override
  State<Ready_To_Play> createState() => _Ready_To_PlayState();
}

class _Ready_To_PlayState extends State<Ready_To_Play> {
  String? userid;
  int unlockedLevel = 1; // Default to level 1 (Classic)
  bool isLoading = true;
  bool isUnlocked(int level) {
    return level <= unlockedLevel;
  }

  @override
  void initState() {
    super.initState();
    loadUnlockedLevel();
  }


  Future<void> loadUnlockedLevel() async {
    setState(() => isLoading = true);

    final prefs = await SharedPreferences.getInstance();
    userid = prefs.getString("userid");

    if (userid != null) {
      // Sync from Firestore
      try {
        final docRef = FirebaseFirestore.instance.collection('users').doc(userid);
        final doc = await docRef.get();

        if (doc.exists) {
          int firestoreLevel = doc.get('unlockedLevel') ?? 1;

          // Update SharedPreferences with Firestore value
          await prefs.setInt("unlockedLevel", firestoreLevel);

          setState(() {
            unlockedLevel = firestoreLevel;
            isLoading = false;
          });
        } else {
          setState(() {
            unlockedLevel = 1;
            isLoading = false;
          });
        }
      } catch (e) {
        // Fallback to SharedPreferences if Firestore fails
        setState(() {
          unlockedLevel = prefs.getInt("unlockedLevel") ?? 1;
          isLoading = false;
        });
      }
    } else {
      setState(() {
        unlockedLevel = 1;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
                          },
                          child: Icon(Icons.settings, color: Colors.grey, size: 30)),
                    ), SizedBox(width: size.width*0.25),
                    Center(child: TText("Never Ever", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.pink)))
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: SizedBox(
                      height: 100,
                      child: Center(child: Image.asset("assets/images/img.png")))
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: TText("Ready to Play?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                    child: TText("Pick a Category and discover secrets!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400))),
              ),
              StreamBuilder(stream: FirebaseFirestore.instance.collection('users').doc(userid).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data!.exists) {
                      unlockedLevel = snapshot.data!.get('unlockedLevel') ?? 1;
                    }
                    bool isUnlocked(int level) => level <= unlockedLevel;
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: InkWell(
                            onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => Screen1(userid: userid, level: unlockedLevel)));
                            },
                            child: Container(
                                height: size.height*0.11,
                                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:  Color(0xFF00B4B6),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 16),
                                    // 🎯 Icon
                                    Image.asset("assets/images/img_1.png", height: 40,), const SizedBox(width: 16),
                                    // Text
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          TText("Classic",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),SizedBox(height: 4),
                                          TText("Fun questions for everyone",style: TextStyle(color: Colors.white70,fontSize: 14)),
                                        ],
                                      ),
                                    ),
                                    // ➡ Arrow
                                    const Padding(
                                      padding: EdgeInsets.only(right: 16),
                                      child: Icon(Icons.chevron_right, color: Colors.white, size: 30),
                                    )
                                  ],
                                )
                            ),
                          ),
                        ), // Inkwell
                        InkWell(
                          onTap: () {
                            if (isLoading) {
                              CircularProgressIndicator();
                            }
                            if (isUnlocked(2)) {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => Screen2(userid: userid, level: unlockedLevel)));
                            }
                          },
                          child: Container(
                              height: size.height*0.11,
                              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xFFA855F7), // Left – Purple
                                      Color(0xFFC241B3), // Center – Pink-Purple
                                    ],
                                  )
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 16),
                                  // 🎯 Icon
                                  Image.asset("assets/images/img_2.png", height: 40,), const SizedBox(width: 16),
                                  // Text
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        TText("Party Mode",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),SizedBox(height: 4),
                                        TText("Get the Party Started",style: TextStyle(color: Colors.white70,fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                  // ➡ Arrow
                                  const Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Icon(Icons.chevron_right, color: Colors.white, size: 30),
                                  )
                                ],
                              )
                          ),
                        ), // Inkwell
                        InkWell(
                          onTap: () {
                            if (isLoading) {
                              CircularProgressIndicator();
                            }
                            if (isUnlocked(3)) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Screen3(userid: userid, level: unlockedLevel)));
                            }
                          },
                          child: Container(
                              height: size.height*0.11,
                              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.pink
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 16),
                                  // 🎯 Icon
                                  Image.asset("assets/images/img_3.png", height: 40,), const SizedBox(width: 16),
                                  // Text
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        TText("Couples",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),SizedBox(height: 4),
                                        TText("For romantic partners",style: TextStyle(color: Colors.white70,fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                  // ➡ Arrow
                                  const Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Icon(Icons.chevron_right, color: Colors.white, size: 30),
                                  )
                                ],
                              )
                          ),
                        ), // Inkwell
                        InkWell(
                          onTap: () {
                               if (isLoading) {
                                    CircularProgressIndicator();
                               }
                              if (isUnlocked(4)) {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Screen4(userid: userid, level: unlockedLevel)));
                              }
                           },
                          child: Container(
                              height: size.height*0.11,
                              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xFFF1601D), // left
                                      Color(0xFFEA4C1E), // center
                                      Color(0xFFE43D26)
                                    ],
                                  )
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 16),
                                  // 🎯 Icon
                                  Image.asset("assets/images/img_4.png", height: 40), const SizedBox(width: 16),
                                  // Text
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        TText("Spicy 18+",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),SizedBox(height: 4),
                                        TText("Adults only content",style: TextStyle(color: Colors.white70,fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                  // ➡ Arrow
                                  const Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Icon(Icons.chevron_right, color: Colors.white, size: 30),
                                  )
                                ],
                              )
                          ),
                        ), // Inkwell
                        InkWell(
                          onTap: () {
                            if (isLoading) {
                              CircularProgressIndicator();
                            }
                            if (isUnlocked(5)) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Screen3(userid: userid, level: unlockedLevel)));
                            }
                          },
                          child: Container(
                              height: size.height*0.11,
                              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blue
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 16),
                                  // 🎯 Icon
                                  Image.asset("assets/images/img_5.png", height: 40), const SizedBox(width: 16),
                                  // Text
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        TText("Best Friends",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),SizedBox(height: 4),
                                        SizedBox(
                                            height: 50,
                                            child: Text("How well do you know each other?", style: TextStyle(color: Colors.white70,fontSize: 14))),
                                      ],
                                    ),
                                  ),
                                  // ➡ Arrow
                                  const Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Icon(Icons.chevron_right, color: Colors.white, size: 30),
                                  )
                                ],
                              )
                          ),
                        ), // Inkwell
                        InkWell(
                          onTap:  isUnlocked(6) ? () { Navigator.push(context, MaterialPageRoute(builder: (_) => Screen6(userid: userid, level: unlockedLevel,))); } : null,
                          child: Container(
                              height: size.height*0.11,
                              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xFFF2B400), // left
                                    Color(0xFFE28A00), // right
                                  ],
                                ),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 16),
                                  // 🎯 Icon
                                  Image.asset("assets/images/img_6.png", height: 40), const SizedBox(width: 16),
                                  // Text
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        TText("Wild Card",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),SizedBox(height: 4),
                                        TText("Expect the unexpected",  style: TextStyle(color: Colors.white70,fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                  // ➡ Arrow
                                  const Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Icon(Icons.chevron_right, color: Colors.white, size: 30),
                                  )
                                ],
                              )
                          ),
                        ), // Inkwell
                      ],
                    );
                  }
              )
            ]
        ),
      ),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isWeb = size.width>600;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 55),
            child: Center(child: TText("Settings", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 20, right: 12),
            child: InkWell(
              onTap: () {
                showDialog(context: context, builder: (context) {
                  return Dialog(
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: Icon(Icons.language, size: 30),
                              title: TText("Language", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 32, top: 10, bottom: 8),
                              child: InkWell(
                                  onTap: () {
                                    appLang.value = 'en';
                                    Navigator.pop(context);
                                  },
                                  child: Text( "US   English   ${isSelected ? "✓" : ""}", style: TextStyle(fontSize: 18,  color: appLang.value == 'en' ? Colors.red : Colors.black))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 32, top: 10, bottom: 8),
                              child: InkWell(
                                  onTap: () {
                                    appLang.value = 'de';
                                    Navigator.pop(context);
                                  },
                                  child: Text("DE   Deutsch   ${isSelected ? "✓" : ""}", style: TextStyle(fontSize: 18, color: appLang.value == 'de' ? Colors.red : Colors.black))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 32, top: 10, bottom: 8),
                              child: InkWell(
                                  onTap: () {
                                    appLang.value = 'fr';
                                    Navigator.pop(context);
                                  },
                                  child: Text( "FR   Francais  ${isSelected ? "✓" : ""}", style: TextStyle(fontSize: 18, color: appLang.value == 'fr' ? Colors.red : Colors.black))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 32, top: 10, bottom: 8),
                              child: InkWell(
                                  onTap: () {
                                    appLang.value = 'es';
                                    Navigator.pop(context);
                                  },
                                  child: Text( "ES  Espanol ${isSelected ? "✓" : ""}", style: TextStyle(fontSize: 18,  color: appLang.value == 'es' ? Colors.red : Colors.black))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 32, top: 10, bottom: 8),
                              child: InkWell(
                                  onTap: () {
                                    appLang.value = 'ko';
                                    Navigator.pop(context);
                                  },
                                  child: Text("KR  한국어   ${isSelected ? "✓" : ""}", style: TextStyle(fontSize: 18, color: appLang.value == 'ko' ? Colors.red : Colors.black))),
                            ),SizedBox(height: size.height*0.015),
                            Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 40, width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.orange.shade300,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(child: Text("Close", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
              },
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                  ),
                  color: Colors.green.shade300,
                  child: ListTile(
                    leading: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                        ),
                        child: Icon(Icons.language, size: 30)),
                    title: Align(
                      alignment: Alignment.topLeft,
                        child: TText("Language", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),
                    subtitle: Align(
                      alignment: Alignment.topLeft,
                        child: TText("Apply to whole App", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400))),
                    trailing: Icon(Icons.chevron_right, size: 30),
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 20, right: 12),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Help()));
              },
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                  ),
                  color: Colors.green.shade300,
                  child: ListTile(
                    leading: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                        ),
                        child: Icon(Icons.question_mark, size: 30)),
                    title: Align(
                      alignment: AlignmentDirectional.topStart,
                        child: TText("Help", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),
                    subtitle: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: TText("Guide to Play This Game",  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400))),
                    trailing: Icon(Icons.chevron_right, size: 30),
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 20, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 50, width: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.orange.shade300
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Icon(Icons.share, size: 25),
                        ), SizedBox(width: size.width*0.020,),
                        Text("Share App", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                      ],
                    )),
                Container(
                    height: 50, width: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.orange.shade300
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Icon(Icons.star_border, size: 25),
                        ), SizedBox(width: size.width*0.020),
                        Text("Rate Us", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.06),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(CupertinoIcons.back, size: 25, color: Colors.black)),
                  ), SizedBox(width: size.width*0.25),
                  TText("How to Play?", align: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 8, right: 15),
              child: TText("Step 1:", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15,),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.orange.shade300
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TText("→ When you click on the “Ready, Let’s Play” button, it moves to the “Ready to Play?” page.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                    TText("→ The Ready to Play? page contains 6 mood categories.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: TText("i. Classic", align: TextAlign.start,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: TText("ii. Party Mode", align: TextAlign.start,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: TText("iii. Couples", align: TextAlign.start,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: TText("iv. Spicy 18+", align: TextAlign.start,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: TText("v. Best Friends", align: TextAlign.start,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: TText("vi. Wild Card", align: TextAlign.start,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TText("Step 2:", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.orange.shade300
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TText("→ Each category contains 200 questions, but the player attempts only 20 questions per level.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                    TText("→ If you stop at any question, you can share that question with others using the Share Question button.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TText("Step 3:", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.orange.shade300
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TText("→  After completing a level, you are moved to the Congratulations screen, and the next level is unlocked.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TText("Step 4:", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.orange.shade300
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TText("→ To unlock and play the next level, you must first purchase the subscription for that level. After subscribing, you can play the newly unlocked level.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

