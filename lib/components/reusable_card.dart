import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({
    @required this.color,
    this.cardChild,
    this.onPress,
  });

  final Color color;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: .0),
        decoration: BoxDecoration(
          color: color.withOpacity(0.9),
          borderRadius: BorderRadius.only(topRight: Radius.circular(25.0), topLeft: Radius.circular(25.0)),
          // image: DecorationImage(
          //   image: AssetImage("images/backgroundCoinDataPageTitle.jpg"),
          //   fit: BoxFit.cover,
          //   colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop),
          // ),
          // border: Border(
          //   bottom: BorderSide(color: Colors.white10, width: 2.0),
          // ),
        ),
      ),
    );
  }
}
