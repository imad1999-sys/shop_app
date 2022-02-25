import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/modules/home_module/screen/home_screen.dart';
import 'package:shop_app/modules/login_module/logic/login_cubit.dart';
import 'package:shop_app/modules/signup_module/components/signup_title.dart';
import 'package:shop_app/modules/signup_module/logic/signup_cubit.dart';
import 'package:shop_app/modules/signup_module/logic/signup_states.dart';
import 'package:shop_app/shared/shared_prefrences/cache_helper.dart';
import 'package:shop_app/shared/widgets/default_button.dart';
import 'package:shop_app/shared/widgets/default_text_field.dart';
import 'package:shop_app/shared/widgets/toast.dart';

class SignupModule extends StatelessWidget {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupCubit>(
      create: (BuildContext context) => SignupCubit(),
      child: BlocConsumer<SignupCubit, SignupStates>(
        listener: (context, state) {
          if (state is SignupSuccessState) {
            if (state.signupModel.status) {
              CacheHelper.putData(
                      key: "token", value: state.signupModel.data.token)
                  .then(
                (value) => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                    (Route<dynamic> route) => false),
              );
            } else {
              showToast(
                text: state.signupModel.message,
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
                      SignupTitle(),
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
                        height: 10,
                      ),
                      DefaultTextField(
                        controller: nameController,
                        textInputType: TextInputType.text,
                        isPassword: false,
                        onchange: (value) {},
                        onValidate: (value) {
                          if (value!.isEmpty) {
                            return "name can't be empty";
                          }
                        },
                        hint: "Name",
                        prefix: SvgPicture.asset(
                          "assets/icons/password_sign.svg",
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
                        controller: phoneController,
                        textInputType: TextInputType.phone,
                        isPassword: false,
                        onchange: (value) {},
                        onValidate: (value) {
                          if (value!.isEmpty) {
                            return "Phone can't be empty";
                          }
                        },
                        hint: "Phone",
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
                            SignupCubit.get(context).signupUser(
                              email: emailController.text,
                              password: passController.text,
                              name: nameController.text,
                              phone: phoneController.text,
                            );
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
