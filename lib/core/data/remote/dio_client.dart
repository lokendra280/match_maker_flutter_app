// import 'package:dio/dio.dart';


// class DioClient{
//   final Dio _dio = Dio(

//   );
//   final _baseUrl = 'https://636b3cc9ad62451f9fac38af.mockapi.io';

//   Future<PopularPlaceModel?> getPost({required String id}) async {
//     PopularPlaceModel? popular;
//     try{
//       Response postData = await _dio.get(_baseUrl + '/api/landing_page/popular/travel/$id');
//       print('User info: ${postData.data}');
//       print(postData.data.runtimeType);

//       print(postData.data["image"]);


//       PopularPlaceModel popular = PopularPlaceModel.fromJson(postData.data);
//     } on DioError catch (e) {
//       if(e.response != null){
//         print('Dio error!');
//         print('STATUS: ${e.response?.statusCode}');
//         print('DATA: ${e.response?.data}');
//         print('HEADERS: ${e.response?.headers}');
//       } else {
//         print('Error sending request');
//         print(e.message);
//        }
//       }
//     return popular;
//     }



//   }
