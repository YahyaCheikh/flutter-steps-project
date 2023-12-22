import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Screen
class ListHotels extends StatelessWidget {
  ListHotels({super.key});
  final HotelController _hotelController = HotelController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: const Text("Liste des hoteles"),
              centerTitle: true,
            ),
            body: Obx(
              () => _hotelController.isLoadingHotels.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView(
                      children: _hotelController.hotels
                          .map(
                            (hotel) => HotelCard(
                              hotel: hotel,
                            ),
                          )
                          .toList()),
            )),
      ),
    );
  }
}

// Service
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
          hotelName: data['hotelName'] ?? '',
          hotelRating: (data['hotelRating'] ?? 0.0).toDouble(),
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
}

//Controller
class HotelController extends GetxController {
  final HotelServices _hotelServices = HotelServices();
  var isLoadingHotels = false.obs;
  List<Hotel> hotels = [];

  

  void setIsLoadingHotels(bool newValue) {
    isLoadingHotels.value = newValue;
  }

  Future<void> getHotels() async {
    setIsLoadingHotels(true);
    hotels = await _hotelServices.getHotelsFromFirebase();
    setIsLoadingHotels(false);
  }

  HotelController(){
    getHotels();
  }
}

// Widget
class HotelCard extends StatelessWidget {
  const HotelCard({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            //New
            image: NetworkImage(hotel.imageUrl),
            //New
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      ),
      title: Text(hotel.hotelName),
      subtitle: Text("Hotel rating : ${hotel.hotelRating}"),
    );
  }
}

// Model
class Hotel {
  final String hotelName;
  final double hotelRating;
  final String imageUrl;

  Hotel(
      {required this.hotelName,
      required this.hotelRating,
      required this.imageUrl});
}
