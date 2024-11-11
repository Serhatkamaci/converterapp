import 'package:flutter/material.dart';

class SpeedPageMain extends StatefulWidget{
  @override
  SpeedPage createState() => SpeedPage(); 

}



class SpeedPage extends State<SpeedPageMain>{

  var kmController= TextEditingController();
  var knotController= TextEditingController();
  var msController= TextEditingController();

  @override
  Widget build(BuildContext context) {

    var screenInformations= MediaQuery.of(context).size;
    var screenWidth= screenInformations.width;
    var screenHeight= screenInformations.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Text("Speed Converter",
        style: TextStyle(
          color: Colors.white,
        ),),
      ),  
      backgroundColor: Colors.blueGrey[50],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
            padding: EdgeInsets.only(
              left: screenWidth/50,
              right: screenWidth/40,
            ),
            child: const Text("m/s:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
          ),
          SizedBox(
            height: screenHeight/18,
            width: screenWidth/5,
            child: TextField(
              controller: msController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                )
              ),
            ),
          ),
          ],
         ),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
            padding: EdgeInsets.only(
              left: screenWidth/50,
              right: screenWidth/40,
            ),
            child: const Text("knots:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
          ),
          SizedBox(
            height: screenHeight/18,
            width: screenWidth/5,
            child: TextField(
              controller: knotController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                )
              ),
            ),
          ),
          ],
         ),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
            padding: EdgeInsets.only(
              left: screenWidth/50,
              right: screenWidth/40,
            ),
            child: const Text("km/h:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
          ),
          SizedBox(
            height: screenHeight/18,
            width: screenWidth/5,
            child: TextField(
              controller: kmController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                )
              ),
            ),
          ),
          ],
         ),
         Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15)
                )
              )
            ),
            onPressed: (){}, 
            child: const Text("Convert",
            style: TextStyle(
              color: Colors.black,
            ),),),
            ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15)
                )
              )
            ),
            onPressed: (){}, 
            child: const Text("Save",
            style: TextStyle(
              color: Colors.black,
            ),),)
            ],
          )
        ],
      ),
    );
  }
}