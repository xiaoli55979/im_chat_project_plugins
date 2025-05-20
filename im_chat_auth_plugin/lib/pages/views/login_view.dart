import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
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
                controller.toHelpSet();
              },
              child: Text(
                SlocalAuth.getLocalizaContent(
                    SlocalAuth.of(context).help_and_set),
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: FontUtils.desFontSize,
                  textBaseline:
                      TextBaseline.ideographic, // 设置基线对齐方式为 alphabetic
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
                                  _serviceView(context),
                                  _buildLoginByPhone(context),
                                  10.verticalSpace,
                                  _protocolView(context),
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
                                  10.verticalSpace,
                                  MainButton(
                                    backgroundColor: Colors.blue,
                                    onPressed: controller.onLogin,
                                    text: SlocalAuth.getLocalizaContent(
                                        SlocalAuth.of(context).auth_login),
                                  ),
                                  Obx(() {
                                    return Visibility(
                                        visible: !controller.isSmsPage.value,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                                onPressed: () {
                                                  Get.toNamed(
                                                      AppRoutesAuth.register);
                                                },
                                                child: Text(
                                                  SlocalAuth.getLocalizaContent(
                                                      SlocalAuth.of(context)
                                                          .auth_regist_new),
                                                  style: TextStyle(
                                                      fontSize: FontUtils
                                                          .contentFontSize,
                                                      color: Colors.blue),
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  Get.toNamed(AppRoutesAuth
                                                      .forgetPassword);
                                                },
                                                child: Text(
                                                  SlocalAuth.getLocalizaContent(
                                                      SlocalAuth.of(context)
                                                          .auth_forget_password),
                                                  style: TextStyle(
                                                      fontSize: FontUtils
                                                          .contentFontSize,
                                                      color: Colors.blue),
                                                )),
                                          ],
                                        ));
                                  }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  _switchLoginWay(context)
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[
                  //     ElevatedButton.icon(
                  //       onPressed: () {
                  //         // Get.toNamed(LinkUtils.getServiceUrl());
                  //       },
                  //       icon: const Icon(Icons.support_agent),
                  //       label: Text(
                  //         SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_connect_server),
                  //         style: TextStyle(
                  //           fontSize: FontUtils.contentFontSize,
                  //         ),
                  //       ),
                  //       style: ElevatedButton.styleFrom(
                  //         foregroundColor: Colors.black.withOpacity(0.8),
                  //         backgroundColor: Colors.white.withOpacity(0),
                  //       ),
                  //     ),
                  //     GetBuilder<LoginController>(
                  //       builder: (controller) {
                  //         return Text(
                  //           controller.version,
                  //           style: TextStyle(
                  //             color: Colors.grey,
                  //             fontSize: FontUtils.contentFontSize,
                  //           ),
                  //         );
                  //       },
                  //     ),
                  //     30.verticalSpace,
                  //   ],
                  // ),
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
              hintText: SlocalAuth.getLocalizaContent(
                  SlocalAuth.of(context).auth_username_hint),
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
              FormBuilderValidators.required(
                  errorText: SlocalAuth.getLocalizaContent(
                      SlocalAuth.of(context).auth_username_hint)),
              FormBuilderValidators.minLength(6,
                  errorText: SlocalAuth.getLocalizaContent(
                      SlocalAuth.of(context).auth_username_not_length)),
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
            border: OutlineInputBorder(),
            // 显式设置边框
            hintText: SlocalAuth.getLocalizaContent(
                SlocalAuth.of(context).auth_passworld),
            errorStyle: TextStyle(
              fontSize: FontUtils.contentFontSize,
            ),
            hintStyle: TextStyle(
              fontSize: FontUtils.contentFontSize,
            ),
            suffixIcon: IconButton(
                onPressed: controller.showPassword,
                icon: Icon(
                  controller.hidePasswordTextField
                      ? CupertinoIcons.eye_slash
                      : CupertinoIcons.eye,
                )),
          ),
          style: TextStyle(
            fontSize: FontUtils.contentFontSize,
            // 其他样式属性可以根据需要进行设置，例如颜色、粗细等
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: SlocalAuth.getLocalizaContent(
                    SlocalAuth.of(context).auth_passworld_hint)),
            FormBuilderValidators.minLength(6,
                errorText: SlocalAuth.getLocalizaContent(
                    SlocalAuth.of(context).auth_passworld_length)),
          ]),
        )
      ],
    );
  }

  /// 服务器控件
  Widget _serviceView(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        controller.toServiceLogin();
      },
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 4.0,
                spreadRadius: 1.0,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 图标部分
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: const Icon(
                  Icons.storage,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 8.0),

              // 文本部分
              const Text(
                'www888',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 8.0),

              // 箭头图标
              const Icon(
                Icons.arrow_forward_ios,
                size: 16.0,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
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
        SizedBox(
          height: 6,
        ),
        Stack(
          children: [
            IntlPhoneField(
              disableLengthCheck: true,
              showDropdownIcon: false,
              // 隐藏下拉图标
              showCountryFlag: false,
              initialCountryCode: 'CN',
              // 默认中国 +86
              languageCode: 'zh',
              controller: controller.phoneController,
              decoration: InputDecoration(
                  hintText: SlocalAuth.getLocalizaContent(
                      SlocalAuth.of(context).auth_phone_hint),
                  errorStyle: TextStyle(fontSize: FontUtils.contentFontSize),
                  hintStyle: TextStyle(fontSize: FontUtils.contentFontSize),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true),
              style: TextStyle(fontSize: FontUtils.contentFontSize),
              dropdownTextStyle: TextStyle(fontSize: 16),
              // **区号字体大小**
              keyboardType: TextInputType.phone,
              autovalidateMode: AutovalidateMode.disabled,
              onChanged: (phone) {
                String formattedNumber =
                    phone.completeNumber.replaceFirst('+', '00');
                // print("格式化后的号码: $formattedNumber"); // 例如 008613812345678
                controller.phoneNum = formattedNumber;
              },
              validator: (phone) {
                if (phone == null || phone.number.isEmpty) {
                  return SlocalAuth.getLocalizaContent(
                      SlocalAuth.of(context).auth_phone_hint);
                }
                return null;
              },
            ),
            Positioned(
                right: 10,
                top: 15,
                child: Obx(() {
                  return GestureDetector(
                    onTap: () {
                      controller.onSendSms();
                    },
                    child: Text(
                        textAlign: TextAlign.end,
                        style: TextStyle(color: Colors.blue),
                        controller.leftCount.value == 0
                            ? SlocalAuth.getLocalizaContent(
                            SlocalAuth.of(context).send)
                            : '${controller.leftCount.value}${SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_verification_second)}'),
                  );
                }))
          ],
        ),
        15.verticalSpace,
        Obx(() {
          return Text(
            controller.isSmsPage.value
                ? SlocalAuth.getLocalizaContent(
                    SlocalAuth.of(context).auth_verification_code)
                : SlocalAuth.getLocalizaContent(
                    SlocalAuth.of(context).auth_login_password),
            style: TextStyle(fontSize: FontUtils.contentFontSize),
          );
        }),
        SizedBox(height: 6,),
        Obx(() {
          return FormBuilderTextField(
            name: 'smsCode',
            obscureText: controller.isSmsPage.value
                ? false
                : controller.hidePasswordTextField,
            keyboardType: controller.isSmsPage.value
                ? TextInputType.number
                : TextInputType.text,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
              hintText: controller.isSmsPage.value
                  ? SlocalAuth.getLocalizaContent(
                      SlocalAuth.of(context).auth_verification_code_hint)
                  : SlocalAuth.getLocalizaContent(
                      SlocalAuth.of(context).auth_passworld_hint),
              errorStyle: TextStyle(fontSize: FontUtils.contentFontSize),
              hintStyle: TextStyle(fontSize: FontUtils.contentFontSize),
              suffixIcon: controller.isSmsPage.value
                  ? null
                  : IconButton(
                      onPressed: controller.showPassword,
                      icon: Icon(
                        controller.hidePasswordTextField
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                      )),
            ),
            style: TextStyle(fontSize: FontUtils.contentFontSize),
            inputFormatters: controller.isSmsPage.value
                ? [
              FilteringTextInputFormatter.allow(RegExp("[0-9]")),

              LengthLimitingTextInputFormatter(6),
            ]
                : [
              FilteringTextInputFormatter.allow(RegExp("[0-9A-Za-z]")),
                    LengthLimitingTextInputFormatter(20),
                  ],
            validator: controller.isSmsPage.value
                ? FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: SlocalAuth.getLocalizaContent(
                            SlocalAuth.of(context)
                                .auth_verification_code_hint)),
                    FormBuilderValidators.minLength(6,
                        errorText: SlocalAuth.getLocalizaContent(
                            SlocalAuth.of(context).auth_verification_length)),
                  ])
                : FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: SlocalAuth.getLocalizaContent(
                            SlocalAuth.of(context).auth_passworld_hint)),
              FormBuilderValidators.minLength(6,
                  errorText: SlocalAuth.getLocalizaContent(
                      SlocalAuth.of(context).auth_verification_length)),
              // FormBuilderValidators.match(
              //   r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$',
              //   errorText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).passwordFormatTips),
              // ),
                  ]),
            autovalidateMode: controller.shouldShowError.value
                ? AutovalidateMode.always // 始终显示校验错误
                : AutovalidateMode.disabled, // 禁用错误提示
          );
        }),
      ],
    );
  }

  Widget _protocolView(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() {
          return SizedBox(
            width: 20,
            child: Checkbox(
              value: controller.isChecked.value,
              onChanged: (value) {
                controller.isChecked.value = value ?? false;
              },
              activeColor: Colors.blue, // 选中颜色
            ),
          );
        }),
        SizedBox(
          width: 4,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: "我已阅读",
              style: TextStyle(color: Colors.black87, fontSize: 14),
              children: [
                TextSpan(
                  text: "《用户协议》",
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // 用户协议点击事件
                      print("用户协议被点击");
                    },
                ),
                TextSpan(
                  text: " 与 ",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
                TextSpan(
                  text: "《隐私协议》",
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // 隐私协议点击事件
                      print("隐私协议被点击");
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _switchLoginWay(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          // 添加你的点击事件逻辑
          print("手机验证码登录按钮点击");
          controller.switchPage();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white, // 背景颜色
            borderRadius: BorderRadius.circular(8), // 圆角
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(0, 2), // 阴影偏移
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                CupertinoIcons.device_phone_portrait, // 手机图标
                size: 24,
                color: Colors.grey, // 图标颜色
              ),
              const SizedBox(width: 10), // 图标与文字间距
              Obx(() {
                return Text(
                  controller.isSmsPage.value
                      ? SlocalAuth.getLocalizaContent(
                          SlocalAuth.of(context).auth_login_with_password)
                      : SlocalAuth.getLocalizaContent(
                          SlocalAuth.of(context).auth_login_with_phone),
                  style: TextStyle(
                    color: Colors.grey, // 文字颜色
                    fontSize: 16, // 文字大小
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
