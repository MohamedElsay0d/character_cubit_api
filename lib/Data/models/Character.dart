class Character {
  int? id;
  String? name;
  String? status;
  String? gender;
  String? image;

  Character({
    this.id,
    this.name,
    this.status,
    this.gender,
    this.image,
  });

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    gender = json['gender'];
    image = json['image'];
  }
}
