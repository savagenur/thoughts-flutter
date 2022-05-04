
class MotivationImages {
  int? _total;
  int? _totalPages;
  late List<Results> _results;
  List<Results> get results => _results;

  MotivationImages({required total, required totalPages, required results}) {
    this._total = total;
    this._totalPages = totalPages;
    this._results = results;
  }

  MotivationImages.fromJson(Map<String, dynamic> json) {
    _total = json['total'];
    _totalPages = json['total_pages'];
    if (json['results'] != null) {
      _results = <Results>[];
      json['results'].forEach((v) {
        _results.add(new Results.fromJson(v));
      });
    }
  }
}

class Results {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? promotedAt;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  String? description;
  String? altDescription;
  late List<Urls> _urls;
  List<Urls> get urls => _urls;
  List<Null>? categories;
  int? likes;
  bool? likedByUser;
  List<Null>? currentUserCollections;
  Null? sponsorship;

  Results({
    required urls,
  }) {
    this._urls = urls;
  }

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    promotedAt = json['promoted_at'];
    width = json['width'];
    height = json['height'];
    color = json['color'];
    blurHash = json['blur_hash'];
    description = json['description'];
    altDescription = json['alt_description'];
    if (json['results'] != null) {
      _urls = <Urls>[];
      json['results'].forEach((v) {
        _urls.add(new Urls.fromJson(v));
      });
    };

    likes = json['likes'];
    likedByUser = json['liked_by_user'];
    if (json['current_user_collections'] != null) {
      currentUserCollections = <Null>[];
    }
    sponsorship = json['sponsorship'];
  }
}

class Urls {
  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;
  String? smallS3;

  Urls(
      {this.raw,
      this.full,
      this.regular,
      this.small,
      this.thumb,
      this.smallS3});

  Urls.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    full = json['full'];
    regular = json['regular'];
    small = json['small'];
    thumb = json['thumb'];
    smallS3 = json['small_s3'];
  }
}
