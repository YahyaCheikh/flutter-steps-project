import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/list_hotel_controller.dart';
import '../widgets/hotel_card.dart';

class ListHotels extends StatelessWidget {
  ListHotels({super.key});
  final ListHotelHotelController _listHotelController = ListHotelHotelController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: const Text(
                'Home',
                style: TextStyle(
                  color: Color(0xFFFE4C66),
                  fontSize: 22,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: -0.30,
                ),
              ),
              centerTitle: true,
            ),
            body: Obx(
              () => _listHotelController.isLoadingHotels.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 5.0, right: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Hôtels populaires',
                                  style: TextStyle(
                                    color: Color(0xFF121212),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                    letterSpacing: 0.10,
                                  ),
                                ),
                                Text(
                                  'Voir plus',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xFFE29446),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: 0.06,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Expanded(
                            child: GridView(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 30,
                                        mainAxisSpacing: 28,
                                        childAspectRatio: 0.9),
                                children: _listHotelController.hotels
                                    .map(
                                      (hotel) => HotelCard(
                                        hotel: hotel,
                                      ),
                                    )
                                    .toList()),
                          ),
                        ],
                      ),
                    ),
            )),
      ),
    );
  }
}
