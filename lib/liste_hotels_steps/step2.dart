//Replace Icon with image

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
            children: [
              ListTile(
                // --------------------------------- New -------------------------------
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage('assetes/images/image_hotel_1.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                ),
                // --------------------------------- New -------------------------------
                title: const Text("Hotel name 1"),
                subtitle: const Text("Hotel rating : 2.5"),
              ),
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage('assetes/images/image_hotel_2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                ),
                title: const Text("Hotel name 2"),
                subtitle: const Text("Hotel rating : 5"),
              ),
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage('assetes/images/image_hotel_3.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                ),
                title: const Text("Hotel name 3"),
                subtitle: const Text("Hotel rating : 3.8"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

