// ignore_for_file: public_member_api_docs, sort_constructors_first

class VacancyPostOwner {
  final String id;
  final String name;
  final String image;

  VacancyPostOwner({
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

  factory VacancyPostOwner.fromMap(Map<String, dynamic> map) {
    return VacancyPostOwner(
      id: map['id'],
      name: map['name'],
      image: map['image'],
    );
  }
}
