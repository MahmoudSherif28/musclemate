import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:musclemate/views/chatbot/constant.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _user = ChatUser(id: '1', firstName: 'Mohamed');
  final _bot = ChatUser(id: '2', firstName: 'Bot');
  List<ChatMessage> messages = [];
  final _chatGpt = OpenAI.instance.build(
      token: '',
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "CHAT",
      )),
      body: DashChat(currentUser: _user, onSend: onSend, messages: messages),
    );
  }

  void onSend(ChatMessage message) async {
    setState(() {
      messages.insert(0, message);
    });
    List<Map<String, dynamic>> messagesHistory =
        messages.reversed.map((message) {
      return {
        'role': message.user == _user ? 'user' : 'assistant',
        'content': message.text,
      };
    }).toList();
    var request = ChatCompleteText(
      model: GptTurbo0301ChatModel(),
      messages: messagesHistory,
      maxToken: 200,
      logprobs: true,
    );
    try {
      var response = await _chatGpt.onChatCompletion(request: request);
      for (var element in response!.choices) {
        if (element.message != null) {
          setState(() {
            messages.insert(
              0,
              ChatMessage(
                text: element.message!.content,
                user: _bot,
                createdAt: DateTime.now(),
              ),
            );
          });
        }
      }
    } on OpenAIAuthError catch (e) {
      // Handle authentication error
      print("OpenAI Authentication Error: $e");
      // Inform the user about the authentication issue
    } catch (e) {
      // Handle other types of errors
      print("Error: $e");
    }
  }
}
