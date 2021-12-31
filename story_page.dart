import 'package:flutter/material.dart';
import 'package:signtry/assets/Models/psychic_details.dart';
import 'package:signtry/pages/psychic_details.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
 final _userDetails =  PsychicDetails();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Column(
            children: const <Widget>[
              // Container(
              //   width: 60,
              //   height: 60,
              //   decoration:  const BoxDecoration(
              //       shape: BoxShape.circle, color: Color(0xFFe9eaec)),
              //   child: const Center(
              //     child: Icon(
              //       Icons.add,
              //       size: 33,
              //     ),
              //   ),
              //   // ),
              // const  SizedBox(
              //     height: 10,
              //   ),
              // const  SizedBox(
              //     width: 75,
              //     child: Align(
              //         child: Text(
              //           'Your Story',
              //           overflow: TextOverflow.ellipsis,
              //         )),
              //   )
            ],
          ),
          Row(
            children: List.generate(
            _userDetails.storyList.length,
              (index) {
                return
                    // Padding(
                    // padding: const EdgeInsets.only(right: 9),
                    // child:
                    Column(
                  children: <Widget>[
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: InkWell(
                        onTap: ()=> Navigator.push(context,
                            MaterialPageRoute(builder:
                                (context)=> const PsychicDetailsPage())),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.blueAccent, width: 3)),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        _userDetails.storyList[index],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(PsychicDetails().storyList[index]),
                                      fit: BoxFit.cover)),
                            ),
                            // Positioned(
                            //   top: 38,
                            //   left: 42,
                            //   child: Container(
                            //     width: 20,
                            //     height: 20,
                            //     decoration: BoxDecoration(
                            //         color: const Color(0xFF66BB6A),
                            //         shape: BoxShape.circle,
                            //         border: Border.all(
                            //             color:const Color(0xFFFFFFFF), width: 3)),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 75,
                      child: Align(
                        child: Text(
                          _userDetails.names[index],
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
