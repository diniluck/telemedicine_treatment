
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telemedicine_treatment/Entry/registration_page.dart';
import 'package:telemedicine_treatment/main_pages/doctor.dart';
import 'package:telemedicine_treatment/widgets/variables.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  loginUser(){
    // exception handler
    try{
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()
      ).then((signedUser) => Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorPage())));
    }catch(e){
      SnackBar snackBar =SnackBar(content: Text('Email or Password Invalid'));
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('images/logo.jpg'),
                ),
                Text(
                  'Telemedicine App',style: myStyle(30,Color(0xff8DC34D),FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Login For Remote Treatment',style: myStyle(20,Colors.black,FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      fillColor: Color(0xff8DC34D),
                      filled: true,
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.mail,color: Color(0xffffffff),),
                      labelStyle: myStyle(20,Color(0xffffffff),),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Color(0xff8DC34D),
                      filled: true,
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock,color:Color(0xffffffff),),
                      labelStyle: myStyle(20,Color(0xffffffff),),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: (){
                    loginUser();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xff8DC34D),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text('Login',style: myStyle(20,Colors.white,FontWeight.w600)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Dont have an Account?',style: myStyle(16)),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>RegistrationPage()
                        ));
                      },
                      child: Text(
                          'Register',style: myStyle(16,Color(0xff8DC34D),)
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
