import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../Navigation_manu.dart';
import '../../CustomWidgets/CustomButton.dart';
import '../../CustomWidgets/CustomTextField.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();

  bool _loading = false;


  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  void _snack(String msg, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _signUp() async {
    if (_password.text != _confirm.text) {
      _snack('Passwords do not match', Colors.red);
      return;
    }
    if (_firstName.text.isEmpty ||
        _lastName.text.isEmpty ||
        _email.text.isEmpty ||
        _password.text.isEmpty
    ) {
      _snack('Please fill all fields', Colors.red);
      return;
    }


    //email validation
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(_email.text.trim())) {
      _snack('Please enter a valid email address', Colors.red);
      return;
    }

    setState(() => _loading = true);


    try{
      // Create user in Firebase Auth
      final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text.trim(),
        password: _password.text.trim(),
      );

      final uid = cred.user!.uid;

      //Save data to Firestore
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'uid': uid,
        'firstName': _firstName.text.trim(),
        'lastName': _lastName.text.trim(),
        'email': _email.text.trim(),
        'createdAt': FieldValue.serverTimestamp(),
      });

      _snack('Account created successfully!', Colors.green);


      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  NavigationMenu()),
        );
      });


    } on FirebaseAuthException catch (e) {
      String msg = 'Signup failed';
      if (e.code == 'email-already-in-use') msg = 'Email already in use';
      if (e.code == 'invalid-email') msg = 'Invalid email address';
      if (e.code == 'weak-password') msg = 'Password too weak';
      _snack(msg, Colors.red);
    } catch (e) {
      _snack('Unexpected error: $e', Colors.red);
    } finally {
      setState(() => _loading = false);
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon:Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text("Register",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),)
            ),
            Text("First Name",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),),
            SizedBox(height: 10,),
            CustomTextField( hintText: "Enter Your First Name",controller: _firstName,),
            SizedBox(height: 20,),
            Text("Last Name",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400)),
            SizedBox(height: 10,),
            CustomTextField( hintText: "Enter Your Last Name",controller: _lastName,),
            SizedBox(height: 10,),
            Text("E-Mail",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400)),
            SizedBox(height: 10,),
            CustomTextField( hintText: "Enter Your E-mail",controller: _email,),
            SizedBox(height: 20,),
            Text("Password",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400)),
            SizedBox(height: 10,),
            CustomTextField( hintText: "Enter Your Password",suffixIcon: Icon(Icons.remove_red_eye),controller: _password),
            SizedBox(height: 10,),
            Text("Confirm Password",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400)),
            SizedBox(height: 10,),
            CustomTextField( hintText: "Confirm Password",suffixIcon: Icon(Icons.remove_red_eye),controller: _confirm),
            SizedBox(height: 25,),
            CustomButton(


             onTap:  _loading ? null : _signUp,
                text: _loading ? "Creating..." : "Create Account",

              fontsize: 18,
              textcolor: Colors.black,
              bgcolor: Colors.blueGrey,
              btnheight: 50,
              btnwidth: double.infinity,

            ),
            SizedBox(height: 20,),
            Center(child: Text('By Counting you agree to out terms of service ',style: TextStyle(color: Colors.black38,fontSize: 15,fontWeight: FontWeight.w500),)),
          ],
        ),
      ),
    );
  }

}


