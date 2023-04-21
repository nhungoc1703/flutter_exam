class Chapters {
  Chapters({
    this.id,
    this.header,
    this.slug,
    this.viewCount,
    this.updatedDate,
    this.story,
  });

  final int? id;
  final String? header;
  final String? slug;
  final int? viewCount;
  final DateTime? updatedDate;
  final Story? story;

  factory Chapters.fromJson(Map<String, dynamic> json) => Chapters(
        id: json["id"],
        header: json["header"],
        slug: json["slug"],
        viewCount: json["viewCount"],
        updatedDate: DateTime.parse(json["updatedDate"]),
        story: Story.fromJson(json["story"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "header": header,
        "slug": slug,
        "viewCount": viewCount,
        "updatedDate": updatedDate!.toIso8601String(),
        "story": story!.toJson(),
      };
}

class Story {
  Story({
    this.id,
    this.slug,
  });

  final int? id;
  final String? slug;

  factory Story.fromJson(Map<String, dynamic> json) => Story(
        id: json["id"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
      };
}
