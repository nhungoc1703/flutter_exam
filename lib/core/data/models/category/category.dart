class Categories {
  Categories({
    this.id,
    this.name,
    this.slug,
    this.description,
  });

  final int? id;
  final String? name;
  final String? slug;
  final String? description;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
      };
}
