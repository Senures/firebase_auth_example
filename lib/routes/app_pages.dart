import 'package:firebase_example/modules/auth/login/login_bindings.dart';
import 'package:firebase_example/modules/auth/login/login_view.dart';
import 'package:firebase_example/modules/auth/register/register_bindings.dart';
import 'package:firebase_example/modules/auth/register/register_view.dart';
import 'package:firebase_example/modules/create_blog/create_blog.dart';
import 'package:firebase_example/modules/create_blog/create_blog_bindings.dart';
import 'package:firebase_example/modules/home/home_bindings.dart';
import 'package:firebase_example/modules/home/home_view.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;
  static final routes = [
    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginView(),
        binding: LoginBinding()),
    GetPage(
        name: Routes.REGISTER,
        page: () => const RegisterView(),
        binding: RegisterBinding()),
    GetPage(
        name: Routes.HOME,
        page: () => const HomeView(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.ADDBLOG,
        page: () => const CreateBlogView(),
        binding: CreateBlogBinding())
  ];
}
