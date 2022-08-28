import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignScreen extends StatelessWidget {
  const SignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat App'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/chat-app.jpg',fit: BoxFit.fitWidth,),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                icon: FaIcon(FontAwesomeIcons.google),
                label: const Text('Sign In with Google'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/chat');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
