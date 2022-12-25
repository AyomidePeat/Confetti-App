import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';


void main() {
  runApp( MaterialApp(home:MyApp()));
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
final controller = ConfettiController();
  
bool isPlaying = false;

@override
void initState(){
  super.initState();
  controller.addListener((){
    setState((){
      isPlaying = controller.state == ConfettiControllerState.playing;
    });
  });
  
}

@override
void dispose(){
  controller.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Stack( alignment:Alignment.center,
    children:[
    Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        title: const Text("Confetti Sprayer"),
        backgroundColor:Colors.purple,
      ),
      body: Center(
        child:ElevatedButton(
         style:ElevatedButton.styleFrom( backgroundColor:Colors.purple),
          child: Text(isPlaying ? "Stop 🎉":"Celebrate 🎉"),
          onPressed: (){
            if (isPlaying){
              controller.stop();
            }else{
              controller.play();
            }
          }
        )
      )
    ),
    ConfettiWidget(
      confettiController: controller,
      shouldLoop:true,
      blastDirectionality: BlastDirectionality.explosive,
      minBlastForce: 1,maxBlastForce:10,
      gravity: 0.3,
      emissionFrequency: 0.50,
      numberOfParticles: 20,
      
    )
    ]);
  }
}
