class StoryDetail {
  StoryDetail({
    this.id,
    this.title,
    this.author,
    this.slug,
    this.description,
    this.poster,
    this.categoryList,
    this.status,
    this.uploadDate,
    this.updatedDate,
    this.deletedAt,
    this.raters,
    this.ratings,
    this.categories,
    this.bookmarks,
    this.comments,
    this.rateCount,
    this.rateAvg,
    this.favorite,
    this.latestUpdatedDate,
  });

  final int? id;
  final String? title;
  final String? author;
  final String? slug;
  final List<String>? description;
  final String? poster;
  final List<String>? categoryList;
  final String? status;
  final DateTime? uploadDate;
  final DateTime? updatedDate;
  final DateTime? deletedAt;
  final List<Rater>? raters;
  final List<Rating>? ratings;
  final List<Category>? categories;
  final List<Bookmark>? bookmarks;
  final List<Comment>? comments;
  final int? rateCount;
  final int? rateAvg;
  final Favorite? favorite;
  final LatestUpdatedDate? latestUpdatedDate;

  factory StoryDetail.fromJson(Map<String, dynamic> json) => StoryDetail(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        slug: json["slug"],
        description: List<String>.from(json["description"].map((x) => x)),
        poster: json["poster"],
        categoryList: List<String>.from(json["categoryList"].map((x) => x)),
        status: json["status"],
        uploadDate: DateTime.parse(json["uploadDate"]),
        updatedDate: DateTime.parse(json["updatedDate"]),
        deletedAt: json["deletedAt"],
        raters: json["raters"] != null
            ? List<Rater>.from(json["raters"].map((x) => Rater.fromJson(x)))
            : null,
        ratings: json["ratings"] != null
            ? List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x)))
            : null,
        categories: json["categories"] != null
            ? List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x)))
            : null,
        bookmarks: json["bookmarks"] != null
            ? List<Bookmark>.from(
                json["bookmarks"].map((x) => Bookmark.fromJson(x)))
            : null,
        comments: json["comments"] != null
            ? List<Comment>.from(
                json["comments"].map((x) => Comment.fromJson(x)))
            : null,
        rateCount: json["rateCount"],
        rateAvg: json["rateAvg"],
        favorite: Favorite.fromJson(json["favorite"]),
        latestUpdatedDate: json["latestUpdatedDate"] != null
            ? LatestUpdatedDate.fromJson(json["latestUpdatedDate"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "slug": slug,
        "description": List<dynamic>.from(description!.map((x) => x)),
        "poster": poster,
        "categoryList": List<dynamic>.from(categoryList!.map((x) => x)),
        "status": status,
        "uploadDate": uploadDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
        "deletedAt": deletedAt,
        "raters": List<dynamic>.from(raters!.map((x) => x.toJson())),
        "ratings": List<dynamic>.from(ratings!.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
        "bookmarks": List<dynamic>.from(bookmarks!.map((x) => x.toJson())),
        "comments": List<dynamic>.from(comments!.map((x) => x.toJson())),
        "rateCount": rateCount,
        "rateAvg": rateAvg,
        "favorite": favorite!.toJson(),
        "latestUpdatedDate": latestUpdatedDate!.toJson(),
      };
}

class Bookmark {
  Bookmark({
    this.id,
    this.updatedDate,
  });

  final int? id;
  final DateTime? updatedDate;

  factory Bookmark.fromJson(Map<String, dynamic> json) => Bookmark(
        id: json["id"],
        updatedDate: DateTime.parse(json["updatedDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "updatedDate": updatedDate?.toIso8601String(),
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.slug,
    this.description,
  });

  final int? id;
  final String? name;
  final String? slug;
  final String? description;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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

class Comment {
  Comment({
    this.id,
    this.content,
    this.parentId,
    this.updatedDate,
    this.deletedAt,
    this.replies,
    this.user,
  });

  final int? id;
  final String? content;
  final int? parentId;
  final DateTime? updatedDate;
  final DateTime? deletedAt;
  final List<Comment>? replies;
  final Rater? user;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        content: json["content"],
        parentId: json["parentId"] != null ? json["parentId"] : null,
        updatedDate: DateTime.parse(json["updatedDate"]),
        deletedAt: json["deletedAt"],
        replies:
            List<Comment>.from(json["replies"].map((x) => Comment.fromJson(x))),
        user: Rater.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "parentId": parentId == null ? null : parentId,
        "updatedDate": updatedDate!.toIso8601String(),
        "deletedAt": deletedAt,
        "replies": List<dynamic>.from(replies!.map((x) => x.toJson())),
        "user": user!.toJson(),
      };
}

class Rater {
  Rater({
    this.id,
    this.email,
    this.name,
    this.roles,
    this.permissions,
    this.avatarFilePath,
    this.isEmailConfirmed,
    this.updatedDate,
    this.deletedAt,
  });

  final int? id;
  final String? email;
  final String? name;
  final List<String>? roles;
  final List<dynamic>? permissions;
  final String? avatarFilePath;
  final bool? isEmailConfirmed;
  final DateTime? updatedDate;
  final DateTime? deletedAt;

  factory Rater.fromJson(Map<String, dynamic> json) => Rater(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        permissions: List<dynamic>.from(json["permissions"].map((x) => x)),
        avatarFilePath: json["avatarFilePath"],
        isEmailConfirmed: json["isEmailConfirmed"],
        updatedDate: DateTime.parse(json["updatedDate"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "roles": List<dynamic>.from(roles!.map((x) => x)),
        "permissions": List<dynamic>.from(permissions!.map((x) => x)),
        "avatarFilePath": avatarFilePath,
        "isEmailConfirmed": isEmailConfirmed,
        "updatedDate": updatedDate!.toIso8601String(),
        "deletedAt": deletedAt,
      };
}

class Favorite {
  Favorite({
    this.count,
    this.isFavorite,
  });

  final int? count;
  final bool? isFavorite;

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        count: json["count"],
        isFavorite: json["isFavorite"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "isFavorite": isFavorite,
      };
}

class LatestUpdatedDate {
  LatestUpdatedDate({
    this.id,
    this.header,
    this.slug,
    this.body,
    this.viewCount,
    this.uploadDate,
    this.updatedDate,
    this.deletedAt,
  });

  final int? id;
  final String? header;
  final String? slug;
  final List<String>? body;
  final int? viewCount;
  final DateTime? uploadDate;
  final DateTime? updatedDate;
  final DateTime? deletedAt;

  factory LatestUpdatedDate.fromJson(Map<String, dynamic> json) =>
      LatestUpdatedDate(
        id: json["id"],
        header: json["header"],
        slug: json["slug"],
        body: List<String>.from(json["body"].map((x) => x)),
        viewCount: json["viewCount"],
        uploadDate: DateTime.parse(json["uploadDate"]),
        updatedDate: DateTime.parse(json["updatedDate"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "header": header,
        "slug": slug,
        "body": List<dynamic>.from(body!.map((x) => x)),
        "viewCount": viewCount,
        "uploadDate": uploadDate!.toIso8601String(),
        "updatedDate": updatedDate!.toIso8601String(),
        "deletedAt": deletedAt,
      };
}

class Rating {
  Rating({
    this.id,
    this.value,
  });

  final int? id;
  final int? value;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
