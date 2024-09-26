class SearchPropertyResponse {
  int? currentPage;
  List<PropertyData>? data;
  int? perPage;
  int? total;

  SearchPropertyResponse(
      {this.currentPage, this.data, this.perPage, this.total});

  SearchPropertyResponse.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <PropertyData>[];
      json['data'].forEach((v) {
        data!.add(PropertyData.fromJson(v)); // Correctly processing each item
      });
    }
    perPage = json['per_page'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['per_page'] = this.perPage;
    data['total'] = this.total;
    return data;
  }
}

class PropertyData {
  int? id;
  String? image;
  int? area;
  int? availability;
  String? priceFrom;
  String? priceTo;
  int? rooms;
  int? masterBedroom;
  int? bathrooms;
  int? bedrooms;
  int? kitchens;
  int? balconies;
  int? parksAndGarden;
  int? schools;
  int? clubhouse;
  int? commercialStrip;
  int? businessHub;
  int? mosque;
  int? sportsClubs;
  int? bicyclesLanes;
  int? medicalCenter;
  int? disabilitySupport;
  int? wifi;
  int? gym;
  int? swimmingPool;
  int? grage;
  int? basketball;
  int? tennis;
  int? laundry;
  int? likey;
  int? likes;
  String? deliveryIn;
  int? featured;
  int? garden;
  int? wellnessFacilities;
  int? transportation;
  int? waterFeatures;
  int? cafes;
  int? restaurant;
  int? cctv;
  int? security;
  int? subId;
  int? categoryId;
  int? userId;
  int? statusId;
  int? views;
  int? compoundId;
  int? modelId;
  int? typeId;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? description;
  String? address;
  Type? type;
  Sub? sub;

  PropertyData(
      {this.id,
      this.image,
      this.area,
      this.availability,
      this.priceFrom,
      this.priceTo,
      this.rooms,
      this.masterBedroom,
      this.bathrooms,
      this.bedrooms,
      this.kitchens,
      this.balconies,
      this.parksAndGarden,
      this.schools,
      this.clubhouse,
      this.commercialStrip,
      this.businessHub,
      this.mosque,
      this.sportsClubs,
      this.bicyclesLanes,
      this.medicalCenter,
      this.disabilitySupport,
      this.wifi,
      this.gym,
      this.swimmingPool,
      this.grage,
      this.basketball,
      this.tennis,
      this.laundry,
      this.likey,
      this.likes,
      this.deliveryIn,
      this.featured,
      this.garden,
      this.wellnessFacilities,
      this.transportation,
      this.waterFeatures,
      this.cafes,
      this.restaurant,
      this.cctv,
      this.security,
      this.subId,
      this.categoryId,
      this.userId,
      this.statusId,
      this.views,
      this.compoundId,
      this.modelId,
      this.typeId,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.description,
      this.address,
      this.type,
      this.sub});

  PropertyData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    area = json['area'];
    availability = json['availability'];
    priceFrom = json['price_from'];
    priceTo = json['price_to'];
    rooms = json['rooms'];
    masterBedroom = json['master_bedroom'];
    bathrooms = json['bathrooms'];
    bedrooms = json['bedrooms'];
    kitchens = json['kitchens'];
    balconies = json['balconies'];
    parksAndGarden = json['parks_and_garden'];
    schools = json['schools'];
    clubhouse = json['clubhouse'];
    commercialStrip = json['commercial_strip'];
    businessHub = json['business_hub'];
    mosque = json['mosque'];
    sportsClubs = json['sports_clubs'];
    bicyclesLanes = json['bicycles_lanes'];
    medicalCenter = json['medical_center'];
    disabilitySupport = json['disability_support'];
    wifi = json['wifi'];
    gym = json['gym'];
    swimmingPool = json['swimming_pool'];
    grage = json['grage'];
    basketball = json['basketball'];
    tennis = json['tennis'];
    laundry = json['laundry'];
    likey = json['likey'];
    likes = json['likes'];
    deliveryIn = json['delivery_in'];
    featured = json['featured'];
    garden = json['garden'];
    wellnessFacilities = json['wellness_facilities'];
    transportation = json['transportation'];
    waterFeatures = json['water_features'];
    cafes = json['cafes'];
    restaurant = json['restaurant'];
    cctv = json['cctv'];
    security = json['security'];
    subId = json['sub_id'];
    categoryId = json['category_id'];
    userId = json['user_id'];
    statusId = json['status_id'];
    views = json['views'];
    compoundId = json['compound_id'];
    modelId = json['model_id'];
    typeId = json['type_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
    sub = json['sub'] != null ? new Sub.fromJson(json['sub']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['area'] = this.area;
    data['availability'] = this.availability;
    data['price_from'] = this.priceFrom;
    data['price_to'] = this.priceTo;
    data['rooms'] = this.rooms;
    data['master_bedroom'] = this.masterBedroom;
    data['bathrooms'] = this.bathrooms;
    data['bedrooms'] = this.bedrooms;
    data['kitchens'] = this.kitchens;
    data['balconies'] = this.balconies;
    data['parks_and_garden'] = this.parksAndGarden;
    data['schools'] = this.schools;
    data['clubhouse'] = this.clubhouse;
    data['commercial_strip'] = this.commercialStrip;
    data['business_hub'] = this.businessHub;
    data['mosque'] = this.mosque;
    data['sports_clubs'] = this.sportsClubs;
    data['bicycles_lanes'] = this.bicyclesLanes;
    data['medical_center'] = this.medicalCenter;
    data['disability_support'] = this.disabilitySupport;
    data['wifi'] = this.wifi;
    data['gym'] = this.gym;
    data['swimming_pool'] = this.swimmingPool;
    data['grage'] = this.grage;
    data['basketball'] = this.basketball;
    data['tennis'] = this.tennis;
    data['laundry'] = this.laundry;
    data['likey'] = this.likey;
    data['likes'] = this.likes;
    data['delivery_in'] = this.deliveryIn;
    data['featured'] = this.featured;
    data['garden'] = this.garden;
    data['wellness_facilities'] = this.wellnessFacilities;
    data['transportation'] = this.transportation;
    data['water_features'] = this.waterFeatures;
    data['cafes'] = this.cafes;
    data['restaurant'] = this.restaurant;
    data['cctv'] = this.cctv;
    data['security'] = this.security;
    data['sub_id'] = this.subId;
    data['category_id'] = this.categoryId;
    data['user_id'] = this.userId;
    data['status_id'] = this.statusId;
    data['views'] = this.views;
    data['compound_id'] = this.compoundId;
    data['model_id'] = this.modelId;
    data['type_id'] = this.typeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['description'] = this.description;
    data['address'] = this.address;
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    if (this.sub != null) {
      data['sub'] = this.sub!.toJson();
    }
    return data;
  }
}

class Type {
  int? id;
  String? name;

  Type({this.id, this.name});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Sub {
  int? id;
  String? image;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  String? name;

  Sub(
      {this.id,
      this.image,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.name});

  Sub.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    return data;
  }
}
