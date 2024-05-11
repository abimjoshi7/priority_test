import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:your_project/product.dart'; // Import your Product class

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to convert Firestore document to Product object
  Product _productFromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return Product(
      id: data['id'] ?? 0,
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      description: data['description'] ?? '',
      price: (data['price'] ?? 0.0).toDouble(),
      size: (data['size'] ?? []).cast<int>(),
      brandType: data['brandType'] ?? 0,
      brandName: data['brandName'],
      genderType: data['genderType'] ?? 0,
      genderName: data['genderName'],
      colors: (data['colors'] ?? []).cast<int>(),
      reviewsCount: data['reviewsCount'] ?? 0,
      avgRating: (data['avgRating'] ?? 0.0).toDouble(),
    );
  }

  // Method to convert Product object to Map
  Map<String, dynamic> _productToMap(Product product) {
    return {
      'id': product.id,
      'name': product.name,
      'image': product.image,
      'description': product.description,
      'price': product.price,
      'size': product.size,
      'brandType': product.brandType,
      'brandName': product.brandName,
      'genderType': product.genderType,
      'genderName': product.genderName,
      'colors': product.colors,
      'reviewsCount': product.reviewsCount,
      'avgRating': product.avgRating,
    };
  }

  // Method to retrieve a document from Firestore and map it to Product
  Future<Product?> getProduct(String collection, String documentId) async {
    try {
      DocumentSnapshot documentSnapshot = await _firestore.collection(collection).doc(documentId).get();
      return _productFromSnapshot(documentSnapshot);
    } catch (e) {
      print("Error getting product: $e");
      return null;
    }
  }

  // Method to retrieve all documents from a collection in Firestore and map them to Product
  Future<List<Product>> getProducts(String collection) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection(collection).get();
      return querySnapshot.docs.map((doc) => _productFromSnapshot(doc)).toList();
    } catch (e) {
      print("Error getting products: $e");
      return [];
    }
  }

  // Method to add a product document to Firestore
  Future<void> addProduct(String collection, Product product) async {
    try {
      await _firestore.collection(collection).add(_productToMap(product));
    } catch (e) {
      print("Error adding product: $e");
    }
  }

  // Method to update a product document in Firestore
  Future<void> updateProduct(String collection, String documentId, Product product) async {
    try {
      await _firestore.collection(collection).doc(documentId).update(_productToMap(product));
    } catch (e) {
      print("Error updating product: $e");
    }
  }

  // Method to delete a product document from Firestore
  Future<void> deleteProduct(String collection, String documentId) async {
    try {
      await _firestore.collection(collection).doc(documentId).delete();
    } catch (e) {
      print("Error deleting product: $e");
    }
  }
}
