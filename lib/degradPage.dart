import 'package:flutter/material.dart';
import 'package:multi_converter/widget.dart';
import 'degRadConverterAppendClass.dart';

List<String> degRadList=[];
bool converterButtonControl= false;

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

  void appendDegRadList(){
    
    int control= 0;
    String degRadValue= "${degController.text},${radController.text}";
    
    if(degRadList.isEmpty)
    {
      degRadList.add(degRadValue);
    }

    for(var item in degRadList){
      if(item==degRadValue)
      {
        control=1;
        break;
      }
    }

    if(control==0){
      degRadList.add(degRadValue);
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
        list: degRadList,
        pageController: "degRad",
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
        title: TextWidget(data: "Deg-Rad Converter", color: Colors.white,),
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
                child: TextWidget(data: "Deg:", fontWeight: FontWeight.bold),
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
                child: TextWidget(data: "Rad:", fontWeight: FontWeight.bold),
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
              SizedBox(
                width: screenWidth/4,
                height: screenHeight/20,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey[900],
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(15)
                          )
                      )
                  ),
                  onPressed: (){
                    converterButtonControl=true;
                    var degRadConverterAppendClass= DegRadConverterAppendClass();
                    degRadConverterAppendClass.degRadConverterAppend(context, degController, radController);
                    },
                  child: TextWidget(data: "Convert", color: Colors.white)),
              ),
              SizedBox(
                width: screenWidth/4,
                height: screenHeight/20,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey[900],
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(15)
                          )
                      )
                  ),
                  onPressed: (){
                    if(converterButtonControl){
                      appendDegRadList();
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
                  child: TextWidget(data: "Save", color: Colors.white)),
              ),
                IconButton(
                    onPressed: (){
                      _displayBottomSheet(context, screenWidth, screenHeight);
                    }, 
                    icon: Icon(
                      color: Colors.blueGrey[900],
                      Icons.history_edu_outlined,
                    size: screenWidth/9,))
            ],
          )
        ],
      ),
    );
  }

}