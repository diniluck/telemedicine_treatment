import 'package:flutter/material.dart';
import 'package:telemedicine_treatment/main_pages/animal.dart';
import 'package:telemedicine_treatment/main_pages/home_page.dart';
import 'package:telemedicine_treatment/main_pages/human.dart';
class DoctorPage extends StatefulWidget {
  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  int page = 0;
  List pageOptions =[
    HomePage(),
    AnimalPage(),
    HumanPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: pageOptions[page],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: page,
          onTap: (index){
            setState(() {
              page = index;
            });
          },
          selectedItemColor: Color(0xff8DC34D),
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,size: 25),
              title: Text(
                  'Home',
                  style: (TextStyle(fontSize: 12))
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pan_tool,size: 25),
              title: Text(
                  'Animal',
                  style: (TextStyle(fontSize: 12))
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,size: 25),
              title: Text(
                  'Human',
                  style: (TextStyle(fontSize: 12))
              ),
            ),
          ],
        ),
      ),
    );
  }
}
