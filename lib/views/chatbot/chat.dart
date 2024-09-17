// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:musclemate/helpers/color_extension.dart';
// import 'package:musclemate/views/chatbot/chat_buble.dart';
// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

// class ChatPage extends StatefulWidget {
//   @override
//   _ChatPageState createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   TextEditingController textEditingController = TextEditingController();
//   List<Map<String, String>> messages = [];
//   OpenAI? openAI;
//   StreamSubscription? _streamSubscription;

//   @override
//   void initState() {
//     super.initState();
//     openAI = OpenAI.instance;
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _streamSubscription?.cancel();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Chat'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               reverse: true,
//               itemCount: messages.length,
//               itemBuilder: (BuildContext context, index) {
//                 return ChatBuble(messageText: messages[index]['Message']!);
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: TextField(
//               controller: textEditingController,
//               decoration: InputDecoration(
//                 hintText: 'Send Message',
//                 suffixIcon: IconButton(
//                   onPressed: () {
//                     userMessage(textEditingController.text);
//                     textEditingController.clear();
//                   },
//                   icon: Icon(
//                     Icons.send,
//                     color: TColor.kPrimaryColor,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void userMessage(String m) {
//     setState(() {
//       messages.insert(0, {'Sender': 'user', 'Message': m});
//     });
//     gptMessage(m);
//     debugPrint(messages.toString());
//   }

//   void gptMessage(String message) async {
//     final request = ChatCompleteText(
//       model: GptTurbo0301ChatModel(),
//       messages: messages,
//       maxToken: 200,
//     );

//     try {
//       final response = await openAI!
//           .build(
//               apiUrl: 'https://api.openai.com/v1/models',
//               token:
//                   "Bearer sk-mJwp5ZMKBkdJAGHKnz2IlPRMTrXbJQUi79Z03jN8SsT3BlbkFJYSUVocnDG-_hA-BpSJHaBWkhVd_cuApkvYFHxanqMA",
//               enableLog: true)
//           .onChatCompletion(request: request);

//       setState(
//         () {
//           final gptResponse =
//               response?.choices[0].message?.content ?? 'No response';

//           messages.insert(0, {
//             'Sender': 'gpt',
//             'Message': gptResponse,
//           });
//         },
//       );
//     } catch (e) {
//       debugPrint('Error occurred: $e');
//     }
//   }
// }
// // curl https://api.openai.com/v1/models \
// //   -H 
  

// //   curl https://api.openai.com/v1/models -H "Authorization: Bearer sk-mJwp5ZMKBkdJAGHKnz2IlPRMTrXbJQUi79Z03jN8SsT3BlbkFJYSUVocnDG-_hA-BpSJHaBWkhVd_cuApkvYFHxanqMA"