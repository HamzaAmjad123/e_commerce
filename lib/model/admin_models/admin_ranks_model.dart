
class AdminRanksListModel {
  int? rankId;
  String? name;
  int? ranking;
  int? tenantId;
  // List<Null>? rankDetails;

  AdminRanksListModel(
      {this.rankId, this.name, this.ranking, this.tenantId,
        // this.rankDetails
      });

  AdminRanksListModel.fromJson(Map<String, dynamic> json) {
    rankId = json['rankId'];
    name = json['name'];
    ranking = json['ranking'];
    tenantId = json['tenantId'];
    // if (json['rankDetails'] != null) {
    //   rankDetails = <Null>[];
    //   json['rankDetails'].forEach((v) {
    //     rankDetails!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rankId'] = this.rankId;
    data['name'] = this.name;
    data['ranking'] = this.ranking;
    data['tenantId'] = this.tenantId;
    // if (this.rankDetails != null) {
    //   data['rankDetails'] = this.rankDetails!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
