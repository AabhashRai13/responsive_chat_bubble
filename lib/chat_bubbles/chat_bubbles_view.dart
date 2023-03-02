import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_chat_bubbles/chat_bubbles/chat_bubbles_controller.dart';
import 'package:responsive_chat_bubbles/widgets/custom_chatbubble_widget.dart';

class ChatBubbleView extends StatelessWidget {
  ChatBubbleView({Key? key}) : super(key: key);
  /// initialized chatBubbleController instance to use ChatBubbleController
  final ChatBubbleController chatBubbleController =
      Get.put(ChatBubbleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Press Icon for next Text"),
            backgroundColor: Colors.green[300],
            actions: [
              IconButton(
                  onPressed: () {
                    /// function access via controller to get next text
                    chatBubbleController.nextText();
                  },
                  icon: const Icon(Icons.skip_next))
            ]),
        body: Center(
          /// using getx for statemanagement hence using obx to use observable
          child: Obx(() => CustomChatBubble(
              chatBubbleController: chatBubbleController,
              height: chatBubbleController.height.value,
              width: chatBubbleController.maxWidth.value,
              actualText: chatBubbleController.actualText.value,
              maxLines: chatBubbleController.maxLines.value)),
        ));
  }
}