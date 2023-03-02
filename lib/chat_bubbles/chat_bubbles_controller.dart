import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatBubbleController extends GetxController {
  /// initial actual text, height,widht and maxlines of program
  int index = 0;
  var actualText = "".obs;
  var height = 72.0.obs;
  var maxWidth = 72.0.obs;
  var maxLines = 1.obs;
  double minWidth = 72.0;
  double minHeight = 72.0;
  List<String> texts = [
    "Lorem",
    "Lorem ipsum",
    "Lorem ipsum dolor",
    "Lorem ipsun ent enum mor",
    "Lorem ipsum dolor sit ed enit ignota",
    "Lorem ipsum dolor sit ed enit ignota, lorem lorem lorrrr ipssss lorem sit ed loremmmmmmmmm",
  ];

  /// function to find the size of the text that includes both height and width
  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 2,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  /// function to find the height of the text
  double _textHeight(String text, int maxlines, TextStyle style, double width) {
    TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 3,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: minWidth);
    return textPainter.size.height;
  }

  /// function to set new value of the chat bubble
  setValue(
    String text,
    double newHeight,
    double newWidth,
    int newMaxLines,
  ) {
    actualText.value = text;
    height.value = newHeight;
    maxWidth.value = newWidth;
    maxLines.value = newMaxLines;
  }

  /// function that check size of the word and sets data accordinly
  ///   according to the given requiremnts
  /// function takes the height and width of text to get compare
  checkSize(String text, TextStyle style) {
    Size sizeOfText = _textSize(text, style);
    double heightOfText = _textHeight(text, 5, style, sizeOfText.width);
    if (sizeOfText.width < 72) {
      setValue(text, minHeight, minWidth, 1);
    } else if (heightOfText == sizeOfText.height * 2) {
      setValue(text, minHeight, sizeOfText.width, 2);
    } else if (heightOfText == sizeOfText.height * 3 &&
        sizeOfText.width <= 180) {
      setValue(text, 90, 90, 3);
    } else if (heightOfText == sizeOfText.height * 3 &&
        sizeOfText.width >= 180) {
      setValue(text, 90, 190, 3);
    }
  }

  /// function to check the increase the index so while pressing the icon button
  /// at the app bar we get next text everytime
  increaseIndex() {
    if (index == texts.length - 1) {
      index = 0;
    } else {
      index = index + 1;
    }
  }

  /// function made to make code readable
  /// instead of accessing both functions one by one at ui
  /// calling it inside same function
  nextText() {
    increaseIndex();
    checkSize(texts[index], const TextStyle(fontSize: 13, color: Colors.white));
  }
}