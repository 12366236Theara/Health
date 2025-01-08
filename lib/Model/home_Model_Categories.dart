class CategoriesHomeScreeen {
  int? status;
  String? message;
  List<CategoriesIpi>? data;

  CategoriesHomeScreeen({this.status, this.message, this.data});

  CategoriesHomeScreeen.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CategoriesIpi>[];
      json['data'].forEach((v) {
        data!.add(CategoriesIpi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoriesIpi {
  int? id;
  String? name;
  String? icon;
  int? order;

  CategoriesIpi({this.id, this.name, this.icon, this.order});

  CategoriesIpi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    data['order'] = order;
    return data;
  }
}