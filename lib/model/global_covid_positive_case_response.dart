class GlobalCovidPositiveCaseResponse {
  String name;
  String value;

  GlobalCovidPositiveCaseResponse({this.name, this.value});

  GlobalCovidPositiveCaseResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}