import 'package:flutter/material.dart';

class ColoredContainer extends StatefulWidget {
  const ColoredContainer({super.key, required this.text});
  final String text;
  @override
  State<ColoredContainer> createState() => _ColoredContainerState();
}

class _ColoredContainerState extends State<ColoredContainer> {
  Color a = Colors.green;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (a == Colors.black) {
                a = Colors.green;
              } else {
                a = Colors.black;
              }
            });
          },
          child: Container(
            width: 100,
            height: 20,
            color: a,
            child: Center(child: Text(widget.text)),
          ),
        )
      ],
    );
  }
}
