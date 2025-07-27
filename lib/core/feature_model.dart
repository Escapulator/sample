class FeatureModel {
  String? _title;
  String? _subtitle;

  FeatureModel({String? title, String? subtitle}) {
    _title = title;
    _subtitle = subtitle;
  }

  String? get title => _title;
  String? get subtitle => _subtitle;

  FeatureModel.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _subtitle = json['subtitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = _title;
    data['subtitle'] = _subtitle;
    return data;
  }
}
