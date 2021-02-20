import 'package:flutter/material.dart';
import 'package:telemedicine_treatment/main_pages/chat_page.dart';
import 'package:telemedicine_treatment/main_pages/video.dart';
class AnimalPage extends StatefulWidget {
  @override
  _AnimalPageState createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: AssetImage('images/logo.jpg'),
              ),
              Container(
                width: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(

                  color: Color(0xff8DC34D),
                  borderRadius: BorderRadius.circular(50),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Animal',
                    style: TextStyle(fontSize: 20, color: Color(0xffffffff),fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  children: [
                    Text(
                      'Aromatherapy for Animals',
                      style: TextStyle(fontSize: 20,color: Color(0xff8DC34D),fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left:15.0,right: 15),
                      child: Text(
                        'Essential oils offer many benefits when safely used on animal. Dr. McCartney is trained in animal aromatherapy and is able to formulate a custom blend according to your animal\'s personal Wellness Protocol,',
                        style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:20.0,right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ActionChip(
                            label: Text('Chat', style: TextStyle(color: Colors.white)),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Chat()));
                            },
                            backgroundColor: Color(0xff8DC34D),
                          ),
                          SizedBox(width:20),
                          ActionChip(
                            label: Text('Send Image', style: TextStyle(color: Colors.white)),
                            onPressed: (){},
                            backgroundColor: Color(0xff8DC34D),
                          ),
                          SizedBox(width:20),
                          ActionChip(
                            label: Text('Send video', style: TextStyle(color: Colors.white)),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddVideoPage()));
                            },
                            backgroundColor: Color(0xff8DC34D),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  children: [
                    Text(
                      'Animal Homeopathy',
                      style: TextStyle(fontSize: 20,color: Color(0xff8DC34D),fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left:15.0,right: 15),
                      child: Text(
                        'Dr. McCartney is a Certified Pet Homeopathic Educator and is experienced in their use in caring for humans and animal',
                        style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:20.0,right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ActionChip(
                            label: Text('Chat', style: TextStyle(color: Colors.white)),
                            onPressed: (){},
                            backgroundColor: Color(0xff8DC34D),
                          ),
                          SizedBox(width:20),
                          ActionChip(
                            label: Text('Send Image', style: TextStyle(color: Colors.white)),
                            onPressed: (){},
                            backgroundColor: Color(0xff8DC34D),
                          ),
                          SizedBox(width:20),
                          ActionChip(
                            label: Text('Send video', style: TextStyle(color: Colors.white)),
                            onPressed: (){},
                            backgroundColor: Color(0xff8DC34D),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  children: [
                    Text(
                      'Herbs for Animal',
                      style: TextStyle(fontSize: 20,color: Color(0xff8DC34D),fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left:15.0,right: 15),
                      child: Text(
                        'Dr. McCartney is a Master Herbalist and is trained in botanical remedies for Animal',
                        style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:20.0,right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ActionChip(
                            label: Text('Chat', style: TextStyle(color: Colors.white)),
                            onPressed: (){},
                            backgroundColor: Color(0xff8DC34D),
                          ),
                          SizedBox(width:20),
                          ActionChip(
                            label: Text('Send Image', style: TextStyle(color: Colors.white)),
                            onPressed: (){},
                            backgroundColor: Color(0xff8DC34D),
                          ),
                          SizedBox(width:20),
                          ActionChip(
                            label: Text('Send video', style: TextStyle(color: Colors.white)),
                            onPressed: (){},
                            backgroundColor: Color(0xff8DC34D),
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
      ),
    );
  }
}
