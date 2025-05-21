import 'package:flutter/material.dart';
import 'package:market_app/widgets/extension.dart';
import 'package:market_app/widgets/sub_text.dart';

class TextHelper extends StatefulWidget {
  const TextHelper({super.key, required this.text});
  final String text;
  @override
  State<TextHelper> createState() => _TextHelperState();
}

class _TextHelperState extends State<TextHelper> {
  bool isExpanded = false;
  final int maxLength = 120; // Maximum characters to show initially

  @override
  Widget build(BuildContext context) {
    final shouldExpand = widget.text.length > maxLength;
    final displayText =
        isExpanded
            ? widget.text
            : (shouldExpand
                ? '${widget.text.substring(0, maxLength)}...'
                : widget.text);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubText(text: displayText),
        if (shouldExpand)
          GestureDetector(
            onTap: () => setState(() => isExpanded = !isExpanded),
            child: Row(
              children: [
                SubText(
                  text: isExpanded ? 'Show less' : 'Show more',
                  textColor: Colors.black,
                ),
                5.width,
                Icon(isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down),
              ],
            ),
          ),
      ],
    );
  }
}
