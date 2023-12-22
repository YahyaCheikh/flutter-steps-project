import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/hotel_controller.dart';
import '../models/hotel.dart';

class HotelCard extends StatelessWidget {
  HotelCard({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;
  final HotelController _hotelController = HotelController();

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: ShapeDecoration(
          color: Colors.grey[50],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadows: const [
            BoxShadow(
              color: Color(0x19202020),
              blurRadius: 50,
              offset: Offset(0, 4),
              spreadRadius: -5,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(hotel.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  // padding: const EdgeInsets.all(8),
                  width: 26.47,
                  height: 23.70,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(.7),
                    shape: const OvalBorder(),
                  ),
                  child: GestureDetector(
                    onTap: () async {
                     await  _hotelController.makeHotelFavorit(hotel.hotelId, hotel.isFavorit);
                     hotel.toggleIsFavorite();
                    },
                    child: Obx(
                        () => _hotelController.isLodingHotelInformation.value
                            ? Center(
                                child: CircularProgressIndicator(
                                    color: Colors.green[300]),
                              )
                            : Icon(
                                hotel.isFavorit
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 16,
                                color: Colors.grey[700],
                              )),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${hotel.hotelRating}",
              style: const TextStyle(
                color: Color(0xFFAAAAAA),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 0.06,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              hotel.hotelName,
              style: const TextStyle(
                color: Color(0xFF121212),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
                letterSpacing: 0.07,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
