enum ShoesBrands {
  Adidas,
  Jordan,
  Nike,
  Reebok,
  Vans,
}

// @freezed
// class Product with _$Product {
//   const factory Product({
//     required int id,
//     required String name,
//     required String image,
//     required String description,
//     required double price,
//     required List<int> size,
//     required int brandType,
//     String? brandName,
//     required int genderType,
//     String? genderName,
//     required List<int> colors,
//     @Default(0) int reviewsCount,
//     @Default(0.0) double avgRating,
//   }) = _Product;
// }

// @freezed
// class ShoeColor with _$ShoeColor {
//   const factory ShoeColor({
//     required int id,
//     required String name,
//   }) = _ShoeColor;
// }

// @freezed
// abstract class Product with _$Product {
//   const factory Product({
//     required String id,
//     required String name,
//     required String imageUrl,
//     required double price,
//     required double rating,
//   }) = _Product;
// }

// @freezed
// abstract class Review with _$Review {
//   const factory Review({
//     required String userId,
//     required String productId,
//     required double rating,
//     required String comment,
//   }) = _Review;
// }

// @freezed
// abstract class CartItem with _$CartItem {
//   const factory CartItem({
//     required Product product,
//     required int quantity,
//     required String size,
//     required String color,
//   }) = _CartItem;
// }

// @freezed
// abstract class Order with _$Order {
//   const factory Order({
//     required String id,
//     required DateTime date,
//     required List<OrderItem> items,
//     required double totalPrice,
//     required String shippingAddress,
//     required String paymentMethod,
//   }) = _Order;
// }

// @freezed
// abstract class OrderItem with _$OrderItem {
//   const factory OrderItem({
//     required Product product,
//     required int quantity,
//     required String size,
//     required String color,
//   }) = _OrderItem;
// }
