import "package:flutter/material.dart";

enum TagAxis {
  up,
  down,
  left,
  right,
}

class ChallengeTag extends StatelessWidget {
  final Color backColor;
  final Color frontColor;
  final TagAxis axis;
  final Alignment alignment;
  final double radius;

  const ChallengeTag({
    super.key,
    required this.backColor,
    required this.frontColor,
    this.axis = TagAxis.up,
    this.alignment = Alignment.bottomCenter,
    this.radius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    final int turns = switch (axis) {
      == TagAxis.up => 0,
      == TagAxis.down => 2,
      == TagAxis.right => 3,
      == TagAxis.left => 1,
      _ => 0,
    };

    return Align(
      alignment: alignment,
      child: RotatedBox(
        quarterTurns: turns,
        child: Container(
          decoration: BoxDecoration(
            color: backColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius),
              topRight: Radius.circular(radius),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
          child: RotatedBox(
            quarterTurns: axis == TagAxis.down ? -turns : 0,
            child: Text(
              "Challenge Tag",
              style: TextStyle(
                color: frontColor,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
