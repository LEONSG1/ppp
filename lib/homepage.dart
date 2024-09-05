import 'package:flutter/material.dart';
import 'package:flutter_application_122/secondpage.dart'; // Import halaman kedua

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 55, 129, 189),
        title: const Text('Halaman Pertama'),
      ),
      body: const Center(
        child: Text("Tekan tombol di bawah untuk memulai"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const SecondPage()), // Navigasi ke halaman kedua
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
