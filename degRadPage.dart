import 'package:flutter/material.dart';


class DegradPageMain extends StatefulWidget{
  @override
  DegradPage createState() => DegradPage();

}

class DegradPage  extends State<DegradPageMain>{

  var degController= TextEditingController();
  var radController= TextEditingController();


  @override
  Widget build(BuildContext context) {

    var screenInformations= MediaQuery.of(context).size;
    var screenWidth= screenInformations.width;
    var screenHeight= screenInformations.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Text("Deg-Rad Converter",
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
            child: const Text("Deg:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
          ),
          SizedBox(
            height: screenHeight/18,
            width: screenWidth/5,
            child: TextField(
              controller: degController,
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
            child: const Text("Rad:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
          ),
          SizedBox(
            height: screenHeight/18,
            width: screenWidth/5,
            child: TextField(
              controller: radController,
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



