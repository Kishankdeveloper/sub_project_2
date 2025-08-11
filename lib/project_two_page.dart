import 'package:flutter/material.dart';

class ProjectTwoPage extends StatefulWidget {
  final String userId;
  const ProjectTwoPage({super.key, required this.userId});

  @override
  State<ProjectTwoPage> createState() => _ProjectTwoPageState();
}

class _ProjectTwoPageState extends State<ProjectTwoPage> {
  Map<String, dynamic>? studentDetails;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadStudentDetails();
  }

  void _loadStudentDetails() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 3)); // Simulated API delay

    setState(() {
      studentDetails = _getStudentDetails(widget.userId);
      isLoading = false;
    });
  }

  Map<String, dynamic> _getStudentDetails(String userId) {
    final students = {
      "101": {
        "rollNumber": "STU-101",
        "name": "Alice Johnson",
        "dob": "2002-03-15",
        "fatherName": "Michael Johnson",
        "course": "B.Sc",
        "branch": "Mathematics",
      },
      "102": {
        "rollNumber": "STU-102",
        "name": "Bob Smith",
        "dob": "2001-07-22",
        "fatherName": "David Smith",
        "course": "B.Tech",
        "branch": "Mechanical Engineering",
      },
      "103": {
        "rollNumber": "STU-103",
        "name": "Clara Brown",
        "dob": "2003-11-05",
        "fatherName": "Robert Brown",
        "course": "B.Com",
        "branch": "Accounting",
      },
      "104": {
        "rollNumber": "STU-104",
        "name": "Daniel Lee",
        "dob": "2000-12-19",
        "fatherName": "Steven Lee",
        "course": "B.Tech",
        "branch": "Computer Science",
      },
    };

    return students[userId] ??
        {
          "rollNumber": "N/A",
          "name": "Student Not Found",
          "dob": "-",
          "fatherName": "-",
          "course": "-",
          "branch": "-",
        };
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (studentDetails == null) {
      return const Center(
        child: Text("No student details found."),
      );
    }

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Roll Number: ${studentDetails!['rollNumber']}", style: const TextStyle(fontSize: 18)),
            Text("Name: ${studentDetails!['name']}", style: const TextStyle(fontSize: 18)),
            Text("DOB: ${studentDetails!['dob']}", style: const TextStyle(fontSize: 18)),
            Text("Father's Name: ${studentDetails!['fatherName']}", style: const TextStyle(fontSize: 18)),
            Text("Course: ${studentDetails!['course']}", style: const TextStyle(fontSize: 18)),
            Text("Branch: ${studentDetails!['branch']}", style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
