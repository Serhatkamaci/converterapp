// ignore: file_names
import 'package:flutter/material.dart';
import 'package:multi_converter/degRadConverterAppendClass.dart';
import 'package:multi_converter/widget.dart';
import 'package:provider/provider.dart';
 
List<String> positionList=[];
bool converterButtonControl= false;

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
      if(secondMinitueController.text==""){
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

    else if(thirdDegreeController.text!="" || thirdMinuteontroller.text!="" || thirdSecondController.text!=""){

      if(thirdDegreeController.text==""){
        thirdDegreeController.text="0";
      }
      if(thirdMinuteontroller.text==""){
        thirdMinuteontroller.text="0";
      }
      if(thirdSecondController.text==""){
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
        content: TextWidget(data: "Lütfen sayı dışında bir sembol girmeyiniz!", color: Colors.white,),
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

  void appendPositionList(){
    
    int control= 0;
    String positionValue= "${firstDegreeController.text},${secondDegreeController.text}-${secondMinitueController.text},${thirdDegreeController.text}-${thirdMinuteontroller.text}-${thirdSecondController.text}";
    
    if(positionList.isEmpty)
    {
      positionList.add(positionValue);
    }

    for(var item in positionList){
      if(item==positionValue)
      {
        control=1;
        break;
      }
    }

    if(control==0){
      positionList.add(positionValue);
    }
  }

  Future _displayBottomSheet(BuildContext context, var screenWidth, var screenHeight){
    return showModalBottomSheet(
      showDragHandle: true,
      backgroundColor: Colors.blueGrey[100],
      context: context, 
      builder: (context)=> ShowModalBottomSheetWidgetStack(
        contextt: context,
        screenHeight: screenHeight,
        screenWidth: screenWidth,
        list: positionList,
        pageController: "position",
      ),
      );
  }

  @override
  Widget build(BuildContext context) {
    var screenInformations= MediaQuery.of(context).size;
    var screenWidth= screenInformations.width;
    var screenHeight= screenInformations.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: TextWidget(data: "Position Converter", color: Colors.white,)
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
                    child:  TextWidget(
                      data: "Deg:",
                      fontWeight: FontWeight.bold,
                      )
                  ),
                  SizedBox(
                    height: screenHeight/16,
                    width: screenWidth/4,
                    child: TextField(
                      onChanged: (_){
                        clearTextEditingController(firstDegreeController);
                        },
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
                child: TextWidget(
                  data: "Deg:",
                  fontWeight: FontWeight.bold,
                  )
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: screenWidth/40,
                ),
                child: SizedBox(
                  height: screenHeight/16,
                  width: screenWidth/5,
                  child: TextField(
                    onChanged: (_){
                      clearTextEditingController(secondDegreeController);
                      },
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
                child: TextWidget(
                  data: "Min:",
                  fontWeight: FontWeight.bold,
                ),
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
                child: TextWidget(
                  data: "Deg:",
                  fontWeight: FontWeight.bold,
                ),
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
                child: TextWidget(
                  data: "Min:",
                  fontWeight: FontWeight.bold,
                ),
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
                child: TextWidget(
                  data: "Sec:",
                  fontWeight: FontWeight.bold,
                ),
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
                  converterButtonControl= true;
                  positionConverterAppend(context, firstDegreeController, secondDegreeController, secondMinitueController, thirdDegreeController, thirdMinuteontroller, thirdSecondController);
                },
                child: TextWidget(
                  data: "Convert",
                  color: Colors.white,
                ),),
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
                  if(converterButtonControl)
                  {
                    appendPositionList();
                    converterButtonControl=false;
                  }
                  else
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.blueGrey[900],
                      content: TextWidget(
                      data: "Lütfen öncelikle 'Converter' butonuna tıklayınız!",
                      color: Colors.white,),
                    ),
                  );
                  }
                },
                child: TextWidget(
                  data: "Save",
                  color: Colors.white,
                ),),
                  IconButton(
                    onPressed: (){
                      _displayBottomSheet(context, screenWidth, screenHeight);
                    }, 
                    icon: Icon(
                      color: Colors.blueGrey[900],
                      Icons.history_edu_outlined,
                    size: screenWidth/9,)),
            ],
          )
        ],
      ),
    );
  }
}