class ChallengeModel {
  String? name;
  String? photo;
  String? target;
  String? end_date;
  String? province;
  String? description;

  ChallengeModel({this.name, this.photo, this.target, this.end_date, this.province, this.description});

  // receiving data from server
  factory ChallengeModel.fromMap(map) {
    return ChallengeModel(
      name: map['name'],
      photo: map['photo'],
      target: map['target'],
      end_date: map['end_date'],
      province: map['province'],
      description: map['description'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photo': photo,
      'target': target,
      'end_date': end_date,
      'province': province,
      'description': description,
    };
  }
}
