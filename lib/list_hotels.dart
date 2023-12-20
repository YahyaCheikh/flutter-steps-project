import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListHotels extends StatefulWidget {
  const ListHotels({super.key});

  @override
  State<ListHotels> createState() => _ListHotelsState();
}

class _ListHotelsState extends State<ListHotels> {
  bool isLodingHotels = false;
  void setIsLoadingHotels(bool newValue) {
    setState(() {
      isLodingHotels = newValue;
    });
  }

  List<Hotel> hotels = [];

  Future<void> getHotelsFromFirebase() async {
    setIsLoadingHotels(true);
    hotels = [];
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
      print("------------------------------------------------------");
      print(hotels);
      print("------------------------------------------------------");
      setIsLoadingHotels(false);
    } catch (error) {
      print('Error fetching hotels: $error');
      setIsLoadingHotels(false);
    }
  }

  @override
  void initState() {
    getHotelsFromFirebase();
    super.initState();
  }

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

// --------------------------------- New -------------------------------
          body: isLodingHotels
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: hotels
                      .map(
                        (hotel) => HotelCard(
                          hotel: hotel,
                        ),
                      )
                      .toList()),

// --------------------------------- New -------------------------------
        ),
      ),
    );
  }
}

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

class Hotel {
  final String hotelName;
  final double hotelRating;
  final String imageUrl;

  Hotel(
      {required this.hotelName,
      required this.hotelRating,
      required this.imageUrl});
}

List<Hotel> hotels = [
  Hotel(
      hotelName: "Hotel name 1",
      hotelRating: 2.5,
      imageUrl: 'assetes/images/image_hotel_1.jpg'),
  Hotel(
      hotelName: "Hotel name 2",
      hotelRating: 3.8,
      imageUrl: 'assetes/images/image_hotel_2.jpg'),
  Hotel(
      hotelName: "Hotel name 3",
      hotelRating: 4,
      imageUrl: 'assetes/images/image_hotel_3.jpg'),
];
