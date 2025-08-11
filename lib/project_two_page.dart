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
    _loadStudentDetails(widget.userId);
  }

  @override
  void didUpdateWidget(covariant ProjectTwoPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.userId != widget.userId) {
      _loadStudentDetails(widget.userId); // Reload details for new ID
    }
  }

  void _loadStudentDetails(String userId) async {
    setState(() {
      isLoading = true;
      studentDetails = null;
    });

    await Future.delayed(const Duration(seconds: 3)); // Simulated API delay

    setState(() {
      studentDetails = _getStudentDetails(userId);
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
      elevation: 6,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              "Student Details",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 12),

            // Details list
            _buildDetailRow(Icons.badge, "Roll Number", studentDetails!['rollNumber']),
            _buildDetailRow(Icons.person, "Name", studentDetails!['name']),
            _buildDetailRow(Icons.cake, "DOB", studentDetails!['dob']),
            _buildDetailRow(Icons.family_restroom, "Father's Name", studentDetails!['fatherName']),
            _buildDetailRow(Icons.school, "Course", studentDetails!['course']),
            _buildDetailRow(Icons.computer, "Branch", studentDetails!['branch']),
          ],
        ),
      ),
    );
  }
  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              "$label: ",
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
