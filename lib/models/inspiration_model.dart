class InspirationModel {
  String? quote;
  String? author;
  String? id;

  InspirationModel({
    this.id,
    this.quote,
    this.author,
  });

  InspirationModel.fromJson(Map<String, dynamic> json) {
    id = json['c'];
    quote = json['q'];
    author = json['a'];
  }
}
