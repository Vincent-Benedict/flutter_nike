

import 'package:flutter/material.dart';
import 'package:myapp/views/pages/home.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<LoginPage>{

  var _ctrlUsername = TextEditingController();
  var _ctrlPass = TextEditingController();

  bool usernameEmpty = false;
  bool passwordEmpty = false;
  bool usernameLength = false;
  bool usernameContainsSpace = false;

  void reset(){
    usernameEmpty = false;
    passwordEmpty = false;
    usernameLength = false;
    usernameContainsSpace = false;
  }

  
  void _onPressed(BuildContext ctx){
      if(_ctrlUsername.text == "" && _ctrlPass.text == ""){
        setState(() {
          usernameEmpty = passwordEmpty = true;
          
        });
      } 
      else if(_ctrlUsername.text == "" || _ctrlPass.text == ""){
        if(_ctrlUsername.text == ""){
          setState(() {
            reset();
            usernameEmpty = true;
          });
        } else{
          setState(() {
            reset();
            passwordEmpty = true;
          });
        }
      }
      else if(_ctrlUsername.text.length < 5){
        setState(() {
          reset();
          usernameLength = true;
        });
      }
      else if(!_ctrlUsername.text.contains(' ')){
        setState(() {
          reset();
          usernameContainsSpace = true;
        });
      }
      else{
        Navigator.pushAndRemoveUntil(ctx, MaterialPageRoute(builder: (builder){
            return HomePage(_ctrlUsername.text);
          }), (route) => false);
      }
      
          
      
    }



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(children: [
        Align(
          child: Image.asset(
            'assets/nike.png',
            height: 250,
            width: 250,
            ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: 'Username',
            errorText: usernameEmpty ? 'Value Can\'t Be Empty' : (usernameLength ? 'Min Length 5 Characters' : (usernameContainsSpace ? 'Username must contains space' : null)),
          ),
          controller: _ctrlUsername,
        ),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            errorText: passwordEmpty ? 'Value Can\'t Be Empty' : null,
          ),
          controller: _ctrlPass,
        ),
        ElevatedButton(onPressed: () => _onPressed(context), child: Text('Login'))
      ],),
    );

  }
  
}




