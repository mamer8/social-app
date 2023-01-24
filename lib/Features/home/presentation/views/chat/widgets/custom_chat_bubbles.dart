import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles/color_manager.dart';
import '../../../../../../core/utils/styles/styles_manager.dart';

class MessagesBubbles extends StatelessWidget {
  final String text;
  //final String sender;

  final bool itsme;

  const MessagesBubbles(
      {super.key,
      required this.text,
      // required this.sender,
      required this.itsme});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            itsme ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Material(
            borderRadius: itsme
                ? const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))
                : const BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
            elevation: 10,
            color: itsme ? ColorManager.white : ColorManager.primary,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                text,
                style: getRegularStyle(
                    color: itsme ? ColorManager.primary : ColorManager.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
