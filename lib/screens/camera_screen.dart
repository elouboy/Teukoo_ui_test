import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:redlipschallange/res/app_colors.dart';
import 'package:redlipschallange/res/images.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  CameraScreen({this.cameras});

  @override
  CameraScreenState createState() {
    return new CameraScreenState();
  }
}

class CameraScreenState extends State<CameraScreen> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller =
        new CameraController(widget.cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return new Container();
    }
    return new AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: Stack(
        children: <Widget>[
          CameraPreview(controller),
          AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: ImageIcon(AssetImage(Images.zap)),
            actions: <Widget>[
              CircleAvatar(
                radius: 15,
                backgroundColor: Color(0xFF242A37),
                child: IconButton(
                    icon: ImageIcon(
                      AssetImage(Images.settings),
                      color: Colors.white,
                    ),
                    onPressed: null),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(right: 10),
              height: 80,
              width: double.infinity,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    padding: EdgeInsets.fromLTRB(5, 10, 8, 15),
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      //color: Colors.grey.withOpacity(.5),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.grey),
                      image: DecorationImage(
                          image: AssetImage(Images.photo2), fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(width: 2, color: Colors.white)),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppColors.camButton),
                    ),
                  ),
                  ImageIcon(
                    AssetImage(Images.flip),
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
