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
  final Color accent;
  final TagAxis axis;
  final Alignment alignment;
  final double radius;
  final double size;
  final String font;

  const ChallengeTag({
    super.key,
    this.backColor = Colors.black,
    this.frontColor = Colors.white,
    this.accent = Colors.red,
    this.axis = TagAxis.up,
    this.alignment = Alignment.bottomCenter,
    this.radius = 8.0,
    this.size = 18.0,
    this.font = "Russo",
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
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          child: RotatedBox(
            quarterTurns: axis == TagAxis.down ? -turns : 0,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Part of\n",
                style: TextStyle(
                  fontFamily: font,
                  color: frontColor,
                  fontSize: size,
                  fontWeight: FontWeight.w300,
                ),
                children: [
                  TextSpan(
                    text: "# 100Days100Apps\n",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: accent,
                    ),
                  ),
                  const TextSpan(
                    text: "Challenge",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
