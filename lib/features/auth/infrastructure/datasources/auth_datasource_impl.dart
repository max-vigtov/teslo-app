
import 'package:dio/dio.dart';
import 'package:teslo_shop/config/constants/enviroment.dart';
import 'package:teslo_shop/features/auth/domain/datasources/auth_datasource.dart';
import 'package:teslo_shop/features/auth/domain/entities/user.dart';
import 'package:teslo_shop/features/auth/infrastructure/infrastructure.dart';

class AuthDataSourceImpl extends AuthDataSource {

  final dio = Dio(
    BaseOptions(
      baseUrl: Enviroment.apiUrl
    )
  );
  
  @override
  Future<User> login(String email, String password) async{
    try {
      final response = await dio.post('/auth/login',
        data: {
          "email": email,
          "password": password
    });
    final user = UserMapper.userToJsonToEntity(response.data);
    return user;
    } catch (e) {
      throw WrongCredentials();
    }
  }  
  
  @override
  Future<User> checkAuthStatus(String token) {
    throw UnimplementedError();
  }

  @override
  Future<User> register(String email, String password, String fullName) {
    throw UnimplementedError();
  }
  
}