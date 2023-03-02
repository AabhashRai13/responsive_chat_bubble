import 'package:flutter/material.dart';
import 'package:responsive_chat_bubbles/chat_bubbles/chat_bubbles_controller.dart';

class CustomChatBubble extends StatelessWidget {
  const CustomChatBubble({
    Key? key,
    required this.chatBubbleController,
    required this.height,
    required this.width,
    required this.actualText,
    required this.maxLines,
  }) : super(key: key);

  final ChatBubbleController chatBubbleController;
  final double height;
  final double width;
  final String actualText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: height,
      constraints: BoxConstraints(maxWidth: width),
      decoration: BoxDecoration(
        color: Colors.greenAccent.shade700,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 4.0),
            constraints: const BoxConstraints(maxWidth: 300),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text(
                    "AUTHOR",
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(fontSize: 9, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Text(actualText == "" ? chatBubbleController.texts[0] : actualText,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13, color: Colors.white)),
        ],
      ),
    );
  }
}