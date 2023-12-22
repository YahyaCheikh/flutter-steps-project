import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/hotel.dart';

class HotelServices {
  Future<List<Hotel>> getHotelsFromFirebase() async {
    List<Hotel> hotels = [];
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('hotels').get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot
          in querySnapshot.docs) {
        Map<String, dynamic> data = documentSnapshot.data();

        // Convert document data to Hotel object
        Hotel hotel = Hotel(
          hotelId: data['hotelId'],
          hotelName: data['hotelName'] ?? '',
          hotelRating: (data['hotelRating'] ?? 0.0).toDouble(),
          isFavorit: data['isFavorit'] ?? '',
          imageUrl: data['imageUrl'] ?? '',
        );

        // Add the Hotel object to the list
        hotels.add(hotel);
      }
      return hotels;
    } catch (error) {
      print('Error fetching hotels: $error');
      return [];
    }
  }

  Future<void> toggleFavoriteStatus(
      String hotelId, bool currentFavoriteStatus) async {
    try {
      DocumentReference hotelRef =
          FirebaseFirestore.instance.collection('hotels').doc(hotelId);

      bool newFavoriteStatus = !currentFavoriteStatus;

      await hotelRef.update({'isFavorit': newFavoriteStatus});
    } catch (error) {
      print('Error toggling favorite status: $error');
    }
  }
}
