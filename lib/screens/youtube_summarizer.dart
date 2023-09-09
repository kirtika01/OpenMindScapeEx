import 'dart:convert';
import 'package:toolify/pallete.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class YoutubeSummarizer extends StatefulWidget {
  const YoutubeSummarizer({super.key});

  @override
  State<YoutubeSummarizer> createState() {
    return _YoutubeSummarizerState();
  }
}

class _YoutubeSummarizerState extends State<YoutubeSummarizer> {
  final textController = TextEditingController();
  var enteredUrl = "";
  late var response;
  late var responsedata;
  late String description;
  List<String> content = [];

  void onPress() async {
    FocusScope.of(context).unfocus();
    enteredUrl = textController.text;
    if (enteredUrl.isEmpty) {
      return;
    }
    var url = Uri.parse(
        "https://youtube-summarizer-by-chatgpt.p.rapidapi.com/ytsummary1/?url=$enteredUrl&key=YourOpenaiApiKey");
    final header = {
      'X-RapidAPI-Key': "Your Radpi api key",
      'X-RapidAPI-Host': "youtube-summarizer-by-chatgpt.p.rapidapi.com"
    };
    try {
      response = await http.get(url, headers: header);
    } on Exception catch (e) {
      description = "Enter valid url";
      print(e.toString());
      return;
    }

    responsedata = await jsonDecode(response.body);
    description = responsedata['summary'].toString().trim();
    setState(() {
      content.add(description);
    });
    print(description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Youtube Summarizer"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                      color: Pallete.assistantCircleColor,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/image/yt_logo2.png"))),
                )
              ],
            ),
            Expanded(
              child: content.isEmpty
                  ? const Center(child: Text("Your summary Appear here"))
                  : ListView.builder(
                      itemCount: content.length,
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              content[index],
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    decoration: const InputDecoration(
                      labelText: "Enter URL",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                  iconSize: 40,
                  icon: const Icon(Icons.send),
                  onPressed: onPress,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
