import 'package:bloodapp/Component/button.dart';
import 'package:bloodapp/Component/textfield.dart';
import 'package:bloodapp/Service/authService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ConfirmpasswordController = TextEditingController();

  //sign up user
  void SignUp() async{
    if (passwordController.text != ConfirmpasswordController.text){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password do not match!"),
        ),
      );
      return;
    }
    final authServices = Provider.of<AuthServices>(context, listen: false);

    try{
      await authServices.signUpWithEmailandPassword(
        emailController.text, 
        passwordController.text,
        );
    } catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()
          ),
      ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              //logo
              Icon(Icons.water_drop,
              size: 100,
              color: Colors.grey[800],
             ),
              SizedBox(height: 10,),
            Container(
              child: Text("Zindagi" ,style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),),
            ),

             const SizedBox(height: 50),
        
            //create an account
            const Text(
              "SIGNUP",
              style: TextStyle(
              fontSize: 16,
            ),
            ),

            const SizedBox(height: 25),
        
            //email textfield
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
              ),

            const SizedBox(height: 10),
        
            //password textfield
             MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
              ),

              const SizedBox(height: 10),
        
            //configure password textfield
             MyTextField(
              controller: ConfirmpasswordController,
              hintText: 'Confirm Password',
              obscureText: true,
              ),

              const SizedBox(height: 25),
        
            //sign Up button
            MyButton(onTap: SignUp, text: "Sign Up"),

              const SizedBox(height: 50),    
        
            //user not a member? register now?
           Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already a member?'),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text('Login now',
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                              ),
                )
             ],
            )
          ],
          ),
        ),
       ),
      ),
    ),);
  }
}