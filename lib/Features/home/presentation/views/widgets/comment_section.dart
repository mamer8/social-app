import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/constants.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: kMargin, horizontal: kMargin),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage(
              AssetsData.testImage,
            ),
          ),
          const SizedBox(
            width: kMargin,
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: 'Write a comment ..',
                suffixIcon: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.send_outlined)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
