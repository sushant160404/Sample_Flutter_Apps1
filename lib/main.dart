import 'package:flutter/material.dart';

void main() {
  runApp(const BlogApp());
}

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Arial',
      ),
      home: const BlogHomePage(),
    );
  }
}

class BlogHomePage extends StatefulWidget {
  const BlogHomePage({super.key});

  @override
  State<BlogHomePage> createState() => _BlogHomePageState();
}

class _BlogHomePageState extends State<BlogHomePage> {
  final List<Map<String, String>> _blogs = [
    {
      "title": "Welcome to My Blog",
      "content": "This is the first post on my amazing blog!",
      "image": "https://via.placeholder.com/600x200.png?text=Welcome+to+My+Blog",
    },
    {
      "title": "Flutter for Beginners",
      "content": "Learn how to create stunning apps using Flutter and Dart.",
      "image": "https://via.placeholder.com/600x200.png?text=Flutter+for+Beginners",
    },
    {
      "title": "Understanding State Management",
      "content": "State management is crucial for building dynamic apps.",
      "image": "https://via.placeholder.com/600x200.png?text=State+Management",
    },
  ];

  void _addBlog() {
    setState(() {
      _blogs.add({
        "title": "New Blog Post",
        "content": "This is a newly added blog post. Enjoy reading!",
        "image": "https://via.placeholder.com/600x200.png?text=New+Blog+Post",
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog App'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: _blogs.length,
        itemBuilder: (context, index) {
          final blog = _blogs[index];
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  child: Image.network(
                    blog['image']!,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        blog['title']!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        blog['content']!,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addBlog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
