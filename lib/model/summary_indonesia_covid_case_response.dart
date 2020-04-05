class SummaryIndonesiaCovidCaseResponse {
  String name;
  String positif;
  String sembuh;
  String meninggal;

  SummaryIndonesiaCovidCaseResponse(
      {this.name, this.positif, this.sembuh, this.meninggal});

  SummaryIndonesiaCovidCaseResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    positif = json['positif'];
    sembuh = json['sembuh'];
    meninggal = json['meninggal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['positif'] = this.positif;
    data['sembuh'] = this.sembuh;
    data['meninggal'] = this.meninggal;
    return data;
  }
}