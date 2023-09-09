import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Meme extends StatefulWidget {
  const Meme({super.key});

  @override
  State<Meme> createState() {
    return _MemeState();
  }
}

class _MemeState extends State<Meme> {
  var url;

  void onPress() async {
    var URL = Uri.parse("https://meme-api.com/gimme/1");
    var response = await http.get(URL);
    var data = jsonDecode(response.body);
    print(data);
    url = data['memes'][0]['preview'][2];

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: url != null
                    ? Image.network(url)
                    : const Text("Your meme appear here"),
              ),
              ElevatedButton(onPressed: onPress, child: const Text("Generate"))
            ],
          ),
        ));
  }
}
