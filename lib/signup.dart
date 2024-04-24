import 'package:flutter/material.dart';
import 'package:splashscreen/home.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formkey = GlobalKey<FormState>();

  bool shwpass=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup page"),
        automaticallyImplyLeading: true,
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            // Image.asset(
            //   "assets/images/image2.png",
            //   width: 70,
            //   height: 70,
            // ),
           
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                validator: (email){
                  if(email!.isEmpty || email.contains('@')){
                    return "email is not valid";
                  }else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: "email"),
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                validator: (password){
                  if(password!.isEmpty || password.length<6){
                    return "password must contain 6 characters";
                  }else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      if(shwpass){
                      shwpass=false;
                    }else{
                      shwpass=true;
                    }
                    });
                  }, icon:Icon( shwpass?Icons.visibility_off:Icons.visibility)),
                  
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: "password"),
                    obscureText: shwpass,
                    obscuringCharacter: '*',
                    
              ),
              
            ),
           
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: "confirm password"),
              ),
            ),
            ElevatedButton(onPressed: () {
              var isvalid=formkey.currentState!.validate();
              if(isvalid==true){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=>Homepage(username: '',)));
              }
            }, child: Text("sign up")),
          ],
        ),
      ),
    );
  }
}
