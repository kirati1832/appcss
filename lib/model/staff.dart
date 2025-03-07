class Personnel {
  final String name;
  final String englishName;
  final String image;
  final String email;
  final String phone;
  final String? education;
  final String? experience;
  final String? expertise;
  final String? interest;
  final String? certificate;
  final String? research;
  final String? books;
  final String? awards;
  final String? contact;
  final String? website;
  final String? lineId;
  final String? status;

  Personnel({
    required this.name,
    required this.englishName,
    required this.image,
    required this.email,
    required this.phone,
    this.education,
    this.experience,
    this.expertise,
    this.interest,
    this.certificate,
    this.research,
    this.books,
    this.awards,
    this.contact,
    this.website,
    this.lineId,
    this.status,
  });

  factory Personnel.fromJson(Map<String, dynamic> json) {
    return Personnel(
      name: json['name'] ?? '',
      englishName: json['english_name'] ?? '',
      image: json['image'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      education: json['education'] ?? '',
      experience: json['experience'] ?? '',
      expertise: json['expertise'] ?? '',
      interest: json['interest'] ?? '',
      certificate: json['certificate'] ?? '',
      research: json['research'] ?? '',
      books: json['books'] ?? '',
      awards: json['awards'] ?? '',
      contact: json['contact'] ?? '',
      website: json['website'] ?? '',
      lineId: json['line_id'] ?? '',
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'english_name': englishName,
      'image': image,
      'email': email,
      'phone': phone,
      'education': education,
      'experience': experience,
      'expertise': expertise,
      'interest': interest,
      'certificate': certificate,
      'research': research,
      'books': books,
      'awards': awards,
      'contact': contact,
      'website': website,
      'line_id': lineId,
      'status': status,
    };
  }
}

class PersonnelData {
  final List<Personnel> lecturers;
  final List<Personnel> executives;
  final List<Personnel> staff;

  PersonnelData({
    required this.lecturers,
    required this.executives,
    required this.staff,
  });

  factory PersonnelData.fromJson(Map<String, dynamic> json) {
    return PersonnelData(
      lecturers: (json['อาจารย์'] as List<dynamic>? ?? [])
          .map((item) => Personnel.fromJson(item as Map<String, dynamic>))
          .toList(),
      executives: (json['ผู้บริหารภาค'] as List<dynamic>? ?? [])
          .map((item) => Personnel.fromJson(item as Map<String, dynamic>))
          .toList(),
      staff: (json['บุคลากรสนับสนุน'] as List<dynamic>? ?? [])
          .map((item) => Personnel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'อาจารย์': lecturers.map((e) => e.toJson()).toList(),
      'ผู้บริหารภาค': executives.map((e) => e.toJson()).toList(),
      'บุคลากรสนับสนุน': staff.map((e) => e.toJson()).toList(),
    };
  }
}
