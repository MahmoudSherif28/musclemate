// import 'package:flutter/material.dart';
// import 'package:musclemate/helpers/color_extension.dart';

// class ChatBuble extends StatelessWidget {
//   const ChatBuble({super.key, required this.messageText});
//   final String messageText;
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerRight,
//       child: Container(
//         padding: const EdgeInsets.only(
//           left: 8,
//           top: 32,
//           right: 32,
//           bottom: 32,
//         ),
//         margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(32),
//             topRight: Radius.circular(32),
//             bottomLeft: Radius.circular(32),
//           ),
//           color: TColor.kPrimaryColor,
//         ),
//         child: Text(
//           messageText,
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
