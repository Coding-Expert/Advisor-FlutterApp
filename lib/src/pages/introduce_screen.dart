import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroduceScreenWidget extends StatefulWidget {
  @override
  _IntroduceScreenWidgetState createState() => _IntroduceScreenWidgetState();
}

class _IntroduceScreenWidgetState extends State<IntroduceScreenWidget> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        backgroundColor: Color(0xFFFFFFFF),
        // title: "Block Time Wasters",
        // styleTitle: TextStyle(
        //   color: Colors.black,
        //   fontSize: 30.0,
        //   fontWeight: FontWeight.bold,
        // ),
        // description:"It is a long established fact that a reader will be distracted by the readable content.",
        widgetTitle: Container(
          width: 300, height: 300,
          child: Image.asset("assets/img/introduce/01.png"),
        ),
        styleDescription: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 20.0,
        ),
        centerWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Block Time Wasters', style: TextStyle(color: Colors.black,fontSize: 30.0,fontWeight: FontWeight.bold,)),
            SizedBox(height: 10,),
            Text("Save time and stay safe by blocking \n unwanted calls", style: TextStyle(color: Colors.grey.shade600,fontSize: 20.0,), textAlign: TextAlign.center,)
          ],
        ),
        // pathImage: "assets/img/introduce/01.png",
        // widthImage: 300,
        // heightImage: 300,
        // centerWidget: Image(
        //   image: AssetImage("assets/img/introduce/02.png"),
        //   width: 300,
        // ),
      ),
    );

    slides.add(
      new Slide(
        backgroundColor: Color(0xFFFFFFFF),
        title: "Identify Caller",
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description: "View ratings and chat with other members.",
        styleDescription: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 20.0,
        ),
        pathImage: "assets/img/introduce/02.png",
        widthImage: 300,
        heightImage: 300,
        // centerWidget: Image(
        //   image: AssetImage("assets/img/introduce/02.png"),
        //   width: 300,
        // ),
      ),
    );
    slides.add(
      new Slide(
        backgroundColor: Color(0xFFFFFFFF),
        title: "Rate your Caller",
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description: "Rate your calls and share your comments in real time.",
        styleDescription: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 20.0,
        ),
        pathImage: "assets/img/introduce/03.png",
        widthImage: 300,
        heightImage: 300,
        // centerWidget: Image(
        //   image: AssetImage("assets/img/introduce/03.png"),
        //   width: 300,
        // ),
      ),
    );
  }

  void onDonePress() {
    // TODO: go to next screen
    Navigator.of(context).pushReplacementNamed('/Login');
  }

  Widget renderNextBtn() {
    return Text(
      "NEXT",
      style: TextStyle(
        fontSize: 15,
        color: Theme.of(context).accentColor,
      ),
    );
  }

  Widget renderDoneBtn() {
    return Text(
      "GOT IT",
      style: TextStyle(
        fontSize: 15,
        color: Theme.of(context).accentColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: this.slides,
      // isShowSkipBtn: false,

      onDonePress: this.onDonePress,
      renderNextBtn: this.renderNextBtn(),
      renderDoneBtn: this.renderDoneBtn(),

      // Dot indicator
      colorDot: Colors.grey,
      colorActiveDot: Colors.red,
      sizeDot: 12.0,
      typeDotAnimation: dotSliderAnimation.DOT_MOVEMENT,
    );
  }
}
