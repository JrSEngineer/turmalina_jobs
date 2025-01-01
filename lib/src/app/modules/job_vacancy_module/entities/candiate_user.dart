// ignore_for_file: public_member_api_docs, sort_constructors_first

class CandidateUser {
  final String id;
  final String name;
  final String image;

  CandidateUser({
    required this.id,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory CandidateUser.fromMap(Map<String, dynamic> map) {
    return CandidateUser(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }
}
