import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final emailController = TextEditingController();


  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async{
    try{
      await
      FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              content: Text('Password reset link sent! check your email', style: TextStyle(
                fontSize: 15,
              ),),
            );
          });
    }on FirebaseAuthException catch(e){
      showDialog(
          context: context,
          builder: (context){
            return CupertinoAlertDialog(
              content: Text(e.message.toString(), style:
              TextStyle(
                fontSize: 15,
                color: Colors.red,
              ),),
            );
          });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              Text("FORGET PASSWORD", style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lora',
                  color: HexColor('#6c1448')
                // fontStyle: FontStyle.italic
              ),
              ),

              SizedBox(height: 50,),

              Text('Enter Your email to send a code', style: TextStyle(
                fontSize: 20,
              ),),
              SizedBox(height: 20,),

              //TextFormField -> email

              Container(
                padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Enter your email',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Container(
                height: 40,
                width: double.infinity,
                padding: EdgeInsetsDirectional.symmetric(horizontal: 20,),
                child: MaterialButton(
                  onPressed: passwordReset,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: HexColor('#916d35'),
                  child: Text('Send code', style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  ),

                ),
              ),

              SizedBox(height: 20,),

              Container(
                height: 40,
                width: double.infinity,
                padding: EdgeInsetsDirectional.symmetric(horizontal: 20,),
                child: MaterialButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacementNamed('toAuth');
                  },
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: HexColor('#916d35'),
                  child: Text('Back', style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  ),

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
