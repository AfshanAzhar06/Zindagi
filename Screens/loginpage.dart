import 'package:bloodapp/Component/button.dart';
import 'package:bloodapp/Component/textfield.dart';
import 'package:bloodapp/Service/authService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatefulWidget {
  final void Function()? onTap;
  const LogInPage({super.key, required this.onTap});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  //text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  //signIn
  void signIn() async {
    // get the auth service
    final authServices = Provider.of<AuthServices>(context, listen: false);

    try{
      await authServices.signInWithEmailandPassword(
        emailController.text,
        passwordController.text,
        );
    }catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString(),
      ),
      ),
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              const Icon(Icons.water_drop,
              size: 100,
              color: Color.fromARGB(255, 77, 71, 71)
             ),
             SizedBox(height: 10,),
            Container(
              child: Text("Zindagi" ,style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),),
            ),

             const SizedBox(height: 50),
        
            //welcome back message
            const Text(
              "LOGIN",
              style: TextStyle(
              fontSize: 19,
            ),
            ),

            const SizedBox(height: 25),
        
            //email textfield
            MyTextField(
              controller: emailController,
              hintText: 'Phone',
              obscureText: false,
              ),

            const SizedBox(height: 10),
        
            //password textfield
             MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
              ),

              const SizedBox(height: 25),
        
            //signIn button
            MyButton(onTap: signIn, text: "Sign In"),

              const SizedBox(height: 50),    
        
            //user not a member? register now?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Text('Not a member?'),
               const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text('Register now',
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
     ), );
  }
}