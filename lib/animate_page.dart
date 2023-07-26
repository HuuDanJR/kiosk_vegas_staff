import 'package:flutter/material.dart';
import 'package:vegas_point_portal/home.dart';
import 'package:vegas_point_portal/util/mycolor.dart';

class AnimatedScreen extends StatefulWidget {
  String? name, number;
  int? currentPoint, totalPoint, dailyPoint, monthlyPoint, weeklyPoint;
  String? id;
  AnimatedScreen(
      {Key? key,
      this.name,
      this.id,
      this.number,
      this.currentPoint,
      this.totalPoint,
      this.dailyPoint,
      this.weeklyPoint,
      this.monthlyPoint})
      : super(key: key);
  @override
  _AnimatedScreenState createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen>
    with TickerProviderStateMixin {
  late Animation _containerRadiusAnimation,
      _containerSizeAnimation,
      _containerColorAnimation;
  late AnimationController _containerAnimationController;

  @override
  void initState() {
    super.initState();
    _containerAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 5000));
    _containerRadiusAnimation = BorderRadiusTween(
            begin: BorderRadius.circular(100.0),
            end: BorderRadius.circular(0.0))
        .animate(CurvedAnimation(
            curve: Curves.ease, parent: _containerAnimationController));

    _containerSizeAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(curve: Curves.ease, parent: _containerAnimationController));
    _containerColorAnimation =
        ColorTween(begin: MyColor.yellow, end: Colors.transparent).animate(
            CurvedAnimation(
                curve: Curves.ease, parent: _containerAnimationController));

    _containerAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(body:
           
     Stack(
       children: [
         Center(child: AnimatedBuilder(
          animation: _containerAnimationController,
          builder: (context, index) {
            return Container(
              width: _containerSizeAnimation.value * width,
              height: _containerSizeAnimation.value * height,
              decoration: BoxDecoration(
                  borderRadius: _containerRadiusAnimation.value,
                  color: _containerColorAnimation.value),
            );
          },
    )),
								
       ],
     ));
  }
}
