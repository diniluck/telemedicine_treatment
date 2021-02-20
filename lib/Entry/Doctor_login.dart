import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:telemedicine_treatment/main_pages/home_page.dart';

class DoctorSignInPage extends StatefulWidget {
  @override
  _DoctorSignInPageState createState() => _DoctorSignInPageState();
}

class _DoctorSignInPageState extends State<DoctorSignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _doctorIDTextEditingcontroller = TextEditingController();
  final TextEditingController _passwordTextEditingcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    double _screenWidth = MediaQuery.of(context).size.width, _screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                child: Image.asset("images/Doctor.jpg"),
                height: 240.0,
                width: 240.0,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Doctor",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Material(
                child: Container(
                  width: _screenWidth*0.8,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _doctorIDTextEditingcontroller,
                         decoration: InputDecoration(
                           border: InputBorder.none,
                           prefixIcon: Icon(Icons.person,color: Color(0xff8DC34D),),
                           hintText: "Id"
                         ),
                          obscureText: false,
                          cursorColor: Color(0xff8DC34D),
                        ),
                        TextFormField(

                          controller: _passwordTextEditingcontroller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.lock,color: Color(0xff8DC34D),),
                              hintText: "Password"
                          ),
                          obscureText: true,
                          cursorColor: Color(0xff8DC34D),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              RaisedButton(
                onPressed: () {
                  _doctorIDTextEditingcontroller.text.isNotEmpty &&
                      _passwordTextEditingcontroller.text.isNotEmpty
                      ? loginAdmin()
                      : showDialog(
                      context: context,
                      builder: (c) {
                        return ErrorAlertDialog(
                          message: "Write Email and Password",
                        );
                      });
                },
                color: Color(0xff8DC34D),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 4.0,
                width: _screenHeight * 0.8,
                color: Color(0xff8DC34D),
              ),
              SizedBox(
                height: 20.0,
              ),
              FlatButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                icon: Icon(
                  Icons.nature_people,
                  color: Color(0xff8DC34D),
                ),
                label: Text(
                  "I'm Not Doctor",
                  style: TextStyle(
                    color: Color(0xff8DC34D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //loginAdmin() =>print("clicked");

  loginAdmin() {
    FirebaseFirestore.instance.collection("doctor").get().then((snapshot) {
      snapshot.docs.forEach((result) {
        if(result.data ["id"] !=_doctorIDTextEditingcontroller.text.trim()){
          Scaffold.of(context).showSnackBar(SnackBar(content: Text("Your id is not correct."),));
        }else if(result.data["password"] !=_passwordTextEditingcontroller.text.trim()){
          Scaffold.of(context).showSnackBar(SnackBar(content: Text("Your password is incorrect"),));
        }else{
          Scaffold.of(context).showSnackBar(SnackBar(content: Text("Welcome Dear Admin"+result.data["name"]),));
          setState(() {
            _doctorIDTextEditingcontroller.text="";
            _passwordTextEditingcontroller.text="";
          });
         Route route=MaterialPageRoute(builder: (c)=>UploadPage());
          Navigator.pushReplacement(context, route);
        }
      });
    });
  }
  loginAdmin(){
    FirebaseFirestore.instance.collection("doctor").doc("doctorsdocumentid").get().then((DocumentSnapshot documentSnapshot){
      if(documentSnapshot.exists){
        print("Document exists on the database");
      }
      //if(documentSnapshot)
    });
  }
}

class ErrorAlertDialog extends StatelessWidget{
  final String message;
  const ErrorAlertDialog({Key key, this.message}) : super(key: key);


  @override
  Widget build(BuildContext context)
  {
    return AlertDialog(
      key: key,
      content: Text(message),

      actions: <Widget>[
        RaisedButton(onPressed: ()
        {
          Navigator.pop(context);
        },
          color: Colors.red,
          child: Center(
            child: Text("OK"),
          ),
        )
      ],
    );
  }
}
