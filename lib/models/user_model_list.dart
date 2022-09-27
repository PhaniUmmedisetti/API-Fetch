class UserModelList {
  List<Data>? data;
  int? total;
  int? page;
  int? limit;

  UserModelList({this.data, this.total, this.page, this.limit});

  UserModelList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['page'] = page;
    data['limit'] = limit;
    return data;
  }
}

class Data {
  String? id;
  String? title;
  String? firstName;
  String? lastName;
  String? picture;

  Data({this.id, this.title, this.firstName, this.lastName, this.picture});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['picture'] = picture;
    return data;
  }
}
