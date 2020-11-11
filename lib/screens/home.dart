import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:redlipschallange/res/app_colors.dart';
import 'package:redlipschallange/res/images.dart';
import 'package:redlipschallange/res/styles.dart';
import 'package:redlipschallange/screens/video_paly.dart';

class HomeScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  HomeScreen({this.cameras});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool accept = false;
  double rating = 0.0;

  bool reject = false;
  CardController controller;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: PreferredSize(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '#RedLipsChallenge',
                  style: Styles.text,
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
                Text(''),
                Text(''),
                Text(''),
                Text(''),
                Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                /*  PopupMenuButton(
            onSelected: null,
            itemBuilder: (BuildContext context) {
              return Container()},
          ), */
              ],
            ),
          ),
          preferredSize: Size.fromHeight(70)),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              //  color: Colors.redAccent,
              margin: EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height * 0.7,
              child: TinderSwapCard(
                  orientation: AmassOrientation.BOTTOM,
                  totalNum: 6,
                  stackNum: 3,
                  swipeEdge: 4.0,
                  maxWidth: size.width * 0.9,
                  maxHeight: size.height * 0.8,
                  minWidth: size.width * 0.8,
                  minHeight: size.height * 0.4,
                  cardBuilder: (context, index) => Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                Images.backgroud,
                                height: size.height * 0.9,
                                width: size.width * 0.9,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: accept,
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color.fromRGBO(255, 173, 1, 0.6)),
                                child: Icon(
                                  Icons.check,
                                  color: Color.fromRGBO(29, 38, 55, 0.5),
                                  size: 70,
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: reject,
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color.fromRGBO(255, 173, 1, 0.6)),
                                child: Icon(
                                  Icons.close,
                                  color: Color.fromRGBO(29, 38, 55, 0.5),
                                  size: 70,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: size.height / 7,
                            left: 20,
                            child: CircleAvatar(
                              radius: 32,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 30,
                                child: Image.asset(Images.profile),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: size.height / 9,
                            left: 20,
                            child: Text(
                              'Beverly Washington',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VideoPlayingScreen(
                                            cameras: widget.cameras,
                                          ))),
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 2)),
                                child: Icon(
                                  Icons.play_arrow,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 15,
                              left: 10,
                              right: 10,
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '0',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  Flexible(
                                    flex: 5,
                                    child: Slider(
                                      value: rating,
                                      onChanged: (newRating) {
                                        setState(() {
                                          rating = newRating;
                                        });
                                      },
                                      max: 100,
                                      min: 0,
                                      activeColor: Colors.blue,
                                    ),
                                  ),
                                  Text(
                                    '1:20',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              )),
                        ],
                      ),
                  cardController: controller = CardController(),
                  swipeUpdateCallback:
                      (DragUpdateDetails details, Alignment align) {
                    // Get swiping card's alignment
                    if (align.x < 0) {
                      //Card is LEFT swiping
                    } else if (align.x > 0) {
                      //Card is RIGHT swiping
                    }
                  },
                  swipeCompleteCallback:
                      (CardSwipeOrientation orientation, int index) {
                    // Get orientation & index of swiped card!
                  }),
            ),
            Container(
              width: size.width / 2,
              // color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.iconBackground,
                      child: ImageIcon(
                        AssetImage(Images.heart),
                        color: Colors.red,
                      )),
                  CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.iconBackground,
                      child: ImageIcon(
                        AssetImage(Images.like),
                      )),
                  CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.iconBackground,
                      child: ImageIcon(
                        AssetImage(Images.share),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
