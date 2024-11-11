// ignore: file_names
import 'package:converterappdemo/degRadConverterAppendClass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PositionPageMain extends StatefulWidget{
  @override
  PositionPage createState() => PositionPage();
}

void positionConverterAppend(BuildContext context,
    TextEditingController firstDegreeController,
    TextEditingController secondDegreeController,
    TextEditingController secondMinitueController,
    TextEditingController thirdDegreeController,
    TextEditingController thirdMinuteontroller,
    TextEditingController thirdSecondController){

  try{
    if (firstDegreeController.text!=""){

      var degree= double.parse(firstDegreeController.text);
      var minute= (degree-degree.toInt())*60;
      var second= (minute-minute.toInt())*60;

      secondDegreeController.text= degree.toInt().toString();
      secondMinitueController.text= minute.toStringAsFixed(2);

      thirdDegreeController.text= degree.toInt().toString();
      thirdMinuteontroller.text= minute.toInt().toString();
      thirdSecondController.text= second.toStringAsFixed(2);
    }

    else if(secondDegreeController.text!="" || secondMinitueController.text!=""){

      if(secondDegreeController.text==""){
        secondDegreeController.text="0";
      }
      else if(secondMinitueController.text==""){
        secondMinitueController.text="0";
      }

      var degree= double.parse(secondDegreeController.text)+ double.parse(secondMinitueController.text)/60;
      var minute= (double.parse(secondDegreeController.text)-double.parse(secondDegreeController.text).toInt())*60+double.parse(secondMinitueController.text);
      var second= (minute- minute.toInt())*60;

      firstDegreeController.text= degree.toStringAsFixed(4);

      thirdDegreeController.text= degree.toInt().toString();
      thirdMinuteontroller.text=  minute.toInt().toString();
      thirdSecondController.text= second.toStringAsFixed(2);

    }

    else if(thirdDegreeController.text!="" && thirdMinuteontroller.text!="" && thirdSecondController.text!=""){

      if(thirdDegreeController.text==""){
        thirdDegreeController.text="0";
      }
      else if(thirdMinuteontroller.text==""){
        thirdMinuteontroller.text="0";
      }
      else if(thirdSecondController.text==""){
        thirdSecondController.text="0";
      }

      var degree= double.parse(thirdDegreeController.text)+(double.parse(thirdMinuteontroller.text)/60)+ (double.parse(thirdSecondController.text)/3600);
      var minute= double.parse(thirdMinuteontroller.text)+(double.parse(thirdSecondController.text)/60)+(double.parse(thirdDegreeController.text)-int.parse(thirdDegreeController.text))*60;

      firstDegreeController.text= degree.toStringAsFixed(4);

      secondDegreeController.text= degree.toInt().toString();
      secondMinitueController.text= minute.toStringAsFixed(2);
    }
  }
  catch (e){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blueGrey[900],
        content: Text("Lütfen sayı dışında bir sembol girmeyiniz!"),
      ),
    );
  }
}

// ignore: must_be_immutable
class PositionPage extends State<PositionPageMain>{

  var firstDegreeController= TextEditingController();
  var secondDegreeController= TextEditingController();
  var secondMinitueController= TextEditingController();
  var thirdDegreeController= TextEditingController();
  var thirdMinuteontroller= TextEditingController();
  var thirdSecondController= TextEditingController();

  void clearTextEditingController(TextEditingController currentController){
    if (currentController==firstDegreeController){
      secondDegreeController.clear();
      secondMinitueController.clear();
      thirdDegreeController.clear();
      thirdMinuteontroller.clear();
      thirdSecondController.clear();
    }

    else if(currentController==secondDegreeController || currentController==secondMinitueController){
      firstDegreeController.clear();
      thirdDegreeController.clear();
      thirdMinuteontroller.clear();
      thirdSecondController.clear();
    }

    else{
      firstDegreeController.clear();
      secondDegreeController.clear();
      secondMinitueController.clear();
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
        title: const Text("Position Converter",
          style: TextStyle(
            color: Colors.white,
          ),),
      ),
      backgroundColor: Colors.blueGrey[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Consumer<DegRadConverterAppendClass>(
            builder: (context, degRadObject, child){
              if (degRadObject.readController()!="") {
                firstDegreeController.text = degRadObject.readController();
              }
              return Row(
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
                    width: screenWidth/4,
                    child: TextField(
                      onChanged: (_)=>clearTextEditingController(firstDegreeController),
                      controller: firstDegreeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Row(
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
              Padding(
                padding: EdgeInsets.only(
                  right: screenWidth/40,
                ),
                child: SizedBox(
                  height: screenHeight/16,
                  width: screenWidth/5,
                  child: TextField(
                    onChanged: (_)=>clearTextEditingController(secondDegreeController),
                    controller: secondDegreeController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: screenWidth/40,
                ),
                child: const Text("Min:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
              ),
              SizedBox(
                height: screenHeight/16,
                width: screenWidth/5,
                child: TextField(
                  onChanged: (_)=>clearTextEditingController(secondMinitueController),
                  controller: secondMinitueController,
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
                  onChanged: (_)=>clearTextEditingController(thirdDegreeController),
                  controller: thirdDegreeController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth/50,
                  right: screenWidth/40,
                ),
                child: const Text("Min:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
              ),
              SizedBox(
                height: screenHeight/16,
                width: screenWidth/5,
                child: TextField(
                  onChanged: (_)=>clearTextEditingController(thirdMinuteontroller),
                  controller: thirdMinuteontroller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth/50,
                  right: screenWidth/40,
                ),
                child: const Text("Sec:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
              ),
              SizedBox(
                height: screenHeight/16,
                width: screenWidth/5,
                child: TextField(
                  onChanged: (_)=>clearTextEditingController(thirdSecondController),
                  controller: thirdSecondController,
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
                  positionConverterAppend(context, firstDegreeController, secondDegreeController, secondMinitueController, thirdDegreeController, thirdMinuteontroller, thirdSecondController);
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
                onPressed: (){

                },
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