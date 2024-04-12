import 'package:flutter/material.dart';

class Indicator extends AnimatedWidget {
  final PageController controller;
  final int pageCount;

  const Indicator(
      {super.key, required this.controller, required this.pageCount})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ListView.builder(
            shrinkWrap: true,
            itemCount: pageCount,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _createIndicator(index);
            })
      ],
    );
  }

  Widget _createIndicator(index) {
    double w = 10;
    double h = 10;
    Color color = Colors.orangeAccent;

    if (controller.page == index) {
      color = Colors.deepOrange;
      h = 13;
      w = 13;
    }

    return Container(
      height: 26,
      width: 26,
      child: Center(
        child: AnimatedContainer(
          margin: EdgeInsets.all(5),
          color: color,
          width: w,
          height: h,
          duration: Duration(milliseconds: 500
          ),
        ),
      ),
    );
  }
}
