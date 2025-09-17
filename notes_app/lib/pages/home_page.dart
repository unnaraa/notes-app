import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/pages/note_page.dart';
import 'package:notes_app/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> notes = [
    {
      'title': 'Note 1',
      'content':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'date': DateTime.now(),
    },
    {
      'title': 'Catatan 2',
      'content':
          'Jangan menunggu sempurna untuk memulai. Bahkan langkah kecil yang terus dilakukan bisa membawamu ke tempat yang besar.',
      'date': DateTime.now(),
    },
    {
      'title': 'Catatan 3',
      'content':
          'Allah tidak melihat hasilmu, tapi usaha dan keikhlasan di baliknya. Terus melangkah, meski perlahan.',
      'date': DateTime.now(),
    },
    {
      'title': 'Catatan 4',
      'content':
          'Belajar bukan soal cepat selesai, tapi tentang istiqamah dalam mencari ilmu dan memperbaiki diri.',
      'date': DateTime.now(),
    },
    {
      'title': 'Catatan 5',
      'content':
          'Setiap pagi adalah kesempatan baru untuk memperbaiki diri dan menjadi lebih dekat dengan tujuan hidupmu.',
      'date': DateTime.now(),
    },
    {
      'title': 'Catatan 6',
      'content':
          'Hidup ini bukan lomba lari cepat, tapi perjalanan panjang. Fokuslah pada arah, bukan hanya kecepatan.',
      'date': DateTime.now(),
    },
  ];

  String searchQuery = '';

  List<Map<String, dynamic>> get filteredNotes {
    if (searchQuery.isEmpty) return notes;
    return notes.where((note) {
      return note['title'].toString().toLowerCase().contains(
            searchQuery.toLowerCase(),
          ) ||
          note['content'].toString().toLowerCase().contains(
            searchQuery.toLowerCase(),
          );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        toolbarHeight: 200,
        flexibleSpace: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              const Text(
                'My Notes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${filteredNotes.length} notes',
                style: TextStyle(color: Colors.grey[400], fontSize: 14),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.person, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.wb_sunny, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search notes...',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: filteredNotes.length,
              itemBuilder: (context, index) {
                final note = filteredNotes[index];
                return Card(
                  elevation: 4,
                  color: Colors.grey[850],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            note['content'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          note['title'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          DateFormat('MMM dd, yyyy').format(note['date']),
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NotePage()),
            );
          },
          backgroundColor: Colors.grey[700],
          elevation: 12,
          shape: const CircleBorder(),
          child: const Icon(Icons.edit, color: Colors.red),
        ),
      ),
    );
  }
}
