import 'package:get/get.dart';

import '../models/hotel.dart';
import '../services/hotel_service.dart';

class ListHotelHotelController extends GetxController {
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

  ListHotelHotelController(){
    getHotels();
  }
}
