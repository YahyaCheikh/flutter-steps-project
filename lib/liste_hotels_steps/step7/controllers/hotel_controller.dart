import 'package:get/get.dart';
import 'package:smart_formation_projet/liste_hotels_steps/step7/services/hotel_service.dart';

class HotelController extends GetxController{
  final HotelServices _hotelServices = HotelServices();
  var isLodingHotelInformation = false.obs;

  void setIsLoadingHotelInformation(bool newValue){
    isLodingHotelInformation.value = newValue;
  }


  Future makeHotelFavorit(hotelId, bool hotelStatus) async{
    setIsLoadingHotelInformation(true);
    await _hotelServices.toggleFavoriteStatus(hotelId, hotelStatus);
    setIsLoadingHotelInformation(false);
  }
}