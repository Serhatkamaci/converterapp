import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextWidget extends StatelessWidget{

  final String data;
  final FontWeight fontWeight;
  late Color color;

  TextWidget({super.key, required this.data, this.fontWeight= FontWeight.normal, this.color= Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}

class ShowModalBottomSheetWidgetStack extends StatelessWidget{

  final BuildContext contextt;
  final double screenWidth;
  final double screenHeight;
  final List<String> list;
  final String pageController;

  const ShowModalBottomSheetWidgetStack({required this.pageController, required this.contextt, required this.screenWidth, required this.screenHeight, required this.list});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            child: list.length==0 ? Align(
            alignment: Alignment.topCenter,
            child: Text("Nothing Here!", style: TextStyle(fontWeight: FontWeight.bold),)):ListView.builder(
            itemBuilder: (contextt, index){
            return Column(
              children: [
                if(pageController=="position")
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    RichTextWidget(keyy: "Degree: ", value: list.elementAt(index).split(",")[0]+" °", pageController: "position"),
                    Row(
                      children: [
                        RichTextWidget(keyy: "Degree: ", value: list.elementAt(index).split(",")[1].split("-")[0]+" °", pageController: "position"),
                        RichTextWidget(keyy: " Minute: ", value: list.elementAt(index).split(",")[1].split("-")[1]+" '", pageController: "position"),
                      ],
                    ),
                    Row(
                      children: [
                        RichTextWidget(keyy: "Degree: ", value: list.elementAt(index).split(",")[2].split("-")[0]+" °", pageController: "position"),
                        RichTextWidget(keyy: " Minute: ", value: list.elementAt(index).split(",")[2].split("-")[1]+" '", pageController: "position"),
                        RichTextWidget(keyy: " Second: ", value: list.elementAt(index).split(",")[2].split("-")[2]+" ''", pageController: "position"),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),),
                  ],
                                    ),
              ),
                if(pageController=="speed")
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    RichTextWidget(keyy: "Speed(m/s): ", value: list.elementAt(index).split(",")[0], pageController: "speed"),
                    RichTextWidget(keyy: "Speed(knots): ", value: list.elementAt(index).split(",")[1], pageController: "speed"),
                    RichTextWidget(keyy: "Speed(km/h): ", value: list.elementAt(index).split(",")[2], pageController: "speed"),
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),),
                  ],
                                    ),
              ),
                if(pageController=="degRad")
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    RichTextWidget(keyy: "Degree: ", value: list.elementAt(index).split(",")[0]+" °", pageController: "degRad"),
                    RichTextWidget(keyy: "Radian: ", value: list.elementAt(index).split(",")[1]+" rad", pageController: "degRad"),
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),),
                  ],
                                    ),
              ),
            ],
          );
        },
        itemCount: list.length),
        height: screenHeight/3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      Positioned(
                left: 16,
                bottom: 16,
                child: IconButton(onPressed: (){
                  list.clear();
                  Navigator.pop(contextt);
                }, icon: Icon(
                  color: Colors.blueGrey[900],
                  Icons.restore_from_trash_sharp,
                size: screenWidth/9,)) 
                ) 
        ],
      );
}
}


class RichTextWidget extends StatelessWidget{

  final String pageController;
  final String keyy;
  final String value;

  RichTextWidget({required this.pageController, required this.keyy, required this.value});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
  children: [
    if (pageController == "position") ...[
      TextSpanWidget(data: keyy, fontWeight: FontWeight.bold),
      TextSpanWidget(data: value),
    ],
    if (pageController == "speed") ...[
      TextSpanWidget(data: keyy, fontWeight: FontWeight.bold),
      TextSpanWidget(data: value),
    ],
    if(pageController=="degRad")...[
      TextSpanWidget(data: keyy, fontWeight: FontWeight.bold),
      TextSpanWidget(data: value),
    ]
  ],
),
    );
  }
}

TextSpan TextSpanWidget({required String data, FontWeight fontWeight= FontWeight.normal}){
  return TextSpan(
    text: data,
    style: TextStyle(
      fontWeight: fontWeight,
      color: Colors.black,
    ),
  );
}
