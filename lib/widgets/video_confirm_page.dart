

import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter_video_compress/flutter_video_compress.dart';
import 'package:image_picker/image_picker.dart';

import 'package:telemedicine_treatment/widgets/variables.dart';
import 'package:video_player/video_player.dart';


class ConfirmPage extends StatefulWidget {
  final File videoFile;
  final String videoPath;
  final ImageSource imageSource;

  ConfirmPage(this.videoFile,this.videoPath,this.imageSource);
  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  TextEditingController musicController = TextEditingController();
  TextEditingController captionsController = TextEditingController();
  VideoPlayerController controller;
  FlutterVideoCompress flutterVideoCompress = FlutterVideoCompress();
  bool isUploading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: isUploading == true ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Uploading.....',style: myStyle(20)),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ):SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/1.5,
              child: VideoPlayer(controller),

            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    margin: EdgeInsets.only(left: 10,right: 10),
                    child: TextField(
                      controller: musicController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xff8DC34D),
                        labelText: 'Video Name',
                        labelStyle: myStyle(15,Color(0xffffffff),),
                        prefixIcon: Icon(Icons.music_note,color: Color(0xffffffff),),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    margin: EdgeInsets.only(right: 50),
                    child: TextField(
                      controller: captionsController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xff8DC34D),
                        labelText: 'Captions',
                        labelStyle: myStyle(15,Color(0xffffffff),),
                        prefixIcon: Icon(Icons.closed_caption,color:Color(0xffffffff),),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: (){

                  },
                  color: Color(0xff8DC34D),
                  child: Text('Upload Video',style: myStyle(15,Colors.white)),
                ),
                RaisedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  color: Color(0xff8DC34D),
                  child: Text('Another Video',style: myStyle(15,Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  compressVideo()async{
    if(widget.imageSource == ImageSource.gallery){
      return widget.videoFile;
    }else{
      final compressVideo = await flutterVideoCompress.compressVideo(
          widget.videoPath, quality: VideoQuality.MediumQuality
      );
      return File(compressVideo.path);
    }
  }

  getPreviewImage()async{
    final previewImage = await flutterVideoCompress.getThumbnailWithFile(widget.videoPath);
    return previewImage;
  }
}
