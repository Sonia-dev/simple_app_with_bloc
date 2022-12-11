class Imagee {
  String? id;
  String? createdAt;
  String? updatedAt;

  int? width;
  int? height;
  String? color;
  String? blurHash;
  Urls? urls;

  int? likes;
  bool? likedByUser;
  List<Null>? currentUserCollections;


  Imagee({this.id, this.createdAt, this.updatedAt,  this.width, this.height, this.color, this.blurHash, this.urls,  this.likes, this.likedByUser, this.currentUserCollections});

  Imagee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

    width = json['width'];
    height = json['height'];
    color = json['color'];
    blurHash = json['blur_hash'];

    urls = json['urls'] != null ? new Urls.fromJson(json['urls']) : null;

    likes = json['likes'];
    likedByUser = json['liked_by_user'];

  }



}

class Urls {
  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;
  String? smallS3;

  Urls({this.raw, this.full, this.regular, this.small, this.thumb, this.smallS3});

  Urls.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    full = json['full'];
    regular = json['regular'];
    small = json['small'];
    thumb = json['thumb'];
    smallS3 = json['small_s3'];
  }


}

class ProfileImage {
  String? small;
  String? medium;
  String? large;

  ProfileImage({this.small, this.medium, this.large});

  ProfileImage.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
  }


}






