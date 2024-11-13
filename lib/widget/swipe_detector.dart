import 'package:flutter/material.dart';

class SwipeDetector extends StatefulWidget {
  final Function onSwipeLeft;
  final Function onSwipeRight;
  final Function? onSwipeUp;
  final Function? onSwipeDown;
  final Function? onClick;
  final Widget child;
  const SwipeDetector(
      {super.key,
        required this.onSwipeLeft,
        required this.onSwipeRight,
        this.onSwipeUp,
        this.onSwipeDown,
        this.onClick,
        required this.child});

  @override
  State<StatefulWidget> createState() {
    return _SwipeDetectorState();
  }
}

class _SwipeDetectorState extends State<SwipeDetector> {
  // horizontal
  double initialHorizontalDrag = 0.0;
  double distanceHorizontalDrag = 0.0;

  // vertical
  double initialVerticalDrag = 0.0;
  double distanceVerticalDrag = 0.0;

  double dx = 0.0;
  double dy = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onClick != null) {
          widget.onClick!();
        }
      },
      onHorizontalDragUpdate: (d) {
        dx = d.delta.dx;
        setState(() {});
      },
      onVerticalDragUpdate: (d) {
        dy = d.delta.dy;
        setState(() {});
      },
      onHorizontalDragEnd: (DragEndDetails drag) {
        if (drag.primaryVelocity == null) return;
        if (drag.primaryVelocity! < 0) {
          // drag from right to left
          widget.onSwipeRight();
        } else {
          // drag from left to right
          widget.onSwipeLeft();
        }
      },
      onVerticalDragEnd: (DragEndDetails drag) {
        if (widget.onSwipeDown != null && widget.onSwipeUp != null) {
          if (drag.primaryVelocity == null) return;
          if (drag.primaryVelocity! < 0) {
            // drag from bottom to top
            widget.onSwipeDown!();
          } else {
            // drag from top to bottom
            widget.onSwipeUp!();
          }
        }
      },
      child: widget.child,
      // child: Container(
      //   margin: EdgeInsets.only(left: dx, top: dy),
      //   child: widget.child,
      // ),
    );
  }
}
