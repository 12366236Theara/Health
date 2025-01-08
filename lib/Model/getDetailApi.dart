class getDetailApi {
  int? status;
  String? message;
  getDetailitem? data;

  getDetailApi({this.status, this.message, this.data});

  getDetailApi.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new getDetailitem.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class getDetailitem {
  int? id;
  String? type;
  String? name;
  String? description;
  String? content;
  String? thumbnail;
  int? views;
  String? status;
  bool? favorite;
  String? createdAt;
  List<Categories>? categories;
  List<Tags>? tags;

  getDetailitem(
      {this.id,
      this.type,
      this.name,
      this.description,
      this.content,
      this.thumbnail,
      this.views,
      this.status,
      this.favorite,
      this.createdAt,
      this.categories,
      this.tags});

  getDetailitem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    description = json['description'];
    content = json['content'];
    thumbnail = json['thumbnail'];
    views = json['views'];
    status = json['status'];
    favorite = json['favorite'];
    createdAt = json['createdAt'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['description'] = this.description;
    data['content'] = this.content;
    data['thumbnail'] = this.thumbnail;
    data['views'] = this.views;
    data['status'] = this.status;
    data['favorite'] = this.favorite;
    data['createdAt'] = this.createdAt;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? icon;
  int? order;

  Categories({this.id, this.name, this.icon, this.order});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['order'] = this.order;
    return data;
  }
}

class Tags {
  int? id;
  String? name;

  Tags({this.id, this.name});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}