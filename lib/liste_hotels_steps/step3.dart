// Créez des modèles d'hôtels et dressez une liste d'hôtels à insérer dans l'écran.

import 'package:flutter/material.dart';

class ListHotels extends StatelessWidget {
  const ListHotels({super.key});

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
          body: ListView(
            children: hotels.map((hotel) => ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image:  DecorationImage(
                      image: AssetImage(hotel.imageUrel),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                ),
                title:  Text(hotel.hotelName),
                subtitle:  Text("Hotel rating : ${hotel.hotelName}"),
              ),).toList()
          ),
        ),
      ),
    );
  }
}


// --------------------------------- New -------------------------------
class Hotel {
  final String hotelName;
  final double rating;
  final String imageUrel;

  Hotel(
      {required this.hotelName, required this.rating, required this.imageUrel});
}

List<Hotel> hotels = [
  Hotel(hotelName: "Hotel name 1", rating: 2.5, imageUrel: 'assetes/images/image_hotel_1.jpg'),
  Hotel(hotelName: "Hotel name 2", rating: 3.8, imageUrel: 'assetes/images/image_hotel_2.jpg'),
  Hotel(hotelName: "Hotel name 3", rating: 4, imageUrel: 'assetes/images/image_hotel_3.jpg'),
];

// --------------------------------- New -------------------------------