class GetModel {
  int? status;
  String? message;
  List<DataNotificatin>? data;
  Paging? paging;

  GetModel({this.status, this.message, this.data, this.paging});

  GetModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataNotificatin>[];
      json['data'].forEach((v) {
        data!.add(new DataNotificatin.fromJson(v));
      });
    }
    paging =
        json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.paging != null) {
      data['paging'] = this.paging!.toJson();
    }
    return data;
  }
}

class DataNotificatin {
  int? id;
  String? type;
  String? name;
  String? description;
  String? thumbnail;
  bool? favorite;
  String? createdAt;
  String? viewAt;

  DataNotificatin(
      {this.id,
      this.type,
      this.name,
      this.description,
      this.thumbnail,
      this.favorite,
      this.createdAt,
      this.viewAt});

  DataNotificatin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    favorite = json['favorite'];
    createdAt = json['createdAt'];
    viewAt = json['viewAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['description'] = this.description;
    data['thumbnail'] = this.thumbnail;
    data['favorite'] = this.favorite;
    data['createdAt'] = this.createdAt;
    data['viewAt'] = this.viewAt;
    return data;
  }
}

class Paging {
  int? page;
  int? size;
  int? total;
  int? totalPages;

  Paging({this.page, this.size, this.total, this.totalPages});

  Paging.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    size = json['size'];
    total = json['total'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['size'] = this.size;
    data['total'] = this.total;
    data['totalPages'] = this.totalPages;
    return data;
  }
}
