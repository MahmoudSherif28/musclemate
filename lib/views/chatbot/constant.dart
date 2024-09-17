const OPENAI_API_KEY =
    'sk-oKeWyrvNL-DNtsOdc9KRbxxUUkie4xqH2E-PYaP_HkT3BlbkFJ04kZGbkHu3Wm6akQo08Ks1b3NAHARPO3lusnKBpxoA';







// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:flutter/material.dart';
// import 'package:musclemate/helpers/color_extension.dart';
// import 'package:musclemate/views/chatbot/constant.dart';

// class Chat extends StatefulWidget {
//   const Chat({super.key});

//   @override
//   State<Chat> createState() => _ChatState();
// }

// class _ChatState extends State<Chat> {
//   final _openAi = OpenAI.instance.build(
//     token: OPENAI_API_KEY, // Ensure the API key is correct
//     baseOption: HttpSetup(
//       receiveTimeout: const Duration(seconds: 5),
//     ),
//     enableLog: true, // Logs will help debug
//   );
//   final ChatUser _currentUser =
//       ChatUser(id: '1', firstName: 'Mohamed', lastName: 'Hussien');
//   final ChatUser _gptCahtUser =
//       ChatUser(id: 'id', firstName: 'Chat', lastName: 'GPT');
//   final List<ChatMessage> _messages = <ChatMessage>[];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: TColor.kPrimaryColor,
//       ),
//       body: DashChat(
//         messageOptions: MessageOptions(
//           currentUserContainerColor: TColor.kPrimaryColor,
//           containerColor: const Color.fromRGBO(0, 166, 126, 1),
//           textColor: Colors.white,
//         ),
//         currentUser: _currentUser,
//         onSend: (ChatMessage m) {
//           getChatResponse(m);
//         },
//         messages: _messages,
//       ),
//     );
//   }

//   Future<void> getChatResponse(ChatMessage m) async {
//     setState(() {
//       _messages.insert(0, m);
//     });
//     List<Map<String, dynamic>> messagesHistory = _messages.reversed.map((m) {
//       return {
//         'role': m.user == _currentUser ? 'user' : 'assistant',
//         'content': m.text,
//       };
//     }).toList();

//     final request = ChatCompleteText(
//       model: GptTurbo0301ChatModel(), // Use the standard model
//       messages: messagesHistory,
//       maxToken: 200,
//     );

//     try {
//       final response = await _openAi.onChatCompletion(request: request);
//       for (var element in response!.choices) {
//         if (element.message != null) {
//           setState(() {
//             _messages.insert(
//                 0,
//                 ChatMessage(
//                     user: _gptCahtUser,
//                     createdAt: DateTime.now(),
//                     text: element.message!.content));
//           });
//         }
//       }
//     } catch (e) {
//       // Handle the OpenAI error and log it
//       print("Error: $e");
//     }
//   }
// }
