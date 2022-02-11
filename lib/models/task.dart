class Task {
  int? _id;
  String? name;
  bool? isChecked;

  Task({this.name = '', this.isChecked = false});

  Task.fromMap(Map<dynamic, dynamic> map) {
    _id = map['id'];
    name = map['name'];
    isChecked = map['isChecked'];
  }

  int? get id => _id;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = _id;
    map['name'] = name;
    map['isChecked'] = isChecked;
    return map;
  }

  void ToogleDone() {
    isChecked = !isChecked!;
  }
}
