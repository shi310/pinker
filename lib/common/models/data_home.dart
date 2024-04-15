import '../index.dart';

class DataHomeModelBanners {
  DataHomeModelBanners({
    required this.list,
  });

  List<DataHomeModelBanner> list;

  factory DataHomeModelBanners.fromJson(Map<String, dynamic> json) =>
      DataHomeModelBanners(
        list: List<DataHomeModelBanner>.from(
            json["list"].map((x) => DataHomeModelBanner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };

  static Map<String, dynamic> child = {
    "list": <DataHomeModelBanner>[],
  };
}

class DataHomeModelMedias {
  DataHomeModelMedias({
    required this.list,
  });

  List<DataHomeModelMedia> list;

  factory DataHomeModelMedias.fromJson(Map<String, dynamic> json) =>
      DataHomeModelMedias(
        list: List<DataHomeModelMedia>.from(
            json["list"].map((x) => DataHomeModelMedia.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };

  static Map<String, dynamic> child = {
    "list": <DataHomeModelMedia>[],
  };
}

class DataHomeModelBanner {
  DataHomeModelBanner({
    required this.image,
    required this.title,
    this.bannerUrl,
  });

  String image;
  String title;
  String? bannerUrl;

  factory DataHomeModelBanner.fromJson(Map<String, dynamic> json) =>
      DataHomeModelBanner(
        image: json["image"],
        title: json["title"],
        bannerUrl: json["bannerUrl"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "bannerUrl": bannerUrl,
      };

  static Map<String, dynamic> child = {
    "image": '',
    "title": '',
    "bannerUrl": '',
  };
}

class DataHomeModelMedia {
  DataHomeModelMedia({
    required this.list,
    required this.title,
  });

  List<DataResourceModel> list;
  String title;

  factory DataHomeModelMedia.fromJson(Map<String, dynamic> json) =>
      DataHomeModelMedia(
        list: List<DataResourceModel>.from(
            json["list"].map((x) => DataResourceModel.fromJson(x))),
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "title": title,
      };

  static Map<String, dynamic> child = {
    "list": <DataResourceModel>[],
    "title": '',
  };
}

class DataHomeModelSearchWord {
  DataHomeModelSearchWord({
    required this.searchWord,
  });

  String searchWord;

  factory DataHomeModelSearchWord.fromJson(Map<String, dynamic> json) =>
      DataHomeModelSearchWord(
        searchWord: json["searchWord"],
      );

  Map<String, dynamic> toJson() => {
        "searchWord": searchWord,
      };
}
