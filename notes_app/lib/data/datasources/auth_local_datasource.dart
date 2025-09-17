// import 'dart:convert';

// import 'package:notes_app/data/models/response/auth_response.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AuthLocalDatasource {
//   static const String keyAuthData = 'auth_data';
//   static const String keyAvatarUrl = 'avatar_url';
//   static const String keyAvatarId = 'avatar_id';

//   Future<void> saveAuthData(AuthResponseModel data) async {
//     try {
//       final pref =
//           await SharedPreferences.getInstance(); //buka loker buat nyimpen barang/data user
//       // await pref.setString(
//       //   'auth_data',
//       //   data.toJson(),
//       // ); // nanti dikelompokannya disini dengan key "auth_data"

//       // oldAuth buat ngecek data auth yang lama
//       final oldAuth = pref.getString(keyAuthData);
//       // jika ada data auth yang lama, kita ambil tokennya
//       if (oldAuth != null) {
//         // kalau ada datanya, kita keluarkan dan ubah dari bentuk string JSON ke objek
//         final oldData = AuthResponseModel.fromMap(json.decode(oldAuth));
//         // jika tokenny anull atau kosong kita set tokennya dari data auth yang lama
//         // ini untuk menghindari kehilangan token saat update data user 
//         // login -> dapet token -> token terisi
//         // update avatar -> tidak kirim token baru -> tokennya kosong
//         if (data.token == null || data.token!.isEmpty) {
//           data = AuthResponseModel(user: data.user, token: oldData.token);
//         }
//       }
//       final jsonString = json.encode(data.toMap());
//       await pref.setString(keyAuthData, jsonString); //buat nyimpan data auth

//       if (data.user?.avatar?.imagePath != null) {
//         await pref.setString(keyAvatarUrl, data.user!.avatar!.imagePath!);
//       }
//     } catch (e) {
//       throw Exception('Failed to save auth data : $e');
//     }
//   }

//   Future<void> removeAuthData() async {
//     final pref = await SharedPreferences.getInstance();
//     await pref.remove(keyAuthData);
//     await pref.remove(keyAvatarId);
//     await pref.remove(keyAvatarUrl);
//   }

//   Future<AuthResponseModel> getAuthData() async {
//     final pref = await SharedPreferences.getInstance();
//     final data = pref.getString('auth_data');
//     if (data != null) {
//       return AuthResponseModel.fromJson(data);
//     } else {
//       throw Exception('No auth data found');
//     }
//   }

//   // Buat pengecekan user udah pernah login apa belum
//   Future<bool> isLogin() async {
//     final pref = await SharedPreferences.getInstance();
//     return pref.containsKey('auth_data');
//   }

//   Future<String?> getAvatarUrl() async {
//     final pref = await SharedPreferences.getInstance();
//     return pref.getString(keyAvatarUrl);
//   }
//   Future<void> saveAvatarId(int avatarId) async {
//     final pref = await SharedPreferences.getInstance();
//     await pref.setInt(keyAvatarId, avatarId);
//   }
//   Future<int?> getAvatarId() async {
//     final pref = await SharedPreferences.getInstance();
//     return pref.getInt(keyAvatarId);
//   }
// }
import 'dart:convert';

import 'package:notes_app/data/models/response/auth_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasource {
  static const String keyAuthData = 'auth_data';
  static const String keyAvatarUrl = 'avatar_url';
  static const String keyAvatarId = 'avatar_id';

  Future<void> saveAuthData(AuthResponseModel data) async {
    try {
      final pref = await SharedPreferences.getInstance();
      // ngecek data auth yang lama
      final oldAuth = pref.getString(keyAuthData);
      // jika ada data auth yang lama, kita ambil tokennya
      if (oldAuth != null) {
        // Kalau ada datanya, kita keluarkan dan ubah dari bentuk string JSON ke objek
        final oldData = AuthResponseModel.fromMap(json.decode(oldAuth));
        // jika tokennya null atau kosong, kita set tokennya dari data auth yang lama
        // ini untuk menghindari kehilangan token saat update data user
        // login -> dapet token ->token terisi
        // update avatar -> tidak kirim token baru -> tokennya kosong
        if (data.token == null || data.token!.isEmpty) {
          data = AuthResponseModel(
            user: data.user,
            token: oldData.token,
          );
        }
      }

      final jsonString = json.encode(data.toMap());
      await pref.setString(keyAuthData, jsonString);

      if (data.user?.avatar?.imagePath != null) {
        await pref.setString(keyAvatarUrl, data.user!.avatar!.imagePath!);
      }
    } catch (e) {
      throw Exception('Failed to save auth data: $e');
    }
  }

  Future<void> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(keyAuthData);
    await pref.remove(keyAvatarUrl);
    await pref.remove(keyAvatarId);
  }

  Future<AuthResponseModel> getAuthData() async {
    final pref = await SharedPreferences.getInstance();
    final data = pref.getString('auth_data');
    if (data != null) {
      return AuthResponseModel.fromJson(data);
    } else {
      throw Exception('No auth data found');
    }
  }

  Future<bool> isLogin() async {
    final pref = await SharedPreferences.getInstance();
    return pref.containsKey('auth_data');
  }

  Future<String?> getAvatarUrl() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(keyAvatarUrl);
  }

  Future<void> saveAvatarId(int avatarId) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setInt(keyAvatarId, avatarId);
  }

  Future<int?> getAvatarId() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt(keyAvatarId);
  }
}