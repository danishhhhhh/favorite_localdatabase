class Favorite {
  int id;
  String title;
  String image;

  Favorite({required this.id, required this.title, required this.image});

  Favorite.fromMap({required map})
      : id = map["id"],
        title = map["title"] ?? "",
        image = map["image"] ?? "";

  Map<String, dynamic> toMap() {
    return {"id": id, "title": title, "image": image};
  }
}