import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/modules/home_module/screen/home_screen.dart';
import 'package:shop_app/modules/login_module/components/login_title.dart';
import 'package:shop_app/modules/login_module/logic/login_cubit.dart';
import 'package:shop_app/modules/login_module/logic/login_states.dart';
import 'package:shop_app/modules/shop_module/views/shop_view.dart';
import 'package:shop_app/shared/shared_prefrences/cache_helper.dart';
import 'package:shop_app/shared/widgets/default_button.dart';
import 'package:shop_app/shared/widgets/default_text_field.dart';
import 'package:shop_app/shared/widgets/toast.dart';

class LoginModule extends StatelessWidget {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.userModel.status) {
              CacheHelper.putData(
                      key: "token", value: state.userModel.data!.token)
                  .then(
                (value) => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => ShopView()),
                    (Route<dynamic> route) => false),
              );
            } else {
              showToast(
                text: state.userModel.message,
                toastCases: ToastCases.ERROR,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoginTitle(),
                      SizedBox(
                        height: 20,
                      ),
                      DefaultTextField(
                        controller: emailController,
                        textInputType: TextInputType.emailAddress,
                        isPassword: false,
                        onchange: (value) {},
                        onValidate: (value) {
                          if (value!.isEmpty) {
                            return "Email can't be empty";
                          }
                        },
                        hint: "Email",
                        prefix: SvgPicture.asset(
                          "assets/icons/email_sign.svg",
                          width: 16,
                          height: 16,
                          fit: BoxFit.scaleDown,
                        ),
                        suffix: SizedBox.shrink(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DefaultTextField(
                        controller: passController,
                        textInputType: TextInputType.visiblePassword,
                        isPassword: true,
                        onchange: (value) {},
                        onValidate: (value) {
                          if (value!.isEmpty) {
                            return "Password can't be empty";
                          }
                        },
                        hint: "Password",
                        prefix: SvgPicture.asset(
                          "assets/icons/password_sign.svg",
                          width: 16,
                          height: 16,
                          fit: BoxFit.scaleDown,
                        ),
                        suffix: SizedBox.shrink(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DefaultButton(
                        btnWidth: MediaQuery.of(context).size.width * 0.4,
                        btnColor: Colors.blue,
                        btnText: "Login",
                        function: () {
                          if (formKey.currentState!.validate()) {
                            LoginCubit.get(context).loginUser(
                                email: emailController.text,
                                password: passController.text);
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Do you not have an account???"),
                          InkWell(
                            onTap: () {},
                            child: Text("Sign up now"),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
