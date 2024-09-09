class Character {
  late int id;
  late String name;
  late String status;
  late String gender;
  late String image;
  late String created;
  late String location;
  late List episode;

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    gender = json['gender'];
    image = json['image'];
    created = json['created'];
    location = json['location']['name'];
    episode = json['episode'];
  }
}
