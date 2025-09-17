import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:notes_app/data/datasources/auth_local_datasource.dart';
import 'package:notes_app/data/datasources/variable.dart';
import 'package:notes_app/data/models/request/notes_request.dart';
import 'package:notes_app/data/models/response/notes_response.dart';

class NotesRemoteDatasource {
  Future<Either<String, NotesResponseModel>> getNotes() async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();

      final response = await http.get(
        Uri.parse('${Variable.baseUrl}/api/api-notes'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${authData.token}',
        },
      );

      if (response.statusCode == 200) {
        return Right(NotesResponseModel.fromJson(response.body));
      } else {
        return Left('Gagal mendapatkan data notes: ${response.body}');
      }
    } catch (e) {
      return Left('Gagal mendapatkan data notes: $e');
    }
  }

  // Add Notes
  Future<Either<String, NotesResponseModel>> createNotes(
    NotesRequestModel request,
  ) async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();

      final response = await http.post(
        Uri.parse('${Variable.baseUrl}/api/api-notes'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${authData.token}',
        },
        body: request.toJson(),
      );

      if (response.statusCode == 200) {
        return Right(NotesResponseModel.fromJson(response.body));
      } else {
        return Left('Gagal menambahkan notes: ${response.body}');
      }
    } catch (e) {
      return Left('Gagal menambahkan notes: $e');
    }
  }

  // Update Notes
  Future<Either<String, NotesResponseModel>> updateNotes(
    int id,
    NotesRequestModel request,
  ) async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();

      final response = await http.patch(
        Uri.parse('${Variable.baseUrl}/api/api-notes/$id'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${authData.token}',
        },
        body: request.toJson(),
      );

      if (response.statusCode == 200) {
        return Right(NotesResponseModel.fromJson(response.body));
      } else {
        return Left('Gagal memperbarui notes: ${response.body}');
      }
    } catch (e) {
      return Left('Gagal memperbarui notes: $e');
    }
  }

  // Delete Notes
  Future<Either<String, String>> deleteNotes(int id) async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();

      final response = await http.delete(
        Uri.parse('${Variable.baseUrl}/api/api-notes/$id'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${authData.token}',
        },
      );

      if (response.statusCode == 200) {
        return Right('Berhasil menghapus notes');
      } else {
        return Left('Gagal menghapus notes: ${response.body}');
      }
    } catch (e) {
      return Left('Gagal menghapus notes: $e');
    }
  }
}
