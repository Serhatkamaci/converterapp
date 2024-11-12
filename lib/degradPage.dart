import 'package:flutter/material.dart';
import 'degRadConverterAppendClass.dart';


class DegradPageMain extends StatefulWidget{
  @override
  DegradPage createState() => DegradPage();

}

class DegradPage  extends State<DegradPageMain>{

  var degController= TextEditingController();
  var radController= TextEditingController();

  void clearTextEditingController(TextEditingController controller){

    if (controller==degController){
      radController.clear();
    }
    else{
      degController.clear();
    }

  }

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
      backgroundColor: Colors.blueGrey[100],
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
                height: screenHeight/16,
                width: screenWidth/5,
                child: TextField(
                  onChanged: (_)=> clearTextEditingController(degController),
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
                height: screenHeight/16,
                width: screenWidth/5,
                child: TextField(
                  onChanged: (_)=> clearTextEditingController(radController),
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
                    backgroundColor: Colors.blueGrey[900],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(15)
                        )
                    )
                ),
                onPressed: (){
                  var degRadConverterAppendClass= DegRadConverterAppendClass();
                  degRadConverterAppendClass.degRadConverterAppend(context, degController, radController);
                  },
                child: const Text("Convert",
                  style: TextStyle(
                    color: Colors.white,
                  ),),),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[900],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(15)
                        )
                    )
                ),
                onPressed: (){},
                child: const Text("Save",
                  style: TextStyle(
                    color: Colors.white,
                  ),),)
            ],
          )
        ],
      ),
    );
  }

}



