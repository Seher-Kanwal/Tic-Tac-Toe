import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_teo_new/textstyle.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: introscreen(),
    );
  }
}
class introscreen extends StatelessWidget {
  const introscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const SizedBox(height: 80,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Text(" TIC TAC TOE",style: nexttextstyle,),
                ),
              ),
              Expanded(
                child:AvatarGlow(
                  endRadius: 160,
                  glowColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.none,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('images/img2.png',
                    //color: Colors.redAccent,
                    fit: BoxFit.scaleDown,),
                  ),

                ) ,

              ),
              const SizedBox(height: 60,),
              GestureDetector(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyhomePage()));
                } ,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(30),
                      color: Colors.white,
                      child: Text("PLAY GAME",style: mytextstyle,),
                    ),
                  ),
              ),
              ),
              SizedBox(height: 120,),
            ],
          ),
        ),
      ),
    );
  }
}



