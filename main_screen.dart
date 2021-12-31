import 'package:flutter/material.dart';
import 'package:signtry/pages/detailspage.dart';
import 'package:signtry/pages/notification_page.dart';
import 'package:signtry/pages/view_all_page.dart';
import 'package:signtry/utils/colors.dart';

import 'custom_drawer.dart';
import 'story_page.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({Key? key}) : super(key: key);

  @override
  _MainScreenPageState createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  String? dropDownValue = 'Nearby Psychic';
  var items = [
    'Nearby Psychic',
    "Psychics",
    "Tarot Readings",
    "Witches",
    "Pet Psychic",
    "Spiritual Wellness"
  ];
  var currentndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                    decoration: const BoxDecoration(
                      color: Colour.themeColor,
                      gradient: LinearGradient(
                        colors: [Colour.lightTheme, Colour.themeColor],
                        begin: FractionalOffset(0.0, 1.0),
                        end: FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        // tileMode: TileMode.clamp,
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 30, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _scaffoldKey.currentState!.openDrawer();
                                },
                                child: Image.asset(
                                  'lib/assets/images/menu2.png',
                                  scale: 2.5,
                                ),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const NearbyPsychic())),
                                    child: Image.asset(
                                      'lib/assets/images/location.png',
                                      scale: 2,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "New York City ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colour.whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const NotificationPage())),
                                child: Image.asset(
                                  'lib/assets/images/bell.png',
                                  scale: 2.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // const SizedBox(
                        //   height: 2
                        // ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Hi Vanessa James",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colour.whiteColor,
                                ),
                              ),

                              // const  SizedBox(width: 100,),

                              Image.asset(
                                'lib/assets/images/usertww.png',
                                scale: 2.0,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // width: MediaQuery.of(context).size.width,

                          decoration: const BoxDecoration(
                            color: Colour.whiteColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(35),
                              topLeft: Radius.circular(35),
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 10, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    const NearbyPsychic(),
                                    // Container(height: 20,width: 200,
                                    //     child: const NearbyPsychic()),

                                    const SizedBox(
                                      width: 90,
                                    ),
                                    InkWell(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ViewAllPage())),
                                      child: const Text(
                                        "View All",
                                        style: TextStyle(
                                            color: Colour.viewAll,
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.0, right: 20, bottom: 10),
                                  child: StoryPage(),
                                ),
                              ),
                              /*************    NEWS FEEEED  *****************************/

                              GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DetailsPage2())),
                                child: const Hero(
                                    tag: "Details", child: NewsFeedPage()),
                              ),
                            ],
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
}

class NewsFeedPage extends StatefulWidget {
  const NewsFeedPage({Key? key}) : super(key: key);

  @override
  _NewsFeedPageState createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                blurRadius: 3.0,
                spreadRadius: 0.4,
                offset: Offset(0.1, 0.5),
              ),
            ],
          ),
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'lib/assets/images/jimmy.png',
                            scale: 1.8,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Jimmy Hardio",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "2 hour",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    color: Colour.text2Color),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        " Loren ipsum is simply dummy text of the printing \n and typesetting industry.",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fill,
                    alignment: Alignment.bottomCenter,
                    image: AssetImage(
                      'lib/assets/images/ii.png',
                    ),
                  )
                  ),
                ),

                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('lib/assets/images/like.png'),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1),
    );
  }
}

class NearbyPsychic extends StatefulWidget {
  const NearbyPsychic({Key? key}) : super(key: key);

  @override
  _NearbyPsychicState createState() => _NearbyPsychicState();
}

class _NearbyPsychicState extends State<NearbyPsychic> {
  String? dropdownvalue = 'Nearby Psychic';
  var items = [
    'Nearby Psychic',
    "Psychics",
    "Tarot Readings",
    "Witches",
    "Pet Psychic",
    "Spiritual Wellness"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: MediaQuery.of(context).size.width / 2,
      child: DropdownButton(

        hint: const Text('Nearby Psychic'),
        value: dropdownvalue,
        icon: const Icon(Icons.keyboard_arrow_down),
        items: items.map((String items) {
          return DropdownMenuItem(
              value: items, child: Text(items));
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownvalue = newValue;
          });
        },
      ),
    );
  }
}
