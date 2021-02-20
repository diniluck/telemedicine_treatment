import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:telemedicine_treatment/widgets/video_confirm_page.dart';

class AddVideoPage extends StatefulWidget {
  @override
  _AddVideoPageState createState() => _AddVideoPageState();
}

class _AddVideoPageState extends State<AddVideoPage> {
  showOptionsDialog(){
    return showDialog(
        context: context,
        builder: (context){
          return SimpleDialog(
            title: Text(
              'Upload your video',
                style: TextStyle(fontSize: 14,color: Color(0xff8DC34D),fontWeight: FontWeight.bold)
            ),
            children: [
              SimpleDialogOption(
                onPressed: (){
                  pickVideo(ImageSource.gallery);
                },
                child: Text('Gallery',style: TextStyle(fontSize: 12,color: Color(0xff8DC34D),)),
              ),
              SimpleDialogOption(
                onPressed: (){
                  pickVideo(ImageSource.camera);
                },
                child: Text('Camera',style: TextStyle(fontSize: 12,color: Color(0xff8DC34D),)),
              ),
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text('Cancel',style: TextStyle(fontSize: 12,color: Color(0xff8DC34D),)),
              ),
            ],
          );
        }
    );
  }
  pickVideo(ImageSource src)async{
    Navigator.pop(context);
    final video = await ImagePicker().getVideo(source: src);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfirmPage(
        File(video.path),video.path,src
    )));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: InkWell(
        onTap: (){
          showOptionsDialog();
        },
        child: Center(
          child: Container(
            width: 180, height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff8DC34D),
            ),
            child: Center(
              child: Text(
                'Insert Video',
                style: TextStyle(fontSize: 12,color: Color(0xffffffff),),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
