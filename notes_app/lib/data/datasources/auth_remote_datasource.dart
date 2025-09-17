import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:notes_app/data/datasources/auth_local_datasource.dart';
import 'package:notes_app/data/datasources/variable.dart';
import 'package:notes_app/data/models/request/login_request.dart';
import 'package:notes_app/data/models/request/register_request.dart';
import 'package:notes_app/data/models/response/auth_response.dart';
import 'package:notes_app/data/models/response/avatar_response_model.dart';

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
    // disini yang L itu buat yang salah, yang R itu bakal bawa data dari auth respon
    LoginRequestModel data,
  ) async {
    final response = await http.post(
      Uri.parse('${Variable.baseUrl}/api/login'),
      // terus kita butuh header
      headers: <String, String>{
        'Accept': 'application/json; charset = UTF-8',
        // charset itu gunanya biar inputan nya kayak teks semua jadi dia ga bakal masukin emoji dan karakter
        'Content-type': 'application/json',
      },
      // terus tambahin body
      body: data.toJson(),
      // ini data nya itu ditambahin di parameter
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
      // kalau berhasil dia mengembalikan response dari model nya
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, AuthResponseModel>> register(
    RegisterRequestModel data,
  ) async {
    print('Register data: $data.toJson()');
    try {
      final response = await http.post(
        Uri.parse('${Variable.baseUrl}/api/register'),
        // butuh header
        headers: <String, String>{
          'Accept': 'application/json; charset= UTF-8',
          'Content-type': 'application/json',
        },
        body: data.toJson(),
      );

      print('Register response: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(AuthResponseModel.fromJson(response.body));
      } else {
        return Left(response.body);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  // kalau yang logout left sama right nya itu sama sama string karena cuman ngehapus dan ngasi string kalau berhasil dan ga bawa data
  Future<Either<String, String>> logout() async {
    // buat nyimpen data user yang login
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(
      Uri.parse('${Variable.baseUrl}/api/logout'),
      headers: <String, String>{
        'Accept': 'application/json; charset= UTF-8',
        'Content-type': 'application/json',
        // karena logout itu bawa token dari yang login makannya di header nya di tambahin bearer token
        'Authorization': 'Bearer ${authData.token}',
        // token nya masi merah karena kita harus taro dulu dan buat dulu auth local datasource nya
      },
    );
    if (response.statusCode == 200) {
      return Right('Logout Berhasil');
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, List<Avatar>>> getAvatars() async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();
      final currentToken = authData.token;

      final response = await http.get(
        Uri.parse('${Variable.baseUrl}/api/avatars'),
        headers: {
          'Accept': 'application/json; charset=UTF-8',
          'Content-type': 'application/json',
          'Authorization': 'Bearer $currentToken',
        }
      );

      if(response.statusCode == 200) {
        // Mengubah dari json string ke Map atau List
        final data = json.decode(response.body);
        // mengubah Map atau list ke AvatarResponseModel atau mengubah Map<String, dynamic> ke List<Avatar>
        // atau ke objek model dart ( AvatarResponseModel )
        final avatarResponse = AvatarResponseModel.fromMap(data);
        return Right(avatarResponse.data ?? []);
      } else {
        return Left(response.body);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, AuthResponseModel>> updateAvatar(int avatarId) async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();
      final currentToken = authData.token;

      if (currentToken == null || currentToken.isEmpty) {
        return const Left('Tidak ada token yang ditemukan');
      }

      final response = await http.post(
        Uri.parse('${Variable.baseUrl}/api/update-avatar'),
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
          'Content-type': 'application/json',
          'Authorization': 'Bearer $currentToken',
        },

        body: json.encode({'avatar_id' : avatarId}),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        // buat nyimpan token lama setelah update avatar
        responseData['token'] = currentToken;

        final authResponse = AuthResponseModel.fromMap(responseData);
        return Right(authResponse);
      } else {
        return Left('Gagal memperbarui avatar: ${response.body}');
      }
    } catch (e) {
      return Left('Terjadi kesalahan: ${e.toString()}');
    }
  }
}