import 'package:equatable/equatable.dart';

class Product extends Equatable {
 final String? id;
  final String? name;
  final String? category;
 final String? brand;
 final String? model;
 final double price;
 final String? color;
 final String? weight;
 final String? image;
 final  bool isFavourite;

 const Product({this.id,
    this.name,
    this.category,
    this.brand,
    this.model,
    this.price=0.0,
    this.color,
    this.weight,
    this.image,
    this.isFavourite = false});

  factory Product.fromJson(Map<String, dynamic> data) {
    return Product(
        id: data['id'],
        name: data['name'],
        category: data['category'],
        brand: data['brand'],
        model: data['model'],
        price: data['price']??0.0,
        color: data['color'],
        weight: data['weight'],
        image: data['image']);
  }

  Product copyWith({
    String? id,
    String? name,
    String? category,
    String? brand,
    String? model,
    double? price,
    String? color,
    String? weight,
    String? image,
    bool isFavourite=false,
  }) {
    return Product(
      id: this.id,
      name: this.name,
      category: this.category,
      brand: this.brand,
      model: this.model,
      price: this.price,
      color: this.color,
      weight: this.weight,
      image: this.image,
      isFavourite: this.isFavourite
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [
        id,
        name,
        category,
        brand,
        model,
        price,
        color,
        weight,
        image,
        isFavourite
      ];
}
