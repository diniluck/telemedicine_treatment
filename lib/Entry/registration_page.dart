
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:telemedicine_treatment/Entry/google_sign_in.dart';
import 'package:telemedicine_treatment/Entry/login_page.dart';
import 'package:telemedicine_treatment/widgets/variables.dart';


class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  registerUser(){
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    ).then((signedUser){
      userCollection.doc(signedUser.user.uid).set({
        'username':usernameController.text,
        'password':passwordController.text,
        'email':emailController.text,
        'uId':signedUser.user.uid,
        'profilePic':'https://st.depositphotos.com/1779253/5140/v/600/depositphotos_51405259-stock-illustration-male-avatar-profile-picture-use.jpg',
      });
    });
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
  }

  /*Future signIn()async{
    final GoogleSignInAccount googleSignInAccount=await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount.authentication;
    AuthCredential credential=GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken
    );
    UserCredential result=await FirebaseAuth.instance.signInWithCredential(credential);
    FirebaseUser user=result.user;
    if (user !=null){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    }
  }*/


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('images/logo.jpg'),
                ),
                Text(
                  'Telemedicine App',style: myStyle(25,Color(0xff8DC34D),FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Registration For Remote Treatment',style: myStyle(20,Colors.black,FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      fillColor: Color(0xff8DC34D),
                      filled: true,
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person,color: Color(0xffffffff),),
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
                    controller: emailController,
                    decoration: InputDecoration(
                      fillColor: Color(0xff8DC34D),
                      filled: true,
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.mail, color: Color(0xffffffff),),
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
                      prefixIcon: Icon(Icons.lock,color: Color(0xffffffff),),
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
                    registerUser();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xff8DC34D),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text('Register',style: myStyle(20,Color(0xffffffff),FontWeight.w600)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Divider(),
                Text(
                  'Or',
                  style: myStyle(18),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xff8DC34D),
                    ),

                    padding: EdgeInsets.all(4),
                    child: OutlineButton.icon(
                      label: Text(
                        'Sign In with Google',
                        style: myStyle(18,Colors.white,FontWeight.w600),
                      ),
                      shape: StadiumBorder(),
                      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                      highlightedBorderColor: Colors.black,
                      borderSide: BorderSide(color: Colors.black),
                      textColor: Colors.black,
                      icon: FaIcon(FontAwesomeIcons.google,color: Colors.red,),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                        //signIn();
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Have an Account?',style: myStyle(16)),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                      },
                        child: Text('Login',style: myStyle(16,Color(0xff8DC34D),))
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
