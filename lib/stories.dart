import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';

class Stories extends StatefulWidget {
  const Stories({super.key});

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  String imageUrl =
      'https://cdn.mos.cms.futurecdn.net/b2b73efcff63147013ce7575e4315c24.jpg'; // Replace with the actual image URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Story1'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              imageUrl,
            ),
            fetchTextWidget(),
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: 'https://picsum.photos/250?image=9',
            ),
          ],
        ),
      ),
    );
  }

  FutureBuilder<String> fetchTextWidget() {
    return FutureBuilder<String>(
      future: fetchText(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(snapshot.data ?? ''),
          );
        }
      },
    );
  }

  Future<String> fetchText() async {
    String url =
        'https://gist.githubusercontent.com/konrados/a1289ade329ac6f4598ebf5ee3dbcb3c/raw/47a5c6473466fff45acf877eb81d6e496d7b001b/story.txt'; // Replace with the actual URL of the page

    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<String> paragraphs =
            response.body.split('\n'); // Split text into paragraphs

        // Return the first three paragraphs or all paragraphs if there are less than three
        return paragraphs.length >= 4
            ? paragraphs.sublist(1, 4).join('\n')
            : paragraphs.join('\n');

        //  return response.body.substring(0,response.body.length~/4);
      } else {
        throw Exception('Failed to fetch text');
        
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
