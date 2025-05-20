import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/components/main_button.dart';
import 'package:im_chat_common_plugin/components/my_app_bar.dart';
import 'package:im_chat_common_plugin/components/nav_text.dart';
import 'package:im_chat_common_plugin/tools/font_utils.dart';
import 'package:im_chat_common_plugin/tools/hide_keyboard_utils.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../l10n/SlocalAuth.dart';
import '../controllers/register_controller.dart';

/// 会员注册页面
class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(
        title: NavText(
            SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_regist)),
        // actions: [
        //   IconButton(
        //     onPressed: () {}, // TODO: 添加客服链接逻辑
        //     icon: Icon(Icons.support_agent, size: FontUtils.navMainFont),
        //   ),
        //   20.verticalSpace,
        // ],
      ),
      body: GestureDetector(
        onTap: HideKeybUtils.hideKeyShowfocus,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.r),
          child: FormBuilder(
            key: controller.formKey,
            child: Column(
              children: [
                _buildLoginByPhone(context),
                _buildInputField(
                  context: context,
                  label: SlocalAuth.getLocalizaContent(
                      SlocalAuth.of(context).auth_nickname),
                  name: 'nickName',
                  hintText: SlocalAuth.getLocalizaContent(
                      SlocalAuth.of(context).auth_nickname_hint),
                ),
                _buildPasswordField(
                  context: context,
                  label: SlocalAuth.getLocalizaContent(
                      SlocalAuth.of(context).auth_login_password),
                  name: 'password',
                  hintText: SlocalAuth.getLocalizaContent(
                      SlocalAuth.of(context).auth_login_set_password),
                  obscureText: controller.hidePasswordTextField,
                  onChanged: controller.onPasswordChange,
                  onToggleVisibility: controller.togglePasswordVisibility,
                ),
                _buildPasswordField(
                  context: context,
                  label: SlocalAuth.getLocalizaContent(
                      SlocalAuth.of(context).auth_confirm_password),
                  name: 'passwordConfirm',
                  hintText: SlocalAuth.getLocalizaContent(
                      SlocalAuth.of(context).auth_login_passowrd_again),
                  obscureText: controller.hideConfirmPasswordTextField,
                  onChanged: controller.onConfirmPasswordChange,
                  onToggleVisibility: () =>
                      controller.togglePasswordVisibility(isConfirm: true),
                ),
                30.verticalSpace,
                _protocolView(context),
                10.verticalSpace,
                MainButton(
                  backgroundColor: Colors.blue,
                  onPressed: () {
                    // if (controller.formKey.currentState?.saveAndValidate() ??
                    //     false) {
                      controller.doRegister(); // 如果表单验证通过，则执行注册逻辑
                    // } else {
                    //   print(
                    //       "表单验证失败：${controller.formKey.currentState?.errors}");
                    // }
                  },
                  text: SlocalAuth.getLocalizaContent(
                      SlocalAuth.of(context).auth_regist),
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                )
                // _buildAgreementRow(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 手机号输入区域
  Widget _buildLoginByPhone(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_phone),
            style: TextStyle(fontSize: FontUtils.contentFontSize)),
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
        _buildVerificationCodeField(context),
      ],
    );
  }

  /// 验证码输入区域
  Widget _buildVerificationCodeField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            SlocalAuth.getLocalizaContent(
                SlocalAuth.of(context).auth_verification_code),
            style: TextStyle(fontSize: FontUtils.contentFontSize)),
        SizedBox(
          height: 6,
        ),
        FormBuilderTextField(
          name: 'smsCode',
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none,
            hintText: SlocalAuth.getLocalizaContent(
                SlocalAuth.of(context).auth_verification_code_hint),
            // suffixIcon: Obx(() => TextButton(
            //       onPressed: controller.leftCount.value == 0 ? controller.onSendSms : null,
            //       child: Text(
            //         controller.leftCount.value == 0
            //             ? SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_verification_code)
            //             : '${controller.leftCount.value}${SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_verification_second)}',
            //         style: TextStyle(
            //           color: controller.leftCount.value == 0 ? Colors.blue : Colors.grey,
            //           fontSize: FontUtils.contentFontSize,
            //         ),
            //       ),
            //     )),
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(6),
            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
          ],
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: SlocalAuth.getLocalizaContent(
                    SlocalAuth.of(context).auth_verification_code_hint)),
            FormBuilderValidators.minLength(6,
                errorText: SlocalAuth.getLocalizaContent(
                    SlocalAuth.of(context).auth_verification_length)),
          ]),
        ),
      ],
    );
  }

  /// 密码输入框封装
  Widget _buildPasswordField({
    required BuildContext context,
    required String label,
    required String name,
    required String hintText,
    required RxBool obscureText,
    required Function(String) onChanged,
    required VoidCallback onToggleVisibility,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.verticalSpace,
        Text(label, style: TextStyle(fontSize: FontUtils.contentTitleFontSize)),
        SizedBox(height: 6,),
        Obx(() => FormBuilderTextField(
              name: name,
              obscureText: obscureText.value,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                hintText: hintText,
                suffixIcon: IconButton(
                  onPressed: onToggleVisibility,
                  icon: Icon(obscureText.value
                      ? CupertinoIcons.eye_slash
                      : CupertinoIcons.eye),
                ),
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: SlocalAuth.getLocalizaContent(
                        SlocalAuth.of(context).auth_passworld_hint)),
                FormBuilderValidators.minLength(8,
                    errorText: SlocalAuth.getLocalizaContent(
                        SlocalAuth.of(context).auth_verification_length)),
                FormBuilderValidators.match(
                  r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$',
                  errorText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).passwordFormatTips),
                ),
              ]),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9A-Za-z]")),
                LengthLimitingTextInputFormatter(20),
              ],
              onChanged: (text) => onChanged.call(text!),
            )),
      ],
    );
  }

  Widget _buildInputField({
    required BuildContext context,
    required String label,
    required String name,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.verticalSpace,
        Text(label, style: TextStyle(fontSize: FontUtils.contentTitleFontSize)),
        SizedBox(height: 6,),
        FormBuilderTextField(
          name: name,
          decoration: InputDecoration(hintText: hintText,filled: true,
            fillColor: Colors.white,
            border: InputBorder.none,),
          validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(
          errorText: SlocalAuth.getLocalizaContent(
          SlocalAuth.of(context).auth_nickname_hint)),
            // FormBuilderValidators.minLength(8,
                // errorText: SlocalAuth.getLocalizaContent(
                //     SlocalAuth.of(context).auth_verification_length)),
            // FormBuilderValidators.match(
            //   r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$',
            //   errorText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).passwordFormatTips),
            // ),
          ]),
          inputFormatters: [
            // FilteringTextInputFormatter.allow(RegExp("[0-9A-Za-z]")),
            LengthLimitingTextInputFormatter(20),
          ],
        ),
      ],
    );
  }

  /// 用户协议部分
  Widget _buildAgreementRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(SlocalAuth.getLocalizaContent(
            SlocalAuth.of(context).auth_regist_agree_notice)),
        TextButton(
          onPressed: () {},
          child: Text(
              "《${SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_regist_service)}》"),
        )
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
}
