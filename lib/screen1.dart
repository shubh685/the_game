import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:never_have_iever_game/Ready%20to%20Play.dart';
import 'package:never_have_iever_game/t_text.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Classic Questions
class Screen1 extends StatefulWidget {
  final String? userid; final int level;
  const Screen1({super.key, this.userid, required this.level});

  @override
  State<Screen1> createState() => Screen1State();
}

class Screen1State extends State<Screen1> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  List<String> allquestions = [
    "I have never ever \n learned to ride a bicycle",
    "I have never ever \n baked a cake from scratch",
    "I have never ever \n been camping in the wilderness",
    "I have never ever \n watched the sunrise",
    "I have never ever \n planted a tree",
    "I have never ever \n written a poem",
    "I have never ever \n gone ice skating",
    "I have never ever \n flown in an airplane",
    "I have never ever \n seen a shooting star",
    "I have never ever \n visited a museum",
    "I have never ever \n rode a roller coaster",
    "I have never ever \n learned a magic trick",
    "I have never ever \n made homemade pizza",
    "I have never ever \n gone fishing",
    "I have never ever \n played chess",
    "I have never ever \n climbed a mountain",
    "I have never ever \n been to a concert",
    "I have never ever \n tried skateboarding",
    "I have never ever \n made a snowman",
    "I have never ever \n gone bowling",
    "I have never ever \n visited a zoo",
    "I have never ever \n learned to cook",
    "I have never ever \n been on a boat",
    "I have never ever \n picked fresh fruit",
    "I have never ever \n made a sand castle",
    "I have never ever \n gone hiking",
    "I have never ever \n played mini golf",
    "I have never ever \n watched a play",
    "I have never ever \n learned origami",
    "I have never ever \n been to a library",
    "I have never ever \n tried rock climbing",
    "I have never ever \n made lemonade",
    "I have never ever \n gone to a fair",
    "I have never ever \n played volleyball",
    "I have never ever \n visited a farm",
    "I have never ever \n made friendship bracelets",
    "I have never ever \n gone horseback riding",
    "I have never ever \n tried yoga",
    "I have never ever \n been to the beach",
    "I have never ever \n made cookies",
    "I have never ever \n played tennis",
    "I have never ever \n gone stargazing",
    "I have never ever \n visited an aquarium",
    "I have never ever \n learned to juggle",
    "I have never ever \n made a scrapbook",
    "I have never ever \n gone skiing",
    "I have never ever \n played badminton",
    "I have never ever \n visited a waterfall",
    "I have never ever \n made smoothies",
    "I have never ever \n gone zip-lining",
    "I have never ever \n played basketball",
    "I have never ever \n been to a carnival",
    "I have never ever \n learned calligraphy",
    "I have never ever \n made pancakes",
    "I have never ever \n gone kayaking",
    "I have never ever \n played table tennis",
    "I have never ever \n visited a castle",
    "I have never ever \n made soap",
    "I have never ever \n gone snorkeling",
    "I have never ever \n played frisbee",
    "I have never ever \n been to a festival",
    "I have never ever \n learned photography",
    "I have never ever \n made jam",
    "I have never ever \n gone parasailing",
    "I have never ever \n played cricket",
    "I have never ever \n visited a lighthouse",
    "I have never ever \n made candles",
    "I have never ever \n gone rafting",
    "I have never ever \n played golf",
    "I have never ever \n been to a botanical garden",
    "I have never ever \n learned pottery",
    "I have never ever \n made bread",
    "I have never ever \n gone surfing",
    "I have never ever \n played hockey",
    "I have never ever \n visited a national park",
    "I have never ever \n learned knitting",
    "I have never ever \n made salsa",
    "I have never ever \n gone scuba diving",
    "I have never ever \n played rugby",
    "I have never ever \n been to a spa",
    "I have never ever \n learned gardening",
    "I have never ever \n made pasta from scratch",
    "I have never ever \n gone paddleboarding",
    "I have never ever \n played handball",
    "I have never ever \n visited a vineyard",
    "I have never ever \n learned woodworking",
    "I have never ever \n made ice cream",
    "I have never ever \n gone paragliding",
    "I have never ever \n played lacrosse",
    "I have never ever \n been to a rodeo",
    "I have never ever \n learned sewing",
    "I have never ever \n made sushi at home",
    "I have never ever \n gone hot air ballooning",
    "I have never ever \n played water polo",
    "I have never ever \n visited a monastery",
    "I have never ever \n learned drawing",
    "I have never ever \n made chocolate",
    "I have never ever \n gone windsurfing",
    "I have never ever \n played squash",
    "I have never ever \n been to an opera",
    "I have never ever \n learned coding",
    "I have never ever \n made kombucha",
    "I have never ever \n gone kitesurfing",
    "I have never ever \n played curling",
    "I have never ever \n visited a temple",
    "I have never ever \n learned animation",
    "I have never ever \n made pickles",
    "I have never ever \n gone whale watching",
    "I have never ever \n played baseball",
    "I have never ever \n been to a ballet",
    "I have never ever \n learned meditation",
    "I have never ever \n made butter",
    "I have never ever \n gone caving",
    "I have never ever \n played softball",
    "I have never ever \n visited a palace",
    "I have never ever \n learned sign language",
    "I have never ever \n made cheese",
    "I have never ever \n gone bird watching",
    "I have never ever \n played dodgeball",
    "I have never ever \n been to a symphony",
    "I have never ever \n learned archery",
    "I have never ever \n made yogurt",
    "I have never ever \n gone fossil hunting",
    "I have never ever \n played kickball",
    "I have never ever \n visited ruins",
    "I have never ever \n learned fencing",
    "I have never ever \n made granola",
    "I have never ever \n gone geocaching",
    "I have never ever \n played croquet",
    "I have never ever \n been to a jazz club",
    "I have never ever \n learned salsa dancing",
    "I have never ever \n made hummus",
    "I have never ever \n gone orienteering",
    "I have never ever \n played bocce ball",
    "I have never ever \n visited a canyon",
    "I have never ever \n learned tango",
    "I have never ever \n made guacamole",
    "I have never ever \n gone tide pooling",
    "I have never ever \n played lawn darts",
    "I have never ever \n been to a comedy show",
    "I have never ever \n learned swing dancing",
    "I have never ever \n made pesto",
    "I have never ever \n gone metal detecting",
    "I have never ever \n played cornhole",
    "I have never ever \n visited a desert",
    "I have never ever \n learned breakdancing",
    "I have never ever \n made salad dressing",
    "I have never ever \n gone mushroom hunting",
    "I have never ever \n played horseshoes",
    "I have never ever \n been to a food festival",
    "I have never ever \n learned tap dancing",
    "I have never ever \n made teriyaki sauce",
    "I have never ever \n gone aurora hunting",
    "I have never ever \n played shuffleboard",
    "I have never ever \n visited glaciers",
    "I have never ever \n learned belly dancing",
    "I have never ever \n made barbecue sauce",
    "I have never ever \n gone storm chasing",
    "I have never ever \n played tetherball",
    "I have never ever \n been to a wine tasting",
    "I have never ever \n learned hip hop dancing",
    "I have never ever \n made marinara sauce",
    "I have never ever \n gone tide watching",
    "I have never ever \n played pickleball",
    "I have never ever \n visited hot springs",
    "I have never ever \n learned folk dancing",
    "I have never ever \n made curry paste",
    "I have never ever \n gone cloud watching",
    "I have never ever \n played spikeball",
    "I have never ever \n been to a craft fair",
    "I have never ever \n learned ballroom dancing",
    "I have never ever \n made chutney",
    "I have never ever \n gone nature photography",
    "I have never ever \n played kan jam",
    "I have never ever \n visited caves",
    "I have never ever \n learned jazz dancing",
    "I have never ever \n made relish",
    "I have never ever \n gone wildlife tracking",
    "I have never ever \n played ladder toss",
    "I have never ever \n been to a book fair",
    "I have never ever \n learned contemporary dance",
    "I have never ever \n made tahini",
    "I have never ever \n gone shell collecting",
    "I have never ever \n played kubb",
    "I have never ever \n visited geysers",
    "I have never ever \n learned Scottish dancing",
    "I have never ever \n made aioli",
    "I have never ever \n gone rock collecting",
    "I have never ever \n played molkky",
    "I have never ever \n been to an art gallery",
    "I have never ever \n learned Irish dancing",
    "I have never ever \n made tzatziki",
    "I have never ever \n gone leaf peeping",
    "I have never ever \n played rounders",
    "I have never ever \n visited volcanoes",
    "I have never ever \n learned flamenco",
    "I have never ever \n made chimichurri",
    "I have never ever \n gone flower pressing",
    "I have never ever \n played boules",
    "I have never ever \n been to a farmers market",
  ];

  List<String> questions = [];

  void _load20Questions() {
    final shuffled = List<String>.from(allquestions)..shuffle(Random());
    setState(() {
      questions = shuffled.take(20).toList();
      currentPage = 0;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pageController.hasClients) {
        _pageController.jumpToPage(0);
      }
    });
  }

  @override
  void initState() {
    _load20Questions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int totalPages = questions.length;

    return Scaffold(
      backgroundColor: const Color(0xFF18B58A),
      body: SafeArea(
        child: Column(
          children: [

            /// 🔹 Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap:  () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close, color: Colors.white)),

                  const TText("Level 1", align: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16)),

                  /// 🔀 Shuffle Button
                  IconButton(
                    icon: const Icon(Icons.shuffle, color: Colors.white),
                    onPressed: _shuffleQuestions,
                  ),
                ],
              ),
            ),

            /// 🔹 Progress Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  LinearProgressIndicator(
                    value: (currentPage + 1) / totalPages,
                    backgroundColor: Colors.white.withOpacity(0.3),
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                  const SizedBox(height: 6),
                  TText("${currentPage + 1} of $totalPages", style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            /// 🔹 Question Card
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: questions.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TText(questions[index], align: TextAlign.center,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                    ),
                  );
                },
              ),
            ),

            /// 🔹 Share Question Button (ABOVE nav buttons)
            TextButton.icon(
              onPressed: () {
                if (questions.isNotEmpty) {
                  final String question = questions[currentPage];

                  Share.share(
                    "$question\n\nPlay this fun game with me 😄",
                    subject: "Never Have I Ever",
                  );
                }
              },
              icon: const Icon(Icons.share, color: Colors.white),
              label: const TText("Share Question", style: TextStyle(color: Colors.white)),
            ),

            /// 🔹 Bottom Buttons
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [

                  /// Previous
                  Expanded(
                    child: ElevatedButton(
                      onPressed: currentPage == 0 ? null : () {
                        _pageController.previousPage(
                          duration:
                          const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade100,
                        disabledBackgroundColor:
                        Colors.white.withOpacity(0.1),
                        padding:
                        const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const TText("Previous"),
                    ),
                  ),

                  const SizedBox(width: 12),

                  /// Next
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (currentPage == totalPages - 1) {
                          Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (_) => CongratilationScreen(userid: widget.userid, completedLevel: 1),
                          ),
                          );
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        disabledBackgroundColor:
                        Colors.white.withOpacity(0.6),
                        padding:
                        const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const TText("Next", style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔀 Shuffle Logic
  void _shuffleQuestions() {
    setState(() {
      questions.shuffle(Random());
      currentPage = 0;
    });

    _pageController.jumpToPage(0);
  }
}

// Party Questions
class Screen2 extends StatefulWidget {
  final String? userid; final int level;
  const Screen2({super.key, this.userid, required this.level});

  @override
  Screen2State createState() => Screen2State();
}

class Screen2State extends State<Screen2> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  List<String> allquestions = [
    "I have never ever \n danced on a table",
    "I have never ever \n sang karaoke in front of strangers",
    "I have never ever \n stayed at a party until sunrise",
    "I have never ever \n crashed a party I wasn't invited to",
    "I have never ever \n made out with someone at a party",
    "I have never ever \n organized a surprise party",
    "I have never ever \n been thrown out of a party",
    "I have never ever \n played beer pong",
    "I have never ever \n done body shots",
    "I have never ever \n danced with a stranger",
    "I have never ever \n stolen something from a party",
    "I have never ever \n had a hangover that lasted two days",
    "I have never ever \n lost my phone at a party",
    "I have never ever \n woken up not knowing where I am",
    "I have never ever \n played spin the bottle",
    "I have never ever \n been to a foam party",
    "I have never ever \n done a keg stand",
    "I have never ever \n taken shots with strangers",
    "I have never ever \n gotten someone's number at a party",
    "I have never ever \n been the DJ at a party",
    "I have never ever \n crowd surfed",
    "I have never ever \n streaked at a party",
    "I have never ever \n played truth or dare",
    "I have never ever \n worn a costume to a non-costume party",
    "I have never ever \n been to a rave",
    "I have never ever \n danced in a cage",
    "I have never ever \n done the limbo",
    "I have never ever \n won a dance-off",
    "I have never ever \n been to a house party with over 100 people",
    "I have never ever \n snuck alcohol into a venue",
    "I have never ever \n jumped into a pool with my clothes on",
    "I have never ever \n been to a silent disco",
    "I have never ever \n done a tequila shot off someone's body",
    "I have never ever \n lost my friends at a party",
    "I have never ever \n been to an after-party",
    "I have never ever \n thrown up at a party",
    "I have never ever \n played flip cup",
    "I have never ever \n been to a rooftop party",
    "I have never ever \n done the Macarena in public",
    "I have never ever \n been to a beach party",
    "I have never ever \n played never have I ever at a party",
    "I have never ever \n been the life of the party",
    "I have never ever \n left a party without saying goodbye",
    "I have never ever \n been to a glow party",
    "I have never ever \n done karaoke duet with a stranger",
    "I have never ever \n been to a warehouse party",
    "I have never ever \n danced until my feet hurt",
    "I have never ever \n taken party photos I regret",
    "I have never ever \n been to a boat party",
    "I have never ever \n started a conga line",
    "I have never ever \n been to a themed party",
    "I have never ever \n mixed different types of alcohol",
    "I have never ever \n been to a pool party",
    "I have never ever \n challenged someone to a drinking game",
    "I have never ever \n been to a nightclub",
    "I have never ever \n worn glow sticks",
    "I have never ever \n been to a college party",
    "I have never ever \n done the worm dance move",
    "I have never ever \n been to a masquerade party",
    "I have never ever \n shotgunned a beer",
    "I have never ever \n been to a block party",
    "I have never ever \n played kings cup",
    "I have never ever \n been to a yacht party",
    "I have never ever \n done the robot dance",
    "I have never ever \n been to a festival",
    "I have never ever \n worn face paint to a party",
    "I have never ever \n been to a barn party",
    "I have never ever \n played quarters",
    "I have never ever \n been to a mansion party",
    "I have never ever \n done the moonwalk",
    "I have never ever \n been to an underground party",
    "I have never ever \n worn a ridiculous hat to a party",
    "I have never ever \n been to a bonfire party",
    "I have never ever \n played ring of fire",
    "I have never ever \n been to a penthouse party",
    "I have never ever \n attempted breakdancing at a party",
    "I have never ever \n been to a desert party",
    "I have never ever \n done a champagne toast",
    "I have never ever \n been to a loft party",
    "I have never ever \n played power hour",
    "I have never ever \n been to a garden party",
    "I have never ever \n done the floss dance",
    "I have never ever \n been to a castle party",
    "I have never ever \n made jungle juice",
    "I have never ever \n been to a basement party",
    "I have never ever \n done the dab",
    "I have never ever \n been to a mountaintop party",
    "I have never ever \n played century club",
    "I have never ever \n been to a secret party",
    "I have never ever \n done the electric slide",
    "I have never ever \n been to a treehouse party",
    "I have never ever \n played drunk jenga",
    "I have never ever \n been to a parking lot party",
    "I have never ever \n done the running man",
    "I have never ever \n been to a cave party",
    "I have never ever \n invented my own drinking game",
    "I have never ever \n been to a hotel party",
    "I have never ever \n done the shopping cart dance",
    "I have never ever \n been to a speakeasy party",
    "I have never ever \n played beer ball",
    "I have never ever \n been to a skate park party",
    "I have never ever \n done the chicken dance",
    "I have never ever \n been to a museum after-hours party",
    "I have never ever \n chugged a drink in under 5 seconds",
    "I have never ever \n been to a vineyard party",
    "I have never ever \n done the Carlton dance",
    "I have never ever \n been to a subway party",
    "I have never ever \n played slap cup",
    "I have never ever \n been to a library party",
    "I have never ever \n done the shuffle dance",
    "I have never ever \n been to a construction site party",
    "I have never ever \n played stack cup",
    "I have never ever \n been to an airplane party",
    "I have never ever \n done the twist",
    "I have never ever \n been to a lighthouse party",
    "I have never ever \n made a cocktail for strangers",
    "I have never ever \n been to a train party",
    "I have never ever \n done the cabbage patch",
    "I have never ever \n been to a bus party",
    "I have never ever \n played civil war drinking game",
    "I have never ever \n been to a treehouse party",
    "I have never ever \n done the hammer dance",
    "I have never ever \n been to an aquarium party",
    "I have never ever \n played chandelier",
    "I have never ever \n been to a zoo party",
    "I have never ever \n done the sprinkler dance",
    "I have never ever \n been to a planetarium party",
    "I have never ever \n played boom cup",
    "I have never ever \n been to a hot air balloon party",
    "I have never ever \n done the lawnmower dance",
    "I have never ever \n been to a tunnel party",
    "I have never ever \n played beer Olympics",
    "I have never ever \n been to a windmill party",
    "I have never ever \n done the dice roll dance",
    "I have never ever \n been to a bridge party",
    "I have never ever \n played drunk twister",
    "I have never ever \n been to a clock tower party",
    "I have never ever \n done the Roger Rabbit dance",
    "I have never ever \n been to a ferris wheel party",
    "I have never ever \n played beer hockey",
    "I have never ever \n been to a roller coaster party",
    "I have never ever \n done the grapevine dance",
    "I have never ever \n been to a water tower party",
    "I have never ever \n played thunderstruck",
    "I have never ever \n been to a gondola party",
    "I have never ever \n done the box step",
    "I have never ever \n been to a cable car party",
    "I have never ever \n played ride the bus",
    "I have never ever \n been to a helicopter party",
    "I have never ever \n done the hustle",
    "I have never ever \n been to a fire escape party",
    "I have never ever \n played horserace drinking game",
    "I have never ever \n been to a water slide party",
    "I have never ever \n done the butterfly dance",
    "I have never ever \n been to a trampoline party",
    "I have never ever \n played pyramid",
    "I have never ever \n been to a zipline party",
    "I have never ever \n done the bump dance",
    "I have never ever \n been to a climbing wall party",
    "I have never ever \n played battleship drinking game",
    "I have never ever \n been to a batting cage party",
    "I have never ever \n done the snake dance",
    "I have never ever \n been to a go-kart party",
    "I have never ever \n played drunk uno",
    "I have never ever \n been to a laser tag party",
    "I have never ever \n done the disco point",
    "I have never ever \n been to a bowling alley party",
    "I have never ever \n played drunk monopoly",
    "I have never ever \n been to an arcade party",
    "I have never ever \n done the pump dance",
    "I have never ever \n been to a mini golf party",
    "I have never ever \n played drink while I think",
    "I have never ever \n been to a haunted house party",
    "I have never ever \n done the shoulder lean",
    "I have never ever \n been to a corn maze party",
    "I have never ever \n played fuzzy duck",
    "I have never ever \n been to a pumpkin patch party",
    "I have never ever \n done the jerk dance",
    "I have never ever \n been to a Christmas tree farm party",
    "I have never ever \n played medusa",
    "I have never ever \n been to a flower field party",
    "I have never ever \n done the stanky leg",
    "I have never ever \n been to a sunflower field party",
    "I have never ever \n played most likely",
    "I have never ever \n been to a lavender field party",
    "I have never ever \n done the dougie",
    "I have never ever \n been to a tulip field party",
    "I have never ever \n played paranoia",
    "I have never ever \n been to a cherry blossom party",
    "I have never ever \n done the nae nae",
    "I have never ever \n been to a bamboo forest party",
    "I have never ever \n played drunk pictionary",
    "I have never ever \n been to a redwood forest party",
    "I have never ever \n done the whip",
    "I have never ever \n been to a waterfall party",
    "I have never ever \n played never have I ever with shots",
    "I have never ever \n been to a hot spring party",
    "I have never ever \n done the shoot dance",
    "I have never ever \n been to a geyser party",
    "I have never ever \n played drunk charades",
  ];

  List<String> questions = [];

  void _load20Questions() {
    final shuffled = List<String>.from(allquestions)..shuffle(Random());
    setState(() {
      questions = shuffled.take(20).toList();
      currentPage = 0;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pageController.hasClients) {
        _pageController.jumpToPage(0);
      }
    });
  }

  @override
  void initState() {
    _load20Questions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int totalPages = questions.length;

    return Scaffold(
      backgroundColor: const Color(0xFF18B58A),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFAA53F1), // purple
              Color(0xFFC23DB5), // pink
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [

              /// 🔹 Top Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap:  () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close, color: Colors.white)),

                    const TText("Level 2", align: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16)),

                    /// 🔀 Shuffle Button
                    IconButton(
                      icon: const Icon(Icons.shuffle, color: Colors.white),
                      onPressed: _shuffleQuestions,
                    ),
                  ],
                ),
              ),

              /// 🔹 Progress Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    LinearProgressIndicator(
                      value: (currentPage + 1) / totalPages,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    const SizedBox(height: 6),
                    TText("${currentPage + 1} of $totalPages", style: const TextStyle(color: Colors.white),),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              /// 🔹 Question Card
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: questions.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TText(questions[index], align: TextAlign.center, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                      ),
                    );
                  },
                ),
              ),

              /// 🔹 Share Question Button (ABOVE nav buttons)
              TextButton.icon(
                onPressed: () {
                  if (questions.isNotEmpty) {
                    final String question = questions[currentPage];

                    Share.share(
                      "$question\n\nPlay this fun game with me 😄",
                      subject: "Never Have I Ever",
                    );
                  }
                },
                icon: const Icon(Icons.share, color: Colors.white),
                label: const TText("Share Question", style: TextStyle(color: Colors.white)),
              ),

              /// 🔹 Bottom Buttons
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [

                    /// Previous
                    Expanded(
                      child: ElevatedButton(
                        onPressed: currentPage == 0 ? null : () {
                          _pageController.previousPage(
                            duration:
                            const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange.shade100,
                          disabledBackgroundColor:
                          Colors.orange.withOpacity(0.3),
                          padding:
                          const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const TText("Previous"),
                      ),
                    ),

                    const SizedBox(width: 12),

                    /// Next
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (currentPage == totalPages - 1) {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => CongratilationScreen(userid: widget.userid, completedLevel: 2)));
                          } else {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          disabledBackgroundColor:
                          Colors.white.withOpacity(0.6),
                          padding:
                          const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const TText("Next", style: TextStyle(color: Colors.black),),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔀 Shuffle Logic
  void _shuffleQuestions() {
    setState(() {
      questions.shuffle(Random());
      currentPage = 0;
    });

    _pageController.jumpToPage(0);
  }
}

// Couples Questions
class Screen3 extends StatefulWidget {
  final String? userid; final int level;
  const Screen3({super.key, this.userid, required this.level});

  @override
  Screen3State createState() => Screen3State();
}

class Screen3State extends State<Screen3> {
  final PageController _pageController = PageController();
  int currentPage = 0;


  List<String> allquestions = [
    "I have never ever \n said 'I love you' first",
    "I have never ever \n said 'I love you' and didn't mean it",
    "I have never ever \n fallen in love at first sight",
    "I have never ever \n been on a romantic vacation with a partner",
    "I have never ever \n given a promise ring",
    "I have never ever \n received a promise ring",
    "I have never ever \n planned a surprise date",
    "I have never ever \n received a surprise date",
    "I have never ever \n written a love letter",
    "I have never ever \n received a love letter",
    "I have never ever \n made a romantic gesture in public",
    "I have never ever \n slow danced with a partner",
    "I have never ever \n watched the sunrise with a partner",
    "I have never ever \n watched the sunset with a partner",
    "I have never ever \n stargazed with a partner",
    "I have never ever \n had a picnic date",
    "I have never ever \n cooked a romantic dinner for someone",
    "I have never ever \n had a romantic dinner cooked for me",
    "I have never ever \n given flowers to a partner",
    "I have never ever \n received flowers from a partner",
    "I have never ever \n celebrated an anniversary",
    "I have never ever \n forgotten an anniversary",
    "I have never ever \n met a partner's parents",
    "I have never ever \n introduced a partner to my parents",
    "I have never ever \n gone on a double date",
    "I have never ever \n been in a relationship over a year",
    "I have never ever \n been in a relationship over 5 years",
    "I have never ever \n lived with a romantic partner",
    "I have never ever \n adopted a pet with a partner",
    "I have never ever \n shared a bank account with a partner",
    "I have never ever \n talked about marriage with a partner",
    "I have never ever \n talked about having children with a partner",
    "I have never ever \n had a pregnancy scare with a partner",
    "I have never ever \n cried in front of my partner",
    "I have never ever \n seen my partner cry",
    "I have never ever \n had a big fight with a partner",
    "I have never ever \n broken up and gotten back together",
    "I have never ever \n gone through a rough patch in a relationship",
    "I have never ever \n considered couples therapy",
    "I have never ever \n gone to couples therapy",
    "I have never ever \n compromised something important for a relationship",
    "I have never ever \n changed something about myself for a partner",
    "I have never ever \n asked a partner to change something",
    "I have never ever \n had different future goals than my partner",
    "I have never ever \n stayed in a relationship longer than I should have",
    "I have never ever \n been in love with someone who didn't love me back",
    "I have never ever \n had someone in love with me that I didn't love back",
    "I have never ever \n fallen out of love with someone",
    "I have never ever \n realized I was never really in love",
    "I have never ever \n broken someone's heart",
    "I have never ever \n had my heart broken",
    "I have never ever \n sent good morning texts to a partner",
    "I have never ever \n sent goodnight texts to a partner",
    "I have never ever \n called my partner just to hear their voice",
    "I have never ever \n had a song that reminded me of my partner",
    "I have never ever \n created a playlist for my partner",
    "I have never ever \n dedicated a song to my partner",
    "I have never ever \n had a couple nickname",
    "I have never ever \n had a special place that's 'our spot'",
    "I have never ever \n recreated my first date",
    "I have never ever \n celebrated a monthly anniversary",
    "I have never ever \n kept something that reminded me of my partner",
    "I have never ever \n worn my partner's clothes",
    "I have never ever \n let my partner wear my clothes",
    "I have never ever \n shared perfume or cologne with a partner",
    "I have never ever \n bought matching items with a partner",
    "I have never ever \n had matching phone cases",
    "I have never ever \n had matching profile pictures",
    "I have never ever \n posted my partner on social media",
    "I have never ever \n made my relationship 'Instagram official'",
    "I have never ever \n changed my relationship status for someone",
    "I have never ever \n deleted couple photos after a breakup",
    "I have never ever \n kept couple photos after a breakup",
    "I have never ever \n stalked an ex's new relationship",
    "I have never ever \n compared myself to my ex's new partner",
    "I have never ever \n been jealous of my partner's ex",
    "I have never ever \n met my partner's ex",
    "I have never ever \n been friends with my partner's ex",
    "I have never ever \n had my partner meet my ex",
    "I have never ever \n stayed friends with an ex",
    "I have never ever \n been jealous of my partner's friends",
    "I have never ever \n been jealous of my partner's coworkers",
    "I have never ever \n checked my partner's phone",
    "I have never ever \n had my partner check my phone",
    "I have never ever \n shared phone passwords with a partner",
    "I have never ever \n shared social media passwords with a partner",
    "I have never ever \n tracked my partner's location",
    "I have never ever \n been tracked by my partner",
    "I have never ever \n had a gut feeling my partner was lying",
    "I have never ever \n caught my partner in a lie",
    "I have never ever \n lied to my partner",
    "I have never ever \n kept a secret from my partner",
    "I have never ever \n found out my partner kept a secret",
    "I have never ever \n snooped through my partner's things",
    "I have never ever \n found something I wish I hadn't",
    "I have never ever \n gone through my partner's messages",
    "I have never ever \n found flirty messages on my partner's phone",
    "I have never ever \n confronted my partner about something",
    "I have never ever \n been confronted by my partner",
    "I have never ever \n had a partner accuse me of something I didn't do",
    "I have never ever \n accused my partner of something they didn't do",
    "I have never ever \n apologized even though I wasn't wrong",
    "I have never ever \n held a grudge against my partner",
    "I have never ever \n brought up past issues in an argument",
    "I have never ever \n given my partner the silent treatment",
    "I have never ever \n received the silent treatment from my partner",
    "I have never ever \n slept on the couch after a fight",
    "I have never ever \n made my partner sleep on the couch",
    "I have never ever \n left during an argument",
    "I have never ever \n had my partner leave during an argument",
    "I have never ever \n said something I regret in a fight",
    "I have never ever \n heard something hurtful from my partner",
    "I have never ever \n made my partner cry during a fight",
    "I have never ever \n cried during a fight with my partner",
    "I have never ever \n yelled during an argument",
    "I have never ever \n been yelled at by my partner",
    "I have never ever \n threatened to break up during a fight",
    "I have never ever \n had my partner threaten to break up",
    "I have never ever \n broken up in the heat of the moment",
    "I have never ever \n regretted breaking up with someone",
    "I have never ever \n tried to get an ex back",
    "I have never ever \n had an ex try to get me back",
    "I have never ever \n given someone a second chance",
    "I have never ever \n been given a second chance",
    "I have never ever \n given someone multiple chances",
    "I have never ever \n been given multiple chances",
    "I have never ever \n taken back a cheater",
    "I have never ever \n been taken back after cheating",
    "I have never ever \n forgiven my partner for something big",
    "I have never ever \n been forgiven by my partner",
    "I have never ever \n struggled to trust my partner",
    "I have never ever \n had my partner struggle to trust me",
    "I have never ever \n rebuilt trust after it was broken",
    "I have never ever \n never fully trusted my partner again",
    "I have never ever \n felt like I was walking on eggshells",
    "I have never ever \n made my partner feel like they were walking on eggshells",
    "I have never ever \n been in a controlling relationship",
    "I have never ever \n been controlling in a relationship",
    "I have never ever \n been told who I can and can't see",
    "I have never ever \n told my partner who they can and can't see",
    "I have never ever \n been in a toxic relationship",
    "I have never ever \n been toxic in a relationship",
    "I have never ever \n ignored red flags in a relationship",
    "I have never ever \n known I should leave but didn't",
    "I have never ever \n stayed for the wrong reasons",
    "I have never ever \n been afraid to be single",
    "I have never ever \n jumped from relationship to relationship",
    "I have never ever \n never been single for long",
    "I have never ever \n been happier single than in a relationship",
    "I have never ever \n missed being single",
    "I have never ever \n felt trapped in a relationship",
    "I have never ever \n wanted to break up but didn't know how",
    "I have never ever \n stayed together for other people",
    "I have never ever \n stayed together for financial reasons",
    "I have never ever \n stayed together for a pet",
    "I have never ever \n stayed together because of a lease",
    "I have never ever \n broken up over text",
    "I have never ever \n been broken up with over text",
    "I have never ever \n been ghosted by someone I was dating",
    "I have never ever \n ghosted someone I was dating",
    "I have never ever \n had someone break up with me out of nowhere",
    "I have never ever \n broken up with someone out of nowhere",
    "I have never ever \n been blindsided by a breakup",
    "I have never ever \n knew a breakup was coming",
    "I have never ever \n been relieved after a breakup",
    "I have never ever \n cried after a breakup",
    "I have never ever \n not cried after a breakup",
    "I have never ever \n immediately felt better after a breakup",
    "I have never ever \n regretted a breakup immediately",
    "I have never ever \n wanted to get back together right away",
    "I have never ever \n begged someone to take me back",
    "I have never ever \n had someone beg me to take them back",
    "I have never ever \n blocked an ex on everything",
    "I have never ever \n been blocked by an ex",
    "I have never ever \n deleted all traces of an ex",
    "I have never ever \n kept everything from a relationship",
    "I have never ever \n burned or destroyed items from an ex",
    "I have never ever \n returned everything to an ex",
    "I have never ever \n asked for my things back",
    "I have never ever \n never got my things back",
    "I have never ever \n told mutual friends about the breakup first",
    "I have never ever \n had to pick sides after a couple broke up",
    "I have never ever \n lost friends after a breakup",
    "I have never ever \n had friends take my ex's side",
    "I have never ever \n had friends trash talk my ex",
    "I have never ever \n trash talked an ex to friends",
    "I have never ever \n defended an ex after a breakup",
    "I have never ever \n stayed friends with my ex",
    "I have never ever \n said I'd stay friends but didn't",
    "I have never ever \n missed my ex",
    "I have never ever \n didn't miss my ex at all",
    "I have never ever \n missed the idea of my ex more than them",
    "I have never ever \n romanticized a past relationship",
    "I have never ever \n realized a past relationship wasn't that great",
    "I have never ever \n had closure after a breakup",
    "I have never ever \n never got closure",
    "I have never ever \n needed closure and reached out",
    "I have never ever \n been asked for closure",
    "I have never ever \n moved on quickly after a breakup",
    "I have never ever \n taken years to move on",
  ];

  List<String> questions = [];

  void _load20Questions() {
    final shuffled = List<String>.from(allquestions)..shuffle(Random());
    setState(() {
      questions = shuffled.take(20).toList();
      currentPage = 0;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pageController.hasClients) {
        _pageController.jumpToPage(0);
      }
    });
  }

  @override
  void initState() {
    _load20Questions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int totalPages = questions.length;

    return Scaffold(
      backgroundColor: const Color(0xFF18B58A),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE2333F),
              Color(0xFFEF3A4B),
              Color(0xFFF04A58),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [

              /// 🔹 Top Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap:  () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close, color: Colors.white)),

                    const TText("Level 3", align: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16)),

                    /// 🔀 Shuffle Button
                    IconButton(
                      icon: const Icon(Icons.shuffle, color: Colors.white),
                      onPressed: _shuffleQuestions,
                    ),
                  ],
                ),
              ),

              /// 🔹 Progress Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    LinearProgressIndicator(
                      value: (currentPage + 1) / totalPages,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    const SizedBox(height: 6),
                    TText("${currentPage + 1} of $totalPages", style: const TextStyle(color: Colors.white),),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              /// 🔹 Question Card
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: questions.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TText(questions[index], align: TextAlign.center, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                      ),
                    );
                  },
                ),
              ),

              /// 🔹 Share Question Button (ABOVE nav buttons)
              TextButton.icon(
                onPressed: () {
                  if (questions.isNotEmpty) {
                    final String question = questions[currentPage];

                    Share.share(
                      "$question\n\nPlay this fun game with me 😄",
                      subject: "Never Have I Ever",
                    );
                  }
                },
                icon: const Icon(Icons.share, color: Colors.white),
                label: const TText("Share Question", style: TextStyle(color: Colors.white)),
              ),

              /// 🔹 Bottom Buttons
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [

                    /// Previous
                    Expanded(
                      child: ElevatedButton(
                        onPressed: currentPage == 0 ? null : () {
                          _pageController.previousPage(
                            duration:
                            const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange.shade100,
                          disabledBackgroundColor:
                          Colors.orange.withOpacity(0.3),
                          padding:
                          const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const TText("Previous"),
                      ),
                    ),

                    const SizedBox(width: 12),

                    /// Next
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (currentPage == totalPages - 1) {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => CongratilationScreen(userid: widget.userid, completedLevel: 3)));
                          } else {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          disabledBackgroundColor:
                          Colors.white.withOpacity(0.6),
                          padding:
                          const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const TText("Next", style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔀 Shuffle Logic
  void _shuffleQuestions() {
    setState(() {
      questions.shuffle(Random());
      currentPage = 0;
    });

    _pageController.jumpToPage(0);
  }
}

// 18+ Questions
class Screen4 extends StatefulWidget {
  final String? userid; final int level;
  const Screen4({super.key, this.userid, required this.level});

  @override
  Screen4State createState() => Screen4State();
}

class Screen4State extends State<Screen4> {
  final PageController _pageController = PageController();
  int currentPage = 0;

// in the Congratulation screen UI section of screen1.dart
  List<String> allquestions = [
    "I have never ever \n sent a nude photo",
    "I have never ever \n received a nude photo",
    "I have never ever \n had a one night stand",
    "I have never ever \n hooked up with someone I just met",
    "I have never ever \n made out in public",
    "I have never ever \n had a friends with benefits relationship",
    "I have never ever \n kissed more than one person in the same night",
    "I have never ever \n gone skinny dipping",
    "I have never ever \n joined the mile high club",
    "I have never ever \n had a threesome",
    "I have never ever \n watched adult content with a partner",
    "I have never ever \n been to a strip club",
    "I have never ever \n given a lap dance",
    "I have never ever \n received a lap dance",
    "I have never ever \n role played in the bedroom",
    "I have never ever \n used handcuffs or restraints",
    "I have never ever \n blindfolded a partner",
    "I have never ever \n been blindfolded by a partner",
    "I have never ever \n tried food play",
    "I have never ever \n had a secret relationship",
    "I have never ever \n cheated on someone",
    "I have never ever \n been cheated on",
    "I have never ever \n hooked up with an ex",
    "I have never ever \n hooked up with a friend's ex",
    "I have never ever \n kissed someone in a relationship",
    "I have never ever \n been the other person in a relationship",
    "I have never ever \n lied about my body count",
    "I have never ever \n regretted who I lost my virginity to",
    "I have never ever \n faked being sober to hook up",
    "I have never ever \n hooked up in a car",
    "I have never ever \n hooked up in a public place",
    "I have never ever \n hooked up at work",
    "I have never ever \n hooked up in a bathroom",
    "I have never ever \n hooked up on a beach",
    "I have never ever \n hooked up in a pool or hot tub",
    "I have never ever \n hooked up in a changing room",
    "I have never ever \n hooked up in nature",
    "I have never ever \n hooked up in someone else's bed",
    "I have never ever \n been walked in on",
    "I have never ever \n walked in on someone else",
    "I have never ever \n sent a sext",
    "I have never ever \n received a sext",
    "I have never ever \n had phone intimacy",
    "I have never ever \n had video intimacy",
    "I have never ever \n posted a thirst trap",
    "I have never ever \n slid into someone's DMs",
    "I have never ever \n had someone slide into my DMs",
    "I have never ever \n used a dating app for hookups",
    "I have never ever \n met someone from a dating app",
    "I have never ever \n hooked up with someone from a dating app",
    "I have never ever \n gone commando",
    "I have never ever \n owned adult toys",
    "I have never ever \n shopped for adult toys online",
    "I have never ever \n been to an adult store",
    "I have never ever \n watched adult content",
    "I have never ever \n subscribed to adult content",
    "I have never ever \n read erotic literature",
    "I have never ever \n written my own erotic content",
    "I have never ever \n had a romantic dream about someone unexpected",
    "I have never ever \n had a romantic dream about a friend",
    "I have never ever \n fantasized about someone I know",
    "I have never ever \n fantasized about a celebrity",
    "I have never ever \n fantasized about a fictional character",
    "I have never ever \n had a crush on someone much older",
    "I have never ever \n had a crush on someone much younger",
    "I have never ever \n been attracted to my friend's partner",
    "I have never ever \n been attracted to my partner's friend",
    "I have never ever \n flirted while in a relationship",
    "I have never ever \n emotionally cheated",
    "I have never ever \n kissed someone to make someone else jealous",
    "I have never ever \n dated multiple people at once",
    "I have never ever \n kept my options open while dating",
    "I have never ever \n gone on a date just for free food",
    "I have never ever \n ghosted someone after intimacy",
    "I have never ever \n been ghosted after intimacy",
    "I have never ever \n had a summer romance",
    "I have never ever \n had a vacation fling",
    "I have never ever \n hooked up with someone from another country",
    "I have never ever \n hooked up with someone whose name I forgot",
    "I have never ever \n pretended to remember someone's name",
    "I have never ever \n given a fake name",
    "I have never ever \n given a fake number",
    "I have never ever \n lied about my job",
    "I have never ever \n lied about being single",
    "I have never ever \n had a secret admirer",
    "I have never ever \n been someone's secret admirer",
    "I have never ever \n sent an anonymous love letter",
    "I have never ever \n received an anonymous gift",
    "I have never ever \n confessed feelings while intoxicated",
    "I have never ever \n kissed someone while intoxicated",
    "I have never ever \n regretted a drunken hookup",
    "I have never ever \n woken up next to someone and regretted it",
    "I have never ever \n sneaked out to see someone",
    "I have never ever \n had someone sneak into my room",
    "I have never ever \n climbed through a window for someone",
    "I have never ever \n lied to my parents about where I was",
    "I have never ever \n covered for a friend's hookup",
    "I have never ever \n been caught by my parents",
    "I have never ever \n been caught by roommates",
    "I have never ever \n accidentally sent a risky message to the wrong person",
    "I have never ever \n screenshot someone's message to show friends",
    "I have never ever \n stalked an ex's new partner",
    "I have never ever \n compared myself to an ex's new partner",
    "I have never ever \n looked up an ex on social media",
    "I have never ever \n unblocked an ex",
    "I have never ever \n texted an ex after midnight",
    "I have never ever \n responded to an ex's late night text",
    "I have never ever \n considered getting back with an ex",
    "I have never ever \n gotten back together with an ex",
    "I have never ever \n had an on-again-off-again relationship",
    "I have never ever \n stayed in a toxic relationship",
    "I have never ever \n dated someone my friends didn't approve of",
    "I have never ever \n dated someone my family didn't approve of",
    "I have never ever \n kept a relationship secret from friends",
    "I have never ever \n kept a relationship secret from family",
    "I have never ever \n lied about having a relationship",
    "I have never ever \n pretended to be single when I wasn't",
    "I have never ever \n been in an open relationship",
    "I have never ever \n suggested an open relationship",
    "I have never ever \n been in a long distance relationship",
    "I have never ever \n cheated in a long distance relationship",
    "I have never ever \n maintained multiple dating app profiles",
    "I have never ever \n used someone else's photos on a dating app",
    "I have never ever \n catfished someone",
    "I have never ever \n been catfished",
    "I have never ever \n lied about my age on a dating app",
    "I have never ever \n lied about my height",
    "I have never ever \n used heavily edited photos on dating apps",
    "I have never ever \n been surprised by someone's real appearance",
    "I have never ever \n left in the middle of a bad date",
    "I have never ever \n been stood up on a date",
    "I have never ever \n stood someone up on a date",
    "I have never ever \n gone on a blind date",
    "I have never ever \n been set up by friends",
    "I have never ever \n set up two friends",
    "I have never ever \n double dated",
    "I have never ever \n been on a group date",
    "I have never ever \n crashed a date",
    "I have never ever \n spied on someone's date",
    "I have never ever \n given relationship advice I don't follow",
    "I have never ever \n judged someone's relationship choices",
    "I have never ever \n been jealous of a friend's relationship",
    "I have never ever \n been the third wheel",
    "I have never ever \n made friends feel like the third wheel",
    "I have never ever \n ditched friends for a date",
    "I have never ever \n cancelled plans for a hookup",
    "I have never ever \n lied about why I cancelled plans",
    "I have never ever \n prioritized a relationship over friendships",
    "I have never ever \n lost friends because of a relationship",
    "I have never ever \n chosen a partner over friends",
    "I have never ever \n had a workplace romance",
    "I have never ever \n hooked up with a coworker",
    "I have never ever \n hooked up with my boss",
    "I have never ever \n dated my boss",
    "I have never ever \n dated a subordinate",
    "I have never ever \n kept a workplace relationship secret",
    "I have never ever \n been caught in a workplace romance",
    "I have never ever \n flirted with a customer or client",
    "I have never ever \n given my number to a customer",
    "I have never ever \n hooked up with a customer",
    "I have never ever \n hooked up with my teacher or professor",
    "I have never ever \n had a crush on my teacher or professor",
    "I have never ever \n flirted with a teacher or professor",
    "I have never ever \n dated someone from my class",
    "I have never ever \n hooked up with someone from my class",
    "I have never ever \n studied together as an excuse to hang out",
    "I have never ever \n joined a club or activity because of a crush",
    "I have never ever \n changed my schedule to see someone more",
    "I have never ever \n taken a class because of someone",
    "I have never ever \n gone to the gym because someone would be there",
    "I have never ever \n showed up somewhere hoping to see someone",
    "I have never ever \n asked friends about someone's relationship status",
    "I have never ever \n stalked someone's social media before meeting them",
    "I have never ever \n googled someone before a date",
    "I have never ever \n looked up someone's dating history",
    "I have never ever \n checked if an ex is in a new relationship",
    "I have never ever \n gotten jealous seeing an ex happy",
    "I have never ever \n posted on social media to make an ex jealous",
    "I have never ever \n posted a photo with someone to make someone jealous",
    "I have never ever \n used someone to make someone else jealous",
    "I have never ever \n been used to make someone jealous",
    "I have never ever \n been a rebound",
    "I have never ever \n used someone as a rebound",
    "I have never ever \n gotten together with someone right after a breakup",
    "I have never ever \n jumped from one relationship to another",
    "I have never ever \n been afraid to be alone",
    "I have never ever \n stayed with someone because of fear of being alone",
    "I have never ever \n settled in a relationship",
    "I have never ever \n dated someone I wasn't attracted to",
    "I have never ever \n dated someone for their money",
    "I have never ever \n dated someone for their status",
    "I have never ever \n been a sugar baby or sugar daddy",
    "I have never ever \n accepted expensive gifts from someone",
    "I have never ever \n been on a date just for the expensive restaurant",
    "I have never ever \n let someone pay for everything",
    "I have never ever \n expected someone to pay for dates",
    "I have never ever \n been uncomfortable with splitting the bill",
    "I have never ever \n judged someone for not paying",
    "I have never ever \n argued about who should pay",
    "I have never ever \n pretended to reach for my wallet",
  ];

  List<String> questions = [];

  void _load20Questions() {
    final shuffled = List<String>.from(allquestions)..shuffle(Random());
    setState(() {
      questions = shuffled.take(20).toList();
      currentPage = 0;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pageController.hasClients) {
        _pageController.jumpToPage(0);
      }
    });
  }

  @override
  void initState() {
    _load20Questions();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final int totalPages = questions.length;

    return Scaffold(
      backgroundColor: const Color(0xFF18B58A),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFFF25F1A),
                Color(0xFFE33922),
              ],
            )
        ),
        child: SafeArea(
          child: Column(
            children: [

              /// 🔹 Top Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap:  () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close, color: Colors.white)),

                    const TText("Level 4", align: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16)),

                    /// 🔀 Shuffle Button
                    IconButton(
                      icon: const Icon(Icons.shuffle, color: Colors.white),
                      onPressed: _shuffleQuestions,
                    ),
                  ],
                ),
              ),

              /// 🔹 Progress Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    LinearProgressIndicator(
                      value: (currentPage + 1) / totalPages,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    const SizedBox(height: 6),
                    TText("${currentPage + 1} of $totalPages", style: const TextStyle(color: Colors.white),),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              /// 🔹 Question Card
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: questions.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TText(questions[index], align: TextAlign.center, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                      ),
                    );
                  },
                ),
              ),

              /// 🔹 Share Question Button (ABOVE nav buttons)
              TextButton.icon(
                onPressed: () {
                  if (questions.isNotEmpty) {
                    final String question = questions[currentPage];

                    Share.share(
                      "$question\n\nPlay this fun game with me 😄",
                      subject: "Never Have I Ever",
                    );
                  }
                },
                icon: const Icon(Icons.share, color: Colors.white),
                label: const TText("Share Question", style: TextStyle(color: Colors.white)),
              ),

              /// 🔹 Bottom Buttons
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [

                    /// Previous
                    Expanded(
                      child: ElevatedButton(
                        onPressed: currentPage == 0 ? null : () {
                          _pageController.previousPage(
                            duration:
                            const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange.shade100,
                          disabledBackgroundColor:
                          Colors.orange.withOpacity(0.3),
                          padding:
                          const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const TText("Previous"),
                      ),
                    ),

                    const SizedBox(width: 12),

                    /// Next
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (currentPage == totalPages - 1) {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => CongratilationScreen(userid: widget.userid, completedLevel: 4)));
                          } else {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          disabledBackgroundColor:
                          Colors.white.withOpacity(0.6),
                          padding:
                          const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          "Next",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔀 Shuffle Logic
  void _shuffleQuestions() {
    setState(() {
      questions.shuffle(Random());
      currentPage = 0;
    });

    _pageController.jumpToPage(0);
  }
}

// freinds questions
class Screen5 extends StatefulWidget {
  final String? userid; final int level;
  const Screen5({super.key, this.userid, required this.level});

  @override
  Screen5State createState() => Screen5State();
}

class Screen5State extends State<Screen5> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  List<String> allquestions = [
    "I have never ever \n pretended to understand a sport I knew nothing about",
    "I have never ever \n lied about how much I can bench press",
    "I have never ever \n challenged a friend to an arm wrestling match",
    "I have never ever \n worn the same clothes multiple days in a row",
    "I have never ever \n forgotten someone's name right after meeting them",
    "I have never ever \n pretended my phone died to avoid a conversation",
    "I have never ever \n had a nickname I didn't choose",
    "I have never ever \n lost a bet and had to do something embarrassing",
    "I have never ever \n competed in a video game tournament",
    "I have never ever \n stayed up all night playing games",
    "I have never ever \n broken something and blamed it on someone else",
    "I have never ever \n tried to grow a beard",
    "I have never ever \n worn sunglasses indoors",
    "I have never ever \n pretended to be sick to skip something",
    "I have never ever \n eaten an entire pizza by myself",
    "I have never ever \n had a secret handshake",
    "I have never ever \n flexed in front of a mirror",
    "I have never ever \n trash talked during a game",
    "I have never ever \n lost my wallet",
    "I have never ever \n forgotten where I parked",
    "I have never ever \n been in a food eating contest",
    "I have never ever \n shaved my head",
    "I have never ever \n pulled an all-nighter studying",
    "I have never ever \n ripped my pants in public",
    "I have never ever \n locked myself out of my house",
    "I have never ever \n fallen asleep during a movie",
    "I have never ever \n pretended to know how to fix something",
    "I have never ever \n gotten into a friendly wrestling match",
    "I have never ever \n worn a jersey with my favorite player's name",
    "I have never ever \n challenged someone to a race",
    "I have never ever \n made a crazy dare",
    "I have never ever \n gotten a sunburn from falling asleep outside",
    "I have never ever \n tried to impress someone with my skills",
    "I have never ever \n forgotten an important date",
    "I have never ever \n spilled something on my shirt before an event",
    "I have never ever \n been late because I lost track of time gaming",
    "I have never ever \n attempted a parkour move",
    "I have never ever \n high-fived someone and missed",
    "I have never ever \n competed to see who could eat the spiciest food",
    "I have never ever \n fallen off a skateboard or bike",
    "I have never ever \n been part of a prank war",
    "I have never ever \n used duct tape to fix something",
    "I have never ever \n watched all seasons of a show in one weekend",
    "I have never ever \n forgotten to shower before going out",
    "I have never ever \n broken a phone screen",
    "I have never ever \n argued about which superhero is strongest",
    "I have never ever \n tried to cook something fancy and failed",
    "I have never ever \n been in a mosh pit",
    "I have never ever \n challenged someone to a push-up contest",
    "I have never ever \n made up an excuse to get out of work",
    "I have never ever \n owned a gaming console",
    "I have never ever \n been fishing with friends",
    "I have never ever \n had a man cave or dedicated space",
    "I have never ever \n watched a boxing or UFC fight",
    "I have never ever \n gone to a sports bar",
    "I have never ever \n owned workout equipment I never use",
    "I have never ever \n been on a road trip with the guys",
    "I have never ever \n played poker with friends",
    "I have never ever \n changed my own car oil",
    "I have never ever \n been to a bachelor party",
    "I have never ever \n owned multiple pairs of sneakers",
    "I have never ever \n subscribed to a sports channel",
    "I have never ever \n argued about the best action movie",
    "I have never ever \n built something from scratch",
    "I have never ever \n gone camping without any plans",
    "I have never ever \n owned a power tool",
    "I have never ever \n been to a car show",
    "I have never ever \n competed in fantasy sports",
    "I have never ever \n gone to the gym at midnight",
    "I have never ever \n learned to change a tire",
    "I have never ever \n been to a monster truck show",
    "I have never ever \n owned a grill",
    "I have never ever \n watched a game at a stadium",
    "I have never ever \n had a heated debate about music",
    "I have never ever \n gone hiking without proper gear",
    "I have never ever \n owned a motorcycle or wanted one",
    "I have never ever \n been to a comedy club with friends",
    "I have never ever \n tried extreme sports",
    "I have never ever \n built a campfire",
    "I have never ever \n gone to a music festival",
    "I have never ever \n owned sports memorabilia",
    "I have never ever \n been in a band or jam session",
    "I have never ever \n gone paintballing",
    "I have never ever \n had a favorite bar or hangout spot",
    "I have never ever \n watched an entire sports season",
    "I have never ever \n owned a dart board",
    "I have never ever \n been to a tailgate party",
    "I have never ever \n learned a trick shot",
    "I have never ever \n gone deep sea fishing",
    "I have never ever \n owned a baseball cap collection",
    "I have never ever \n been to a demolition derby",
    "I have never ever \n had a wingman",
    "I have never ever \n gone to a drive-in movie",
    "I have never ever \n owned a pool table",
    "I have never ever \n been to a car race",
    "I have never ever \n had a signature drink order",
    "I have never ever \n gone hunting",
    "I have never ever \n owned a foosball table",
    "I have never ever \n been to a shooting range",
    "I have never ever \n had a garage I actually use",
    "I have never ever \n organized a guys' night out",
    "I have never ever \n been to a brewery tour",
    "I have never ever \n owned a tool belt",
    "I have never ever \n watched a documentary about wars or history",
    "I have never ever \n gone rock climbing outdoors",
    "I have never ever \n had a lucky jersey or shirt",
    "I have never ever \n been to a wrestling event",
    "I have never ever \n owned a ping pong table",
    "I have never ever \n tried to build furniture myself",
    "I have never ever \n gone on a spontaneous adventure",
    "I have never ever \n had an epic fail moment captured on video",
    "I have never ever \n been part of a sports team",
    "I have never ever \n owned a drone",
    "I have never ever \n gone off-roading",
    "I have never ever \n had a debate about the best video game",
    "I have never ever \n been to a go-kart track",
    "I have never ever \n owned a leather jacket",
    "I have never ever \n tried to juggle",
    "I have never ever \n gone to an arcade",
    "I have never ever \n had a competition to see who's stronger",
    "I have never ever \n been cliff diving",
    "I have never ever \n owned a Swiss Army knife",
    "I have never ever \n gone to a comic convention",
    "I have never ever \n had a favorite action hero",
    "I have never ever \n been in an escape room",
    "I have never ever \n owned a punching bag",
    "I have never ever \n gone white water rafting",
    "I have never ever \n had an embarrassing gym moment",
    "I have never ever \n been to a LAN party",
    "I have never ever \n owned board shorts",
    "I have never ever \n tried to break a world record",
    "I have never ever \n gone zorbing",
    "I have never ever \n had a ridiculous injury story",
    "I have never ever \n been indoor skydiving",
    "I have never ever \n owned a hammock",
    "I have never ever \n tried fire breathing or fire tricks",
    "I have never ever \n gone wakeboarding",
    "I have never ever \n had a collection of something random",
    "I have never ever \n been to a trampoline park",
    "I have never ever \n owned cargo shorts",
    "I have never ever \n tried to learn a backflip",
    "I have never ever \n gone tubing down a river",
    "I have never ever \n had a secret talent",
    "I have never ever \n been sandboarding",
    "I have never ever \n owned a gaming chair",
    "I have never ever \n tried to grow a mustache",
    "I have never ever \n gone ice fishing",
    "I have never ever \n had a crazy road trip story",
    "I have never ever \n been axe throwing",
    "I have never ever \n owned a bandana",
    "I have never ever \n tried BMX biking",
    "I have never ever \n gone to a demolition site",
    "I have never ever \n had matching outfits with friends",
    "I have never ever \n been to a ninja warrior gym",
    "I have never ever \n owned a tactical flashlight",
    "I have never ever \n tried slacklining",
    "I have never ever \n gone base jumping",
    "I have never ever \n had a legendary comeuppance story",
    "I have never ever \n been canyoneering",
    "I have never ever \n owned a multi-tool",
    "I have never ever \n tried to build a treehouse",
    "I have never ever \n gone heli-skiing",
    "I have never ever \n had an inside joke that lasted years",
    "I have never ever \n been ice climbing",
    "I have never ever \n owned a carabiner for non-climbing purposes",
    "I have never ever \n tried free running",
    "I have never ever \n gone snowmobiling",
    "I have never ever \n had a nickname for my car",
    "I have never ever \n been sand sailing",
    "I have never ever \n owned tactical gear",
    "I have never ever \n tried to learn knife throwing",
    "I have never ever \n gone dirt biking",
    "I have never ever \n had a competition eating wings",
    "I have never ever \n been caving or spelunking",
    "I have never ever \n owned paracord bracelets",
    "I have never ever \n tried urban exploration",
    "I have never ever \n gone bobsledding",
    "I have never ever \n had a group chat with hilarious names",
    "I have never ever \n been kite skiing",
    "I have never ever \n owned a utility vest",
    "I have never ever \n tried longboarding",
    "I have never ever \n gone volcano boarding",
    "I have never ever \n had a competition for who could grow the best beard",
    "I have never ever \n been coasteering",
    "I have never ever \n owned a tactical backpack",
    "I have never ever \n tried downhill mountain biking",
    "I have never ever \n gone dog sledding",
    "I have never ever \n had a road trip playlist",
    "I have never ever \n been land sailing",
    "I have never ever \n owned a machete",
    "I have never ever \n tried street luge",
    "I have never ever \n gone ice yachting",
    "I have never ever \n had a legendary prank story",
    "I have never ever \n been sand skiing",
    "I have never ever \n owned a survival kit",
    "I have never ever \n tried aggressive inline skating",
    "I have never ever \n gone cave diving",
    "I have never ever \n had a friend group tradition",
    "I have never ever \n been volcano surfing",
    "I have never ever \n owned a rope and grappling hook",
  ];

  List<String> questions = [];

  void _load20Questions() {
    final shuffled = List<String>.from(allquestions)..shuffle(Random());
    setState(() {
      questions = shuffled.take(20).toList();
      currentPage = 0;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pageController.hasClients) {
        _pageController.jumpToPage(0);
      }
    });
  }

  @override
  void initState() {
    _load20Questions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int totalPages = questions.length;

    return Scaffold(
      backgroundColor: const Color(0xFF18B58A),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4A7CF3),
              Color(0xFF4E6EF2),
              Color(0xFF4B5DE6),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [

              /// 🔹 Top Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap:  () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close, color: Colors.white)),

                    const TText("Level 5", align: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16)),

                    /// 🔀 Shuffle Button
                    IconButton(
                      icon: const Icon(Icons.shuffle, color: Colors.white),
                      onPressed: _shuffleQuestions,
                    ),
                  ],
                ),
              ),

              /// 🔹 Progress Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    LinearProgressIndicator(
                      value: (currentPage + 1) / totalPages,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    const SizedBox(height: 6),
                    TText("${currentPage + 1} of $totalPages", style: const TextStyle(color: Colors.white),),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              /// 🔹 Question Card
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: questions.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TText(questions[index], align: TextAlign.center, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                      ),
                    );
                  },
                ),
              ),

              /// 🔹 Share Question Button (ABOVE nav buttons)
              TextButton.icon(
                onPressed: () {
                  if (questions.isNotEmpty) {
                    final String question = questions[currentPage];

                    Share.share(
                      "$question\n\nPlay this fun game with me 😄",
                      subject: "Never Have I Ever",
                    );
                  }
                },
                icon: const Icon(Icons.share, color: Colors.white),
                label: const TText("Share Question", style: TextStyle(color: Colors.white)),
              ),

              /// 🔹 Bottom Buttons
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [

                    /// Previous
                    Expanded(
                      child: ElevatedButton(
                        onPressed: currentPage == 0 ? null : () {
                          _pageController.previousPage(
                            duration:
                            const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange.shade100,
                          disabledBackgroundColor:
                          Colors.orange.withOpacity(0.3),
                          padding:
                          const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const TText("Previous"),
                      ),
                    ),

                    const SizedBox(width: 12),

                    /// Next
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (currentPage == totalPages - 1) {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => CongratilationScreen(userid: widget.userid, completedLevel: 5)));
                          } else {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          disabledBackgroundColor:
                          Colors.white.withOpacity(0.6),
                          padding:
                          const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const TText("Next", style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔀 Shuffle Logic
  void _shuffleQuestions() {
    setState(() {
      questions.shuffle(Random());
      currentPage = 0;
    });

    _pageController.jumpToPage(0);
  }
}

// Wild card questions
class Screen6 extends StatefulWidget {
  final String? userid; final int level;
  const Screen6({super.key, this.userid, required this.level});

  @override
  Screen6State createState() => Screen6State();
}

class Screen6State extends State<Screen6> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  List<String> allquestions = [
    "I have never ever \n stalked an ex on social media",
    "I have never ever \n cried during a romantic movie",
    "I have never ever \n had a girls' night out",
    "I have never ever \n gone shopping for therapy",
    "I have never ever \n shared clothes with friends",
    "I have never ever \n had a spa day",
    "I have never ever \n got a manicure or pedicure",
    "I have never ever \n dyed my hair a crazy color",
    "I have never ever \n had a sleepover",
    "I have never ever \n did each other's makeup",
    "I have never ever \n had a photoshoot with friends",
    "I have never ever \n worn high heels that hurt my feet",
    "I have never ever \n bought something just because it was on sale",
    "I have never ever \n had a crush on a teacher",
    "I have never ever \n pretended to be interested in someone's story",
    "I have never ever \n checked my horoscope",
    "I have never ever \n had a pregnancy scare",
    "I have never ever \n been to a bachelorette party",
    "I have never ever \n tried a crazy diet",
    "I have never ever \n owned more than 20 pairs of shoes",
    "I have never ever \n had a secret admirer",
    "I have never ever \n sent screenshots of messages to friends",
    "I have never ever \n stalked my crush's entire Instagram",
    "I have never ever \n pretended to be on my phone to avoid someone",
    "I have never ever \n had a wardrobe malfunction",
    "I have never ever \n worn makeup to the gym",
    "I have never ever \n had a friends with benefits situation",
    "I have never ever \n gone out in public without a bra",
    "I have never ever \n faked confidence I didn't have",
    "I have never ever \n had a toxic friendship",
    "I have never ever \n compared myself to other girls",
    "I have never ever \n ghosted someone",
    "I have never ever \n been ghosted",
    "I have never ever \n had a summer fling",
    "I have never ever \n kissed someone on the first date",
    "I have never ever \n checked out someone's partner",
    "I have never ever \n had a crush on my best friend's sibling",
    "I have never ever \n lied about my age",
    "I have never ever \n pretended to have plans when I didn't",
    "I have never ever \n unfollowed someone after a breakup",
    "I have never ever \n had a rebound relationship",
    "I have never ever \n sent a risky text message",
    "I have never ever \n regretted a hookup",
    "I have never ever \n had a one-night stand",
    "I have never ever \n dated someone my friends didn't like",
    "I have never ever \n kept a relationship a secret",
    "I have never ever \n checked my partner's phone",
    "I have never ever \n faked an orgasm",
    "I have never ever \n had a friend who stole my crush",
    "I have never ever \n been in love with two people at the same time",
    "I have never ever \n gone to brunch with mimosas",
    "I have never ever \n had a wine night with girlfriends",
    "I have never ever \n taken a bubble bath",
    "I have never ever \n done a face mask",
    "I have never ever \n had my nails professionally done",
    "I have never ever \n had my eyebrows done",
    "I have never ever \n tried contouring makeup",
    "I have never ever \n owned a little black dress",
    "I have never ever \n worn shapewear",
    "I have never ever \n had extensions or a wig",
    "I have never ever \n gotten eyelash extensions",
    "I have never ever \n tried false eyelashes",
    "I have never ever \n had acrylic nails",
    "I have never ever \n gotten a wax",
    "I have never ever \n had a skincare routine with more than 5 steps",
    "I have never ever \n tried a sheet mask",
    "I have never ever \n used a jade roller",
    "I have never ever \n owned more than 10 lipsticks",
    "I have never ever \n tried a bold lip color",
    "I have never ever \n taken over an hour to get ready",
    "I have never ever \n changed my outfit several times before going out",
    "I have never ever \n asked friends which outfit looked better",
    "I have never ever \n bought an outfit for a specific event",
    "I have never ever \n worn something uncomfortable because it looked good",
    "I have never ever \n walked for hours in high heels",
    "I have never ever \n carried flat shoes in my handbag for later",
    "I have never ever \n had a closet full of clothes but nothing to wear",
    "I have never ever \n bought duplicate items in different colors",
    "I have never ever \n had a favorite handbag",
    "I have never ever \n collected perfumes",
    "I have never ever \n had a signature scent",
    "I have never ever \n tried Pilates or yoga",
    "I have never ever \n attended a barre class",
    "I have never ever \n tried hot yoga",
    "I have never ever \n attended a spinning class",
    "I have never ever \n done Zumba",
    "I have never ever \n tried aerial yoga",
    "I have never ever \n attended a dance fitness class",
    "I have never ever \n tried kickboxing",
    "I have never ever \n visited a boutique gym",
    "I have never ever \n had a gym membership I barely used",
    "I have never ever \n tried a juice cleanse",
    "I have never ever \n done a detox",
    "I have never ever \n tried intermittent fasting",
    "I have never ever \n counted calories",
    "I have never ever \n tried keto",
    "I have never ever \n eaten gluten-free",
    "I have never ever \n tried vegan",
    "I have never ever \n taken progress photos",
    "I have never ever \n worn activewear as regular clothes",
    "I have never ever \n had a girl crush",
    "I have never ever \n complimented a stranger's outfit",
    "I have never ever \n made a friend in the restroom",
    "I have never ever \n helped a stranger with a wardrobe malfunction",
    "I have never ever \n shared tampons or pads with someone",
    "I have never ever \n synchronized cycles with close friends",
    "I have never ever \n had period cramps that ruined my day",
    "I have never ever \n called in sick because of my period",
    "I have never ever \n worn period underwear",
    "I have never ever \n tried a menstrual cup",
    "I have never ever \n tracked my cycle",
    "I have never ever \n had PMS mood swings",
    "I have never ever \n craved chocolate during my period",
    "I have never ever \n taken the pill",
    "I have never ever \n taken a pregnancy test just to be sure",
    "I have never ever \n been to the gynecologist",
    "I have never ever \n had a pap smear",
    "I have never ever \n had a bladder infection",
    "I have never ever \n dealt with a yeast infection",
    "I have never ever \n shaved before a date",
    "I have never ever \n planned my outfit around my underwear",
    "I have never ever \n owned matching lingerie sets",
    "I have never ever \n bought lingerie for someone else to see",
    "I have never ever \n worn a push-up bra",
    "I have never ever \n worn a strapless bra",
    "I have never ever \n adjusted my bra in public",
    "I have never ever \n worn a backless dress with special underwear",
    "I have never ever \n used fashion tape",
    "I have never ever \n worn nipple covers",
    "I have never ever \n had a breast-related wardrobe malfunction",
    "I have never ever \n complained about bra prices",
    "I have never ever \n been measured for the correct bra size",
    "I have never ever \n discovered I was wearing the wrong bra size",
    "I have never ever \n taken off my bra immediately upon arriving home",
    "I have never ever \n slept in a bra",
    "I have never ever \n worn the same bra for several days in a row",
    "I have never ever \n hand-washed delicate items",
    "I have never ever \n ruined something by washing it incorrectly",
    "I have never ever \n had a garment that could only be dry cleaned",
    "I have never ever \n ironed or steamed an outfit right before wearing it",
    "I have never ever \n used dry shampoo instead of washing my hair",
    "I have never ever \n not washed my hair for days",
    "I have never ever \n tried a hair mask",
    "I have never ever \n got a blowout",
    "I have never ever \n tried a keratin treatment",
    "I have never ever \n got highlights or balayage",
    "I have never ever \n cut my own bangs",
    "I have never ever \n regretted a haircut",
    "I have never ever \n cried over a bad haircut",
    "I have never ever \n damaged my hair with bleach",
    "I have never ever \n used heat protectant spray",
    "I have never ever \n straightened naturally curly hair",
    "I have never ever \n curled naturally straight hair",
    "I have never ever \n slept in braids for waves",
    "I have never ever \n used a curling iron or straightener",
    "I have never ever \n burned myself with a styling tool",
    "I have never ever \n owned multiple hair styling tools",
    "I have never ever \n had a drawer full of hair ties",
    "I have never ever \n worn a hair tie on my wrist",
    "I have never ever \n lost countless bobby pins",
    "I have never ever \n used bobby pins to hold my outfit together",
    "I have never ever \n worn a messy bun as my go-to style",
    "I have never ever \n mastered the perfect ponytail",
    "I have never ever \n tried to recreate a complicated hairstyle from Pinterest",
    "I have never ever \n watched YouTube tutorials for makeup or hair",
    "I have never ever \n followed beauty influencers",
    "I have never ever \n tried a trendy makeup look",
    "I have never ever \n bought makeup because an influencer recommended it",
    "I have never ever \n owned a makeup palette I never use",
    "I have never ever \n organized my makeup collection",
    "I have never ever \n threw away expired makeup",
    "I have never ever \n used makeup past its expiration date",
    "I have never ever \n shared makeup with friends",
    "I have never ever \n borrowed makeup without asking",
    "I have never ever \n lent out makeup and never got it back",
    "I have never ever \n applied makeup in the car",
    "I have never ever \n applied makeup without a mirror",
    "I have never ever \n touched up my makeup in public",
    "I have never ever \n carried my entire makeup bag everywhere",
    "I have never ever \n did a full face of makeup for no reason",
    "I have never ever \n practiced makeup looks for fun",
    "I have never ever \n watched makeup transformation videos",
    "I have never ever \n tried a dramatic eye look",
    "I have never ever \n perfected my winged eyeliner",
    "I have never ever \n struggled with winged eyeliner",
    "I have never ever \n used tape to help with eyeliner",
    "I have never ever \n poked myself in the eye with mascara",
    "I have never ever \n sneezed right after applying mascara",
    "I have never ever \n got mascara on my eyelid",
    "I have never ever \n tried magnetic lashes",
    "I have never ever \n had difficulty applying false eyelashes",
    "I have never ever \n had a false eyelash fall off",
    "I have never ever \n over-plucked my eyebrows",
    "I have never ever \n filled in my eyebrows",
    "I have never ever \n had my eyebrows microbladed",
    "I have never ever \n tried eyebrow lamination",
    "I have never ever \n used an eyebrow pencil or powder",
    "I have never ever \n had my eyebrows threaded",
    "I have never ever \n shaped my eyebrows myself",
    "I have never ever \n followed the eyebrow trend of the time",
  ];

  List<String> questions = [];


  void _load20Questions() {
    final shuffled = List<String>.from(allquestions)..shuffle(Random());
    setState(() {
      questions = shuffled.take(20).toList();
      currentPage = 0;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pageController.hasClients) {
        _pageController.jumpToPage(0);
      }
    });
  }

  @override
  void initState() {
    _load20Questions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int totalPages = questions.length;

    return Scaffold(
      backgroundColor: const Color(0xFF18B58A),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF2B705),
              Color(0xFFEFA300),
              Color(0xFFE38F00),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              /// 🔹 Top Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap:  () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close, color: Colors.white)),

                    const TText("Level 6", align: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16)),

                    /// 🔀 Shuffle Button
                    IconButton(
                      icon: const Icon(Icons.shuffle, color: Colors.white),
                      onPressed: _shuffleQuestions,
                    ),
                  ],
                ),
              ),

              /// 🔹 Progress Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    LinearProgressIndicator(
                      value: (currentPage + 1) / totalPages,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    const SizedBox(height: 6),
                    TText("${currentPage + 1} of $totalPages", style: const TextStyle(color: Colors.white),),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              /// 🔹 Question Card
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: questions.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TText(questions[index], align: TextAlign.center, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                      ),
                    );
                  },
                ),
              ),

              /// 🔹 Share Question Button (ABOVE nav buttons)
              TextButton.icon(
                onPressed: () {
                  if (questions.isNotEmpty) {
                    final String question = questions[currentPage];

                    Share.share(
                      "$question\n\nPlay this fun game with me 😄",
                      subject: "Never Have I Ever",
                    );
                  }
                },
                icon: const Icon(Icons.share, color: Colors.white),
                label: const TText("Share Question", style: TextStyle(color: Colors.white)),
              ),

              /// 🔹 Bottom Buttons
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [

                    /// Previous
                    Expanded(
                      child: ElevatedButton(
                        onPressed: currentPage == 0 ? null : () {
                          _pageController.previousPage(
                            duration:
                            const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange.shade100,
                          disabledBackgroundColor:
                          Colors.orange.withOpacity(0.3),
                          padding:
                          const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const TText("Previous"),
                      ),
                    ),

                    const SizedBox(width: 12),

                    /// Next
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (currentPage == totalPages - 1) {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => CongratilationScreen(userid: widget.userid, completedLevel: 6)));
                          } else {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          disabledBackgroundColor:
                          Colors.white.withOpacity(0.6),
                          padding:
                          const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const TText("Next", style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔀 Shuffle Logic
  void _shuffleQuestions() {
    setState(() {
      questions.shuffle(Random());
      currentPage = 0;
    });

    _pageController.jumpToPage(0);
  }
}


class CongratilationScreen extends StatefulWidget {
  final String? userid;
  final int completedLevel;
  const CongratilationScreen({super.key, this.userid, required this.completedLevel});

  @override
  State<CongratilationScreen> createState() => _CongratilationScreenState();
}

class _CongratilationScreenState extends State<CongratilationScreen> {
  int currentLevel = 1; String? userid;
  @override
  void initState() {
    super.initState();
  }

  Future<void> unlockNextLevel(int currentLevel, String uid) async {
    final docRef = FirebaseFirestore.instance.collection('users').doc(uid);
    final snapshot = await docRef.get();

    int unlocked = snapshot.data()?['unlockedLevel'] ?? 1;

    // Unlock only next level
    if (currentLevel >= unlocked) {
      await docRef.update({
        "unlockedLevel": currentLevel + 1,
      });

      // Also update SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt("unlockedLevel", currentLevel + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("🎉", style: TextStyle(fontSize: 80),), const SizedBox(height: 24),

                const TText("Congratulations", style: TextStyle(color: Colors.black87, fontSize: 28, fontWeight: FontWeight.bold,)),

                const SizedBox(height: 16),

                const TText("You finished this level!\nNext level unlocked 🔓", style: TextStyle(color: Colors.black, fontSize: 18)),

                const SizedBox(height: 40),

                ElevatedButton(
                  onPressed: () async {
                    if (widget.userid != null) {
                      await unlockNextLevel(widget.completedLevel, widget.userid!);
                    }
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Ready_To_Play()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.yellow,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 16,
                    ),
                  ),
                  child: const TText("Continue", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}