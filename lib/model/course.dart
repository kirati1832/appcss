class Course {
  final String imageUrl;
  final String courseTitle;
  final String courseDescription;

  Course({
    required this.imageUrl,
    required this.courseTitle,
    required this.courseDescription,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      imageUrl: json['imageUrl'] ?? '',
      courseTitle: json['courseTitle'] ?? '',
      courseDescription: json['courseDescription'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'courseTitle': courseTitle,
      'courseDescription': courseDescription,
    };
  }
}

class CourseList {
  final List<Course> courses;

  CourseList({required this.courses});

  factory CourseList.fromJson(List<dynamic> json) {
    return CourseList(
      courses: json.map((item) => Course.fromJson(item)).toList(),
    );
  }

  List<Map<String, dynamic>> toJson() {
    return courses.map((course) => course.toJson()).toList();
  }
}
