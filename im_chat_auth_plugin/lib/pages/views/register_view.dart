import 'package:flutter/cupertino.dart';
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
        title: NavText(SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_regist)),
        actions: [
          IconButton(
            onPressed: () {}, // TODO: 添加客服链接逻辑
            icon: Icon(Icons.support_agent, size: FontUtils.navMainFont),
          ),
          20.verticalSpace,
        ],
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
                  label: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_nickname),
                  name: 'nickName',
                  hintText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_nickname_hint),
                  validator: FormBuilderValidators.required(
                    errorText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_nickname_hint),
                  ),
                ),
                _buildPasswordField(
                  context: context,
                  label: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_login_password),
                  name: 'password',
                  hintText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_login_set_password),
                  obscureText: controller.hidePasswordTextField,
                  onChanged: controller.onPasswordChange,
                  onToggleVisibility: controller.togglePasswordVisibility,
                ),
                _buildPasswordField(
                  context: context,
                  label: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_confirm_password),
                  name: 'passwordConfirm',
                  hintText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_login_passowrd_again),
                  obscureText: controller.hideConfirmPasswordTextField,
                  onChanged: controller.onConfirmPasswordChange,
                  onToggleVisibility: () => controller.togglePasswordVisibility(isConfirm: true),
                ),
                20.verticalSpace,
                MainButton(
                  onPressed: () {
                    if (controller.formKey.currentState?.saveAndValidate() ?? false) {
                      controller.doRegister(); // 如果表单验证通过，则执行注册逻辑
                    } else {
                      print("表单验证失败：${controller.formKey.currentState?.errors}");
                    }
                  },
                  text: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_regist),
                ),
                _buildAgreementRow(context),
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
        Text(SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_phone), style: TextStyle(fontSize: FontUtils.contentFontSize)),
        IntlPhoneField(
          initialCountryCode: 'CN',
          languageCode: 'zh',
          decoration: InputDecoration(
            hintText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_phone_hint),
            border: OutlineInputBorder(),
            counterText: "",
          ),
          keyboardType: TextInputType.phone,
          autovalidateMode: AutovalidateMode.disabled,
          invalidNumberMessage: "请输入正确的手机号码",
          onChanged: (phone) {
            // 不带+的区号
            String countryCodeWithoutPlus = phone.countryCode.replaceFirst('+', '00'); // 例如 "86"
            controller.zoneNum = countryCodeWithoutPlus;
            // 完整的号码
            controller.phoneNum = phone.number; //.replaceFirst('+', '00'); // 例如 "00861234567890"

            // 你可以打印或存储区号
            print("区号: $countryCodeWithoutPlus number:${phone.number}"); // 或赋值给某个变量
          },
        ),
        15.verticalSpace,
        _buildVerificationCodeField(context),
      ],
    );
  }

  /// 验证码输入区域
  Widget _buildVerificationCodeField(BuildContext context) {
    return FormBuilderTextField(
      name: 'smsCode',
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_verification_code_hint),
        suffixIcon: Obx(() => TextButton(
              onPressed: controller.leftCount.value == 0 ? controller.onSendSms : null,
              child: Text(
                controller.leftCount.value == 0
                    ? SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_verification_code)
                    : '${controller.leftCount.value}${SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_verification_second)}',
                style: TextStyle(
                  color: controller.leftCount.value == 0 ? Colors.blue : Colors.grey,
                  fontSize: FontUtils.contentFontSize,
                ),
              ),
            )),
      ),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(6)],
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
        Obx(() => FormBuilderTextField(
              name: name,
              obscureText: obscureText.value,
              decoration: InputDecoration(
                hintText: hintText,
                suffixIcon: IconButton(
                  onPressed: onToggleVisibility,
                  icon: Icon(obscureText.value ? CupertinoIcons.eye_slash : CupertinoIcons.eye),
                ),
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: '密码不能为空'),
                FormBuilderValidators.minLength(6, errorText: '密码长度至少为6位'),
              ]),
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
    required String? Function(String?) validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.verticalSpace,
        Text(label, style: TextStyle(fontSize: FontUtils.contentTitleFontSize)),
        FormBuilderTextField(
          name: name,
          decoration: InputDecoration(hintText: hintText),
          validator: validator,
        ),
      ],
    );
  }

  /// 用户协议部分
  Widget _buildAgreementRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_regist_agree_notice)),
        TextButton(
          onPressed: () {},
          child: Text("《${SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_regist_service)}》"),
        )
      ],
    );
  }
}
