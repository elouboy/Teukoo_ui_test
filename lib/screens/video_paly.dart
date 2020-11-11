import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:redlipschallange/res/app_colors.dart';
import 'package:redlipschallange/res/images.dart';
import 'package:redlipschallange/res/styles.dart';
import 'package:redlipschallange/screens/camera_screen.dart';

class VideoPlayingScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  VideoPlayingScreen({this.cameras});
  @override
  _VideoPlayingScreenState createState() => _VideoPlayingScreenState();
}

class _VideoPlayingScreenState extends State<VideoPlayingScreen> {
  double rating = 0.0;
  double height = 20;
  bool show = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.greyBackground,
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Images.backgroud), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[_upperBar(), _lowerBar(size)],
        ),
      ),
    );
  }

  Widget _upperBar() {
    return PreferredSize(
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
              IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CameraScreen(
                                cameras: widget.cameras,
                              ))))
            ],
          ),
        ),
        preferredSize: Size.fromHeight(70));
  }

  Widget _lowerBar(size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Image.asset(Images.profile),
                    ),
                  ),
                  Container(
                    width: size.width / 2,
                    //  color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CircleAvatar(
                            radius: 25,
                            backgroundColor: AppColors.iconBackground,
                            child: ImageIcon(
                              AssetImage(Images.heart),
                              color: Colors.red,
                            )),
                        CircleAvatar(
                            radius: 25,
                            backgroundColor: AppColors.iconBackground,
                            child: ImageIcon(
                              AssetImage(Images.like),
                            )),
                        CircleAvatar(
                            radius: 25,
                            backgroundColor: AppColors.iconBackground,
                            child: ImageIcon(
                              AssetImage(Images.share),
                            )),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Beverly Washington',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Text(
                          '0',
                          style: TextStyle(color: Colors.white, fontSize: 16),
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
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  ImageIcon(
                    AssetImage(Images.zoomOut),
                    color: Colors.white,
                    size: 15,
                  ),
                ],
              ),
              _animatedList()
            ],
          ),
        ),
      ],
    );
  }

  Widget _animatedList() {
    return GestureDetector(
      onTap: () {},
      onVerticalDragEnd: (details) {
        setState(() {
          if (height == 20) {
            height = 170;
          } else {
            height = 20;
          }
        });
      },
      child: AnimatedContainer(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        duration: Duration(seconds: 1),
        height: height,
        color: Colors.transparent,
        child: ClipRect(
          child: BackdropFilter(
            filter: height == 20
                ? ImageFilter.blur(sigmaX: 0, sigmaY: 0)
                : ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.black.withOpacity(.2),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                        width: 100,
                        height: 170,
                        padding: EdgeInsets.fromLTRB(5, 10, 8, 15),
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          //color: Colors.grey.withOpacity(.5),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(index == 1
                                  ? Images.photo1
                                  : index == 2 ? Images.photo2 : Images.photo3),
                              fit: BoxFit.cover),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Align(
                                alignment: Alignment.centerRight,
                                child: Text('1:30',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Leahgibson',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                                Text('1‏‏M views ',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12))
                              ],
                            )
                          ],
                        ));
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
