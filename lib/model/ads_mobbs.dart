class AdsMobbs {
  String? id;
  String? title;
  String? description;
  String? adType;
  String? adLink;
  String? fromDate;
  String? toDate;
  String? images;
  String? status;
  String? adminId;
  String? color;
  String? priority;
  String? slidingTime;
  String? subject;

  AdsMobbs(
      {this.id,
      this.title,
      this.description,
      this.adType,
      this.adLink,
      this.fromDate,
      this.toDate,
      this.images,
      this.status,
      this.adminId,
      this.color,
      this.priority,
      this.slidingTime,
      this.subject});

  AdsMobbs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    adType = json['adType'];
    adLink = json['adLink'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    images = json['images'];
    status = json['status'];
    adminId = json['adminId'];
    color = json['color'];
    priority = json['priority'];
    slidingTime = json['slidingTime'];
    subject = json['subject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['adType'] = this.adType;
    data['adLink'] = this.adLink;
    data['fromDate'] = this.fromDate;
    data['toDate'] = this.toDate;
    data['images'] = this.images;
    data['status'] = this.status;
    data['adminId'] = this.adminId;
    data['color'] = this.color;
    data['priority'] = this.priority;
    data['slidingTime'] = this.slidingTime;
    data['subject'] = this.subject;
    return data;
  }
}
