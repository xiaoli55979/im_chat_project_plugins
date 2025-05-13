import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../l10n/SlocalAuth.dart';
import '../../routes/app_routes_auth.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<LoginController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: MyAppBar(
          title: Text(
            "登录",
            style: TextStyle(
              fontSize: FontUtils.navFont,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // controller.seartCheckLine();
                print("跳转至帮助与设置");
              },
              child: Text(
                SlocalAuth.getLocalizaContent(SlocalAuth.of(context).help_and_set),
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: FontUtils.desFontSize,
                  textBaseline: TextBaseline.ideographic, // 设置基线对齐方式为 alphabetic
                ),
              ),
            ),
          ],
        ),
        body: GetBuilder<LoginController>(builder: (controller) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SafeArea(
              top: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.rl,
                      horizontal: 20.rl,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            // GetBuilder<LoginController>(
                            //   builder: (controller) {
                            //     return ToggleButtons(
                            //       isSelected: controller.selectList,
                            //       color: theme.primaryColor,
                            //       selectedColor: Colors.white,
                            //       selectedBorderColor: theme.primaryColor,
                            //       borderColor: theme.primaryColor,
                            //       fillColor: theme.primaryColor,
                            //       borderRadius: MyStyles.getBorderRadius,
                            //       constraints: BoxConstraints(
                            //         minHeight: 25.0.bt,
                            //         minWidth: 100.0,
                            //       ).hw,
                            //       onPressed: controller.onSwitch,
                            //       children: [
                            //         Row(
                            //           children: [
                            //             Icon(
                            //               CupertinoIcons.lock,
                            //               size: FontUtils.contentFontSize,
                            //             ),
                            //             Text(
                            //               SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_login_with_password),
                            //               style: TextStyle(
                            //                 fontSize: FontUtils.contentFontSize,
                            //               ),
                            //             )
                            //           ],
                            //         ),
                            //         Row(
                            //           children: [
                            //             Icon(
                            //               CupertinoIcons.device_phone_portrait,
                            //               size: FontUtils.contentFontSize,
                            //             ),
                            //             Text(
                            //               SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_login_with_phone),
                            //               style: TextStyle(
                            //                 fontSize: FontUtils.contentFontSize,
                            //               ),
                            //             ),
                            //           ],
                            //         )
                            //       ],
                            //     );
                            //   },
                            // ),
                            20.verticalSpace,
                            FormBuilder(
                              key: controller.formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // GetBuilder<LoginController>(builder: (controller) {
                                  //   return controller.selectedIndex == 0 ? _buildLoginByPassword(context) : _buildLoginByPhone(context);
                                  // }),
                                  _buildLoginByPhone(context),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.end,
                                  //   children: <Widget>[
                                  //     TextButton(
                                  //         onPressed: () {
                                  //           // Get.toNamed(Routes.forgetPassword);
                                  //         },
                                  //         child: Text(
                                  //           SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_forget_password),
                                  //           style: TextStyle(
                                  //             fontSize: FontUtils.contentFontSize,
                                  //           ),
                                  //         )),
                                  //   ],
                                  // ),
                                  40.verticalSpace,
                                  MainButton(
                                    onPressed: controller.onLogin,
                                    text: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_login),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Get.toNamed(AppRoutesAuth.register);
                                          },
                                          child: Text(
                                            SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_regist_now),
                                            style: TextStyle(
                                              fontSize: FontUtils.contentFontSize,
                                            ),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton.icon(
                        onPressed: () {
                          // Get.toNamed(LinkUtils.getServiceUrl());
                        },
                        icon: const Icon(Icons.support_agent),
                        label: Text(
                          SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_connect_server),
                          style: TextStyle(
                            fontSize: FontUtils.contentFontSize,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black.withOpacity(0.8),
                          backgroundColor: Colors.white.withOpacity(0),
                        ),
                      ),
                      GetBuilder<LoginController>(
                        builder: (controller) {
                          return Text(
                            controller.version,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: FontUtils.contentFontSize,
                            ),
                          );
                        },
                      ),
                      30.verticalSpace,
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      );
    });
  }

  /// 用户名
  Widget _buildLoginByPassword(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_username),
          style: TextStyle(
            fontSize: FontUtils.contentFontSize,
          ),
        ),
        GetBuilder<LoginController>(builder: (controller) {
          return FormBuilderTextField(
            name: 'username',
            // autofocus: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_username_hint),
              errorStyle: TextStyle(
                fontSize: FontUtils.contentFontSize,
              ),
              hintStyle: TextStyle(
                fontSize: FontUtils.contentFontSize,
                // 其他样式属性可以根据需要进行设置
              ),
            ),
            style: TextStyle(
              fontSize: FontUtils.contentFontSize,
              // 其他样式属性可以根据需要进行设置，例如颜色、粗细等
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_username_hint)),
              FormBuilderValidators.minLength(6, errorText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_username_not_length)),
            ]),
          );
        }),
        15.verticalSpace,
        Text(
          SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_passworld),
          style: TextStyle(
            fontSize: FontUtils.contentFontSize,
          ),
        ),
        FormBuilderTextField(
          name: 'password',
          obscureText: controller.hidePasswordTextField,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_passworld),
            errorStyle: TextStyle(
              fontSize: FontUtils.contentFontSize,
            ),
            hintStyle: TextStyle(
              fontSize: FontUtils.contentFontSize,
            ),
            suffixIcon: IconButton(
                onPressed: controller.showPassword,
                icon: Icon(
                  controller.hidePasswordTextField ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                )),
          ),
          style: TextStyle(
            fontSize: FontUtils.contentFontSize,
            // 其他样式属性可以根据需要进行设置，例如颜色、粗细等
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_passworld_hint)),
            FormBuilderValidators.minLength(6, errorText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_passworld_length)),
          ]),
        )
      ],
    );
  }

  /// 手机号
  Widget _buildLoginByPhone(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_phone),
          style: TextStyle(
            fontSize: FontUtils.contentFontSize,
          ),
        ),
        IntlPhoneField(
          initialCountryCode: 'CN', // 默认中国 +86
          languageCode: 'zh',
          controller: controller.phoneController,
          decoration: InputDecoration(
            hintText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_phone_hint),
            errorStyle: TextStyle(fontSize: FontUtils.contentFontSize),
            hintStyle: TextStyle(fontSize: FontUtils.contentFontSize),
            border: OutlineInputBorder(),
          ),
          style: TextStyle(fontSize: FontUtils.contentFontSize),
          dropdownTextStyle: TextStyle(fontSize: 16), // **区号字体大小**
          keyboardType: TextInputType.phone,
          autovalidateMode: AutovalidateMode.disabled,
          onChanged: (phone) {
            String formattedNumber = phone.completeNumber.replaceFirst('+', '00');
            // print("格式化后的号码: $formattedNumber"); // 例如 008613812345678
            controller.phoneNum = formattedNumber;
          },
          validator: (phone) {
            if (phone == null || phone.number.isEmpty) {
              return SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_phone_hint);
            }
            return null;
          },
        ),
        15.verticalSpace,
        Text(
          SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_passworld),
          style: TextStyle(fontSize: FontUtils.contentFontSize),
        ),
        FormBuilderTextField(
          name: 'smsCode',
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_passworld_hint),
            errorStyle: TextStyle(fontSize: FontUtils.contentFontSize),
            hintStyle: TextStyle(fontSize: FontUtils.contentFontSize),
          ),
          style: TextStyle(fontSize: FontUtils.contentFontSize),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
            LengthLimitingTextInputFormatter(6),
          ],
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_passworld_hint)),
          ]),
        ),
      ],
    );
  }
}
