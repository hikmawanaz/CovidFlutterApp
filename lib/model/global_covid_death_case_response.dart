class GlobalCovidDeathCaseResponse {
  String name;
  String value;

  GlobalCovidDeathCaseResponse({this.name, this.value});

  GlobalCovidDeathCaseResponse.fromJson(Map<String, dynamic> json) {
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