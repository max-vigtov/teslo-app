
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

    } on DioException catch (e) {

      if (e.response?.statusCode == 401){ 
        throw CustomError(e.response?.data['message'] ?? 'Credenciales incorrectas');
      }

      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Revisar conexión a internet');
      }

      throw CustomError('Something wrong happend');

    } catch(e){
      throw CustomError('Something wrong happend');
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