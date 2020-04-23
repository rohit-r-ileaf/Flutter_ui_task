import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: LoginPage(),
      ),
    ),
  );
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Stack(children: <Widget>[
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: deviceHeight * 0.50,
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.only(
                    bottomLeft: const Radius.circular(40.0),
                    bottomRight: const Radius.circular(40.0),
                  ),
                  boxShadow: [BoxShadow(color: Color(0xff35c8da))]),
              child: Center(
                child: Image(
                  width: 190,
                  height: 190,
                  image: AssetImage("images/loginscreen.png"),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Your mobile Number",
              style: TextStyle(color: Colors.grey, fontFamily: "Poppins"),
            ),
            Container(
              margin: EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 20),
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: '+919746604334'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Your Pin",
              style: TextStyle(color: Colors.grey, fontFamily: "Poppins"),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              child: PinEntryTextField(
                showFieldAsBox: true,
                isTextObscure: true,
                onSubmit: (String pin) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Pin"),
                          content: Text('Pin entered is $pin'),
                        );
                      }); //end showDialog()
                }, // end onSubmit
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      print("clicked Forget pin");
                    },
                    child: Text(
                      "FORGET PIN?",
                      style: TextStyle(
                        color: Color(0xff18b8a5),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Poppins",
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      print("clicked Register");
                    },
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                        color: Color(0xff18b8a5),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Poppins",
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {
                  /* Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));*/
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Color(0xff18b8a5).withAlpha(100),
                            offset: Offset(2, 4),
                            blurRadius: 8,
                            spreadRadius: 2)
                      ],
                      color: Color(0xff18b8a5)),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
