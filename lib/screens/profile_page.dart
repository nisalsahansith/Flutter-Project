import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_flutter_application/screens/home_page.dart';
import 'package:my_flutter_application/screens/student_form.dart';
import 'package:my_flutter_application/shared/student_provider.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  void _onTap(BuildContext context, int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    } else if(index == 1){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StudentForm()),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final student = ref.watch(studentProvider);

    if (student == null) {
      return const Scaffold(
        body: Center(child: Text("No Student Data")),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: student["profileImageUrl"]!.isNotEmpty
                    ? NetworkImage(student["profileImageUrl"]!)
                    : null,
                child: student["profileImageUrl"]!.isEmpty
                    ? const Icon(Icons.person, size: 50)
                    : null,
              ),

              const SizedBox(height: 20),

              Text(
                student["name"] ?? "",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Text(student["email"] ?? ""),

              const SizedBox(height: 10),

              Text("Course: ${student["course"] ?? ""}"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        onTap: (index) => _onTap(context, index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: "Form"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
