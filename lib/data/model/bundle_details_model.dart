class BundleDetailsModel {
  final int? status;
  final Data? data;

  BundleDetailsModel({
    this.status,
    this.data,
  });

  BundleDetailsModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'data' : data?.toJson()
  };
}

class Data {
  final String? uuid;
  final String? displayName;
  final dynamic displayNameSubText;
  final String? description;
  final dynamic extraDescription;
  final dynamic promoDescription;
  final bool? useAdditionalContext;
  final String? displayIcon;
  final String? displayIcon2;
  final String? verticalPromoImage;
  final String? assetPath;

  Data({
    this.uuid,
    this.displayName,
    this.displayNameSubText,
    this.description,
    this.extraDescription,
    this.promoDescription,
    this.useAdditionalContext,
    this.displayIcon,
    this.displayIcon2,
    this.verticalPromoImage,
    this.assetPath,
  });

  Data.fromJson(Map<String, dynamic> json)
    : uuid = json['uuid'] as String?,
      displayName = json['displayName'] as String?,
      displayNameSubText = json['displayNameSubText'],
      description = json['description'] as String?,
      extraDescription = json['extraDescription'],
      promoDescription = json['promoDescription'],
      useAdditionalContext = json['useAdditionalContext'] as bool?,
      displayIcon = json['displayIcon'] as String?,
      displayIcon2 = json['displayIcon2'] as String?,
      verticalPromoImage = json['verticalPromoImage'] as String?,
      assetPath = json['assetPath'] as String?;

  Map<String, dynamic> toJson() => {
    'uuid' : uuid,
    'displayName' : displayName,
    'displayNameSubText' : displayNameSubText,
    'description' : description,
    'extraDescription' : extraDescription,
    'promoDescription' : promoDescription,
    'useAdditionalContext' : useAdditionalContext,
    'displayIcon' : displayIcon,
    'displayIcon2' : displayIcon2,
    'verticalPromoImage' : verticalPromoImage,
    'assetPath' : assetPath
  };
}

class BundlesPrice {
  String priceVP;
  String priceRP;

  BundlesPrice({
    required this.priceVP,
    required this.priceRP
  }); 

  var listPrice = [
    BundlesPrice(priceVP: "4950", priceRP: "447000",),
    BundlesPrice(priceVP: "6800", priceRP: "596000"),
    BundlesPrice(priceVP: "11400", priceRP: "892000"),
    BundlesPrice(priceVP: "5625", priceRP: "520000"),
    BundlesPrice(priceVP: "6175", priceRP: "551000"),
    BundlesPrice(priceVP: "8650", priceRP: "743000"),
    BundlesPrice(priceVP: "4950", priceRP: "447000",),
    BundlesPrice(priceVP: "6800", priceRP: "596000"),
    BundlesPrice(priceVP: "11400", priceRP: "892000"),
    BundlesPrice(priceVP: "5625", priceRP: "520000"),
    BundlesPrice(priceVP: "6175", priceRP: "551000"),
    BundlesPrice(priceVP: "8650", priceRP: "743000"),
    BundlesPrice(priceVP: "4950", priceRP: "447000",),
    BundlesPrice(priceVP: "6800", priceRP: "596000"),
    BundlesPrice(priceVP: "11400", priceRP: "892000"),
    BundlesPrice(priceVP: "5625", priceRP: "520000"),
    BundlesPrice(priceVP: "6175", priceRP: "551000"),
    BundlesPrice(priceVP: "8650", priceRP: "743000"),
    BundlesPrice(priceVP: "4950", priceRP: "447000",),
    BundlesPrice(priceVP: "6800", priceRP: "596000"),
    BundlesPrice(priceVP: "11400", priceRP: "892000"),
    BundlesPrice(priceVP: "5625", priceRP: "520000"),
    BundlesPrice(priceVP: "6175", priceRP: "551000"),
    BundlesPrice(priceVP: "8650", priceRP: "743000"),
    BundlesPrice(priceVP: "4950", priceRP: "447000",),
    BundlesPrice(priceVP: "6800", priceRP: "596000"),
    BundlesPrice(priceVP: "11400", priceRP: "892000"),
    BundlesPrice(priceVP: "5625", priceRP: "520000"),
    BundlesPrice(priceVP: "6175", priceRP: "551000"),
    BundlesPrice(priceVP: "8650", priceRP: "743000"),
    BundlesPrice(priceVP: "4950", priceRP: "447000",),
    BundlesPrice(priceVP: "6800", priceRP: "596000"),
    BundlesPrice(priceVP: "11400", priceRP: "892000"),
    BundlesPrice(priceVP: "5625", priceRP: "520000"),
    BundlesPrice(priceVP: "6175", priceRP: "551000"),
    BundlesPrice(priceVP: "8650", priceRP: "743000"),
    BundlesPrice(priceVP: "4950", priceRP: "447000",),
    BundlesPrice(priceVP: "6800", priceRP: "596000"),
    BundlesPrice(priceVP: "11400", priceRP: "892000"),
    BundlesPrice(priceVP: "5625", priceRP: "520000"),
    BundlesPrice(priceVP: "6175", priceRP: "551000"),
    BundlesPrice(priceVP: "8650", priceRP: "743000"),
    BundlesPrice(priceVP: "4950", priceRP: "447000",),
    BundlesPrice(priceVP: "6800", priceRP: "596000"),
    BundlesPrice(priceVP: "11400", priceRP: "892000"),
    BundlesPrice(priceVP: "5625", priceRP: "520000"),
    BundlesPrice(priceVP: "6175", priceRP: "551000"),
    BundlesPrice(priceVP: "8650", priceRP: "743000"),
    BundlesPrice(priceVP: "4950", priceRP: "447000",),
    BundlesPrice(priceVP: "6800", priceRP: "596000"),
    BundlesPrice(priceVP: "11400", priceRP: "892000"),
    BundlesPrice(priceVP: "5625", priceRP: "520000"),
    BundlesPrice(priceVP: "6175", priceRP: "551000"),
    BundlesPrice(priceVP: "8650", priceRP: "743000"),
    BundlesPrice(priceVP: "4950", priceRP: "447000",),
    BundlesPrice(priceVP: "6800", priceRP: "596000"),
    BundlesPrice(priceVP: "11400", priceRP: "892000"),
    BundlesPrice(priceVP: "5625", priceRP: "520000"),
    BundlesPrice(priceVP: "6175", priceRP: "551000"),
    BundlesPrice(priceVP: "8650", priceRP: "743000"),
    BundlesPrice(priceVP: "4950", priceRP: "447000",),
    BundlesPrice(priceVP: "6800", priceRP: "596000"),
    BundlesPrice(priceVP: "11400", priceRP: "892000"),
    BundlesPrice(priceVP: "5625", priceRP: "520000"),
    BundlesPrice(priceVP: "6175", priceRP: "551000"),
    BundlesPrice(priceVP: "8650", priceRP: "743000"),
    BundlesPrice(priceVP: "4950", priceRP: "447000",),
    BundlesPrice(priceVP: "6800", priceRP: "596000"),
    BundlesPrice(priceVP: "11400", priceRP: "892000"),
    BundlesPrice(priceVP: "5625", priceRP: "520000"),
    BundlesPrice(priceVP: "6175", priceRP: "551000"),
    BundlesPrice(priceVP: "8650", priceRP: "743000"),
    BundlesPrice(priceVP: "4950", priceRP: "447000",),
    BundlesPrice(priceVP: "6800", priceRP: "596000"),
    BundlesPrice(priceVP: "11400", priceRP: "892000"),
    BundlesPrice(priceVP: "5625", priceRP: "520000"),
    BundlesPrice(priceVP: "6175", priceRP: "551000"),
    BundlesPrice(priceVP: "8650", priceRP: "743000"),
    BundlesPrice(priceVP: "4950", priceRP: "447000",),
    BundlesPrice(priceVP: "6800", priceRP: "596000"),
    BundlesPrice(priceVP: "11400", priceRP: "892000"),
    BundlesPrice(priceVP: "5625", priceRP: "520000"),
  ];
}