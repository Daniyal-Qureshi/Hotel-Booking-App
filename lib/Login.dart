import 'package:app/Signup.dart';
import 'package:app/tabbed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Store.dart';
import ' HomePage.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Loginstate();
}

class Loginstate extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool isvisible = false;
  String errormessage = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Stack(children: [
        Align(
            alignment: Alignment.topCenter,
            child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ))),
        SingleChildScrollView(
          padding: EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Visibility(
                  visible: isvisible,
                  child: Padding(
                    padding: EdgeInsets.only(left: 6, right: 6),
                    child: Container(
                        width: double.infinity,
                        height: 50,
                        color: Color(int.parse("0xff${"f4c2c2"}")),
                        child: Align(
                          child: Text(errormessage,
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.red)),
                        )),
                  )),
              Padding(
                padding: EdgeInsets.all(6.0),
                child: TextField(
                  controller: _email,
                  onChanged: (text) {
                    setState(() {
                      isvisible = false;
                    });
                  },
                  maxLines: null,
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.blue,
                      ),
                      border: OutlineInputBorder(),
                      labelText: "Email"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(6.0),
                child: TextField(
                  controller: _password,
                  onChanged: (text) {
                    setState(() {
                      isvisible = false;
                    });
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.blue,
                      ),
                      border: OutlineInputBorder(),
                      labelText: "Password"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(children: [
                Padding(
                    padding: EdgeInsets.only(left: 6, top: 10),
                    child: Text("Sign in",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.blue,
                        ))),
                Padding(
                    padding: EdgeInsets.only(top: 6, left: 200),
                    child: IconButton(
                        icon: Image.asset('assets/rightarrow.png'),
                        iconSize: 50,
                        onPressed: () {
                          Store.getData(_email.text, _password.text);
                          Store.status().then((value) {
                            if (!value)
                              setState(() {
                                errormessage = "Incorrect Email or Password";
                                isvisible = true;
                              });
                            else {
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          tabbed()));
                            }
                          });
                        }))
              ]),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "-OR-",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Sign in with",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/facebook.png", width: 35),
                  Image.asset("assets/google.png", width: 30),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have account ? create one",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Signup()));
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
