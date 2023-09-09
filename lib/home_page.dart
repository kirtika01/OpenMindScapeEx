import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toolify/meme.dart';
import 'package:toolify/screens/image_screen.dart';
import 'package:toolify/screens/youtube_summarizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            CarouselSlider(
              items: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                          image: AssetImage("assets/image/slider_3.jpg"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                          image: AssetImage("assets/image/slider_yt.png"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                          image: AssetImage(
                              "assets/image/slider_text_to_voice.jpg"),
                          fit: BoxFit.cover)),
                ),
              ],
              options: CarouselOptions(autoPlay: true, enlargeCenterPage: true),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Elevate your",
                style: TextStyle(
                  fontSize: 25,
                )),
            const Text(
              "Productivity",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => const YoutubeSummarizer()));
              },
              child: Expanded(
                child: Container(
                  //1st Container
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.red.withOpacity(.999),
                      Colors.red.withOpacity(.66),
                      Colors.red.withOpacity(.44),
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.red,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Youtuber Summarizer",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "Summarize youtube videos using captions.",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                        child: Icon(
                          FontAwesomeIcons.youtube,
                          color: Colors.white,
                          size: 35,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => const Meme()));
              },
              child: Container(
                //2nd Container
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    const Color.fromARGB(255, 52, 6, 81).withOpacity(.99),
                    const Color.fromARGB(255, 52, 6, 81).withOpacity(.7),
                    const Color.fromARGB(255, 52, 6, 81).withOpacity(.4),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.red,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Meme Generator",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "Make meme of any image.",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                      child: Icon(
                        FontAwesomeIcons.faceLaughSquint,
                        color: Colors.white,
                        size: 45,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => const ImageGenerationScreen()));
              },
              child: Container(
                //3rd Container
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    const Color.fromARGB(255, 0, 0, 0).withOpacity(.99),
                    const Color.fromARGB(255, 0, 0, 0).withOpacity(.7),
                    const Color.fromARGB(255, 0, 0, 0).withOpacity(.4),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.red,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Image Generator",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "Create images using text.",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      child: Icon(
                        FontAwesomeIcons.image,
                        color: Colors.white,
                        size: 45,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
