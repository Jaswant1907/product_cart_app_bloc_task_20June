class ProductModel {
  List<Product>? products;
  int? total;
  int? skip;
  int? limit;

  ProductModel({this.products, this.total, this.skip, this.limit});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = List<Product>.from(
        json['products'].map((v) => Product.fromJson(v)),
      );
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products?.map((v) => v.toJson()).toList(),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }
}

class Product {



  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Review>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;

  Product({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    price = (json['price'] as num?)?.toDouble();
    discountPercentage = (json['discountPercentage'] as num?)?.toDouble();
    rating = (json['rating'] as num?)?.toDouble();
    stock = json['stock'];
    tags = json['tags'] != null ? List<String>.from(json['tags']) : null;
    brand = json['brand'];
    sku = json['sku'];
    weight = json['weight'];
    dimensions = json['dimensions'] != null ? Dimensions.fromJson(json['dimensions']) : null;
    warrantyInformation = json['warrantyInformation'];
    shippingInformation = json['shippingInformation'];
    availabilityStatus = json['availabilityStatus'];
    reviews = json['reviews'] != null
        ? List<Review>.from(json['reviews'].map((v) => Review.fromJson(v)))
        : null;
    returnPolicy = json['returnPolicy'];
    minimumOrderQuantity = json['minimumOrderQuantity'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    images = json['images'] != null ? List<String>.from(json['images']) : null;
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'tags': tags,
      'brand': brand,
      'sku': sku,
      'weight': weight,
      'dimensions': dimensions?.toJson(),
      'warrantyInformation': warrantyInformation,
      'shippingInformation': shippingInformation,
      'availabilityStatus': availabilityStatus,
      'reviews': reviews?.map((v) => v.toJson()).toList(),
      'returnPolicy': returnPolicy,
      'minimumOrderQuantity': minimumOrderQuantity,
      'meta': meta?.toJson(),
      'images': images,
      'thumbnail': thumbnail,
    };
  }

}

class Dimensions {
  double? width;
  double? height;
  double? depth;

  Dimensions({this.width, this.height, this.depth});

  Dimensions.fromJson(Map<String, dynamic> json) {
    width = (json['width'] as num?)?.toDouble();
    height = (json['height'] as num?)?.toDouble();
    depth = (json['depth'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() => {
    'width': width,
    'height': height,
    'depth': depth,
  };
}

class Review {
  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  Review({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  Review.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    comment = json['comment'];
    date = json['date'];
    reviewerName = json['reviewerName'];
    reviewerEmail = json['reviewerEmail'];
  }

  Map<String, dynamic> toJson() => {
    'rating': rating,
    'comment': comment,
    'date': date,
    'reviewerName': reviewerName,
    'reviewerEmail': reviewerEmail,
  };
}

class Meta {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  Meta.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    barcode = json['barcode'];
    qrCode = json['qrCode'];
  }

  Map<String, dynamic> toJson() => {
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'barcode': barcode,
    'qrCode': qrCode,
  };
}
