import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutterfebnew/register.dart';

import 'HomeScreen.dart';
import 'HomeScreen.dart';
void main() {
  runApp(DevicePreview(
      builder: (BuildContext context) => MaterialApp(
        theme: ThemeData(primarySwatch: Colors.red),
        useInheritedMediaQuery: true,
        home: loginvalidation(),
        debugShowCheckedModeBanner: false,
      )));
}

class loginvalidation extends StatefulWidget {
  const loginvalidation({Key? key}) : super(key: key);

  @override
  State<loginvalidation> createState() => _loginvalidationState();
}

class _loginvalidationState extends State<loginvalidation> {
  GlobalKey<FormState> formkey = GlobalKey();
  bool showpass = true; // for checking pass is visible or not

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: SingleChildScrollView(
            child: Form(
                key: formkey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50, top: 20),
                        child: Image.asset(
                          "Assets/Icons/img.png",
                          width: 200,
                          height: 200,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.account_box_sharp),
                              hintText: "username",
                              labelText: "username",
                              helperText: 'username must be an email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          validator: (uname) {
                            if (uname!.isEmpty ||
                                !uname.contains('@') ||
                                !uname.contains('.')) {
                              return 'enter a valid username';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            obscureText: showpass,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.password),
                                suffixIcon:  IconButton(onPressed: (){
                                  setState(() {
                                    if (showpass){
                                      showpass= false;
                                    }else{
                                      showpass = true;
                                    }
                                  });
                                },icon: Icon(showpass== true? Icons.visibility_off: Icons.visibility),),
                                hintText: 'password',
                                labelText: "password",
                                helperText:
                                'password must contain 8 characters',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            validator: (password) {
                              if (password!.isEmpty || password.length < 8) {
                                return 'enter a strong passsword';
                              } else {
                                return null;
                              }
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              final valid = formkey.currentState!.validate();
                              if (valid) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const HomeScreen()));
                              }
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(fontSize: 15),
                            )),
                      ),
                      TextButton(
                          onPressed: () {  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                            },


                          child: const Text('Not a user?? Sign up here!!' )),
                    ]))));
  }
}