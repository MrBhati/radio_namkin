

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:radioapp/components/main_tab/main_tab.dart';
class Splash extends StatefulWidget {
  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<Splash> with SingleTickerProviderStateMixin {
  var _visible = true;

  late AnimationController animationController;
  Animation<double>? animation;
  bool isSubmited = false;

  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainTabs(),
      ),
    );
   
    
  }

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 1));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation!.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
    body: Stack(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/bg.png"),
                          fit: BoxFit.cover),
                    ),
                    // child: BackdropFilter(
                    //   filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.black.withOpacity(0.1),
                      ),
                    // ),
                  ),
                ),
              Center(
                child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: animation!.value * 50),
                  child: new Image.asset(
                    'assets/images/mainicon.png',
                    width: animation!.value * 300,
                    height: animation!.value * 300,
                  ),
                ),
                SizedBox(height: 20),
                   Text(
                          "Ek Dum Zabardast",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
            ],
          ),
              ),
              ],
            ),
     
    );
  }
}
