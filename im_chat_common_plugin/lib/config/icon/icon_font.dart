import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

enum IconNames {
  zuocedakai, to_right_arrow, toleft_arraow, hongbao_red, a_lianhechayanxitong_1_1, renminbi, anquan_1, wangluojiance_1, wangluojiance, zhifupingtai_yinlian, shangchuan_shangchuantupian, dengdai, dengdai_1, dengbaoerji_01, fuzhi, yanjing_xianshi_o, yanjing_yincang_o, erweima, meiyuan, arrowswap, email, email_1, qianfuhao, qrcode, jiaoyi_1, changjianwenti, caozuojiaocheng, qianbaojilu, anquanzhongxin, xitongshezhi, zhongbo, yingyongchengxu, kefu_5, kefu_2, kefu_4, kefu_3, xiangce, kefuguanli, guge, tousujianyi, yijianjianyi, shenfenzheng_6_copy_copy, shenfenzhengzhengmian_2_copy, shenfenzhengrenzheng, a_frame_39, jiaoyiliebiao, kefu_1, jiaoyi, a_kefufuwu, a_gonglve_2, lvyougonglve, kefu, chenggong, quxiao, liulanqi, fangda, fangda_1, tongzhi, ap_pxiazai, qinglihuancun, suoxiao, banbenxinxi, shuzirenminbi, usdt, tupian, shouye, gouwuche, paizhao, tishi, wenjian, wode, xiaoxi, gonggao, hongbao, shezhi, wenzhang, youhuiquan_1, anquanyanzheng, sousuo, yiwen, kabao, renwu, shuju, anquan, chakandingdan, gouwu, youjian, luxiang, jiesuo, mima, yinhangka_1, chongzhi, yue, guanyuwomen, shijian, saomiao, shanchu, renzheng, wendang, history, zijin, daiban, forward_zhuanfa, cart_gouwuche, order_dingdan, a_customerservice_kefu, gongjijin, goupiao, kaijuzhengming, shenfenzheng, tongzhigonggao, yinsijimi, youhuiquan, zixun, piaoju, zhifubao, weixin, anquanyinsi, bank, security, edit, share, video, search, delete, camera, star, bank_2, message, picture, setup, file, person_card, home
}

extension parseString on IconNames {
  String serialize() => this.toString().split('.').last;
}

/// A class includes all icons which you provided from https://iconfont.cn
///
/// How to use it:
/// ```dart
/// IconFont(IconNames.xxx);
/// IconFont(IconNames.xxx, color: '#f00');
/// IconFont(IconNames.xxx, colors: ['#f00', 'blue']);
/// IconFont(IconNames.xxx, size: 30, color: '#000');
/// ```
///
/// The name is dynamic to against server interface.
/// Feel free to input string literal.
/// ```dart
/// IconFont('xxx');
/// ```
class IconFontSvg extends StatelessWidget {
  IconNames? name;
  final String? color;
  final List<String>? colors;
  final double size;

  IconFontSvg(dynamic iconName, { this.size = 32, this.color, this.colors }) {
    this.name = getIconNames(iconName);
  }

  static IconNames getIconNames(dynamic iconName) {
    switch (iconName) {
      case 'zuocedakai':
        iconName = IconNames.zuocedakai;
        break;
      case 'to_right_arrow':
        iconName = IconNames.to_right_arrow;
        break;
      case 'toleft_arraow':
        iconName = IconNames.toleft_arraow;
        break;
      case 'hongbao_red':
        iconName = IconNames.hongbao_red;
        break;
      case 'a_lianhechayanxitong_1_1':
        iconName = IconNames.a_lianhechayanxitong_1_1;
        break;
      case 'renminbi':
        iconName = IconNames.renminbi;
        break;
      case 'anquan_1':
        iconName = IconNames.anquan_1;
        break;
      case 'wangluojiance_1':
        iconName = IconNames.wangluojiance_1;
        break;
      case 'wangluojiance':
        iconName = IconNames.wangluojiance;
        break;
      case 'zhifupingtai_yinlian':
        iconName = IconNames.zhifupingtai_yinlian;
        break;
      case 'shangchuan_shangchuantupian':
        iconName = IconNames.shangchuan_shangchuantupian;
        break;
      case 'dengdai':
        iconName = IconNames.dengdai;
        break;
      case 'dengdai_1':
        iconName = IconNames.dengdai_1;
        break;
      case 'dengbaoerji_01':
        iconName = IconNames.dengbaoerji_01;
        break;
      case 'fuzhi':
        iconName = IconNames.fuzhi;
        break;
      case 'yanjing_xianshi_o':
        iconName = IconNames.yanjing_xianshi_o;
        break;
      case 'yanjing_yincang_o':
        iconName = IconNames.yanjing_yincang_o;
        break;
      case 'erweima':
        iconName = IconNames.erweima;
        break;
      case 'meiyuan':
        iconName = IconNames.meiyuan;
        break;
      case 'arrowswap':
        iconName = IconNames.arrowswap;
        break;
      case 'email':
        iconName = IconNames.email;
        break;
      case 'email_1':
        iconName = IconNames.email_1;
        break;
      case 'qianfuhao':
        iconName = IconNames.qianfuhao;
        break;
      case 'qrcode':
        iconName = IconNames.qrcode;
        break;
      case 'jiaoyi_1':
        iconName = IconNames.jiaoyi_1;
        break;
      case 'changjianwenti':
        iconName = IconNames.changjianwenti;
        break;
      case 'caozuojiaocheng':
        iconName = IconNames.caozuojiaocheng;
        break;
      case 'qianbaojilu':
        iconName = IconNames.qianbaojilu;
        break;
      case 'anquanzhongxin':
        iconName = IconNames.anquanzhongxin;
        break;
      case 'xitongshezhi':
        iconName = IconNames.xitongshezhi;
        break;
      case 'zhongbo':
        iconName = IconNames.zhongbo;
        break;
      case 'yingyongchengxu':
        iconName = IconNames.yingyongchengxu;
        break;
      case 'kefu_5':
        iconName = IconNames.kefu_5;
        break;
      case 'kefu_2':
        iconName = IconNames.kefu_2;
        break;
      case 'kefu_4':
        iconName = IconNames.kefu_4;
        break;
      case 'kefu_3':
        iconName = IconNames.kefu_3;
        break;
      case 'xiangce':
        iconName = IconNames.xiangce;
        break;
      case 'kefuguanli':
        iconName = IconNames.kefuguanli;
        break;
      case 'guge':
        iconName = IconNames.guge;
        break;
      case 'tousujianyi':
        iconName = IconNames.tousujianyi;
        break;
      case 'yijianjianyi':
        iconName = IconNames.yijianjianyi;
        break;
      case 'shenfenzheng_6_copy_copy':
        iconName = IconNames.shenfenzheng_6_copy_copy;
        break;
      case 'shenfenzhengzhengmian_2_copy':
        iconName = IconNames.shenfenzhengzhengmian_2_copy;
        break;
      case 'shenfenzhengrenzheng':
        iconName = IconNames.shenfenzhengrenzheng;
        break;
      case 'a_frame_39':
        iconName = IconNames.a_frame_39;
        break;
      case 'jiaoyiliebiao':
        iconName = IconNames.jiaoyiliebiao;
        break;
      case 'kefu_1':
        iconName = IconNames.kefu_1;
        break;
      case 'jiaoyi':
        iconName = IconNames.jiaoyi;
        break;
      case 'a_kefufuwu':
        iconName = IconNames.a_kefufuwu;
        break;
      case 'a_gonglve_2':
        iconName = IconNames.a_gonglve_2;
        break;
      case 'lvyougonglve':
        iconName = IconNames.lvyougonglve;
        break;
      case 'kefu':
        iconName = IconNames.kefu;
        break;
      case 'chenggong':
        iconName = IconNames.chenggong;
        break;
      case 'quxiao':
        iconName = IconNames.quxiao;
        break;
      case 'liulanqi':
        iconName = IconNames.liulanqi;
        break;
      case 'fangda':
        iconName = IconNames.fangda;
        break;
      case 'fangda_1':
        iconName = IconNames.fangda_1;
        break;
      case 'tongzhi':
        iconName = IconNames.tongzhi;
        break;
      case 'ap_pxiazai':
        iconName = IconNames.ap_pxiazai;
        break;
      case 'qinglihuancun':
        iconName = IconNames.qinglihuancun;
        break;
      case 'suoxiao':
        iconName = IconNames.suoxiao;
        break;
      case 'banbenxinxi':
        iconName = IconNames.banbenxinxi;
        break;
      case 'shuzirenminbi':
        iconName = IconNames.shuzirenminbi;
        break;
      case 'usdt':
        iconName = IconNames.usdt;
        break;
      case 'tupian':
        iconName = IconNames.tupian;
        break;
      case 'shouye':
        iconName = IconNames.shouye;
        break;
      case 'gouwuche':
        iconName = IconNames.gouwuche;
        break;
      case 'paizhao':
        iconName = IconNames.paizhao;
        break;
      case 'tishi':
        iconName = IconNames.tishi;
        break;
      case 'wenjian':
        iconName = IconNames.wenjian;
        break;
      case 'wode':
        iconName = IconNames.wode;
        break;
      case 'xiaoxi':
        iconName = IconNames.xiaoxi;
        break;
      case 'gonggao':
        iconName = IconNames.gonggao;
        break;
      case 'hongbao':
        iconName = IconNames.hongbao;
        break;
      case 'shezhi':
        iconName = IconNames.shezhi;
        break;
      case 'wenzhang':
        iconName = IconNames.wenzhang;
        break;
      case 'youhuiquan_1':
        iconName = IconNames.youhuiquan_1;
        break;
      case 'anquanyanzheng':
        iconName = IconNames.anquanyanzheng;
        break;
      case 'sousuo':
        iconName = IconNames.sousuo;
        break;
      case 'yiwen':
        iconName = IconNames.yiwen;
        break;
      case 'kabao':
        iconName = IconNames.kabao;
        break;
      case 'renwu':
        iconName = IconNames.renwu;
        break;
      case 'shuju':
        iconName = IconNames.shuju;
        break;
      case 'anquan':
        iconName = IconNames.anquan;
        break;
      case 'chakandingdan':
        iconName = IconNames.chakandingdan;
        break;
      case 'gouwu':
        iconName = IconNames.gouwu;
        break;
      case 'youjian':
        iconName = IconNames.youjian;
        break;
      case 'luxiang':
        iconName = IconNames.luxiang;
        break;
      case 'jiesuo':
        iconName = IconNames.jiesuo;
        break;
      case 'mima':
        iconName = IconNames.mima;
        break;
      case 'yinhangka_1':
        iconName = IconNames.yinhangka_1;
        break;
      case 'chongzhi':
        iconName = IconNames.chongzhi;
        break;
      case 'yue':
        iconName = IconNames.yue;
        break;
      case 'guanyuwomen':
        iconName = IconNames.guanyuwomen;
        break;
      case 'shijian':
        iconName = IconNames.shijian;
        break;
      case 'saomiao':
        iconName = IconNames.saomiao;
        break;
      case 'shanchu':
        iconName = IconNames.shanchu;
        break;
      case 'renzheng':
        iconName = IconNames.renzheng;
        break;
      case 'wendang':
        iconName = IconNames.wendang;
        break;
      case 'history':
        iconName = IconNames.history;
        break;
      case 'zijin':
        iconName = IconNames.zijin;
        break;
      case 'daiban':
        iconName = IconNames.daiban;
        break;
      case 'forward_zhuanfa':
        iconName = IconNames.forward_zhuanfa;
        break;
      case 'cart_gouwuche':
        iconName = IconNames.cart_gouwuche;
        break;
      case 'order_dingdan':
        iconName = IconNames.order_dingdan;
        break;
      case 'a_customerservice_kefu':
        iconName = IconNames.a_customerservice_kefu;
        break;
      case 'gongjijin':
        iconName = IconNames.gongjijin;
        break;
      case 'goupiao':
        iconName = IconNames.goupiao;
        break;
      case 'kaijuzhengming':
        iconName = IconNames.kaijuzhengming;
        break;
      case 'shenfenzheng':
        iconName = IconNames.shenfenzheng;
        break;
      case 'tongzhigonggao':
        iconName = IconNames.tongzhigonggao;
        break;
      case 'yinsijimi':
        iconName = IconNames.yinsijimi;
        break;
      case 'youhuiquan':
        iconName = IconNames.youhuiquan;
        break;
      case 'zixun':
        iconName = IconNames.zixun;
        break;
      case 'piaoju':
        iconName = IconNames.piaoju;
        break;
      case 'zhifubao':
        iconName = IconNames.zhifubao;
        break;
      case 'weixin':
        iconName = IconNames.weixin;
        break;
      case 'anquanyinsi':
        iconName = IconNames.anquanyinsi;
        break;
      case 'bank':
        iconName = IconNames.bank;
        break;
      case 'security':
        iconName = IconNames.security;
        break;
      case 'edit':
        iconName = IconNames.edit;
        break;
      case 'share':
        iconName = IconNames.share;
        break;
      case 'video':
        iconName = IconNames.video;
        break;
      case 'search':
        iconName = IconNames.search;
        break;
      case 'delete':
        iconName = IconNames.delete;
        break;
      case 'camera':
        iconName = IconNames.camera;
        break;
      case 'star':
        iconName = IconNames.star;
        break;
      case 'bank_2':
        iconName = IconNames.bank_2;
        break;
      case 'message':
        iconName = IconNames.message;
        break;
      case 'picture':
        iconName = IconNames.picture;
        break;
      case 'setup':
        iconName = IconNames.setup;
        break;
      case 'file':
        iconName = IconNames.file;
        break;
      case 'person_card':
        iconName = IconNames.person_card;
        break;
      case 'home':
        iconName = IconNames.home;
        break;

    }
    return iconName;
  }

  static String getColor(int arrayIndex, String? color, List<String>? colors, String defaultColor) {
    if (color != null && color.isNotEmpty) {
      return color;
    }

    if (colors != null && colors.isNotEmpty && colors.length > arrayIndex) {
      return colors.elementAt(arrayIndex);
    }

    return defaultColor;
  }

  @override
  Widget build(BuildContext context) {
    String svgXml;

    switch (this.name!) {
      case IconNames.zuocedakai:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M876.8 512l-320 313.6c-6.4 6.4-12.8 6.4-19.2 6.4-6.4 0-19.2-6.4-25.6-12.8-12.8-12.8-12.8-32 0-44.8L787.2 512 512 249.6c-12.8-12.8-12.8-38.4 0-44.8 12.8-12.8 32-12.8 44.8-6.4l320 313.6zM211.2 198.4c-6.4-6.4-32-6.4-44.8 6.4s-12.8 32 0 44.8L441.6 512l-268.8 262.4c-12.8 12.8-12.8 32 0 44.8 0 6.4 12.8 12.8 19.2 12.8 6.4 0 19.2 0 19.2-6.4l320-313.6-320-313.6z"
              fill="''' + getColor(0, color, colors, '#333333') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.to_right_arrow:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M881 625.99999999l-800 0c-27.6 0-50-22.4-50-50s22.4-50 50-50L881 525.99999999c27.6 0 50 22.4 50 50s-22.4 50-50 50z"
              fill="''' + getColor(0, color, colors, '#d81e06') + '''"
            />
            <path
              d="M843.60000001 604.69999999l-212.1-212.1c-19.5-19.5-19.5-51.2 0-70.7s51.2-19.5 70.7 0L914.40000001 533.99999998c19.5 19.5 19.5 51.2 0 70.7-19.6 19.6-51.2 19.6-70.8 1e-8z"
              fill="''' + getColor(1, color, colors, '#d81e06') + '''"
            />
            <path
              d="M493.18412332 633.97435459L193.22942674 633.97435459c-27.57716447 0-49.99244943-22.41528496-49.99244943-49.99244943s22.41528496-49.99244943 49.99244943-49.99244943l299.95469658 0c27.57716447 0 49.99244943 22.41528496 49.99244943 49.99244943s-22.41528496 49.99244943-49.99244943 49.99244943z"
              fill="''' + getColor(2, color, colors, '#d81e06') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.toleft_arraow:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M143 398.00000001h800c27.6 0 50 22.4 50 50s-22.4 50-50 50H143c-27.6 0-50-22.4-50-50s22.4-50 50-50z"
              fill="''' + getColor(0, color, colors, '#d81e06') + '''"
            />
            <path
              d="M921.28024124 489.81735594l-299.95469658 0c-27.57716447 0-49.99244943-22.41528496-49.99244943-49.99244943s22.41528496-49.99244943 49.99244943-49.99244943L921.35095191 389.7617464c27.57716447 0 49.99244943 22.41528496 49.99244943 49.99244943 0 27.71858582-22.34457429 50.06316011-50.0631601 50.06316011z"
              fill="''' + getColor(1, color, colors, '#d81e06') + '''"
            />
            <path
              d="M392.49999999 264.60000001L180.39999999 476.70000001c-19.5 19.5-51.2 19.5-70.7 0s-19.5-51.2 0-70.7l212.1-212.1c19.5-19.5 51.2-19.5 70.7 0s19.5 51.2 0 70.7z"
              fill="''' + getColor(2, color, colors, '#d81e06') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.hongbao_red:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M609.751 212.752l368.796 98.819q42.39 11.358 31.032 53.748L849.803 961.61q-11.358 42.39-53.748 31.032l-368.796-98.818q-42.39-11.359-31.032-53.75l159.775-596.29q11.359-42.39 53.75-31.032z"
              fill="''' + getColor(0, color, colors, '#D8000F') + '''"
            />
            <path
              d="M609.751 212.752l368.796 98.819q42.39 11.358 31.032 53.748L849.803 961.61q-11.358 42.39-53.748 31.032l-368.796-98.818q-42.39-11.359-31.032-53.75l159.775-596.29q11.359-42.39 53.75-31.032z"
              fill="''' + getColor(1, color, colors, '#D8000F') + '''"
            />
            <path
              d="M648.979 223.263c-23.412-6.273-47.476 7.621-53.748 31.033l-159.776 596.29c-6.273 23.411 7.621 47.475 31.031 53.75l-39.228-10.513c-23.411-6.272-37.304-30.336-31.031-53.748l159.776-596.29c6.272-23.413 30.336-37.306 53.748-31.033z"
              fill="''' + getColor(2, color, colors, '#C40714') + '''"
            />
            <path
              d="M847.76 969.24c-5.146 19.198-24.878 30.59-44.077 25.447L419.628 891.78c-19.197-5.145-30.588-24.878-25.447-44.076 90.086-33.814 172.925-40.595 248.522-20.338C718.3 847.622 786.651 894.913 847.76 969.24z"
              fill="''' + getColor(3, color, colors, '#FFE400') + '''"
            />
            <path
              d="M642.703 827.366c75.596 20.256 143.93 67.607 205.008 142.055a36.039 36.039 0 0 1-4.579 10.309c-60.727-73.491-128.605-120.288-203.637-140.392-75.596-20.256-158.452-13.416-248.568 20.52l2.018-0.756a36.014 36.014 0 0 1 1.039-10.639l0.15-0.578c90.117-33.935 172.973-40.776 248.568-20.52z"
              fill="''' + getColor(4, color, colors, '#FFA700') + '''"
            />
            <path
              d="M565.472 232.476l-14.794 9.45 171.25 268.038a8.777 8.777 0 0 0 11.45 3.06L1015.82 366.08l-8.101-15.574-275.322 143.239-166.926-261.27z"
              fill="''' + getColor(5, color, colors, '#FFE400') + '''"
            />
            <path
              d="M602.492 210.808L986.25 313.635c19.157 5.133 30.526 24.825 25.393 43.982l-282.615 147.58-171.081-268.672c5.199-19.403 25.143-30.918 44.547-25.719z"
              fill="''' + getColor(6, color, colors, '#D8000F') + '''"
            />
            <path
              d="M638.357 220.417c-19.403-5.199-39.348 6.316-44.547 25.719l157.294 247.322-22.326 11.674-170.83-268.604c5.2-19.403 25.144-30.918 44.547-25.719z"
              fill="''' + getColor(7, color, colors, '#C40714') + '''"
            />
            <path
              d="M980.82 303.092c28.092 7.528 44.764 36.405 37.236 64.5L858.282 963.88c-7.528 28.096-36.405 44.766-64.5 37.24l-368.796-98.819c-28.092-7.528-44.765-36.405-37.237-64.499l159.775-596.29c7.528-28.095 36.405-44.766 64.499-37.24l368.796 98.82z m-2.272 8.479L609.75 212.752c-23.412-6.273-47.476 7.622-53.748 31.032L396.227 840.075c-6.273 23.413 7.621 47.477 31.031 53.75l368.797 98.819c23.411 6.272 47.475-7.622 53.748-31.032l159.776-596.29c6.273-23.413-7.621-47.477-31.031-53.75z"
              fill="''' + getColor(8, color, colors, '#91000A') + '''"
            />
            <path
              d="M677.642 490.673a53.394 53.394 0 1 0 103.15 27.64 53.394 53.394 0 1 0-103.15-27.64z"
              fill="''' + getColor(9, color, colors, '#FFE400') + '''"
            />
            <path
              d="M743.358 453.004a54.782 54.782 0 0 1 5.944 1.962c-26.615-3.947-52.502 12.486-59.591 38.941-7.09 26.456 7.114 53.63 32.137 63.52a54.68 54.68 0 0 1-6.13-1.274c-28.66-7.68-45.709-36.995-38.077-65.48 7.633-28.483 37.055-45.349 65.717-37.669z"
              fill="''' + getColor(10, color, colors, '#FFA700') + '''"
            />
            <path
              d="M52.182 152.127l450.75-120.779q42.391-11.358 53.75 31.032l193.093 720.636q11.359 42.39-31.031 53.749L267.993 957.543q-42.39 11.359-53.749-31.032L21.15 205.875q-11.358-42.39 31.032-53.748z"
              fill="''' + getColor(11, color, colors, '#D8000F') + '''"
            />
            <path
              d="M52.182 152.127l450.75-120.779q42.391-11.358 53.75 31.032l193.093 720.636q11.359 42.39-31.031 53.749L267.993 957.543q-42.39 11.359-53.749-31.032L21.15 205.875q-11.358-42.39 31.032-53.748z"
              fill="''' + getColor(12, color, colors, '#D8000F') + '''"
            />
            <path
              d="M98.812 139.633C75.4 145.905 61.506 169.969 67.78 193.38l193.091 720.636c6.275 23.411 30.339 37.305 53.75 31.031l-46.63 12.494c-23.412 6.275-47.476-7.62-53.748-31.031L21.15 205.875c-6.273-23.411 7.621-47.475 31.032-53.748z"
              fill="''' + getColor(13, color, colors, '#C40714') + '''"
            />
            <path
              d="M750.117 784.287c6.085 22.71-7.392 46.051-30.102 52.137L266.72 957.884c-22.708 6.085-46.05-7.393-52.136-30.1 72.118-87.879 152.804-143.776 242.059-167.692 89.254-23.916 187.08-15.85 293.474 24.195z"
              fill="''' + getColor(14, color, colors, '#FFE400') + '''"
            />
            <path
              d="M456.643 760.092c89.254-23.916 187.08-15.85 293.474 24.195a42.537 42.537 0 0 1 1.404 13.24c-105.474-39.274-202.503-47.042-291.093-23.304-89.254 23.915-169.94 79.812-242.057 167.69l1.618-1.961a42.5 42.5 0 0 1-5.217-11.491l-0.187-0.678c72.116-87.878 152.803-143.775 242.058-167.691z"
              fill="''' + getColor(15, color, colors, '#FFA700') + '''"
            />
            <path
              d="M351.027 367.116L24.657 197.205l-8.105 15.57 333.514 173.63a8.777 8.777 0 0 0 11.46-3.078l201.876-317.65-14.816-9.416-197.559 310.855z"
              fill="''' + getColor(16, color, colors, '#FFE400') + '''"
            />
            <path
              d="M51.257 152.374L504.383 30.96c22.611-6.06 45.852 7.358 51.91 29.97L354.416 378.578 20.903 204.949c-6.137-22.9 7.453-46.438 30.354-52.575z"
              fill="''' + getColor(17, color, colors, '#D8000F') + '''"
            />
            <path
              d="M93.648 141.017c-22.901 6.135-36.491 29.674-30.355 52.575l307.085 159.87-15.961 25.118L20.903 204.948c-6.137-22.9 7.453-46.439 30.354-52.575z"
              fill="''' + getColor(18, color, colors, '#C40714') + '''"
            />
            <path
              d="M500.661 22.87c28.095-7.528 56.971 9.145 64.498 37.239l193.094 720.635c7.528 28.095-9.143 56.971-37.237 64.498l-450.75 120.78c-28.096 7.527-56.973-9.145-64.5-37.24L12.672 208.148c-7.528-28.094 9.143-56.971 37.237-64.497L500.66 22.87z m2.272 8.479L52.183 152.127C28.77 158.4 14.877 182.464 21.15 205.875l193.094 720.636c6.273 23.411 30.337 37.306 53.749 31.031l450.75-120.777c23.413-6.273 37.305-30.337 31.033-53.749L556.682 62.381c-6.273-23.412-30.337-37.306-53.749-31.032z"
              fill="''' + getColor(19, color, colors, '#91000A') + '''"
            />
            <path
              d="M294.363 394.67a62.903 62.903 0 1 0 121.52-32.56 62.903 62.903 0 1 0-121.52 32.56z"
              fill="''' + getColor(20, color, colors, '#FFE400') + '''"
            />
            <path
              d="M338.842 317.63a63.567 63.567 0 0 1 7.176-1.488c-29.292 11.6-45.875 43.575-37.525 74.742 8.352 31.166 38.7 50.565 69.866 45.966a63.55 63.55 0 0 1-6.956 2.298c-33.556 8.992-68.049-10.921-77.04-44.478-8.992-33.558 10.924-68.05 44.48-77.04z"
              fill="''' + getColor(21, color, colors, '#FFA700') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.a_lianhechayanxitong_1_1:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M0.000291 0h1023.454448v1023.454449H0.000291V0z"
              fill="''' + getColor(0, color, colors, '#FEFEFE') + '''"
            />
            <path
              d="M577.193685 172.394246c1.887608 0.57392 3.343139 1.665023 4.364411 3.273309a3581.591936 3581.591936 0 0 1-2.182206 175.667554 37.227337 37.227337 0 0 1 1.091103 10.911028c-5.068173 27.973694-13.615872 54.886836-25.640916 80.741609l-20.185403 40.370805a2405.373272 2405.373272 0 0 1-7.637719 10.911028c-1.100923-1.570097-0.737586-3.024537 1.091102-4.364411a46.665377 46.665377 0 0 0 1.636655-9.819926c0.908889-93.109259 0.727766-186.217428-0.545552-279.322322-4.160375-1.499175-3.797038-2.408064 1.091103-2.727758l-4.909963-1.636654c-0.276049 1.129291-1.184938 2.220394-2.727757 3.273309-6.135271-0.31642-11.590785-0.31642-16.366542 0 25.052812-5.44133 48.692646-14.53349 70.921684-27.277571z"
              fill="''' + getColor(1, color, colors, '#5B9EEF') + '''"
            />
            <path
              d="M527.002955 494.269579a287.27428 287.27428 0 0 1-12.002131 20.730954 530.687318 530.687318 0 0 1-33.824188 44.735216c-1.565733-1.620288-1.383518-3.074728 0.545551-4.364412l1.091103 1.091103 1.091103-5.455514c0.545551-113.838031 0.727766-227.676062 0.545552-341.515184 1.749038 0.205127 3.204569-0.340424 4.364411-1.636654-11.638794-0.727766-11.638794-1.45444 0-2.182206a35.41938 35.41938 0 0 0-8.728823-0.545551v-3.273309l26.186468-2.182205c4.775757-0.31642 10.231271-0.31642 16.366542 0 1.542819-1.052914 2.451708-2.144017 2.727757-3.273309l4.909963 1.636654c-4.888141 0.319693-5.251478 1.228582-1.091103 2.727758 1.273317 93.104895 1.45444 186.213063 0.545552 279.322322a46.665377 46.665377 0 0 1-1.636655 9.819926c-1.828688 1.339874-2.192026 2.794314-1.091102 4.364411z"
              fill="''' + getColor(2, color, colors, '#5499EF') + '''"
            />
            <path
              d="M449.534654 200.76292c0.911071 1.574461 2.365511 2.665564 4.364411 3.273308a52.25837 52.25837 0 0 1-8.728822 1.091103 547.203342 547.203342 0 0 1 21.822056 4.364411v130.932339h-4.364411a5.383501 5.383501 0 0 0-0.545551-3.273308c-1.502449 4.332769-0.411346 5.787209 3.273308 4.364411 1.531908 0.00982 2.804134 0.555371 3.81886 1.636654-2.783403 0.002182-4.965609 0.912162-6.546617 2.727757a22.574917 22.574917 0 0 0-5.455514 1.091103c0.948168-6.630632-1.597375-8.086163-7.63772-4.364411a598.89652 598.89652 0 0 1 8.728823-34.369739c0.242225-2.482259-0.848878-3.754485-3.273309-3.81886-2.935067-3.12601-6.571712-5.489338-10.911028-7.092169-1.558095-0.631749-3.013626-0.449534-4.364411 0.545552v-6.546617a14.10796 14.10796 0 0 0-5.455514 0.545551c-8.394945 4.923056-16.76043 9.833019-25.095365 14.729888-0.078559-23.664929 0.102564-47.305854 0.545551-70.921683a12.41675 12.41675 0 0 1-2.727757-2.182206c1.203486-0.543369 2.294589-0.906706 3.273308-1.091103-0.413528-1.869059-1.504631-2.960162-3.273308-3.273308a1239.03018 1239.03018 0 0 0 21.822057-28.914225 12.582598 12.582598 0 0 1 6.001065-1.636654c4.912145 0.788867 9.822108 1.515542 14.729888 2.182206z"
              fill="''' + getColor(3, color, colors, '#4B93EE') + '''"
            />
            <path
              d="M406.981644 229.131593c1.768678 0.313147 2.859781 1.404249 3.273308 3.273308-0.978719 0.184396-2.069822 0.547734-3.273308 1.091103a12.41675 12.41675 0 0 0 2.727757 2.182206 3212.776269 3212.776269 0 0 0-0.545551 70.921683c-9.993411 33.417206-19.994459 66.878056-30.005328 100.38146a54.0696 54.0696 0 0 0-1.636654 14.184337h4.364411c-0.260774 2.146199 0.102564 4.147282 1.091103 6.001065a112.489428 112.489428 0 0 1 13.093234 7.092169c0.773592 0.986357 1.864695 1.349694 3.273308 1.091103a7738.816989 7738.816989 0 0 0-15.275439 69.285029l1.091103 3.81886c2.210574-3.706476 4.39278-7.343122 6.546616-10.911028a64.217948 64.217948 0 0 0-2.727757 16.366542 84.09675 84.09675 0 0 0 13.638786 7.63772c1.372607 0.563009 2.46371-0.163665 3.273308-2.182206 1.370425-0.042553 2.461528 0.502998 3.273309 1.636654 0.342606 30.105709-0.021822 60.293251-1.091103 90.561535l4.364411 1.091102c-2.448435 0.054555-4.267303 0.963444-5.455514 2.727758a178.183638 178.183638 0 0 1-31.641982 0.545551c-6.17346-0.273867-11.993402-1.547184-17.457645-3.81886 1.793773 0.233496 3.430427-0.130932 4.909963-1.091103l1.091102-322.966436c0.727766-1.45444 1.45444-1.45444 2.182206 0a9.197997 9.197997 0 0 0 0.545552-4.364411 7.46969 7.46969 0 0 1-4.364412-1.091103l-1.091103 4.364412c-0.834694-1.213306-1.925796-1.941072-3.273308-2.182206a1806.61314 1806.61314 0 0 0 49.099627-55.646244z"
              fill="''' + getColor(4, color, colors, '#418CED') + '''"
            />
            <path
              d="M357.882017 612.108684c-13.314728-3.945428-25.680196-9.76537-37.097496-17.457645l-1.091103-2.182206c3.893055-1.60283 4.257483-3.96725 1.091103-7.092168a3960.614871 3960.614871 0 0 0 2.182206-131.47789l-0.545552-130.932339-1.091103-2.182206c-2.65138 0.127659-5.379137 0.855425-8.183271 2.182206a1111.065641 1111.065641 0 0 0 44.735216-38.188599c1.347512 0.241134 2.438615 0.968899 3.273308 2.182206l1.091103-4.364412a7.46969 7.46969 0 0 0 4.364412 1.091103 9.197997 9.197997 0 0 1-0.545552 4.364411c-0.727766-1.45444-1.45444-1.45444-2.182206 0l-1.091102 322.966436c-1.479535 0.96017-3.11619 1.324599-4.909963 1.091103z"
              fill="''' + getColor(5, color, colors, '#3C88ED') + '''"
            />
            <path
              d="M439.714729 297.871071a524.878287 524.878287 0 0 1-24.004262 13.638785 17.272158 17.272158 0 0 0-3.81886 6.001066 10819.022082 10819.022082 0 0 1-30.005328 103.654768h-4.364411a54.0696 54.0696 0 0 1 1.636654-14.184337c10.010868-33.503403 20.011917-66.964254 30.005328-100.38146 8.334934-4.896869 16.70042-9.806832 25.095365-14.729888a14.10796 14.10796 0 0 1 5.455514-0.545551v6.546617z"
              fill="''' + getColor(6, color, colors, '#2A2BCE') + '''"
            />
            <path
              d="M454.990168 304.417688c2.42443 0.064375 3.515533 1.336601 3.273309 3.81886a598.89652 598.89652 0 0 0-8.728823 34.369739c-1.577735 3.004897-2.668838 6.278206-3.273308 9.819925a623.469247 623.469247 0 0 0-5.455514 18.003197l1.091102 1.636654c10.410212-7.020156 21.32124-12.839007 32.733085-17.457645 1.224217 1.950892 1.406432 4.133097 0.545552 6.546617a4814.578498 4814.578498 0 0 0-38.734151 89.470431 2963.632759 2963.632759 0 0 0-30.550879 68.739478c-0.809598 2.01854-1.900701 2.745215-3.273308 2.182206a2013.711003 2013.711003 0 0 1 21.822056-99.290357c-0.943804-1.181664-2.034907-1.362787-3.273308-0.545552a2835.121577 2835.121577 0 0 0-16.366543 10.365477c-2.03818 0.832511-3.857048 1.923614-5.455514 3.273309-1.408614 0.258591-2.499717-0.104746-3.273308-1.091103a2021.006116 2021.006116 0 0 1 30.005327-109.110283 32.206082 32.206082 0 0 1 2.727758-4.909962 696.654969 696.654969 0 0 0 26.186467-15.820991z"
              fill="''' + getColor(7, color, colors, '#FDFEFE') + '''"
            />
            <path
              d="M577.193685 172.394246c-22.229038 12.744081-45.868872 21.836241-70.921684 27.277571l-26.186468 2.182205c-10.209449 0.163665-20.393803-0.199672-30.550879-1.091102a614.690233 614.690233 0 0 1-14.729888-2.182206 12.582598 12.582598 0 0 0-6.001065 1.636654 1239.03018 1239.03018 0 0 1-21.822057 28.914225 1806.61314 1806.61314 0 0 1-49.099627 55.646244 1111.065641 1111.065641 0 0 1-44.735216 38.188599 5.383501 5.383501 0 0 0-3.273308 0.545551 101.891546 101.891546 0 0 1-20.730954 13.093234c-3.200205 2.470257-5.564624 5.562442-7.092168 9.274374a7244.028045 7244.028045 0 0 0 0 177.84976c2.142926 23.540543 11.235086 43.90816 27.27757 61.101758a102.303983 102.303983 0 0 0 10.365477 7.63772l1.091103 2.182206c-34.148245-16.625134-53.242544-43.902704-57.282898-81.832712-0.545551-58.190696-0.727766-116.383574-0.545552-174.576452 0.617564-4.688469 2.79977-8.507329 6.546617-11.456579a313.593863 313.593863 0 0 0 44.735216-30.550879c35.077865-31.425944 66.174295-66.160111 93.289291-104.20032a20.488729 20.488729 0 0 1 6.001066-4.909963c37.117136 7.383493 73.486866 4.473522 109.110282-8.728822a438.416026 438.416026 0 0 0 36.006394-15.820991 75.592695 75.592695 0 0 1 18.548748 9.819925z"
              fill="''' + getColor(8, color, colors, '#1D4986') + '''"
            />
            <path
              d="M582.649199 331.695258a123355.009432 123355.009432 0 0 1 365.519446 210.037294c4.822674 4.817219 8.278197 10.454947 10.365476 16.912094 0.902342 14.00976 0.720128 27.83076-0.545551 41.461907 0.181123-10.553147 0-21.100838-0.545551-31.641982-3.029993 7.029975-7.939955 12.304367-14.729889 15.820991a9204.082975 9204.082975 0 0 0-174.576451 102.018114 3582.168038 3582.168038 0 0 0-92.74374 53.464038 807545.310994 807545.310994 0 0 1-123.294619 71.467235c-8.208367 3.883235-16.572761 6.97542-25.095365 9.274374-16.041394 2.222576-31.681262 0.585922-46.917422-4.909962a565990.860991 565990.860991 0 0 1-129.841236-73.649441 11698.455322 11698.455322 0 0 0-161.483218-93.834843 759673.174606 759673.174606 0 0 0-114.565796-66.011721c-4.725566-3.801402-8.362212-8.348028-10.911028-13.638785-0.533549-1.631199-1.260224-3.08673-2.182206-4.364411 0.082924-6.46042 2.084006-12.280362 6.001065-17.457645a296.725413 296.725413 0 0 1 13.638786-10.365477c60.207054-34.817091 120.217709-69.550167 180.031966-104.20032 0.727766-31.456494 1.45444-62.735139 2.182205-93.834843-0.182214 58.192878 0 116.385756 0.545552 174.576452 4.040354 37.930007 23.134653 65.207578 57.282898 81.832712 11.4173 7.692275 23.782768 13.512217 37.097496 17.457645 5.464243 2.271676 11.284185 3.544993 17.457645 3.81886 10.571695 0.756134 21.119386 0.575011 31.641982-0.545551 12.593509-2.48335 23.868965-7.575527 33.824188-15.27544 15.27544-11.638794 28.732011-25.095365 40.370804-40.370804a530.687318 530.687318 0 0 0 33.824188-44.735216 213.406619 213.406619 0 0 0-12.547683 38.188599c-2.735395 16.912094-2.007629 33.641973 2.182206 50.190729 5.076901 13.62351 14.351275 23.080098 27.823122 28.368674 9.942129 8.827022 21.579832 12.282544 34.91529 10.365477 16.005387-2.73103 30.189724-9.277647 42.55301-19.639851a271.250344 271.250344 0 0 0 28.914225-28.914225 2335.8973 2335.8973 0 0 0 42.007459 23.458711c8.945952 0.340424 15.674783-3.478436 20.185402-11.45658 5.034348-7.715188 5.762114-15.716245 2.182206-24.004262a1697.246449 1697.246449 0 0 0-44.189665-26.186468c10.679714-22.928435 14.498574-46.932697 11.45658-72.012786-2.607736-16.91864-11.518773-28.920771-26.732019-36.006393-14.436381-12.162523-30.802924-15.618046-49.099627-10.365477-12.430934 4.212748-23.7053 10.394937-33.824188 18.548748a312.40456 312.40456 0 0 0-26.186468 27.823122l20.185403-40.370805c12.025044-25.854773 20.572744-52.767915 25.640916-80.741609 1.827597-9.941038 2.555363-20.125392 2.182206-30.550879z"
              fill="''' + getColor(9, color, colors, '#E3EBF8') + '''"
            />
            <path
              d="M581.558096 175.667555a5578.499955 5578.499955 0 0 1 1.091103 156.027703c0.373157 10.425487-0.354608 20.609841-2.182206 30.550879a37.227337 37.227337 0 0 0-1.091103-10.911028 3581.591936 3581.591936 0 0 0 2.182206-175.667554z"
              fill="''' + getColor(10, color, colors, '#84B6F3') + '''"
            />
            <path
              d="M319.693418 592.468833a102.303983 102.303983 0 0 1-10.365477-7.63772c-16.042485-17.193598-25.134645-37.561215-27.27757-61.101758a7244.028045 7244.028045 0 0 1 0-177.84976c1.527544-3.711932 3.891964-6.804117 7.092168-9.274374a101.891546 101.891546 0 0 0 20.730954-13.093234 5.383501 5.383501 0 0 1 3.273308-0.545551c2.804134-1.326781 5.531891-2.054547 8.183271-2.182206l1.091103 2.182206 0.545552 130.932339c-0.003273 44.05655-0.731039 87.882877-2.182206 131.47789 3.16638 3.124918 2.801952 5.489338-1.091103 7.092168z"
              fill="''' + getColor(11, color, colors, '#3583EC') + '''"
            />
            <path
              d="M457.172374 346.970698a167.011836 167.011836 0 0 0-10.365477 6.546617c-0.43535-0.248771-0.616473-0.6132-0.545551-1.091103 0.604471-3.54172 1.695574-6.815028 3.273308-9.819925 6.040345-3.721752 8.585888-2.266221 7.63772 4.364411z"
              fill="''' + getColor(12, color, colors, '#3231CE') + '''"
            />
            <path
              d="M454.990168 304.417688a696.654969 696.654969 0 0 1-26.186467 15.820991 32.206082 32.206082 0 0 0-2.727758 4.909962 2021.006116 2021.006116 0 0 0-30.005327 109.110283 112.489428 112.489428 0 0 0-13.093234-7.092169c-0.988539-1.853784-1.351876-3.854866-1.091103-6.001065a10819.022082 10819.022082 0 0 0 30.005328-103.654768 17.272158 17.272158 0 0 1 3.81886-6.001066 524.878287 524.878287 0 0 0 24.004262-13.638785c1.350785-0.995086 2.806316-1.1773 4.364411-0.545552 4.339316 1.60283 7.975962 3.966159 10.911028 7.092169z"
              fill="''' + getColor(13, color, colors, '#ABC2EA') + '''"
            />
            <path
              d="M462.627888 345.879595a102.816801 102.816801 0 0 0 12.002131 8.728823c-11.411844 4.618638-22.322873 10.43749-32.733085 17.457645l-1.091102-1.636654a623.469247 623.469247 0 0 1 5.455514-18.003197c-0.070922 0.477903 0.110201 0.842331 0.545551 1.091103 3.433701-2.345871 6.888132-4.528077 10.365477-6.546617a22.574917 22.574917 0 0 1 5.455514-1.091103z"
              fill="''' + getColor(14, color, colors, '#AEC6EA') + '''"
            />
            <path
              d="M449.534654 200.76292c10.157076 0.891431 20.34143 1.254768 30.550879 1.091102v3.273309a35.41938 35.41938 0 0 1 8.728823 0.545551c-11.638794 0.727766-11.638794 1.45444 0 2.182206-1.159842 1.29623-2.615373 1.841782-4.364411 1.636654 0.182214 113.839122 0 227.677153-0.545552 341.515184l-1.091103 5.455514-1.091103-1.091103c-1.92907 1.289684-2.111284 2.744124-0.545551 4.364412-11.638794 15.27544-25.095365 28.732011-40.370804 40.370804-5.89632-3.546084-5.168554-5.72829 2.182205-6.546617a2288.991881 2288.991881 0 0 0-2.182205-140.752264c1.189302-1.639928 2.462619-2.003265 3.818859-1.091103 0.727766-1.45444 0.727766-2.909971 0-4.364411l-1.091102 2.182205c-1.949801-7.23183-3.040904-6.867401-3.273309 1.091103l-1.091103-2.182205c-0.772501 0.961262-1.682481 1.687936-2.727757 2.182205a4814.578498 4814.578498 0 0 1 38.734151-89.470431c0.86088-2.413519 0.678666-4.595725-0.545552-6.546617a102.816801 102.816801 0 0 1-12.002131-8.728823c1.581008-1.815595 3.763214-2.725575 6.546617-2.727757-1.014726-1.081283-2.286952-1.626834-3.81886-1.636654-3.684654 1.422798-4.775757-0.031642-3.273308-4.364411 0.527003 1.034365 0.708126 2.125468 0.545551 3.273308h4.364411v-130.932339a547.203342 547.203342 0 0 0-21.822056-4.364411 52.25837 52.25837 0 0 0 8.728822-1.091103c-1.9989-0.607744-3.45334-1.698847-4.364411-3.273308z"
              fill="''' + getColor(15, color, colors, '#4E95EF') + '''"
            />
            <path
              d="M402.617233 521.54715a84.09675 84.09675 0 0 1-13.638786-7.63772 64.217948 64.217948 0 0 1 2.727757-16.366542l14.184337-63.283964c-0.046917-0.99945-0.410255-1.727216-1.091103-2.182206a2835.121577 2835.121577 0 0 1 16.366543-10.365477c1.238402-0.817236 2.329505-0.636113 3.273308 0.545552a2013.711003 2013.711003 0 0 0-21.822056 99.290357z"
              fill="''' + getColor(16, color, colors, '#ABC4EA') + '''"
            />
            <path
              d="M404.799438 432.076718c0.680848 0.45499 1.044185 1.182755 1.091103 2.182206l-14.184337 63.283964c-2.153837 3.567906-4.336043 7.204552-6.546616 10.911028l-1.091103-3.81886a7738.816989 7738.816989 0 0 1 15.275439-69.285029c1.598466-1.349694 3.417334-2.440797 5.455514-3.273309z"
              fill="''' + getColor(17, color, colors, '#2B2DCE') + '''"
            />
            <path
              d="M643.750957 447.352158c15.213247 7.085622 24.124283 19.087753 26.732019 36.006393 3.041995 25.08009-0.776865 49.084352-11.45658 72.012786a1697.246449 1697.246449 0 0 1 44.189665 26.186468c3.579908 8.288017 2.852143 16.289074-2.182206 24.004262-4.510619 7.978144-11.23945 11.797004-20.185402 11.45658a2335.8973 2335.8973 0 0 1-42.007459-23.458711 271.250344 271.250344 0 0 1-28.914225 28.914225c-12.363286 10.362204-26.547623 16.90882-42.55301 19.639851-13.335459 1.917068-24.973161-1.538455-34.91529-10.365477-12.425479-17.203418-16.971013-36.478841-13.638786-57.82845 8.606619-49.294934 33.156433-88.393513 73.649441-117.293553 15.783893-10.586971 32.878201-13.678065 51.281833-9.274374z"
              fill="''' + getColor(18, color, colors, '#FECD30') + '''"
            />
            <path
              d="M440.805832 600.106553c-9.955222 7.699913-21.230679 12.79209-33.824188 15.27544 1.188211-1.764313 3.007079-2.673202 5.455514-2.727758l-4.364411-1.091102c1.069281-30.268283 1.433709-60.455825 1.091103-90.561535-0.811781-1.133656-1.902883-1.679207-3.273309-1.636654a2963.632759 2963.632759 0 0 1 30.550879-68.739478c1.045277-0.49427 1.955256-1.220944 2.727757-2.182205l1.091103 2.182205c0.232405-7.958504 1.323508-8.322932 3.273309-1.091103l1.091102-2.182205c0.727766 1.45444 0.727766 2.909971 0 4.364411-1.356241-0.912162-2.629558-0.548825-3.818859 1.091103a2288.991881 2288.991881 0 0 1 2.182205 140.752264c-7.35076 0.818327-8.078525 3.000533-2.182205 6.546617z"
              fill="''' + getColor(19, color, colors, '#4891EE') + '''"
            />
            <path
              d="M613.200078 472.447523c15.266711-2.27604 26.72329 3.179474 34.369739 16.366542 6.64809 19.819883 5.920324 39.459734-2.182206 58.919552-9.506779 26.117728-25.691107 47.029805-48.554076 62.738413-11.889747 7.398768-24.619644 9.580974-38.188598 6.546617-12.619695-6.842306-19.348526-17.57112-20.185403-32.187534 0.568465-40.961091 16.753884-74.239727 48.554076-99.835908 8.109076-5.693375 16.837899-9.875572 26.186468-12.547682z"
              fill="''' + getColor(20, color, colors, '#FEFEFD') + '''"
            />
            <path
              d="M603.380152 482.267448c5.073628 0.161483 7.07362 2.707026 6.001066 7.63772-1.6923 6.807391-5.874498 10.262913-12.547683 10.365477-2.271676-7.63772-0.08947-13.638785 6.546617-18.003197z"
              fill="''' + getColor(21, color, colors, '#FDCE37') + '''"
            />
            <path
              d="M878.338064 524.820458a399.175604 399.175604 0 0 1-17.457645 9.274374c-2.182206 0.727766-4.364411 0.727766-6.546617 0a6.86631 6.86631 0 0 0 1.091103-3.273308c-0.511727-2.058911-1.60283-3.695565-3.273309-4.909963 0.030551-3.815587 0.211674-7.816661 0.545551-12.002131l1.636655-1.636654a14.10796 14.10796 0 0 0-5.455514-0.545552c2.451708-2.247672 5.361679-3.15656 8.728822-2.727757a74.467768 74.467768 0 0 0 14.184337 8.183271c2.642651 1.531908 3.370417 3.5319 2.182206 6.001066 1.159842 1.29623 2.615373 1.841782 4.364411 1.636654z"
              fill="''' + getColor(22, color, colors, '#C8DFF7') + '''"
            />
            <path
              d="M643.750957 447.352158c-18.403631-4.403691-35.497939-1.312597-51.281833 9.274374-40.493008 28.90004-65.042822 67.998619-73.649441 117.293553-3.332228 21.349609 1.213306 40.625031 13.638786 57.82845-13.471847-5.288575-22.746221-14.745164-27.823122-28.368674-4.189835-16.548757-4.9176-33.278636-2.182206-50.190729a213.406619 213.406619 0 0 1 12.547683-38.188599 287.27428 287.27428 0 0 0 12.002131-20.730954c2.53245-3.596275 5.077993-7.232921 7.637719-10.911028a312.40456 312.40456 0 0 1 26.186468-27.823122c10.118888-8.153811 21.393253-14.336 33.824188-18.548748 18.296703-5.252569 34.663246-1.797046 49.099627 10.365477z"
              fill="''' + getColor(23, color, colors, '#C68721') + '''"
            />
            <path
              d="M856.516007 536.822589a226.392925 226.392925 0 0 1-1.091102 31.096431c1.370425 0.45499 2.098191 1.363879 2.182205 2.727757a158.515418 158.515418 0 0 1-27.27757-10.365477c-1.037639-3.335501-1.400976-6.789933-1.091103-10.365477-0.181123-9.099798 0-18.191957 0.545551-27.27757a927.531235 927.531235 0 0 1 26.732019 14.184336z"
              fill="''' + getColor(24, color, colors, '#79B4F3') + '''"
            />
            <path
              d="M848.878288 511.727224a14.10796 14.10796 0 0 1 5.455514 0.545552l-1.636655 1.636654a168.068023 168.068023 0 0 0-0.545551 12.002131c1.670478 1.214397 2.761581 2.851052 3.273309 4.909963a6.86631 6.86631 0 0 1-1.091103 3.273308c2.182206 0.727766 4.364411 0.727766 6.546617 0a399.175604 399.175604 0 0 0 17.457645-9.274374c1.682481-0.873973 3.500258-1.237311 5.455514-1.091103a280.224665 280.224665 0 0 1-1.091103 34.915291 59.697509 59.697509 0 0 0-9.819925 4.364411c-0.080742-2.085097-1.171844-3.358414-3.273309-3.81886l2.182206-1.091103a1067.131295 1067.131295 0 0 1-8.183271-12.547682c-1.412978 1.463169-1.95853 2.917609-1.636655 4.364411l-2.182205-8.728822a4.863045 4.863045 0 0 0-1.636654 2.182205c-0.208401-2.409155-0.753952-4.591361-1.636655-6.546617a927.531235 927.531235 0 0 0-26.732019-14.184336c-0.545551 9.085613-0.726674 18.177773-0.545551 27.27757h-1.091103a185.406738 185.406738 0 0 1 1.091103-28.368673 1960.517558 1960.517558 0 0 1 19.639851-9.819926z"
              fill="''' + getColor(25, color, colors, '#A7CEF6') + '''"
            />
            <path
              d="M816.145203 532.458178h3.273308c0.57392 3.609368-0.88052 5.972697-4.364411 7.092168a167.427546 167.427546 0 0 0-27.277571 15.27544c-1.91925 0.8707-3.738118 0.688486-5.455514-0.545552 0.90016-0.966717 1.991263-1.330054 3.273309-1.091102-0.021822-1.792682 0.705944-3.247122 2.182205-4.364412a271.613681 271.613681 0 0 0 28.368674-16.366542z"
              fill="''' + getColor(26, color, colors, '#BCD7FA') + '''"
            />
            <path
              d="M856.516007 536.822589c0.882702 1.955256 1.428254 4.137462 1.636655 6.546617a4.863045 4.863045 0 0 1 1.636654-2.182205l2.182205 8.728822c-0.321875-1.446802 0.223676-2.901242 1.636655-4.364411a1067.131295 1067.131295 0 0 0 8.183271 12.547682l-2.182206 1.091103c2.101464 0.460445 3.192567 1.733762 3.273309 3.81886l-15.27544 7.63772c-0.084015-1.363879-0.811781-2.272767-2.182205-2.727757a226.392925 226.392925 0 0 0 1.091102-31.096431z"
              fill="''' + getColor(27, color, colors, '#94C2F4') + '''"
            />
            <path
              d="M828.147334 549.915823h1.091103c-0.309873 3.575544 0.053464 7.029975 1.091103 10.365477a158.515418 158.515418 0 0 0 27.27757 10.365477 256.825965 256.825965 0 0 0-19.639851 10.365477c-2.595734 0.669937-5.141277 1.033274-7.637719 1.091102a172.025453 172.025453 0 0 0-7.63772-16.912093c4.782304-3.938881 6.601172-9.031058 5.455514-15.27544z"
              fill="''' + getColor(28, color, colors, '#C8DCF7') + '''"
            />
            <path
              d="M61.102049 564.10016c0.921982 1.277681 1.648656 2.733213 2.182206 4.364411-1.084556 11.077967-1.448985 22.352332-1.091103 33.824188-1.085647-12.534589-1.448985-25.264486-1.091103-38.188599z"
              fill="''' + getColor(29, color, colors, '#93BCF5') + '''"
            />
            <path
              d="M957.98857 600.106553c-0.32624 3.933426-1.598466 7.571162-3.81886 10.911028l-8.183271 8.183271a25313.512405 25313.512405 0 0 1-183.305274 106.382526 16.844445 16.844445 0 0 0-3.273309-7.63772c4.924147-1.217671 10.016324-1.945436 15.27544-2.182206 1.45444-8.728823 1.45444-17.457645 0-26.186467-1.778498-1.924705-3.960703-3.015808-6.546617-3.273309a9204.082975 9204.082975 0 0 1 174.576451-102.018114c6.789933-3.516624 11.699896-8.791015 14.729889-15.820991 0.545551 10.541144 0.726674 21.088835 0.545551 31.641982z"
              fill="''' + getColor(30, color, colors, '#5C9FEF') + '''"
            />
            <path
              d="M63.284255 568.464571c2.548816 5.290758 6.185462 9.837383 10.911028 13.638785 38.218059 22.016273 76.406657 44.020543 114.565796 66.011721-0.49427 1.045277-1.220944 1.955256-2.182205 2.727757 2.909971 1.091103 2.909971 2.182206 0 3.273309a181.675167 181.675167 0 0 1 1.091102 27.823122c1.61265-0.285869 3.06709 0.077468 4.364412 1.091103-1.776315 0.086197-3.595184 0.449534-5.455514 1.091102a11334.009522 11334.009522 0 0 0-111.292488-63.829515c-6.911045-4.198564-11.275457-10.199629-13.093234-18.003196-0.357882-11.471855 0.006547-22.746221 1.091103-33.824188z"
              fill="''' + getColor(31, color, colors, '#3785EC') + '''"
            />
            <path
              d="M768.136679 686.303676c2.585914 0.2575 4.768119 1.348603 6.546617 3.273309 1.45444 8.728823 1.45444 17.457645 0 26.186467-5.259116 0.236769-10.351292 0.964535-15.27544 2.182206a16.844445 16.844445 0 0 1 3.273309 7.63772 5303.7559 5303.7559 0 0 1-88.379329 51.281832c-3.131465-3.226391-2.4037-5.408597 2.182205-6.546616a192.88843 192.88843 0 0 1-1.091102-28.368674c4.134189-0.258591 4.134189-0.986357 0-2.182206a3582.168038 3582.168038 0 0 1 92.74374-53.464038z"
              fill="''' + getColor(32, color, colors, '#5599EF') + '''"
            />
            <path
              d="M188.761079 648.115077a11698.455322 11698.455322 0 0 1 161.483218 93.834843c-1.370425 4.26403 0.084015 5.900684 4.364411 4.909963-2.691751 2.795405-1.963985 3.886508 2.182206 3.273308-2.28586-0.606653-2.468075-1.152205-0.545551-1.636654 1.155478 0.141843 2.064367 0.687395 2.727757 1.636654a85.80869 85.80869 0 0 0 0 27.277571l-5.455514 2.727757a18787.974478 18787.974478 0 0 1-166.938732-96.017049c1.86033-0.641568 3.679199-1.004906 5.455514-1.091102-1.297321-1.013635-2.751761-1.376972-4.364412-1.091103a181.675167 181.675167 0 0 0-1.091102-27.823122c2.909971-1.091103 2.909971-2.182206 0-3.273309 0.961262-0.772501 1.687936-1.682481 2.182205-2.727757z"
              fill="''' + getColor(33, color, colors, '#3F8AEE') + '''"
            />
            <path
              d="M675.392939 739.767714c4.134189 1.195849 4.134189 1.923614 0 2.182206a192.88843 192.88843 0 0 0 1.091102 28.368674c-4.585905 1.13802-5.313671 3.320226-2.182205 6.546616-40.042383 23.291772-80.04985 46.568269-120.021311 69.830581-0.121112-0.67321-0.48445-1.218762-1.091103-1.636654 5.941055-4.485524 5.213289-6.303301-2.182205-5.455514l1.091103-1.091103-4.364412-18.548748c1.629017-1.261315 1.446802-2.171295-0.545551-2.727757a33.150977 33.150977 0 0 1-5.455514 3.273308 128.53955 128.53955 0 0 0-14.729888 0c8.522604-2.298954 16.886998-5.391139 25.095365-9.274374 41.12803-23.835141 82.2266-47.657189 123.294619-71.467235z"
              fill="''' + getColor(34, color, colors, '#4F95EF') + '''"
            />
            <path
              d="M350.244297 741.94992c43.220765 24.523627 86.501541 49.073441 129.841236 73.649441 15.23616 5.495885 30.876028 7.132539 46.917422 4.909962 5.046351-0.281505 9.956313-0.281505 14.729888 0a33.150977 33.150977 0 0 0 5.455514-3.273308c1.992354 0.556462 2.174568 1.466442 0.545551 2.727757l4.364412 18.548748-1.091103 1.091103c7.395495-0.847787 8.123261 0.96999 2.182205 5.455514 0.606653 0.417892 0.96999 0.963444 1.091103 1.636654-28.598896 15.639868-57.331998 15.822082-86.197123 0.545552a315210.916211 315210.916211 0 0 1-114.565796-67.102824l5.455514-2.727757a85.80869 85.80869 0 0 1 0-27.277571c-0.663391-0.949259-1.572279-1.494811-2.727757-1.636654-1.922523 0.48445-1.740309 1.030001 0.545551 1.636654-4.146191 0.6132-4.873956-0.477903-2.182206-3.273308-4.280396 0.990721-5.734836-0.645933-4.364411-4.909963z"
              fill="''' + getColor(35, color, colors, '#4890EE') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.renminbi:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M511.264243 70.25611c-244.22942 0-442.169585 197.940165-442.169585 442.169585s197.940165 442.169585 442.169585 442.169585c244.143463 0 442.169585-197.940165 442.169585-442.169585S755.407706 70.25611 511.264243 70.25611L511.264243 70.25611zM725.353203 474.945059l0 51.125401L571.975976 526.07046l0 102.337783 153.464207 0 0 51.125401L571.975976 679.533644l0 102.337783L469.638193 781.871427 469.638193 679.534667 316.173986 679.534667l0-51.125401 153.550165 0L469.724151 526.07046 316.173986 526.07046l0-51.125401 158.300352 0.604774L265.048585 270.355451l102.337783 0 153.464207 153.464207 153.464207-153.464207L776.652566 270.355451 584.930009 475.549833 725.353203 474.945059 725.353203 474.945059z"
              fill="''' + getColor(0, color, colors, '#272536') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.anquan_1:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M867.584 160.192c-149.632-16.928-262.208-57.408-334.592-120.352l-19.04-16.544-20.544 14.656C379.968 118.944 267.776 160 160 160H128v448c0 137.344 121.088 261.92 370.208 380.864l13.088 6.24 13.344-5.728C771.072 883.52 896 755.232 896 608V163.424l-28.416-3.232zM832 608c0 116.8-107.392 223.36-319.328 316.8C299.872 821.024 192 714.464 192 608V222.976c104.672-6.784 211.584-46.688 318.496-118.944C587.232 162.528 695.168 201.536 832 220.256V608z"
              fill="''' + getColor(0, color, colors, '#333333') + '''"
            />
            <path
              d="M359.776 468.672a32 32 0 1 0-47.968 42.4l121.792 137.824c12.608 14.24 30.176 21.568 47.904 21.568a64.384 64.384 0 0 0 49.696-23.52l197.6-242.72a32 32 0 0 0-49.632-40.416l-197.6 242.688-121.792-137.824z"
              fill="''' + getColor(1, color, colors, '#333333') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.wangluojiance_1:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M443.733333 772.266667c-8.533333 25.6 4.266667 55.466667 34.133334 64 25.6 8.533333 55.466667-8.533333 59.733333-38.4l136.533333-601.6c0-8.533333-4.266667-12.8-8.533333-17.066667-8.533333 0-12.8 0-17.066667 8.533333l-204.8 584.533334zM93.866667 392.533333c132.266667-132.266667 311.466667-187.733333 486.4-166.4L554.666667 294.4c-145.066667-17.066667-298.666667 34.133333-409.6 145.066667-12.8 12.8-34.133333 12.8-46.933334 0-17.066667-12.8-17.066667-34.133333-4.266666-46.933334z m132.266666 153.6C302.933333 469.333333 405.333333 426.666667 512 426.666667l-25.6 68.266666c-76.8 4.266667-153.6 38.4-209.066667 98.133334-12.8 12.8-34.133333 12.8-46.933333 0-17.066667-12.8-17.066667-34.133333-4.266667-46.933334z m443.733334-85.333333l-17.066667 68.266667c34.133333 17.066667 68.266667 38.4 93.866667 68.266666 12.8 12.8 34.133333 12.8 46.933333 0 12.8-12.8 12.8-34.133333 0-46.933333-34.133333-42.666667-76.8-68.266667-123.733333-89.6zM716.8 256l-17.066667 68.266667c64 25.6 128 64 179.2 119.466666 12.8 12.8 34.133333 12.8 46.933334 0 12.8-12.8 12.8-34.133333 0-46.933333-59.733333-68.266667-132.266667-110.933333-209.066667-140.8z"
              fill="''' + getColor(0, color, colors, '#1969f0') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.wangluojiance:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M462.9 858.3c-96 0-192.1-35.4-266.9-106.6C41.5 604.5 35.5 359 182.7 204.5 254 129.6 350.2 87 453.5 84.5c103.3-2.4 201.5 35.4 276.3 106.7 74.9 71.3 117.5 167.5 120 270.8s-35.4 201.5-106.7 276.3c-75.8 79.8-177.9 120-280.2 120z m0.3-730.7c-2.8 0-5.7 0-8.6 0.1-91.8 2.2-177.3 40.1-240.6 106.6C83.2 371.5 88.5 589.6 225.8 720.4S581.2 845.9 712 708.6c63.4-66.5 97-153.7 94.8-245.5-2.2-91.8-40.1-177.3-106.6-240.6-64.5-61.4-148.3-94.9-237-94.9z"
              fill="''' + getColor(0, color, colors, '#1195FE') + '''"
            />
            <path
              d="M862.1 928.3c-17.7 0-35.5-6.5-49.3-19.7l-150.1-143 19.3-15.4c12.6-10 24.3-20.7 34.8-31.7 10.5-11 20.6-23.2 30-36.3l14.5-20.1 150.1 143c13.8 13.1 21.6 30.9 22.1 50s-6.5 37.2-19.6 51c-14.1 14.8-33 22.2-51.8 22.2zM727.8 768l114.8 109.4c11.3 10.8 29.2 10.3 40-1s10.3-29.2-1-40L766.8 727c-6.1 7.4-12.3 14.5-18.7 21.2-6.5 6.8-13.2 13.4-20.3 19.8zM268.8 551.8c-9.8-23.6-15.2-49-15.9-75.3-1.4-56.1 19.2-109.5 58-150.1 1.2-1.3 2.4-2.5 3.7-3.8 38.3-38.3 89.1-60.1 143.5-61.4 30.3-0.7 59.2 5 85.5 16l32.6-32.6c-35.8-17.9-76.3-27.6-119.1-26.6-67.7 1.6-130.7 29.3-177.3 78.6-46.7 49-71.5 113.3-69.9 180.9 0.9 37.8 10 74.1 26.4 106.9l32.5-32.6zM657 390.1c9.9 23.5 15.7 49.1 16.3 76.1 2.8 115.9-89.2 212.5-205.1 215.3-30.1 0.7-59.4-4.9-86.4-16.2l-32.6 32.6c36.7 18.5 77.7 27.8 120 26.8 67.6-1.6 128.5-29.8 172.9-74.2 47.3-47.3 76-113.2 74.3-185.3-0.9-38.7-10.6-75.1-26.9-107.6L657 390.1z"
              fill="''' + getColor(1, color, colors, '#1195FE') + '''"
            />
            <path
              d="M287.283 615.504l188.401-62.199 6.05 18.327-188.4 62.199zM430.89 361.097l188.4-62.199 6.051 18.327-188.4 62.199z"
              fill="''' + getColor(2, color, colors, '#1195FE') + '''"
            />
            <path
              d="M472.411 564.972l-27.36-196.516 19.117-2.661 27.36 196.515z"
              fill="''' + getColor(3, color, colors, '#1195FE') + '''"
            />
            <path
              d="M623.8 314m-33.8 0a33.8 33.8 0 1 0 67.6 0 33.8 33.8 0 1 0-67.6 0Z"
              fill="''' + getColor(4, color, colors, '#FFFFFF') + '''"
            />
            <path
              d="M623.8 360.8c-25.8 0-46.8-21-46.8-46.8 0-25.8 21-46.8 46.8-46.8 25.8 0 46.8 21 46.8 46.8 0 25.8-21 46.8-46.8 46.8z m0-67.5c-11.4 0-20.7 9.3-20.7 20.7 0 11.4 9.3 20.7 20.7 20.7s20.7-9.3 20.7-20.7c0-11.4-9.3-20.7-20.7-20.7z"
              fill="''' + getColor(5, color, colors, '#1195FE') + '''"
            />
            <path
              d="M449.7 363.9m-33.8 0a33.8 33.8 0 1 0 67.6 0 33.8 33.8 0 1 0-67.6 0Z"
              fill="''' + getColor(6, color, colors, '#FFFFFF') + '''"
            />
            <path
              d="M449.7 410.7c-25.8 0-46.8-21-46.8-46.8 0-25.8 21-46.8 46.8-46.8 25.8 0 46.8 21 46.8 46.8 0 25.8-21 46.8-46.8 46.8z m0-67.5c-11.4 0-20.7 9.3-20.7 20.7 0 11.4 9.3 20.7 20.7 20.7 11.4 0 20.7-9.3 20.7-20.7 0-11.5-9.3-20.7-20.7-20.7z"
              fill="''' + getColor(7, color, colors, '#1195FE') + '''"
            />
            <path
              d="M302.4 628.7m-33.8 0a33.8 33.8 0 1 0 67.6 0 33.8 33.8 0 1 0-67.6 0Z"
              fill="''' + getColor(8, color, colors, '#FFFFFF') + '''"
            />
            <path
              d="M302.4 675.5c-25.8 0-46.8-21-46.8-46.8 0-25.8 21-46.8 46.8-46.8 25.8 0 46.8 21 46.8 46.8 0 25.8-21 46.8-46.8 46.8z m0-67.5c-11.4 0-20.7 9.3-20.7 20.7 0 11.4 9.3 20.7 20.7 20.7 11.4 0 20.7-9.3 20.7-20.7 0-11.4-9.3-20.7-20.7-20.7z"
              fill="''' + getColor(9, color, colors, '#1195FE') + '''"
            />
            <path
              d="M474.7 560.5m-33.8 0a33.8 33.8 0 1 0 67.6 0 33.8 33.8 0 1 0-67.6 0Z"
              fill="''' + getColor(10, color, colors, '#FFFFFF') + '''"
            />
            <path
              d="M474.7 607.3c-25.8 0-46.8-21-46.8-46.8s21-46.8 46.8-46.8 46.8 21 46.8 46.8-21 46.8-46.8 46.8z m0-67.5c-11.4 0-20.7 9.3-20.7 20.7 0 11.4 9.3 20.7 20.7 20.7s20.7-9.3 20.7-20.7c0-11.4-9.3-20.7-20.7-20.7z"
              fill="''' + getColor(11, color, colors, '#1195FE') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.zhifupingtai_yinlian:
        svgXml = '''
          <svg viewBox="0 0 1325 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M342.874353 817.543529l87.341176-376.470588h-3.011764c-3.011765 0-7.529412 1.505882-10.541177 3.011765-1.505882 7.529412-6.023529 28.611765-9.035294 37.647059-4.517647 19.576471-4.517647 22.588235-6.023529 33.129411l-1.505883 1.505883h-37.647058l-1.505883-1.505883 9.035294-36.141176c7.529412-33.129412 9.035294-45.176471 12.047059-61.741176l1.505882-1.505883c16.564706-3.011765 21.082353-3.011765 40.658824-6.023529l1.505882 1.505882-3.011764 10.541177c3.011765-1.505882 6.023529-4.517647 9.035294-6.02353 1.505882-1.505882 3.011765-1.505882 6.023529-3.011765l45.176471-191.247058c9.035294-42.164706 51.2-75.294118 91.858823-75.294118h-274.070588c-42.164706 0-82.823529 33.129412-91.858823 75.294118l-138.541177 596.329411c-9.035294 42.164706 16.564706 75.294118 57.223529 75.294118h272.564706c-42.164706 0-67.764706-34.635294-57.223529-75.294118z m-27.105882-313.223529c-13.552941 7.529412-33.129412 12.047059-54.211765 12.047059-16.564706 0-45.176471-3.011765-54.211765-19.576471-4.517647-6.023529-6.023529-12.047059-6.023529-19.57647l3.011764-27.105883 1.505883-7.529411 22.588235-97.882353 1.505882-6.02353s7.529412 1.505882 49.694118 0v1.505883c-4.517647 12.047059-25.6 97.882353-25.6 97.882352l-4.517647 25.6v4.517648c1.505882 12.047059 9.035294 19.576471 22.588235 19.57647 9.035294 0 15.058824-3.011765 22.588236-7.529412 10.541176-9.035294 13.552941-22.588235 18.070588-42.164706 0 0 21.082353-94.870588 21.082353-100.894117 3.011765 0 12.047059 1.505882 42.164706 0v1.505882c-4.517647 12.047059-25.6 102.4-25.6 102.4l-3.011765 9.035294c-3.011765 19.576471-9.035294 40.658824-31.623529 54.211765z"
              fill="''' + getColor(0, color, colors, '#D43634') + '''"
            />
            <path
              d="M669.650824 817.543529l22.588235-99.388235H665.133176c-4.517647 0-7.529412 0-10.541176-1.505882-3.011765-1.505882-6.023529-4.517647-6.023529-7.529412s1.505882-7.529412 3.011764-13.552941l46.682353-153.6h33.129412l-4.517647 16.564706 4.517647-4.517647 9.035294-37.647059h-21.082353v-1.505883c1.505882-6.023529 3.011765-13.552941 4.517647-19.57647l1.505883-9.035294c3.011765-13.552941 6.023529-30.117647 6.023529-36.141177 0-3.011765 1.505882-10.541176-7.529412-10.541176-3.011765 0-7.529412 1.505882-12.047059 3.011765-1.505882 7.529412-6.023529 28.611765-9.035294 37.647058-4.517647 19.576471-4.517647 22.588235-6.023529 33.129412l-1.505882 1.505882h-37.647059l-1.505883-1.505882 9.035294-36.141176c7.529412-33.129412 9.035294-45.176471 10.541177-61.741177l1.505882-1.505882c16.564706-3.011765 21.082353-3.011765 40.658824-6.02353l1.505882 1.505883-3.011765 10.541176c3.011765-1.505882 6.023529-4.517647 9.035295-6.023529 9.035294-4.517647 18.070588-6.023529 24.094117-6.02353 4.517647 0 9.035294 0 13.552941 3.011765l43.670589-191.247059c9.035294-42.164706 51.2-75.294118 93.364706-75.294117h-326.776471c-42.164706 0-82.823529 33.129412-91.858824 75.294117l-43.670588 191.247059c7.529412-3.011765 13.552941-3.011765 18.070588-3.011765 7.529412 0 16.564706 3.011765 21.082353 12.047059 3.011765 9.035294 1.505882 19.576471-3.011764 39.152941l-3.011765 10.541177c-4.517647 22.588235-6.023529 27.105882-7.529412 42.164706l-4.517647 4.517647h-37.647059v-1.505883c1.505882-6.023529 3.011765-13.552941 4.517647-19.57647l1.505883-9.035294c3.011765-13.552941 6.023529-30.117647 6.023529-36.141177 0-3.011765 1.505882-9.035294-4.517647-10.541176l-87.341176 376.470588c-9.035294 42.164706 16.564706 75.294118 57.223529 75.294118h328.282353c-40.658824 1.505882-66.258824-33.129412-57.223529-73.788236z m12.047058-263.529411l-7.529411 24.094117h-52.705883l-6.023529 4.517647c-3.011765 3.011765-3.011765 1.505882-6.02353 3.011765s-9.035294 4.517647-18.070588 4.517647h-16.564706l7.529412-22.588235h4.517647c4.517647 0 7.529412 0 9.035294-1.505883 1.505882-1.505882 3.011765-3.011765 6.02353-7.529411l9.035294-18.070589h39.152941l-6.023529 13.552942h37.647058z m-140.047058-124.988236l-7.529412 30.117647c-1.505882 6.023529-3.011765 13.552941-4.517647 19.576471-3.011765 13.552941-4.517647 19.576471-6.02353 22.588235-1.505882 3.011765-1.505882 6.023529-3.011764 13.552941h-43.670589c1.505882-7.529412 3.011765-10.541176 4.517647-13.552941s1.505882-6.023529 4.517647-13.552941c3.011765-10.541176 4.517647-18.070588 6.02353-25.6 1.505882-6.023529 4.517647-24.094118 6.023529-30.117647-1.505882-4.517647 1.505882-9.035294 7.529412-13.552941 9.035294-6.023529 22.588235-7.529412 31.623529-3.011765 6.023529 3.011765 7.529412 9.035294 4.517648 13.552941z m7.529411 34.635294c3.011765-13.552941 9.035294-28.611765 19.576471-39.152941 16.564706-15.058824 36.141176-15.058824 45.17647-15.058823 13.552941 0 28.611765 3.011765 36.141177 13.552941 4.517647 6.023529 9.035294 18.070588 4.517647 40.658823-1.505882 7.529412-6.023529 24.094118-16.564706 34.635295-13.552941 13.552941-30.117647 18.070588-48.188235 18.070588-6.023529 0-16.564706-1.505882-24.094118-4.517647-22.588235-9.035294-19.576471-33.129412-16.564706-48.188236z m81.317647 254.494118h-43.670588c-3.011765 0-6.023529 0-10.541176-1.505882-3.011765-1.505882-6.023529-3.011765-7.529412-4.517647-1.505882-3.011765-4.517647-4.517647-3.011765-10.541177l12.047059-42.164706h-21.082353l7.529412-24.094117h21.082353l6.023529-19.576471h-21.082353l7.529412-22.588235h94.870588l-7.529412 22.588235h-37.647058l-6.02353 19.576471h39.152941l-6.023529 24.094117h-39.152941l-9.035294 31.62353c-1.505882 3.011765 9.035294 4.517647 13.552941 4.517647l19.57647-3.011765-9.035294 25.6z"
              fill="''' + getColor(1, color, colors, '#034582') + '''"
            />
            <path
              d="M723.862588 566.061176l-7.529412 25.6s3.011765-1.505882 6.02353-4.517647l4.517647-21.082353h-3.011765z m-129.505882-72.282352c4.517647 0 7.529412-3.011765 10.541176-7.529412 4.517647-6.023529 7.529412-21.082353 9.035294-24.094118 4.517647-18.070588 3.011765-28.611765-6.023529-28.611765-12.047059 0-16.564706 15.058824-21.082353 31.62353-1.505882 6.023529-3.011765 12.047059-3.011765 16.564706 3.011765 12.047059 10.541176 12.047059 10.541177 12.047059z m94.870588 189.741176c-1.505882 4.517647-1.505882 7.529412-1.505882 7.529412 1.505882 1.505882 3.011765 3.011765 4.517647 3.011764h4.517647l13.552941-58.729411h-7.529412l-13.552941 48.188235z m24.094118-81.317647l-3.011765 10.541176h7.529412l3.011765-10.541176h-7.529412z"
              fill="''' + getColor(2, color, colors, '#034582') + '''"
            />
            <path
              d="M967.815529 493.778824c4.517647 0 12.047059-3.011765 15.058824-7.529412 1.505882-1.505882 3.011765-6.023529 4.517647-9.035294 1.505882-4.517647 3.011765-10.541176 3.011765-15.058824 1.505882-3.011765 1.505882-6.023529 1.505882-9.035294 1.505882-12.047059-3.011765-19.576471-10.541176-19.576471-12.047059 0-16.564706 15.058824-21.082353 31.62353-1.505882 6.023529-3.011765 12.047059-3.011765 16.564706 3.011765 12.047059 10.541176 12.047059 10.541176 12.047059z m-203.294117 118.964705l3.011764-10.541176h-48.188235l-3.011765 10.541176h40.658824c6.023529 0 7.529412 1.505882 7.529412 0z"
              fill="''' + getColor(3, color, colors, '#107C84') + '''"
            />
            <path
              d="M1198.215529 147.425882h-296.658823c-42.164706 0-82.823529 33.129412-93.364706 75.294118l-43.670588 191.247059c3.011765 1.505882 6.023529 4.517647 7.529412 9.035294 3.011765 9.035294 1.505882 19.576471-3.011765 39.152941l-3.011765 10.541177c-4.517647 22.588235-6.023529 27.105882-7.529412 42.164705l-1.505882 1.505883h-16.564706l-9.035294 37.647059c3.011765-3.011765 9.035294-6.023529 12.047059-7.529412 7.529412-3.011765 24.094118-6.023529 24.094117-6.02353h52.705883l-18.070588 60.235295c-3.011765 10.541176-6.023529 16.564706-9.035295 19.57647-1.505882 3.011765-4.517647 6.023529-9.035294 9.035294-4.517647 3.011765-9.035294 4.517647-12.047058 4.517647h-60.235295l-13.552941 58.729412 18.070588-1.505882-7.529411 27.105882h-15.058824l-24.094117 99.388235c-9.035294 42.164706 16.564706 75.294118 57.223529 75.294118h296.658823c42.164706 0 82.823529-33.129412 93.364706-75.294118l138.541177-594.823529c9.035294-42.164706-16.564706-75.294118-57.22353-75.294118z m-212.329411 263.529412c6.023529 3.011765 10.541176 6.023529 13.552941 10.541177v-4.517647l1.505882-1.505883c18.070588-3.011765 22.588235-3.011765 42.164706-6.023529v1.505882c-3.011765 13.552941-7.529412 28.611765-10.541176 42.164706-7.529412 30.117647-9.035294 45.176471-12.047059 60.235294l-1.505883 1.505882h-39.152941l-1.505882-1.505882c0-1.505882 1.505882-4.517647 1.505882-6.023529-6.023529 4.517647-12.047059 9.035294-19.57647 9.035294s-13.552941-1.505882-21.082353-4.517647c-22.588235-9.035294-19.576471-34.635294-16.564706-48.188236 3.011765-13.552941 9.035294-28.611765 19.57647-39.152941 16.564706-13.552941 34.635294-16.564706 43.670589-13.552941z m-204.8 105.411765l28.611764-118.964706 12.047059-54.211765s1.505882-4.517647 1.505883-6.023529c6.023529 0 18.070588 1.505882 51.2 0h12.047058c25.6 0 46.682353 0 58.729412 15.058823 4.517647 6.023529 6.023529 13.552941 6.02353 21.082353 0 6.023529-1.505882 12.047059-1.505883 16.564706-4.517647 19.576471-15.058824 36.141176-28.611765 46.682353-21.082353 16.564706-49.694118 16.564706-73.788235 16.564706h-3.011765l-3.011764 3.011765c0 1.505882-6.023529 24.094118-6.02353 24.094117s-6.023529 31.623529-7.529411 37.647059c-7.529412-1.505882-19.576471-1.505882-46.682353-1.505882z m10.541176 137.035294c-1.505882 4.517647-3.011765 7.529412-6.023529 10.541176-3.011765 3.011765-7.529412 6.023529-18.070589 6.02353h-18.070588v16.564706c0 4.517647 1.505882 4.517647 1.505883 4.517647s1.505882 1.505882 3.011764 1.505882h6.02353l18.070588-1.505882-9.035294 27.105882h-19.576471c-13.552941 0-24.094118 0-28.611764-3.011765-3.011765-1.505882-4.517647-4.517647-3.011765-9.035294l1.505882-64.752941h31.62353v13.552941h7.529411c3.011765 0 4.517647 0 6.02353-1.505882 1.505882-1.505882 1.505882-1.505882 1.505882-3.011765l3.011765-10.541176h25.6l-3.011765 13.552941z m111.435294 64.752941h-34.635294l3.011765-7.529412h-69.270588l7.529411-22.588235h7.529412l36.141177-121.976471 7.529411-24.094117h34.635294l-3.011764 12.047059s9.035294-6.023529 18.070588-9.035294c7.529412-1.505882 43.670588-3.011765 55.717647-3.011765h37.647059v13.552941c0 3.011765 1.505882 3.011765 6.023529 3.011765h6.02353l-6.02353 24.094117h-19.57647c-18.070588 1.505882-24.094118-6.023529-24.094118-15.058823v-13.552941l-3.011765 12.047058h-12.047058l-36.141177 120.470589h9.035294l-7.529412 24.094117h-10.541176l-3.011765 7.529412z m155.105883-106.917647h-37.647059l-6.02353 19.576471h37.647059l-6.023529 19.57647h-40.658824l-7.529412 9.035294h16.564706l4.517647 25.6c0 3.011765 0 4.517647 1.505883 6.02353 1.505882 1.505882 6.023529 1.505882 9.035294 1.505882h4.517647l-7.529412 25.6h-21.082353c-4.517647 0-6.023529-3.011765-9.035294-4.517647-3.011765-1.505882-6.023529-4.517647-6.023529-9.035294l-4.517647-25.6-18.070589 25.6c-6.023529 7.529412-13.552941 13.552941-27.105882 13.552941h-25.6l7.529412-22.588235h10.541176c3.011765 0 6.023529-1.505882 7.529412-1.505883 1.505882-1.505882 3.011765-1.505882 6.023529-4.517647l27.105883-37.647058h-36.141177l6.02353-21.082353h40.658823l6.02353-19.576471h-40.658824l7.529412-22.588235h112.941176l-12.047058 22.588235z m24.094117-70.776471l-1.505882 1.505883-15.058824 25.6c-4.517647 9.035294-13.552941 15.058824-27.105882 15.058823h-22.588235l7.529411-22.588235h4.517648c3.011765 0 4.517647 0 6.023529-1.505882 1.505882 0 1.505882-1.505882 3.011765-3.011765l7.529411-13.552941c12.047059-18.070588 15.058824-25.6 27.105883-45.176471-1.505882-22.588235-3.011765-30.117647-4.517647-43.670588-1.505882-9.035294-3.011765-18.070588-3.011765-27.105882-1.505882-18.070588-1.505882-15.058824-4.517647-27.105883v-1.505882l1.505882-1.505882c18.070588-1.505882 18.070588-3.011765 37.647059-6.02353l1.505882 1.505883 3.011765 49.694117v3.011765c10.541176-22.588235 10.541176-16.564706 22.588235-45.176471v-1.505882l1.505883-1.505882c16.564706-1.505882 19.576471-3.011765 39.152941-6.02353l1.505882 1.505883c-1.505882 0-75.294118 128-85.835294 149.082352z"
              fill="''' + getColor(4, color, colors, '#107C84') + '''"
            />
            <path
              d="M775.062588 579.614118l4.517647-13.552942h-51.2l-4.517647 21.082353c7.529412-4.517647 15.058824-7.529412 22.588236-7.529411h28.611764z m105.411765-159.62353c10.541176-4.517647 18.070588-15.058824 19.576471-27.105882 3.011765-13.552941-1.505882-22.588235-10.541177-27.105882l-25.6-1.505883h-4.517647V368.790588l-12.047059 52.705883v3.011764h6.02353c9.035294 0 19.576471 0 27.105882-4.517647z m-28.611765 266.541177h28.611765l7.529412-27.105883h-28.611765l-7.529412 27.105883z m36.141177-120.470589l-9.035294 30.117648s10.541176-4.517647 16.564705-6.02353c6.023529-1.505882 15.058824-1.505882 15.058824-1.505882l6.023529-22.588236h-28.611764z m-24.094118 76.8s10.541176-6.023529 16.564706-7.529411c6.023529-1.505882 15.058824-3.011765 15.058823-3.011765l7.529412-22.588235h-28.611764l-10.541177 33.129411z"
              fill="''' + getColor(5, color, colors, '#107C84') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.shangchuan_shangchuantupian:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M256.111993 608.601962c61.628148 0 122.808324 17.790888 183.220549 52.796701 88.122492-119.67252 198.387601-180.788701 328.747453-180.788701 80.122992 0 142.071121 0 191.860009 41.213424V217.522405C959.940004 168.181489 919.750516 127.992 870.345603 127.992h-716.755202A89.5944 89.5944 0 0 0 63.996 217.586401v489.569402c47.165052-64.95594 111.929004-98.489844 192.179989-98.489845z m95.994-159.99a95.994 95.994 0 1 0 0-191.988001 95.994 95.994 0 0 0 0 191.988001z m0 63.996a159.990001 159.990001 0 1 1 0-319.980001 159.990001 159.990001 0 0 1 0 319.980001zM1023.936004 619.097306a254.448097 254.448097 0 0 0-112.63296-41.469408c-38.909568-33.021936-81.27492-33.021936-143.223049-33.021936-116.664708 0-213.682645 58.23636-293.357665 177.716893l-17.726892 26.622336-26.622336-17.726892c-58.940316-39.293544-116.920692-58.620336-174.261109-58.620336-72.699456 0-125.880132 53.564652-163.317793 128.439972l-14.335104 28.606212-14.207112-7.103556A89.5944 89.5944 0 0 0 153.590401 905.031436h425.893381c6.783576 22.782576 16.63896 44.285232 29.182176 63.996H153.590401a153.590401 153.590401 0 0 1-153.590401-153.590401V217.586401A153.590401 153.590401 0 0 1 153.590401 63.996h716.691206A153.654397 153.654397 0 0 1 1023.936004 217.586401v401.510905z"
              fill="''' + getColor(0, color, colors, '#333333') + '''"
            />
            <path
              d="M796.366227 796.430223v-142.199112a28.414224 28.414224 0 0 1 56.892444 0v142.199112h142.199113a28.414224 28.414224 0 0 1 0 56.828448h-142.199113v142.263109a28.414224 28.414224 0 0 1-56.95644 0v-142.263109h-142.135116a28.414224 28.414224 0 0 1 0-56.828448h142.199112z"
              fill="''' + getColor(1, color, colors, '#333333') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.dengdai:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M512 1024C229.241263 1024 0 794.758737 0 512 0 229.241263 229.241263 0 512 0 794.758737 0 1024 229.241263 1024 512 1024 794.758737 794.758737 1024 512 1024ZM512 53.894737C258.991158 53.894737 53.894737 258.991158 53.894737 512 53.894737 765.008842 258.991158 970.105263 512 970.105263 765.008842 970.105263 970.105263 765.008842 970.105263 512 970.105263 258.991158 765.008842 53.894737 512 53.894737ZM736.660211 616.474947 501.517474 536.818526C501.517474 536.818526 501.517474 536.818526 501.490526 536.818526L497.987368 535.632842C488.016842 529.866105 483.301053 518.709895 485.052632 507.984842L485.052632 188.631579C485.052632 173.756632 497.125053 161.684211 512 161.684211 526.874947 161.684211 538.947368 173.756632 538.947368 188.631579L538.947368 493.702737 763.607579 569.802105C776.488421 577.239579 780.907789 593.731368 773.470316 606.612211 766.005895 619.493053 749.541053 623.912421 736.660211 616.474947Z"
              fill="''' + getColor(0, color, colors, '#272636') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.dengdai_1:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M509.2 129.9c209.6-1.3 381.2 168.2 382.5 377.8S723.6 888.8 514 890.1 132.8 722 131.5 512.4s168.1-381.2 377.7-382.5m-0.4-66.1c-246.4 1.5-444.9 202.5-443.4 449s202.5 444.9 449 443.4c246.4-1.5 444.9-202.5 443.4-449S755.3 62.3 508.8 63.8z"
              fill="''' + getColor(0, color, colors, '#231F20') + '''"
            />
            <path
              d="M485.2 234.4c-16.1 0.1-29.1 13.3-29 29.4l1.8 285.7c0.1 16.1 13.3 29.1 29.4 29l285.7-1.8c16.1-0.1 29.1-13.3 29-29.4-0.1-16.1-13.3-29.1-29.4-29l-256.5 1.6-1.6-256.5c-0.1-16.1-13.4-29.1-29.4-29z"
              fill="''' + getColor(1, color, colors, '#231F20') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.dengbaoerji_01:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M469.459627 967.036906a12.105627 12.105627 0 0 1-5.117008-1.201042C449.109932 958.44055 91.546445 783.682907 91.546445 605.881175V101.306413a11.90976 11.90976 0 0 1 12.72995-11.858073c16.433728 1.301695 35.801371 2.502736 54.955465 2.502736C280.558803 91.951076 392.854133 58.540906 459.448682 2.720366a12.062101 12.062101 0 0 1 7.614303-2.720366h4.681749a12.304213 12.304213 0 0 1 7.618384 2.720366c66.590468 55.932076 178.891239 89.23071 300.218182 89.23071 19.042559 0 37.649859-1.201041 54.948663-2.614271a11.629563 11.629563 0 0 1 8.92688 3.155624 11.953286 11.953286 0 0 1 3.809872 8.702449v504.574762c0 207.943382-358.223176 354.195675-373.455863 360.283853a9.794676 9.794676 0 0 1-4.351225 0.983413zM115.157858 114.037724v491.843451c0 152.777089 312.40678 315.127145 354.737027 336.343276 42.766867-18.172042 353.865151-156.58016 353.865151-336.343276V114.037724c-14.14318 0.979332-28.94605 1.742394-44.067201 1.742394-123.723585 0-238.962351-33.732533-310.233208-90.536486C398.18741 82.046225 282.950005 115.780118 159.23186 115.780118c-15.126593 0-30.253185-0.764423-44.074002-1.742394z m0 0"
              fill="''' + getColor(0, color, colors, '#596F89') + '''"
            />
            <path
              d="M269.89497 239.286074c83.024196 0 155.715084-23.724308 198.039892-59.200595h3.04953c42.324807 35.476287 115.015695 59.200595 198.039891 59.200595 12.300133 0 24.158206-0.765783 36.01764-1.6363v324.705552c0 130.248382-235.582296 224.808289-235.582296 224.808289s-235.476202-113.926189-235.476202-224.919823v-324.594018c11.751979 0.870517 23.829042 1.6363 35.911545 1.6363z m0 0"
              fill="''' + getColor(1, color, colors, '#64C4FF') + '''"
            />
            <path
              d="M470.984392 180.085479h-1.524765v606.972042s235.582296-94.559906 235.582296-224.813729v-324.594018c-11.859434 0.870517-23.717507 1.6363-36.01764 1.6363-82.912661 0-155.715084-23.616854-198.039891-59.200595z m0 0"
              fill="''' + getColor(2, color, colors, '#0072D8') + '''"
            />
            <path
              d="M637.197367 539.243101v60.823293H312.60879V539.244461zM607.191735 331.60576v58.334158H342.604901v-58.334158z m0 0"
              fill="''' + getColor(3, color, colors, '#FFFFFF') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.fuzhi:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M394.666667 106.666667h448a74.666667 74.666667 0 0 1 74.666666 74.666666v448a74.666667 74.666667 0 0 1-74.666666 74.666667H394.666667a74.666667 74.666667 0 0 1-74.666667-74.666667V181.333333a74.666667 74.666667 0 0 1 74.666667-74.666666z m0 64a10.666667 10.666667 0 0 0-10.666667 10.666666v448a10.666667 10.666667 0 0 0 10.666667 10.666667h448a10.666667 10.666667 0 0 0 10.666666-10.666667V181.333333a10.666667 10.666667 0 0 0-10.666666-10.666666H394.666667z m245.333333 597.333333a32 32 0 0 1 64 0v74.666667a74.666667 74.666667 0 0 1-74.666667 74.666666H181.333333a74.666667 74.666667 0 0 1-74.666666-74.666666V394.666667a74.666667 74.666667 0 0 1 74.666666-74.666667h74.666667a32 32 0 0 1 0 64h-74.666667a10.666667 10.666667 0 0 0-10.666666 10.666667v448a10.666667 10.666667 0 0 0 10.666666 10.666666h448a10.666667 10.666667 0 0 0 10.666667-10.666666v-74.666667z"
              fill="''' + getColor(0, color, colors, '#1296db') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.yanjing_xianshi_o:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M512 298.666667c-162.133333 0-285.866667 68.266667-375.466667 213.333333 89.6 145.066667 213.333333 213.333333 375.466667 213.333333s285.866667-68.266667 375.466667-213.333333c-89.6-145.066667-213.333333-213.333333-375.466667-213.333333z m0 469.333333c-183.466667 0-328.533333-85.333333-426.666667-256 98.133333-170.666667 243.2-256 426.666667-256s328.533333 85.333333 426.666667 256c-98.133333 170.666667-243.2 256-426.666667 256z m0-170.666667c46.933333 0 85.333333-38.4 85.333333-85.333333s-38.4-85.333333-85.333333-85.333333-85.333333 38.4-85.333333 85.333333 38.4 85.333333 85.333333 85.333333z m0 42.666667c-72.533333 0-128-55.466667-128-128s55.466667-128 128-128 128 55.466667 128 128-55.466667 128-128 128z"
              fill="''' + getColor(0, color, colors, '#ffffff') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.yanjing_yincang_o:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M332.8 729.6l34.133333-34.133333c42.666667 12.8 93.866667 21.333333 145.066667 21.333333 162.133333 0 285.866667-68.266667 375.466667-213.333333-46.933333-72.533333-102.4-128-166.4-162.133334l29.866666-29.866666c72.533333 42.666667 132.266667 106.666667 183.466667 192-98.133333 170.666667-243.2 256-426.666667 256-59.733333 4.266667-119.466667-8.533333-174.933333-29.866667z m-115.2-64c-51.2-38.4-93.866667-93.866667-132.266667-157.866667 98.133333-170.666667 243.2-256 426.666667-256 38.4 0 76.8 4.266667 110.933333 12.8l-34.133333 34.133334c-25.6-4.266667-46.933333-4.266667-76.8-4.266667-162.133333 0-285.866667 68.266667-375.466667 213.333333 34.133333 51.2 72.533333 93.866667 115.2 128l-34.133333 29.866667z m230.4-46.933333l29.866667-29.866667c8.533333 4.266667 21.333333 4.266667 29.866666 4.266667 46.933333 0 85.333333-38.4 85.333334-85.333334 0-12.8 0-21.333333-4.266667-29.866666l29.866667-29.866667c12.8 17.066667 17.066667 38.4 17.066666 64 0 72.533333-55.466667 128-128 128-17.066667-4.266667-38.4-12.8-59.733333-21.333333zM384 499.2c4.266667-68.266667 55.466667-119.466667 123.733333-123.733333 0 4.266667-123.733333 123.733333-123.733333 123.733333zM733.866667 213.333333l29.866666 29.866667-512 512-34.133333-29.866667L733.866667 213.333333z"
              fill="''' + getColor(0, color, colors, '#ffffff') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.erweima:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M597.333333 597.333333h85.333334v-85.333333h85.333333v128h-85.333333v42.666667h-85.333334v-42.666667h-85.333333v-128h85.333333v85.333333z m-384-85.333333h256v256H213.333333v-256z m85.333334 85.333333v85.333334h85.333333v-85.333334H298.666667zM213.333333 213.333333h256v256H213.333333V213.333333z m85.333334 85.333334v85.333333h85.333333V298.666667H298.666667z m213.333333-85.333334h256v256h-256V213.333333z m85.333333 85.333334v85.333333h85.333334V298.666667h-85.333334z m85.333334 384h85.333333v85.333333h-85.333333v-85.333333z m-170.666667 0h85.333333v85.333333h-85.333333v-85.333333z"
              fill="''' + getColor(0, color, colors, '#ffffff') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.meiyuan:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M554.666667 810.666667v42.666666h-85.333334v-42.666666c-93.866667 0-170.666667-76.8-170.666666-170.666667h85.333333c0 46.933333 38.4 85.333333 85.333333 85.333333v-170.666666c-93.866667 0-170.666667-76.8-170.666666-170.666667s76.8-170.666667 170.666666-170.666667V170.666667h85.333334v42.666666c93.866667 0 170.666667 76.8 170.666666 170.666667h-85.333333c0-46.933333-38.4-85.333333-85.333333-85.333333v170.666666h17.066666c29.866667 0 68.266667 17.066667 98.133334 42.666667 34.133333 29.866667 59.733333 76.8 59.733333 128-4.266667 93.866667-81.066667 170.666667-174.933333 170.666667z m0-85.333334c46.933333 0 85.333333-38.4 85.333333-85.333333s-38.4-85.333333-85.333333-85.333333v170.666666zM469.333333 298.666667c-46.933333 0-85.333333 38.4-85.333333 85.333333s38.4 85.333333 85.333333 85.333333V298.666667z"
              fill="''' + getColor(0, color, colors, '#ffffff') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.arrowswap:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M128 656l0 96c0 8.8 7.2 16 16 16l496 0 0 128 256-192-256-192 0 128L144 640C135.2 640 128 647.2 128 656z"
              fill="''' + getColor(0, color, colors, '#ffffff') + '''"
            />
            <path
              d="M896 368l0-96c0-8.8-7.2-16-16-16L384 256 384 128 128 320l256 192 0-128 496 0C888.8 384 896 376.8 896 368z"
              fill="''' + getColor(1, color, colors, '#ffffff') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.email:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M853.333333 341.333333 512 554.666667 170.666667 341.333333 170.666667 256 512 469.333333 853.333333 256M853.333333 170.666667 170.666667 170.666667C123.306667 170.666667 85.333333 208.64 85.333333 256L85.333333 768C85.333333 814.933333 123.733333 853.333333 170.666667 853.333333L853.333333 853.333333C900.266667 853.333333 938.666667 814.933333 938.666667 768L938.666667 256C938.666667 208.64 900.266667 170.666667 853.333333 170.666667Z"
              fill="''' + getColor(0, color, colors, '#272636') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.email_1:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M741.12 305.737143H276.114286L511.817143 528.457143z"
              fill="''' + getColor(0, color, colors, '#353535') + '''"
            />
            <path
              d="M524.8 566.857143a18.651429 18.651429 0 0 1-25.417143 0.182857l-62.72-59.245714L256 668.525714v49.737143h512v-49.737143l-181.577143-161.645714L524.8 566.857143zM256 337.005714v282.514286l153.965714-136.96zM768 619.52V330.788571l-155.245714 150.491429z"
              fill="''' + getColor(1, color, colors, '#353535') + '''"
            />
            <path
              d="M512 9.142857C234.24 9.142857 9.142857 234.24 9.142857 512S234.24 1014.857143 512 1014.857143 1014.857143 789.76 1014.857143 512 789.76 9.142857 512 9.142857z m292.571429 727.405714c0 10.057143-8.228571 18.285714-18.285715 18.285715H237.714286c-10.057143 0-18.285714-8.228571-18.285715-18.285715V287.451429c0-10.057143 8.228571-18.285714 18.285715-18.285715h548.571428c10.057143 0 18.285714 8.228571 18.285715 18.285715v449.097142z"
              fill="''' + getColor(2, color, colors, '#353535') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.qianfuhao:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M767.296477 164.746158l-93.858668 0L567.905264 359.196849c-28.14399 52.696176-45.358047 87.723947-51.643194 105.084337l-1.797949 0c-18.565844-42.214451-70.955028-142.055366-157.177785-299.534004L258.040984 164.747181l184.571692 317.04789L291.272853 481.795071l0 70.055542 177.385013 0 0 96.55201L291.272853 648.402623l0 70.954005 177.385013 0 0 140.562363 88.017636 0L556.675502 719.355605l171.09782 0 0-70.954005-171.096796 0 0-96.55201 171.09782 0 0-70.055542L580.929906 481.794048 767.296477 164.746158 767.296477 164.746158z"
              fill="''' + getColor(0, color, colors, '#272536') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.qrcode:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M224 416.096V224l192-0.096 0.096 192.096L224 416.096zM416.096 160H223.904A64 64 0 0 0 160 223.904v192.192A64 64 0 0 0 223.904 480h192.192A64 64 0 0 0 480 416.096V223.904A64 64 0 0 0 416.096 160zM224 800.096V608l192-0.096 0.096 192.096L224 800.096zM416.096 544H223.904A64 64 0 0 0 160 607.904v192.192A64 64 0 0 0 223.904 864h192.192A64 64 0 0 0 480 800.096v-192.192A64 64 0 0 0 416.096 544zM608 416.096V224l192-0.096 0.096 192.096-192.096 0.096zM800.096 160h-192.192A64 64 0 0 0 544 223.904v192.192A64 64 0 0 0 607.904 480h192.192A64 64 0 0 0 864 416.096V223.904A64 64 0 0 0 800.096 160zM704 608a32 32 0 0 0-32 32v192a32 32 0 0 0 64 0v-192a32 32 0 0 0-32-32M576 608a32 32 0 0 0-32 32v192a32 32 0 0 0 64 0v-192a32 32 0 0 0-32-32M832 544a32 32 0 0 0-32 32v256a32 32 0 0 0 64 0v-256a32 32 0 0 0-32-32"
              fill="''' + getColor(0, color, colors, '#3E3A39') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.jiaoyi_1:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M935.424 454.656h-893.44c-14.336 0-25.6-11.264-25.6-25.6s11.264-25.6 25.6-25.6h893.44c12.8 0 18.944-6.144 20.48-9.728 0.512-1.024 1.024-3.584-4.608-7.68l-404.48-283.136c-11.776-8.192-14.336-24.064-6.144-35.84 8.192-11.776 24.064-14.336 35.84-6.144l404.48 283.136c22.528 15.872 31.744 40.448 24.064 65.024-8.704 27.136-36.864 45.568-69.632 45.568zM462.336 967.168c-5.12 0-10.24-1.536-14.848-4.608l-404.48-283.136c-22.528-15.872-31.744-40.448-24.064-65.024 8.704-27.136 36.352-45.568 69.12-45.568h893.44c14.336 0 25.6 11.264 25.6 25.6s-11.264 25.6-25.6 25.6h-893.44c-12.8 0-18.944 6.144-20.48 9.728-0.512 1.024-1.024 3.584 4.608 7.68l404.48 283.136c11.776 8.192 14.336 24.064 6.144 35.84-4.608 7.168-12.288 10.752-20.48 10.752z"
              fill="''' + getColor(0, color, colors, '#012733') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.changjianwenti:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M512 0.0125c-282.6875 0-512 229.0625-512 511.75 0 282.95 229.3125 512.2625 512 512.2625 282.875 0 512-229.3125 512-512.2625C1024 229.0625 794.875 0.0125 512 0.0125zM512 852.8125c-32.25 0-58.3625-26.1125-58.3625-58.3625s26.175-58.3625 58.3625-58.3625c32.1875 0 58.3625 26.1125 58.3625 58.3625S544.25 852.8125 512 852.8125zM615.8625 537.2875c-29.825 19.5875-39.875 42.1125-39.875 66.05l0 100.675-115.5875 0-12.4125 0 0-143.3c0-39.1 17.4125-65.6625 54.725-89.6l68.475-43.4625c40.7-27.9625 37.3125-84.2875 11.7125-109.25-22.4-21.825-66.4375-34.4375-106.5625-26.3-73.6 14.85-92.35 69.1875-92.35 120.7l0 35.2-87.675 0c0-128 10.75-146.8125 61.375-202.175 56.3875-61.8875 136.125-78.2125 209.5375-63.0375s161.025 86.85 161.025 191.1C728.25 478.15 645.6875 517.775 615.8625 537.2875z"
              fill="''' + getColor(0, color, colors, '#69A6F2') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.caozuojiaocheng:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M512 512m-512 0a512 512 0 1 0 1024 0 512 512 0 1 0-1024 0Z"
              fill="''' + getColor(0, color, colors, '#51CEFA') + '''"
            />
            <path
              d="M789.794133 372.48h0.068267V720.554667a55.569067 55.569067 0 0 1-55.466667 55.466666H371.968c-38.570667 0-70.826667-30.190933-79.1552-70.5536-0.0512-0.597333-2.218667-16.622933-2.218667-19.5072v-290.986666a118.357333 118.357333 0 0 1 118.203734-118.2208h285.4912c10.888533 0 19.626667 8.874667 19.626666 19.694933v317.1328a19.626667 19.626667 0 0 1-19.626666 19.6096h-322.389334c-22.801067 0-42.069333 23.773867-42.069333 51.797333 0 32.887467 27.2896 51.712 50.722133 51.780267h353.774934a16.145067 16.145067 0 0 0 16.145066-16.162133V372.497067c0-25.668267 39.304533-26.794667 39.304534 0v-0.017067z m-95.4368 292.864c27.648 0 25.344 39.338667 0 39.338667H419.447467c-25.787733 0-27.101867-39.3216 0-39.3216h274.944-0.034134z"
              fill="''' + getColor(1, color, colors, '#FFFFFF') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.qianbaojilu:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M950.855105 873.177557v-721.918453A150.673963 150.673963 0 0 0 801.058855 0H222.938951A150.673963 150.673963 0 0 0 73.1427 151.332247v721.333312A150.673963 150.673963 0 0 0 222.938951 1023.997806h578.119904c82.651251 0.438856 149.79625-67.291284 149.79625-150.820249z"
              fill="''' + getColor(0, color, colors, '#F33B3D') + '''"
              opacity=".7"
            />
            <path
              d="M392.044874 408.867695H215.405253a36.717636 36.717636 0 0 0-26.331372 10.898263 37.522205 37.522205 0 0 0-10.751977 26.5508c0 20.84567 16.457108 37.449063 37.083349 37.449063H392.044874a36.717636 36.717636 0 0 0 26.331372-10.898263 37.522205 37.522205 0 0 0 10.751977-26.5508 37.083349 37.083349 0 0 0-37.083349-37.449063zM490.056093 283.647392H215.405253a36.717636 36.717636 0 0 0-26.331372 10.898263 37.522205 37.522205 0 0 0-10.751977 26.5508c0 20.84567 16.457108 37.449063 37.083349 37.449062h275.235981a36.717636 36.717636 0 0 0 26.331372-10.898262 37.741633 37.741633 0 0 0-26.770228-63.999863z m153.599671-125.220303H213.576685a36.717636 36.717636 0 0 0-26.331372 10.898262 37.522205 37.522205 0 0 0-10.751977 26.550801c0 20.84567 16.383965 37.449063 37.083349 37.449062H643.655764a36.717636 36.717636 0 0 0 26.331372-10.898262 37.668491 37.668491 0 0 0-26.331372-63.999863z"
              fill="''' + getColor(1, color, colors, '#FFFFFF') + '''"
            />
            <path
              d="M548.423968 798.718288a168.959638 168.959638 0 0 0 168.081925 169.764208 168.959638 168.959638 0 0 0 168.155068-169.764208 168.959638 168.959638 0 0 0-168.155068-169.83735 168.959638 168.959638 0 0 0-168.081925 169.83735z"
              fill="''' + getColor(2, color, colors, '#F33B3D') + '''"
              opacity=".7"
            />
            <path
              d="M780.432613 819.125102c5.119989 0 9.362266 1.90171 12.653688 5.193132 3.291422 3.291422 5.119989 8.045697 5.119989 12.799972 0 9.947407-7.972554 17.993104-18.285676 17.993104h-45.055903v38.034205c0 9.874265-8.045697 17.993104-17.846819 17.993104h-2.852565a17.919962 17.919962 0 0 1-17.846819-18.066247v-37.961062h-43.666192a17.554248 17.554248 0 0 1-17.846819-17.993104c0-9.947407 8.045697-17.993104 17.846819-17.993104h43.666192v-20.918812h-43.666192a17.554248 17.554248 0 0 1-17.846819-17.993105c0-9.947407 8.045697-17.993104 17.846819-17.993104h37.595348l-43.227336-43.666192a18.13939 18.13939 0 0 1 0-25.599945l1.90171-1.901711a17.700533 17.700533 0 0 1 25.307374 0l41.325626 41.69134 41.325626-41.69134a17.700533 17.700533 0 0 1 25.380517 0l1.90171 1.901711a18.13939 18.13939 0 0 1 0 25.599945l-43.227336 43.666192h38.985059c9.874265 0 18.285675 8.045697 18.285676 17.993104s-7.972554 17.993104-18.285676 17.993105h-45.055903v20.918812h45.49476z"
              fill="''' + getColor(3, color, colors, '#FFFFFF') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.anquanzhongxin:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M512 512m-512 0a512 512 0 1 0 1024 0 512 512 0 1 0-1024 0Z"
              fill="''' + getColor(0, color, colors, '#3598FE') + '''"
            />
            <path
              d="M324.408781 655.018925C505.290126 655.018925 651.918244 508.387706 651.918244 327.509463c0-152.138029-103.733293-280.047334-244.329811-316.853972C205.813923 52.463528 47.497011 213.017581 8.987325 415.981977 47.587706 553.880127 174.183098 655.018925 324.408781 655.018925z"
              fill="''' + getColor(1, color, colors, '#FFFFFF') + '''"
              fill-opacity=".2"
            />
            <path
              d="M512 1024c282.766631 0 512-229.233369 512-512 0-31.765705-2.891385-62.853911-8.433853-93.018889C928.057169 336.0999 809.874701 285.26268 679.824375 285.26268c-269.711213 0-488.357305 218.645317-488.357305 488.357305 0 54.959576 9.084221 107.802937 25.822474 157.10377C300.626556 989.489417 402.283167 1024 512 1024z"
              fill="''' + getColor(2, color, colors, '#FFFFFF') + '''"
              fill-opacity=".15"
            />
            <path
              d="M732.535958 756.566238c36.389596 0 65.889478-29.499882 65.889477-65.889478 0 36.389596 29.502983 65.889478 65.889478 65.889478-17.053747 0-65.889478 29.502983-65.889478 65.889477 0-36.386495-29.499882-65.889478-65.889477-65.889477zM159.685087 247.279334c25.686819 0 46.51022-20.8234 46.51022-46.51022 0 25.686819 20.8234 46.51022 46.510219 46.51022-12.03607 0-46.51022 20.8234-46.510219 46.510219 0-25.686819-20.8234-46.51022-46.51022-46.510219z"
              fill="''' + getColor(3, color, colors, '#FFFFFF') + '''"
              fill-opacity=".5"
            />
            <path
              d="M206.195307 333.32324c8.562531 0 15.503407-6.940875 15.503406-15.503407 0 8.562531 6.940875 15.503407 15.503407 15.503407-4.012282 0-15.503407 6.940875-15.503407 15.503406 0-8.562531-6.940875-15.503407-15.503406-15.503406z"
              fill="''' + getColor(4, color, colors, '#FFFFFF') + '''"
              fill-opacity=".3"
            />
            <path
              d="M646.833126 440.630068l-143.079388 138.677971c-0.989117 1.510032-1.97746 3.020064-3.485941 4.009956-4.006855 4.009181-9.469481 5.988191-14.932881 5.988191-5.514562 0-10.977962-1.97901-15.452245-5.988191-0.989117-0.989893-2.497599-2.499924-3.017738-4.009956l-76.795349-74.312478c-7.960224-7.967201-7.960224-20.465272 0-28.433248 7.960999-8.019137 21.43656-8.019137 29.396784 0l65.816612 63.376376L617.385181 412.196821c8.480363-7.967201 21.435785-7.967201 29.396009 0 8.533075 7.498998 8.533075 20.466047 0.051936 28.433247z m76.795349-118.263861c-6.503679-5.988191-14.984042-9.00903-23.413244-9.009029h-2.497599c-0.520139 0-5.982765 0.520914-14.463903 0.520914-14.463903 0-41.883228-0.989117-68.31421-7.498997-33.923004-7.967201-73.308633-45.357541-84.80751-52.856539-5.462625-3.489042-12.487219-5.468051-18.938186-5.468052-6.451743 0-12.955422 1.97901-18.938962 5.468052-1.456545 0.989117-42.351431 43.379307-82.257974 52.856539-26.430983 6.457169-54.83865 7.498998-68.782413 7.498997-9.001278 0-14.463903-0.520914-14.932106-0.520914h-1.97746c-9.001278 0-16.961502 3.020839-23.413244 9.009029-6.971882 5.988966-10.977962 14.946059-10.977962 23.955089v82.800593c0 305.371373 206.868154 344.79266 215.348518 346.304243 1.97746 0.519364 4.00608 0.519364 5.983539 0.519364 1.976684 0 4.00608 0 5.98354-0.519364C526.177865 773.91455 734.086298 734.493263 734.086298 429.121889V346.321296c0-9.00903-4.00608-17.966123-10.457823-23.955089z"
              fill="''' + getColor(5, color, colors, '#FFFFFF') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.xitongshezhi:
        svgXml = '''
          <svg viewBox="0 0 1025 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M0 512a512.988417 512 0 1 0 1025.976834 0 512.988417 512 0 1 0-1025.976834 0Z"
              fill="''' + getColor(0, color, colors, '#6DC9FF') + '''"
            />
            <path
              d="M1024 563.397683c-15.769205 163.110548-108.46295 303.784031-241.450502 385.482626-8.792958-29.411336-13.561081-60.928-13.561081-93.707861 0-160.246116 113.952618-290.321792 255.011583-291.774765z"
              fill="''' + getColor(1, color, colors, '#FFFFFF') + '''"
              opacity=".3"
            />
            <path
              d="M340.015444 31.629344c-26.622023 134.399012-141.001637 228.015938-262.918919 211.639845C137.830795 146.285714 230.275459 70.962409 340.015444 31.629344z"
              fill="''' + getColor(2, color, colors, '#FFFFFF') + '''"
              fill-opacity=".4"
            />
            <path
              d="M754.561483 466.518981c-0.108726-0.984463-0.217452-1.804849-0.381529-2.299058v-0.436881l-0.219429-1.203891c-3.882502-18.938069-16.407722-31.141066-31.995058-31.141066h-2.569884c-26.58051 0-48.128-21.674008-48.128-48.163583 0-6.130162 2.844664-14.832185 4.046579-17.896278 7.547552-17.623475-0.492232-37.710085-19.141683-47.944155l-58.684294-33.220694-1.093189-0.383506c-4.374734-1.42332-9.461127-3.119444-15.148479-3.119444-10.611645 0-22.533931 4.92627-29.917405 12.313699-9.241699 9.14088-28.001853 22.769174-39.159104 22.769173-11.1019 0-29.915429-13.572942-39.159105-22.769173-7.87373-7.770934-18.758178-12.313699-29.915428-12.313699-5.851429 0-10.773745 1.642749-15.148479 3.119444l-0.984463 0.383506-61.528958 33.331397-0.381529 0.217452c-14.931027 9.360309-21.001884 30.812911-13.400957 47.835429l0.110703 0.217451 0.108725 0.219429c1.203892 2.682564 4.922317 11.768093 4.922317 19.703104 0 26.598301-21.658193 48.161606-48.128 48.161606h-2.569884c-16.298996 0-28.494085 12.040896-31.995058 31.360494l-0.219429 1.095166v0.383506c0 0.547583-0.217452 1.312618-0.381529 2.299058-1.367969 8.263166-4.649514 27.746842-4.649513 43.674193 0 15.925375 3.226193 35.411027 4.649513 43.674193 0.108726 0.984463 0.217452 1.806826 0.381529 2.299058v0.436881l0.219429 1.205868c3.882502 18.936093 16.407722 31.141066 31.995058 31.141066h1.312618c26.578533 0 48.128 21.672031 48.128 48.161606 0 6.130162-2.844664 14.832185-4.048556 17.896278-7.272772 16.58366-0.381529 37.874162 15.698038 48.600463l0.436881 0.219429 57.972633 32.291583 1.093189 0.383506c4.37671 1.421344 9.352402 3.119444 15.039753 3.119444 12.141714 0 23.081514-4.653467 29.917405-12.315676 0.656309-0.492232 1.312618-1.148541 2.077653-1.804849 6.999969-6.130162 25.813498-22.330317 38.229992-22.330317 9.241699 0 24.720309 9.686486 40.307645 25.285683 7.87373 7.770934 18.758178 12.313699 29.915428 12.313699 7.547552 0 13.126178-2.079629 19.469838-5.199073l0.219429-0.110703 59.449328-32.89254 0.217452-0.217452c14.931027-9.360309 21.001884-30.812911 13.400957-47.835429l-0.110702-0.217451-0.108726-0.219429c-0.108726-0.055351-4.758239-9.741838-3.882502-18.443861l0.108726-0.547583v-0.547583c0-26.598301 21.658193-48.163583 48.128-48.163583h2.733961c16.298996 0 28.494085-12.038919 31.995058-31.358517l0.219428-1.095166v-0.383506c0.108726-0.43688 0.217452-1.095166 0.381529-1.970904 1.42332-8.043737 4.704865-26.81773 4.704865-44.002347 0.108726-15.872-3.117467-35.300324-4.540787-43.565467z m-240.64 121.719598c-42.05912 0-76.13183-34.096432-76.13183-76.183228 0-42.088772 34.07271-76.185205 76.13183-76.185204 42.057143 0 76.129853 34.096432 76.129853 76.185204 0 42.086795-34.07271 76.183228-76.129853 76.183228z"
              fill="''' + getColor(3, color, colors, '#FFFFFF') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.zhongbo:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M708.266667 439.466667l-192-110.933334c-55.466667-34.133333-128 8.533333-128 72.533334v221.866666c0 64 72.533333 106.666667 128 72.533334l192-110.933334c55.466667-29.866667 55.466667-115.2 0-145.066666z m-234.666667 183.466666V401.066667l192 110.933333-192 110.933333z"
              fill="''' + getColor(0, color, colors, '#303133') + '''"
            />
            <path
              d="M938.666667 512c0 234.666667-192 426.666667-426.666667 426.666667-157.866667 0-298.666667-89.6-371.2-217.6l-76.8 42.666666C153.6 917.333333 320 1024 512 1024c281.6 0 512-230.4 512-512S793.6 0 512 0C311.466667 0 132.266667 119.466667 51.2 290.133333l76.8 34.133334C196.266667 183.466667 341.333333 85.333333 512 85.333333c234.666667 0 426.666667 192 426.666667 426.666667z"
              fill="''' + getColor(1, color, colors, '#303133') + '''"
            />
            <path
              d="M145.066667 742.4c0 25.6-17.066667 42.666667-42.666667 42.666667s-42.666667-17.066667-42.666667-42.666667 17.066667-42.666667 42.666667-42.666667 42.666667 17.066667 42.666667 42.666667z"
              fill="''' + getColor(2, color, colors, '#303133') + '''"
            />
            <path
              d="M59.733333 85.333333c25.6 0 42.666667 21.333333 38.4 46.933334l-8.533333 157.866666 149.333333-29.866666c25.6-4.266667 46.933333 8.533333 51.2 34.133333S281.6 337.066667 256 341.333333l-149.333333 34.133334C51.2 384 0 341.333333 4.266667 285.866667L17.066667 128c0-25.6 21.333333-42.666667 42.666666-42.666667z"
              fill="''' + getColor(3, color, colors, '#303133') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.yingyongchengxu:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M464 480H144c-8.8 0-16-7.2-16-16V144c0-8.8 7.2-16 16-16h320c8.8 0 16 7.2 16 16v320c0 8.8-7.2 16-16 16z m16 400V560c0-8.8-7.2-16-16-16H144c-8.8 0-16 7.2-16 16v320c0 8.8 7.2 16 16 16h320c8.8 0 16-7.2 16-16z m352-688H608v224h224V192m48-64c8.8 0 16 7.2 16 16v320c0 8.8-7.2 16-16 16H560c-8.8 0-16-7.2-16-16V144c0-8.8 7.2-16 16-16h320z m16 752V560c0-8.8-7.2-16-16-16H560c-8.8 0-16 7.2-16 16v320c0 8.8 7.2 16 16 16h320c8.8 0 16-7.2 16-16z"
              fill="''' + getColor(0, color, colors, '#333333') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.kefu_5:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M448 917.376C448 917.333333 576 917.333333 576 917.333333c0.085333 0 0-42.709333 0-42.709333C576 874.666667 448 874.666667 448 874.666667c-0.085333 0 0 42.709333 0 42.709333z m371.349333-173.034667C809.6 745.877333 799.573333 746.666667 789.333333 746.666667a21.333333 21.333333 0 0 1-21.333333-21.333334V384a21.333333 21.333333 0 0 1 21.333333-21.333333 191.146667 191.146667 0 0 1 92.373334 23.637333C828.202667 234.517333 681.045333 128 511.296 128 341.290667 128 193.749333 234.816 140.458667 387.328A191.125333 191.125333 0 0 1 234.666667 362.666667a21.333333 21.333333 0 0 1 21.333333 21.333333v341.333333a21.333333 21.333333 0 0 1-21.333333 21.333334 192 192 0 0 1-148.906667-313.216 21.269333 21.269333 0 0 1 0.042667-8.682667C127.36 228.288 304.469333 85.333333 511.274667 85.333333c209.706667 0 388.544 146.944 427.008 347.093334l0.213333 1.344A191.210667 191.210667 0 0 1 981.333333 554.666667c0 70.4-37.909333 131.968-94.421333 165.397333-57.642667 100.693333-154.752 174.762667-268.778667 204.074667A42.517333 42.517333 0 0 1 576 960h-128c-23.573333 0-42.666667-19.157333-42.666667-42.624v-42.752c0-23.552 18.922667-42.624 42.666667-42.624h128c23.573333 0 42.666667 19.157333 42.666667 42.624v5.141333a392.810667 392.810667 0 0 0 200.682666-135.424zM85.333333 554.666667c0.298667 133.589333 128 148.949333 128 148.949333V406.144s-128.298667 14.933333-128 148.522667z m853.333334 0c0.298667-133.589333-128-148.522667-128-148.522667v297.472s127.701333-15.36 128-148.949333z"
              fill="''' + getColor(0, color, colors, '#3D3D3D') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.kefu_2:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M85.333333 512c0 235.639467 191.0272 426.666667 426.666667 426.666667s426.666667-191.0272 426.666667-426.666667S747.639467 85.333333 512 85.333333 85.333333 276.360533 85.333333 512z"
              fill="''' + getColor(0, color, colors, '#ED4001') + '''"
            />
            <path
              d="M775.5264 456.516267l-0.085333-0.8704C751.684267 330.666667 641.1776 238.933333 511.488 238.933333c-127.863467 0-237.226667 89.224533-262.997333 211.882667a12.9536 12.9536 0 0 0 0 5.410133 120.8832 120.8832 0 0 0-15.1552 127.112534c19.746133 41.847467 61.422933 68.437333 107.178666 68.334933h0.1024a13.277867 13.277867 0 0 0 13.1584-13.346133V425.489067a13.277867 13.277867 0 0 0-13.1584-13.346134 118.5792 118.5792 0 0 0-58.2656 15.36c32.904533-95.197867 124.16-161.8944 229.239467-161.8944 104.891733 0 195.857067 66.5088 228.949333 161.2288a118.152533 118.152533 0 0 0-57.122133-14.779733h-0.1024a13.141333 13.141333 0 0 0-13.056 13.329067v213.1456c0 7.338667 5.905067 13.329067 13.141333 13.329066a120.490667 120.490667 0 0 0 18.602667-1.450666 243.0976 243.0976 0 0 1-124.0576 84.5824v-3.191467c0-14.677333-11.810133-26.5728-26.402133-26.5728h-79.240534c-14.506667 0-26.231467 11.8784-26.231466 26.5728v26.6752c0.1024 14.6944 11.8272 26.589867 26.4192 26.589867h79.138133a26.282667 26.282667 0 0 0 26.043733-22.4256 268.970667 268.970667 0 0 0 166.109867-127.402667C779.912533 613.7856 802.133333 574.464 802.133333 532.002133a120.832 120.832 0 0 0-26.606933-75.485866z m-448.170667-14.984534v185.685334s-78.9504-9.557333-79.138133-92.9792c-0.187733-83.336533 79.138133-92.706133 79.138133-92.706134zM696.490667 627.319467V441.514667s79.240533 9.284267 79.1552 92.706133c-0.187733 83.4048-79.1552 93.0816-79.1552 93.0816z"
              fill="''' + getColor(1, color, colors, '#FFFFFF') + '''"
            />
            <path
              d="M543.6416 785.066667h-79.8208c-18.2272 0-33.194667-14.626133-33.297067-32.546134v-26.043733c0-17.92 14.865067-32.5632 33.109334-32.5632h79.7184c16.418133 0 30.037333 11.605333 32.8192 26.897067a236.714667 236.714667 0 0 0 103.048533-65.774934h-3.072c-11.025067 0-19.950933-8.772267-19.950933-19.626666v-208.042667a18.858667 18.858667 0 0 1 5.666133-13.7728c3.7376-3.7888 8.823467-5.853867 14.199467-5.853867 15.445333 0 30.788267 2.833067 45.192533 8.192-37.137067-83.114667-122.709333-137.9328-218.112-137.9328-95.744 0-181.418667 55.005867-218.282667 138.410667a128.750933 128.750933 0 0 1 46.250667-8.584533c11.042133 0 19.968 8.789333 19.968 19.626666V635.221333c0 10.8544-8.925867 19.626667-19.968 19.626667h-0.375467a128.068267 128.068267 0 0 1-67.072-18.944 125.252267 125.252267 0 0 1-46.626133-51.438933 121.002667 121.002667 0 0 1-11.3152-67.84 122.624 122.624 0 0 1 25.6-61.047467 15.496533 15.496533 0 0 1 0.494933-4.727467c12.8512-59.528533 47.018667-113.493333 96.136534-151.995733C377.275733 260.164267 439.466667 238.933333 502.971733 238.933333c132.881067 0 247.159467 90.862933 272.008534 216.2688A122.88 122.88 0 0 1 802.133333 531.626667c0 43.025067-23.125333 83.319467-60.535466 105.591466-36.078933 60.757333-96.529067 106.052267-166.280534 124.7232-4.232533 13.499733-17.083733 23.125333-31.675733 23.125334z m-79.9232-77.943467c-10.922667 0-19.7632 8.686933-19.7632 19.3536v26.043733a19.7632 19.7632 0 0 0 19.8656 19.336534h79.8208c9.608533 0 17.954133-6.997333 19.387733-16.315734l0.682667-4.352 4.3008-1.024c68.608-17.271467 128-61.44 163.0208-121.258666l0.853333-1.501867 1.536-0.853333c34.167467-19.729067 55.381333-56.149333 55.381334-95.112534a109.602133 109.602133 0 0 0-25.2416-69.546666l-1.245867-1.501867-0.290133-2.56c-23.5008-119.3472-132.317867-205.9776-258.9696-205.9776-60.535467 0-119.739733 20.309333-166.656 57.088-46.728533 36.608-79.1552 87.944533-91.4432 144.554667a5.290667 5.290667 0 0 0 0 2.4576l0.682666 3.106133-2.030933 2.4576a109.294933 109.294933 0 0 0-14.3872 117.0944 111.4112 111.4112 0 0 0 41.642667 45.960533 113.4592 113.4592 0 0 0 59.869866 16.981334h0.290134a6.536533 6.536533 0 0 0 6.519466-6.417067V427.451733a6.536533 6.536533 0 0 0-6.519466-6.417066c-19.285333 0-38.382933 4.9152-55.364267 14.165333l-15.445333 8.482133 5.853866-16.418133c34.645333-97.1776 129.809067-162.474667 236.987734-162.474667 106.7008 0 201.8816 65.024 236.714666 161.826134l5.853867 16.213333-15.36-8.192a115.268267 115.268267 0 0 0-54.306133-13.687467 6.570667 6.570667 0 0 0-4.693334 1.877334 5.9904 5.9904 0 0 0-1.826133 4.437333v208.162133c0 3.4816 2.9696 6.4 6.519467 6.4 5.853867 0 11.810133-0.4608 17.664-1.314133l16.776533-2.56-10.5472 13.141333a250.112 250.112 0 0 1-128.290133 84.821334l-8.533334 2.440533v-11.8784c0-10.666667-8.925867-19.3536-19.8656-19.3536h-79.445333z m218.760533-75.195733v-196.266667l7.492267 0.853333c0.853333 0.1024 21.674667 2.56 42.7008 15.6672 19.575467 12.270933 42.973867 36.317867 42.888533 81.339734-0.1024 45.0048-23.415467 69.154133-42.990933 81.5104a111.991467 111.991467 0 0 1-42.5984 15.872l-7.492267 1.024z m13.431467-180.7872v165.307733a102.365867 102.365867 0 0 0 29.8496-12.629333c24.081067-15.394133 36.352-38.980267 36.352-70.212267 0-31.317333-12.270933-55.005867-36.642133-70.1952a102.161067 102.161067 0 0 0-29.559467-12.270933zM324.5056 631.825067l-7.492267-0.853334c-0.853333-0.085333-21.589333-2.628267-42.5984-15.837866-19.575467-12.270933-42.888533-36.420267-42.990933-81.425067-0.085333-45.021867 23.210667-69.0688 42.888533-81.339733a113.493333 113.493333 0 0 1 42.7008-15.752534l7.492267-0.853333V631.808z m-13.431467-180.6848a102.058667 102.058667 0 0 0-29.934933 12.544c-24.098133 15.291733-36.283733 38.792533-36.283733 69.922133 0.1024 31.419733 12.475733 55.005867 36.7616 70.382933 11.127467 6.997333 22.357333 10.666667 29.457066 12.373334v-165.2224z"
              fill="''' + getColor(2, color, colors, '#FFFFFF') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.kefu_4:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M514.50311111 515.18577778m-506.31111111 0a506.31111111 506.31111111 0 1 0 1012.62222222 0 506.31111111 506.31111111 0 1 0-1012.62222222 0Z"
              fill="''' + getColor(0, color, colors, '#ED6501') + '''"
            />
            <path
              d="M790.7 457.4l-0.1-0.9c-24.9-129.3-140.8-224.2-276.8-224.2-134.1 0-248.8 92.3-275.8 219.2-0.4 1.8-0.4 3.8 0 5.6-30.3 37.1-36.5 88.3-15.9 131.5 20.7 43.3 64.4 70.8 112.4 70.7h0.1c7.6 0 13.8-6.2 13.8-13.8V425.3c0-7.6-6.2-13.8-13.8-13.8-21.4 0-42.4 5.5-61.1 15.9 34.5-98.5 130.2-167.5 240.4-167.5 110 0 205.4 68.8 240.1 166.8-18.4-10-38.9-15.3-59.9-15.3h-0.1c-7.6 0-13.8 6.2-13.7 13.8v220.5c0 7.6 6.2 13.8 13.8 13.8 6.5 0 13-0.5 19.5-1.5-33.1 42.1-78.6 72.7-130.1 87.5v-3.3c0-15.2-12.4-27.5-27.7-27.5h-83.1c-15.2 0-27.5 12.3-27.5 27.5v27.6c0.1 15.2 12.4 27.5 27.7 27.5h83c13.6 0.1 25.2-9.8 27.3-23.2 73.9-18.9 136.8-66.8 174.2-131.8 37.9-22.2 61.2-62.9 61.2-106.8-0.1-28.5-9.9-56.1-27.9-78.1z"
              fill="''' + getColor(1, color, colors, '#FFFFFF') + '''"
            />
            <path
              d="M556.1 803.8h-83.2c-18.7 0-34.1-15.2-34.2-34v-27.6c0-18.7 15.3-34 34-34h83.1c17 0 31.2 12.4 33.8 28.7 42.2-13.6 79.5-37.9 108.9-70.9-1.5 0-2.9 0.1-4.4 0.1-11.2 0-20.3-9.1-20.3-20.3V425.2c-0.1-5.3 2-10.4 5.8-14.3 3.8-3.9 8.9-6 14.4-6 16.4 0 32.7 3.1 48 9.1-38.3-88.9-128-147.6-228.1-147.6-100.4 0-190.2 58.9-228.4 148.1 15.6-6.3 32.3-9.5 49.1-9.5 11.2 0 20.3 9.1 20.3 20.3v220.2c0 11.2-9.1 20.3-20.3 20.3h-0.4c-24.7 0-48.7-6.9-69.6-20.1-21-13.2-37.7-32-48.4-54.3-10.6-22.3-14.7-47.1-11.7-71.6 2.9-23.6 12.1-45.9 26.7-64.6-0.1-1.7 0.1-3.4 0.4-5.1 13.4-62.9 48.9-120.1 100-160.9 51.3-40.9 116-63.4 182.1-63.4 138.3 0 257.2 96.2 283.1 228.9 18.1 22.8 28.1 51.4 28.2 80.8 0 45.5-24.1 88.1-62.9 111.5-37.7 64.6-100.7 112.7-173.5 132.4-4.1 14.2-17.4 24.4-32.5 24.4z m-83.3-82.6c-11.7 0-21.1 9.4-21.1 21v27.6c0.1 11.6 9.6 21 21.2 21h83.2c10.3 0 19.1-7.6 20.7-17.7l0.7-4.2 4.1-1.1c71.6-18.3 133.6-65.2 170.2-128.7l0.9-1.5 1.5-0.9c35.8-21 58-59.7 58-101.2-0.1-27-9.5-53.3-26.4-74l-1.2-1.5-0.3-2.6C759.6 330.8 646 238.8 513.8 238.8c-63.2 0-125 21.5-174 60.6-48.8 38.9-82.7 93.4-95.4 153.5-0.2 0.9-0.2 2 0 2.8l0.7 3.1-2 2.4c-28.6 35-34.5 83.9-15.1 124.6 9.6 20.1 24.7 37.1 43.6 48.9 18.8 11.8 40.5 18.1 62.7 18.1H334.6c4 0 7.3-3.3 7.3-7.3V425.3c0-4-3.3-7.3-7.3-7.3-20.2 0-40.2 5.2-57.9 15.1l-14.9 8.3 5.7-16.1c36-102.8 135.1-171.9 246.5-171.9 111 0 210 68.8 246.2 171.1l5.7 16-14.9-8.1c-17.5-9.5-37.1-14.5-56.8-14.5-2 0-3.9 0.8-5.2 2.2-1.3 1.4-2.1 3.2-2.1 5.1v220.6c0 4 3.3 7.3 7.3 7.3 6.1 0 12.4-0.5 18.5-1.4l16.3-2.5-10.3 12.8c-34.1 43.4-80.3 74.5-133.4 89.7l-8.3 2.4v-11.9c0-11.6-9.5-21-21.2-21h-83z"
              fill="''' + getColor(2, color, colors, '#FFFFFF') + '''"
            />
            <path
              d="M320.7 441.9V634s-82.8-9.9-83-96.2c-0.2-86.2 83-95.9 83-95.9z"
              fill="''' + getColor(3, color, colors, '#FFFFFF') + '''"
            />
            <path
              d="M327.2 641.3l-7.3-0.9c-0.9-0.1-22.4-2.8-44.2-16.7-20.3-13-44.5-38.4-44.6-85.9-0.1-47.5 24.1-72.9 44.4-85.8 21.8-13.8 43.4-16.5 44.3-16.6l7.3-0.8v206.7z m-13-191.5c-7.5 1.8-19.8 5.7-32 13.5-25.3 16.3-38.1 41.3-38 74.5 0.1 33.3 12.9 58.4 38.2 74.7 12.1 7.8 24.3 11.7 31.8 13.6V449.8z"
              fill="''' + getColor(4, color, colors, '#FFFFFF') + '''"
            />
            <path
              d="M707.8 634.1V441.9s83.1 9.6 83 95.9c-0.2 86.3-83 96.3-83 96.3z"
              fill="''' + getColor(5, color, colors, '#FFFFFF') + '''"
            />
            <path
              d="M701.3 641.4V434.6l7.2 0.8c0.9 0.1 22.5 2.7 44.3 16.6 20.3 12.9 44.5 38.3 44.5 85.8-0.1 47.5-24.3 73-44.6 86-21.7 13.9-43.2 16.7-44.2 16.8l-7.2 0.8z m13-191.6v176.4c7.5-1.8 19.7-5.8 31.8-13.6 25.3-16.4 38.1-41.5 38.2-74.8 0-33.4-12.9-58.6-38.4-74.8-12.1-7.7-24.2-11.5-31.6-13.2z"
              fill="''' + getColor(6, color, colors, '#FFFFFF') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.kefu_3:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M967.111111 530.962963a151.703704 151.703704 0 0 0-94.814815-140.705185 360.296296 360.296296 0 0 0-720.592592 0A151.703704 151.703704 0 0 0 208.592593 682.666667a18.962963 18.962963 0 0 0 18.962963-18.962963V398.222222a18.962963 18.962963 0 0 0-18.962963-18.962963 151.703704 151.703704 0 0 0-18.962963 0 322.37037 322.37037 0 0 1 644.74074 0 151.703704 151.703704 0 0 0-18.962963 0 18.962963 18.962963 0 0 0-18.962963 18.962963v265.481482a18.962963 18.962963 0 0 0 18.962963 18.962963 151.703704 151.703704 0 0 0 18.962963-1.137778 265.481481 265.481481 0 0 1-251.448889 246.518518 37.925926 37.925926 0 1 0 1.137778 37.925926A303.407407 303.407407 0 0 0 872.296296 671.288889a151.703704 151.703704 0 0 0 94.814815-140.325926z m-777.481481 111.881481a113.777778 113.777778 0 0 1 0-224.331851z m644.74074 0V418.322963a113.777778 113.777778 0 0 1 0 224.521481z"
              fill="''' + getColor(0, color, colors, '#FFB53E') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.xiangce:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M746.6496 198.4a129.6384 129.6384 0 0 1 129.536 124.0064l0.1024 5.632v367.9232a129.6384 129.6384 0 0 1-124.0064 129.536l-5.632 0.1024H306.9184a129.6384 129.6384 0 0 1-129.536-124.0064l-0.128-5.632v-57.9328c0-7.4752 2.6368-14.6944 7.3728-20.4032l2.5344-2.7136 131.84-126.0544a32 32 0 0 1 35.4304-5.9648l3.1488 1.664 116.0704 69.5808 74.7008-66.0992a32 32 0 0 1 35.072-4.864l3.072 1.6896 177.1008 110.6688a32 32 0 0 1-30.848 55.9616l-3.072-1.6896-156.8256-97.9968-74.3424 65.792a32 32 0 0 1-34.6112 5.12l-3.072-1.6384-115.2512-69.0944-104.32 99.712v44.2624a65.6384 65.6384 0 0 0 61.4912 65.5104l4.1728 0.128h439.7312a65.6384 65.6384 0 0 0 65.5104-61.4912l0.128-4.1472V328.0384a65.6384 65.6384 0 0 0-61.4912-65.5104l-4.1472-0.128H306.9184a65.6384 65.6384 0 0 0-65.536 61.4912l-0.128 4.1472v134.3488a32 32 0 0 1-63.8208 3.2768l-0.1792-3.2768v-134.3488a129.6384 129.6384 0 0 1 124.032-129.536l5.632-0.1024h439.7312z"
              fill="''' + getColor(0, color, colors, '#FB553C') + '''"
            />
            <path
              d="M692.5312 398.3104m-47.4112 0a47.4112 47.4112 0 1 0 94.8224 0 47.4112 47.4112 0 1 0-94.8224 0Z"
              fill="''' + getColor(1, color, colors, '#FB553C') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.kefuguanli:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M509.9008 509.5936m-450.816 0a450.816 450.816 0 1 0 901.632 0 450.816 450.816 0 1 0-901.632 0Z"
              fill="''' + getColor(0, color, colors, '#C65EDB') + '''"
            />
            <path
              d="M764.3136 420.4544c-8.6016-127.3344-117.0944-228.352-249.1904-228.352-131.584 0-239.616 100.1472-249.088 226.7136-35.3792 15.104-60.2624 50.2272-60.2624 91.0848v101.5808c0 54.5792 44.3904 98.9696 98.9696 98.9696h38.144c19.8144 0 35.84-16.0256 35.84-35.84v-227.84c0-19.8144-16.0256-35.84-35.84-35.84h-3.9424c12.9024-83.1488 86.9888-147.1488 176.128-147.1488 89.1904 0 163.2256 63.9488 176.1792 147.1488h-7.2192c-19.8144 0-35.84 16.0256-35.84 35.84v227.84c0 12.9536 6.912 24.2688 17.2032 30.5664-23.3984 22.7328-60.6208 48.6912-113.2032 56.1152a37.93408 37.93408 0 0 0-22.6816-7.5264h-26.112a38.1952 38.1952 0 0 0 0 76.3904h26.112c11.3152 0 21.4528-4.9664 28.4672-12.8 99.9424-13.056 156.928-78.4896 177.8176-107.9808 48.128-6.7072 85.2992-47.9744 85.2992-97.9456V509.9008c0.1024-39.4752-23.2448-73.5744-56.7808-89.4464z"
              fill="''' + getColor(1, color, colors, '#FFFFFF') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.guge:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M213.33376 515.669333c0-33.493333 5.632-65.621333 15.616-95.744l-175.445333-132.693333A511.36 511.36 0 0 0 0.000427 515.669333c0 82.090667 19.2 159.573333 53.376 228.266667l175.402666-132.906667A302.250667 302.250667 0 0 1 213.33376 515.669333"
              fill="''' + getColor(0, color, colors, '#FBBC05') + '''"
            />
            <path
              d="M521.515093 210.986667a303.530667 303.530667 0 0 1 192 67.925333l151.722667-150.016C772.779093 49.237333 654.251093 0 521.515093 0c-206.08 0-383.232 116.736-468.053333 287.232l175.616 132.693333c40.405333-121.557333 155.690667-208.981333 292.522667-208.981333"
              fill="''' + getColor(1, color, colors, '#EA4335') + '''"
            />
            <path
              d="M523.776427 813.610667c-137.557333 0-253.397333-86.869333-294.058667-207.701334L53.33376 737.834667c85.205333 169.472 263.253333 285.44 470.4 285.44 127.786667 0 249.813333-44.416 341.418667-127.744l-167.424-126.72c-47.232 29.098667-106.709333 44.8-174.08 44.8"
              fill="''' + getColor(2, color, colors, '#34A853') + '''"
            />
            <path
              d="M1024.000427 510.805333c0-30.293333-4.778667-62.890667-11.946667-93.184H523.73376v197.973334h281.088c-13.994667 67.541333-52.224 119.466667-107.008 153.173333l167.424 126.762667C961.408427 808.106667 1024.000427 677.888 1024.000427 510.805333"
              fill="''' + getColor(3, color, colors, '#4285F4') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.tousujianyi:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M222.6176 835.8912h410.5728l312.3712-312.3712c16.7936-16.7424 26.0096-39.0656 26.0096-62.7712s-9.216-46.0288-26.0096-62.7712L651.008 103.424a88.14592 88.14592 0 0 0-62.7712-26.0096c-23.7056 0-46.0288 9.216-62.7712 26.0096l-454.912 454.912c-34.6112 34.6112-34.6112 90.9312 0 125.5424l152.064 152.0128z m26.7776-261.4272l300.2368-9.3184a19.01056 19.01056 0 0 0 18.432-19.6096l-8.7552-280.9344c-0.4096-14.1312 10.6496-25.9584 24.7808-26.368 14.1824-0.3072 25.9584 10.6496 26.368 24.7808l8.7552 280.9344c1.1776 38.7072-29.3376 71.168-68.0448 72.3968l-300.2368 9.3184h-0.8192a25.6512 25.6512 0 0 1-25.6-24.7808c-0.3584-14.1824 10.752-26.0096 24.8832-26.4192zM920.7808 883.0976H82.688c-14.1312 0-25.6 11.4688-25.6 25.6s11.4688 25.6 25.6 25.6h838.144c14.1312 0 25.6-11.4688 25.6-25.6s-11.52-25.6-25.6512-25.6z"
              fill="''' + getColor(0, color, colors, '#F5504E') + '''"
            />
            <path
              d="M239.2576 883.0976h-27.5968c66.9696 29.8496 141.6704 45.1584 219.904 41.9328 64-2.6112 124.6208-17.3568 179.7632-41.9328H239.2576zM588.2368 77.3632c-23.7056 0-46.0288 9.216-62.7712 26.0096l-454.912 454.912c-34.6112 34.6112-34.6112 90.9312 0 125.5424l152.064 152.0128h410.5728l243.712-243.712c18.9952-55.808 28.2112-115.9168 25.6512-178.3296-0.9216-22.4768-3.3792-44.544-7.168-66.0992l-244.3264-244.3264a88.4736 88.4736 0 0 0-62.8224-26.0096z m-37.0176 538.9312l-300.2368 9.3184h-0.8192a25.6512 25.6512 0 0 1-25.6-24.7808c-0.4096-14.1312 10.6496-25.9584 24.7808-26.368l300.2368-9.3184a19.01056 19.01056 0 0 0 18.432-19.6096l-8.7552-280.9344c-0.4096-14.1312 10.6496-25.9584 24.7808-26.368 14.1824-0.3072 25.9584 10.6496 26.368 24.7808l8.7552 280.9344c1.28 38.656-29.2352 71.1168-67.9424 72.3456z"
              fill="''' + getColor(1, color, colors, '#FF5A5A') + '''"
            />
            <path
              d="M811.4176 263.7824l-160.4096-160.4096a88.14592 88.14592 0 0 0-62.7712-26.0096c-23.7056 0-46.0288 9.216-62.7712 26.0096l-454.912 454.912c-32.9728 32.9728-34.4576 85.6064-4.608 120.4736 79.7184 48.2304 174.0288 74.3424 274.0736 70.2464 262.5536-10.752 468.5312-225.536 471.3984-485.2224z m-260.1984 352.512l-300.2368 9.3184h-0.8192a25.6512 25.6512 0 0 1-25.6-24.7808c-0.4096-14.1312 10.6496-25.9584 24.7808-26.368l300.2368-9.3184a19.01056 19.01056 0 0 0 18.432-19.6096l-8.7552-280.9344c-0.4096-14.1312 10.6496-25.9584 24.7808-26.368 14.1824-0.3072 25.9584 10.6496 26.368 24.7808l8.7552 280.9344c1.28 38.656-29.2352 71.1168-67.9424 72.3456z"
              fill="''' + getColor(2, color, colors, '#F66A68') + '''"
            />
            <path
              d="M651.008 103.3728a88.14592 88.14592 0 0 0-62.7712-26.0096c-23.7056 0-46.0288 9.216-62.7712 26.0096l-454.912 454.912c-1.9456 1.9456-3.7376 3.9424-5.4272 6.0416a489.79456 489.79456 0 0 0 163.4304 20.8384c0.3072 0 0.6144-0.0512 0.9728-0.0512 4.5056-6.1952 11.6224-10.3936 19.8656-10.6496l73.3184-2.304c94.3104-22.4256 177.664-71.8336 241.8688-139.3664l-5.2224-168.2432c-0.4096-14.1312 10.6496-25.9584 24.7808-26.368 14.1824-0.3072 25.9584 10.6496 26.368 24.7808l3.3792 109.0048c44.544-64.9216 73.8816-140.9024 82.9952-222.6688l-45.8752-45.9264z"
              fill="''' + getColor(3, color, colors, '#F67271') + '''"
            />
            <path
              d="M224.9216 403.9168c164.3008-36.352 293.3248-162.304 335.872-322.2016-13.1584 4.2496-25.2416 11.5712-35.328 21.6576l-300.544 300.544z"
              fill="''' + getColor(4, color, colors, '#F67B7A') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.yijianjianyi:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M527.598933 963.106133c-245.1456 0-444.586667-199.441067-444.586666-444.586666S282.453333 73.9328 527.598933 73.9328s444.586667 199.441067 444.586667 444.586667-199.441067 444.586667-444.586667 444.586666z m0-814.08c-203.741867 0-369.493333 165.751467-369.493333 369.493334s165.751467 369.493333 369.493333 369.493333 369.493333-165.751467 369.493334-369.493333S731.3408 149.026133 527.598933 149.026133z"
              fill="''' + getColor(0, color, colors, '#333333') + '''"
            />
            <path
              d="M572.5184 681.608533c9.6256 7.7824 14.404267 18.2272 14.404267 31.3344 0 12.6976-4.8128 23.3472-14.404267 31.9488-10.5472 8.192-22.664533 12.288-36.386133 12.288-13.7216 0-25.3952-4.3008-35.0208-12.9024-10.069333-8.6016-15.121067-19.0464-15.121067-31.3344 0-13.1072 5.0176-23.552 15.121067-31.3344 9.147733-8.192 20.821333-12.288 35.0208-12.288 15.121067 0 27.2384 4.096 36.386133 12.288zM493.568 318.498133h85.845333l-15.803733 314.5728h-54.237867l-15.803733-314.5728z"
              fill="''' + getColor(1, color, colors, '#054FE5') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.shenfenzheng_6_copy_copy:
        svgXml = '''
          <svg viewBox="0 0 1514 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M23.33121 19.576659h82.784956V0h-102.361614v102.233662h19.576658V19.576659z m0 984.846682h82.784956v19.576659h-102.361614v-102.361614h19.576658V1004.423341zM1482.751928 19.576659h-82.784956V0h102.233662v102.233662h-19.576658V19.576659h0.127952z m0 984.846682h-82.784956v19.576659h102.233662v-102.361614h-19.576658V1004.423341h0.127952z"
              fill="''' + getColor(0, color, colors, '#1296db') + '''"
            />
            <path
              d="M1413.913742 889.906285c0 24.182931-19.576659 43.887542-43.887542 43.887542h-1243.565663c-24.182931 0-43.887542-19.576659-43.887542-43.887542V121.298513c0-24.182931 19.576659-43.887542 43.887542-43.887542h1243.565663c11.643634 0 22.775459 4.606273 30.964388 12.795202 8.188929 8.188929 12.795202 19.320755 12.795202 30.964388v768.735724h0.127952z"
              fill="''' + getColor(1, color, colors, '#f3f9ff') + '''"
            />
            <path
              d="M489.33246 178.237161H584.656713v49.261527H489.33246v-49.261527z m0 122.705985H584.656713v49.261527H489.33246v-49.261527z m0 122.833938H584.656713v49.261527H489.33246v-49.261527zM203.99946 774.365613H420.87813v49.261527h-216.87867v-49.261527z"
              fill="''' + getColor(2, color, colors, '#dbdbdb') + '''"
            />
            <path
              d="M469.499897 774.365613h737.003624v49.261527H469.499897v-49.261527z"
              fill="''' + getColor(3, color, colors, '#e2e2e2') + '''"
            />
            <path
              d="M203.99946 678.017743H420.87813v49.261527h-216.87867v-49.261527z"
              fill="''' + getColor(4, color, colors, '#dbdbdb') + '''"
            />
            <path
              d="M469.499897 678.017743h737.003624v49.261527H469.499897v-49.261527zM613.062061 176.957641H1206.503521v49.389479H613.062061v-49.389479zM613.062061 300.943146H1206.503521v49.389479H613.062061v-49.389479zM613.062061 423.777084H1206.503521v49.261527H613.062061v-49.261527z"
              fill="''' + getColor(5, color, colors, '#e2e2e2') + '''"
            />
            <path
              d="M530.789998 460.53755741H522.44506766c-0.45266055 0-0.88401943-0.17840151-1.2035445-0.49792659s-0.4979266-0.75354668-0.49792663-1.20354453V454.21362328c0-0.68697896 0.41005722-1.30472748 1.04378198-1.57099837-0.02396438-0.02662709-0.03727793-0.06390502-0.03461522-0.09852024 0-0.03727793 0.210354-0.53520453 0.30887424-0.53520452H523.18530079c0.08786941 0 0.32218778 0.38609282 0.39141824 0.50058931h0.69230438s0.68431625-1.33934268 1.00650403-1.33934268h3.69317753c0.33816405 0 0.83875337 1.33934268 0.83875339 1.33934268h0.98253964c0.93993631 0 1.70413383 0.76153479 1.70413383 1.70413382v4.622463c0 0.93993631-0.76153479 1.7014711-1.70413383 1.70147113z m-8.20114405-6.35588665c0.17840151 0 0.34881489-0.06923042 0.47396223-0.19437775 0.12514733-0.12514733 0.19704046-0.29556071 0.19704044-0.47396222 0-0.17840151-0.07189313-0.34881489-0.19704044-0.47396222-0.12514733-0.12514733-0.29556071-0.19437777-0.47396223-0.19437779-0.37011659 0-0.67100269 0.29822342-0.67100269 0.66834002 0 0.17840151 0.07189313 0.34881489 0.19704048 0.47396221 0.12514733 0.12514733 0.29556071 0.19437777 0.47396221 0.19437775z m4.53459363-1.17159199c-1.76271344 0-3.18992551 1.42188666-3.18992553 3.17927467 0 1.75472531 1.42721209 3.17927467 3.18992553 3.17927466 1.76271344 0 3.18992551-1.42188666 3.18992549-3.17927466 0-1.75472531-1.4298748-3.17927467-3.18992549-3.17927467z m0 5.35470803c-1.20620722 0-2.18342147-0.97455155-2.18342149-2.17543336s0.97721425-2.17543334 2.18342149-2.17543336 2.18342147 0.97455155 2.18342144 2.17543336c-0.00266271 1.2008818-0.97987696 2.17543334-2.18342144 2.17543336z m0 0z"
              fill="''' + getColor(6, color, colors, '#dbdbdb') + '''"
            />
            <path
              d="M277.955726 277.144071m-132.174434 0a132.174435 132.174435 0 1 0 264.348869 0 132.174435 132.174435 0 1 0-264.348869 0Z"
              fill="''' + getColor(7, color, colors, '#e2e2e2') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.shenfenzhengzhengmian_2_copy:
        svgXml = '''
          <svg viewBox="0 0 1498 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M19.476 19.476h83.149V0H0v102.625h19.476V19.476z m0 985.048h83.149V1024H0V921.375h19.476v83.149zM1479.444 19.476h-83.148V0h102.624v102.625h-19.476V19.476z m0 985.048h-83.148V1024h102.624V921.375h-19.476v83.149z"
              fill="''' + getColor(0, color, colors, '#44C8C6') + '''"
            />
            <path
              d="M1381.314 869.688c0 23.971-19.476 42.698-42.698 42.698H120.603c-23.971 0-42.698-19.476-42.698-42.698v-752.83c0-23.971 19.476-42.699 42.698-42.699h1218.013c11.236 0 22.473 4.495 30.712 12.735 8.24 8.24 12.735 18.727 12.735 30.712l-0.75 752.082z"
              fill="''' + getColor(1, color, colors, '#F3F9FF') + '''"
            />
            <path
              d="M196.26 205.25h93.636v47.94H196.26v-47.94z m0 120.602h93.636v47.942H196.26v-47.942z m0 119.854h93.636v47.941H196.26v-47.941zM1208.275 367.8c1.498 0.75 2.996 2.247 4.495 2.996l4.494 2.997v5.243c0 14.982-1.498 28.466-5.993 38.204-3.745 8.989-8.989 16.48-16.48 20.225-5.243 17.978-11.236 34.458-19.476 48.69-9.738 16.48-22.472 28.466-40.45 35.208-8.24 2.996-28.466 4.494-47.942 3.745-19.476 0-38.203-2.247-45.694-5.993-16.48-7.49-27.716-20.225-36.705-35.956-7.491-13.483-12.735-29.214-17.23-45.694-7.49-3.745-13.483-10.487-17.228-20.225-4.495-10.488-5.993-23.222-5.993-38.953v-5.243l4.495-2.997c0.749-0.749 2.247-1.498 3.745-2.247-5.244-62.174-2.996-84.647 20.225-110.865 44.946-36.705 147.57-35.207 192.515-2.247 31.462 29.964 32.96 62.174 23.222 113.112z m-93.636 179.031l0.75 14.233-8.24 13.484 11.236 76.406 47.941-103.373 72.662-2.248c37.454 35.207 62.174 119.854 56.181 174.537H888.416c0.749-47.941 9.738-130.34 57.68-172.29l65.919 0.75 61.425 101.875 11.236-76.406-8.24-13.484 0.75-14.233c16.479-0.749 21.723-0.749 37.453 0.75z m54.684-201.504c-29.215 5.993-71.913 10.488-106.37-8.989-13.484-7.49-32.211 7.491-47.942 5.993-5.244 9.738-8.99 20.225-10.487 31.462l-2.247 8.989-9.739-0.75c-2.247 0-3.745 0-5.243 0.75-0.75 0-1.498 0.749-2.247 0.749 0 10.487 1.498 18.727 4.494 25.469 2.247 5.992 5.993 8.989 9.738 10.487l5.244 1.498 1.498 5.244c4.494 17.229 9.738 32.96 17.229 45.694 6.742 11.985 14.982 21.723 26.967 26.967 4.495 2.247 20.974 3.745 37.454 3.745 17.23 0 35.207-0.749 41.2-2.996 12.734-4.494 22.473-14.233 29.963-26.218 7.491-13.483 13.484-29.963 17.978-47.941l1.499-5.244 5.243-2.247c3.746-1.498 7.491-5.244 9.738-10.487 2.248-6.742 3.746-14.982 4.495-24.72-0.75 0-1.498-0.75-2.247-0.75-1.499-0.748-3.746-0.748-5.244-0.748l-8.989 0.749-1.498-8.99c-2.997-8.24-5.993-17.977-10.487-27.716zM324.354 205.25h280.907v47.942H324.354v-47.942z m0 120.603h280.907v47.942H324.354v-47.942z m0 119.854h280.907v47.941H324.354v-47.941z m149.068 314.616h423.233v47.941H473.422v-47.941z m-277.162 0h247.948v47.941H196.26v-47.941z"
              fill="''' + getColor(2, color, colors, '#DDDDDD') + '''"
            />
            <path
              d="M0.31051767 62.47350228h-0.02145371s-0.01107307-0.02906641-0.01833977-0.02906639H0.19044522c-0.00692072 0-0.02179969 0.02906641-0.02179968 0.02906639h-0.0152254c-0.00138396-0.00276837-0.00657473-0.01107261-0.0083047-0.0110726h-0.02456808c-0.0020764 0-0.00657473 0.01107261-0.00657472 0.0117646 0 0.00069197 0.00034643 0.00138443 0.00069198 0.0020764-0.013841 0.0058823-0.02249167 0.01903177-0.02249167 0.03425718V62.61122206c0 0.00968865 0.00380635 0.01903177 0.0107266 0.02629803 0.00692072 0.00692072 0.01626384 0.01072709 0.0262985 0.01072708h0.18131914c0.02041618 0 0.03702556-0.01660939 0.03737157-0.03667912V62.51052739c-0.000346-0.02041573-0.01695537-0.0370251-0.03737108-0.03702511z m-0.16817061 0.0321808c-0.00276792 0.00276837-0.00657428 0.00415236-0.01038063 0.00415233s-0.0076127-0.00138396-0.01038109-0.00415233c-0.00276837-0.00276837-0.00415236-0.00657473-0.00415234-0.0103811 0-0.0079587 0.00657473-0.01453298 0.01453343-0.01453296 0.00380635 0 0.0076127 0.00138396 0.01038063 0.00415233 0.00276837 0.00276837 0.00415281 0.00657428 0.00415282 0.01038063s-0.00138443 0.0076127-0.00415282 0.0103811z m0.08823764 0.11695758c-0.03806352 0-0.06920588-0.03079636-0.06920587-0.06920542 0-0.03806352 0.03114281-0.06920588 0.06920587-0.06920587 0.03840951 0 0.06920588 0.03079636 0.06920588 0.06920587 0 0.03806352-0.03079636 0.06920588-0.06920588 0.06920589z"
              fill="''' + getColor(3, color, colors, '#e6e6e6') + '''"
            />
            <path
              d="M0.23058471 62.60084099c-0.02629802 0-0.04740619-0.0211077-0.04740618-0.04740574s0.02110817-0.04740619 0.04740618-0.0474062 0.04740619 0.0211077 0.04740617 0.0474062-0.02145414 0.04740574-0.04740617 0.04740573z"
              fill="''' + getColor(4, color, colors, '#e6e6e6') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.shenfenzhengrenzheng:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M512 0C230.4 0 0 230.4 0 512s230.4 512 512 512 512-230.4 512-512S793.6 0 512 0zM512 960c-249.6 0-448-198.4-448-448 0-249.6 198.4-448 448-448s448 198.4 448 448C960 761.6 761.6 960 512 960z"
              fill="''' + getColor(0, color, colors, '#C9A063') + '''"
            />
            <path
              d="M198.4 435.2l192 0c19.2 0 32-12.8 32-32 0-19.2-12.8-32-32-32l-192 0C179.2 371.2 166.4 384 166.4 403.2 166.4 416 179.2 435.2 198.4 435.2z"
              fill="''' + getColor(1, color, colors, '#C9A063') + '''"
            />
            <path
              d="M198.4 563.2l192 0c19.2 0 32-12.8 32-32 0-19.2-12.8-32-32-32l-192 0C179.2 499.2 166.4 512 166.4 531.2 166.4 544 179.2 563.2 198.4 563.2z"
              fill="''' + getColor(2, color, colors, '#C9A063') + '''"
            />
            <path
              d="M390.4 627.2l-192 0c-19.2 0-32 12.8-32 32 0 19.2 12.8 32 32 32l192 0c19.2 0 32-12.8 32-32C422.4 640 409.6 627.2 390.4 627.2z"
              fill="''' + getColor(3, color, colors, '#C9A063') + '''"
            />
            <path
              d="M857.6 691.2c0-70.4-38.4-134.4-102.4-166.4 19.2-25.6 38.4-51.2 38.4-89.6 0-70.4-57.6-128-128-128-70.4 0-128 57.6-128 128 0 32 12.8 64 38.4 89.6C512 550.4 473.6 614.4 473.6 691.2c0 0 0 0 0 0l0 0c0 19.2 12.8 32 32 32s32-12.8 32-32l0 0c0 0 0 0 0 0 0-70.4 57.6-128 128-128s128 57.6 128 128c0 0 0 0 0 0l0 0c0 19.2 12.8 32 32 32S857.6 704 857.6 691.2L857.6 691.2C857.6 691.2 857.6 691.2 857.6 691.2zM665.6 499.2c-38.4 0-64-25.6-64-64 0-38.4 25.6-64 64-64 38.4 0 64 25.6 64 64C729.6 467.2 704 499.2 665.6 499.2z"
              fill="''' + getColor(4, color, colors, '#C9A063') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.a_frame_39:
        svgXml = '''
          <svg viewBox="0 0 1060 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M792.393143 24.393143h-253.220572L304.493714 31.378286H265.142857a128 128 0 0 0-128 128v706.304a128 128 0 0 0 128 128h527.250286a128 128 0 0 0 128-128V152.393143a128 128 0 0 0-128-128zM283.428571 67.949714h3.035429v889.161143H283.428571a109.714286 109.714286 0 0 1-109.714285-109.714286V177.664a109.714286 109.714286 0 0 1 109.714285-109.714286z"
              fill="''' + getColor(0, color, colors, '#00BCA5') + '''"
            />
            <path
              d="M713.142857 60.964571h-155.428571v348.818286l74.752-44.873143a25.6 25.6 0 0 1 28.525714 1.462857l52.150857 39.131429V60.964571z"
              fill="''' + getColor(1, color, colors, '#FFFFFF') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.jiaoyiliebiao:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M856.74 551.62c-20.52-4.93-40.82 7.52-45.78 27.82-33.35 136.82-155.09 232.35-296.11 232.35-135.71 0-256.3-91.11-293.22-221.54-0.27-0.97-0.99-1.64-1.33-2.57-0.99-2.75-2.36-5.15-3.91-7.57-1.05-1.59-1.97-3.17-3.24-4.57-2.29-2.66-4.95-4.71-7.87-6.63-0.96-0.61-1.83-1.28-2.85-1.81-3.06-1.61-6.25-2.54-9.71-3.18-1.84-0.38-3.59-0.66-5.48-0.77-1.11-0.02-2.1-0.55-3.23-0.45-1.6 0.05-2.94 0.8-4.48 1.05-1.57 0.24-3.11-0.08-4.67 0.36-0.99 0.28-1.68 1-2.61 1.35-2.47 0.91-4.61 2.12-6.81 3.5-2.05 1.28-4 2.51-5.72 4.12-1.78 1.64-3.16 3.47-4.59 5.42-1.46 1.99-2.82 3.91-3.87 6.14-0.99 2.1-1.55 4.28-2.16 6.56-0.67 2.55-1.18 5.01-1.31 7.68-0.04 0.99-0.51 1.84-0.48 2.84l4.71 152.97c0.62 20.52 17.46 36.73 37.84 36.73 0.39 0 0.79 0 1.18-0.02 20.2-0.62 35.85-17.03 36.36-36.98 70.83 81.91 174.54 133.15 287.45 133.15 176.06 0 328.1-119.33 369.71-290.16 4.96-20.36-7.49-40.85-27.82-45.79zM850.11 253.57c-15.11 0-27.92 9.01-34 21.8-70.48-91.05-180.71-148.8-301.25-148.8-175.37 0-327.26 118.76-369.36 288.8-5.03 20.3 7.35 40.85 27.67 45.88 20.37 5.16 40.87-7.35 45.88-27.67 33.72-136.15 155.34-231.24 295.81-231.24 143.28 0 268.68 101.57 298.18 241.52 0.3 1.4 1.11 2.51 1.54 3.84 0.62 1.87 1.26 3.61 2.15 5.34 1.29 2.54 2.86 4.77 4.66 6.92 1.13 1.37 2.16 2.72 3.48 3.91 2.26 2.04 4.77 3.57 7.44 5.02 1.38 0.75 2.59 1.69 4.07 2.27 4.32 1.7 8.89 2.78 13.69 2.78h0.05c0.02 0 0.04-0.01 0.05-0.01 2.57-0.01 5.17-0.27 7.77-0.8 1.23-0.26 2.16-1.07 3.34-1.44 2.48-0.78 4.72-1.76 6.96-3 2.13-1.19 4.07-2.44 5.91-3.98 1.85-1.56 3.43-3.23 4.96-5.11 1.54-1.91 2.87-3.81 4.02-5.98 1.12-2.09 1.94-4.22 2.65-6.53 0.78-2.46 1.27-4.88 1.52-7.48 0.12-1.23 0.72-2.29 0.72-3.55v-144.6c-0.03-20.92-17-37.89-37.91-37.89z"
              fill="''' + getColor(0, color, colors, '#333333') + '''"
            />
            <path
              d="M371.43 556.68c-20.92 0-37.89 16.97-37.89 37.89s16.97 37.89 37.89 37.89h103.59l-0.86 70.22c-0.25 20.92 16.5 38.08 37.42 38.35h0.47c20.72 0 37.64-16.65 37.89-37.42l0.88-71.16h95.22c20.92 0 37.89-16.97 37.89-37.89s-16.97-37.89-37.89-37.89h-94.29l0.26-21.06h94.04c20.92 0 37.89-16.97 37.89-37.89s-16.97-37.89-37.89-37.89h-43.76l66.03-70.12c14.36-15.24 13.64-39.22-1.6-53.55-15.22-14.36-39.22-13.69-53.55 1.6l-99.13 105.25-103.61-105.78c-14.6-14.95-38.63-15.17-53.57-0.54s-15.19 38.63-0.54 53.57l68.14 69.58h-53.02c-20.92 0-37.89 16.97-37.89 37.89s16.97 37.89 37.89 37.89h104.78l-0.26 21.06H371.43z"
              fill="''' + getColor(1, color, colors, '#333333') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.kefu_1:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M634.5216 698.8288c1.024-5.0176-4.864-8.448-8.7552-5.12-18.5344 15.9232-58.7776 45.2096-104.2432 45.2096-46.7968 0-92.5184-17.3056-112.4352-25.9072-4.3008-1.8944-8.8064 2.3552-7.168 6.7584 8.1408 22.2208 35.3792 68.864 119.9616 68.864 84.5312-0.0512 106.8032-60.7744 112.64-89.8048z"
              fill="''' + getColor(0, color, colors, '#FF623E') + '''"
            />
            <path
              d="M920.832 366.6944C876.9024 181.3504 710.144 43.008 511.5392 43.008c-198.5536 0-365.3632 138.3424-409.2928 323.6864-37.376 6.7072-65.7408 39.2704-65.7408 78.592v145.1008c0 44.1344 35.7888 79.9232 79.9232 79.9232 26.1632 0 49.2544-12.5952 63.8464-32 34.6112 86.272 103.6288 155.4432 190.4128 191.1296 5.9904 2.4576 10.5472-5.632 5.376-9.5232-58.2656-43.9808-114.9952-114.9952-111.104-223.7952 0-23.552 23.552-61.7472 71.5776-68.608 48.0256-6.8608 266.7008-2.9184 294.144-118.6304 5.888-31.3856 3.1232-54.7328 23.1936-38.5536 8.8064 7.68 76.8 84.6336 85.9648 210.1248 5.4784 75.4688-4.9152 157.696-61.3888 218.112-4.3008 4.608 1.3824 11.7248 6.7584 8.4992 69.2736-40.96 122.88-104.8576 150.016-180.992 8.96 17.8688 24.3712 31.8976 43.2128 39.0656-9.8304 39.936-31.3344 94.1568-78.4384 140.0832-58.0096 56.6272-141.3632 87.808-248.0128 92.928-10.1888-23.0912-33.2288-39.2704-60.1088-39.2704-36.2496 0-65.6896 29.3888-65.6896 65.6896 0 36.2496 29.3888 65.6896 65.6896 65.6896 27.4944 0 51.0464-16.9472 60.8256-40.9088 120.3712-5.5296 215.4496-41.5232 283.0336-107.4688 59.8528-58.4192 84.6336-127.2832 94.9248-175.2064 32.3584-10.1888 55.8592-40.448 55.8592-76.2368V445.2864c0.0512-39.2704-28.3136-71.8848-65.6896-78.592zM505.4464 168.3968c-150.6304 0-278.9888 93.7984-328.0896 225.2288a80.50176 80.50176 0 0 0-24.32-19.3536c40.0896-160.6656 185.6-280.064 358.5024-280.064s318.4128 119.3984 358.5024 280.064a80.05632 80.05632 0 0 0-32.512 31.0272C791.8592 267.776 660.48 168.3968 505.4464 168.3968z"
              fill="''' + getColor(1, color, colors, '#FF623E') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.jiaoyi:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M510.7712 509.952m-450.816 0a450.816 450.816 0 1 0 901.632 0 450.816 450.816 0 1 0-901.632 0Z"
              fill="''' + getColor(0, color, colors, '#8486F8') + '''"
            />
            <path
              d="M510.7712 170.8544c-187.2896 0-339.0976 151.808-339.0976 339.0976s151.808 339.0976 339.0976 339.0976 339.0976-151.808 339.0976-339.0976-151.808-339.0976-339.0976-339.0976zM319.8464 399.4624l126.8224-102.0928c7.7824-6.2976 19.4048-0.7168 19.4048 9.3184v66.8672h106.2912c36.096 0 119.552 5.0176 133.7344 104.96 0.7168 5.0688-5.632 7.9872-9.0112 4.1472-18.9952-21.3504-41.4208-37.4784-85.5552-37.4784H466.0224v65.7408c0 10.0352-11.6224 15.5648-19.4048 9.3184L319.8464 418.048a11.91936 11.91936 0 0 1 0-18.5856z m381.9008 211.4048l-126.8224 102.0928c-7.7824 6.2976-19.4048 0.7168-19.4048-9.3184v-66.8672H449.2288c-36.096 0-119.552-5.0176-133.7344-104.96-0.7168-5.0688 5.632-7.9872 9.0112-4.1472 18.9952 21.3504 41.4208 37.4784 85.5552 37.4784h145.5104V499.456c0-10.0352 11.6224-15.5648 19.4048-9.3184l126.8224 102.0928c5.888 4.8128 5.888 13.824-0.0512 18.6368z"
              fill="''' + getColor(1, color, colors, '#FFFFFF') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.a_kefufuwu:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M254.094058 368.633917a257.391942 257.391942 0 1 0 514.783884 0 257.391942 257.391942 0 1 0-514.783884 0z"
              fill="''' + getColor(0, color, colors, '#9776FF') + '''"
            />
            <path
              d="M955.0569 944.857788a450.087899 450.087899 0 0 0-258.322941-330.932926 364.444918 364.444918 0 0 1-367.702918 0A451.483899 451.483899 0 0 0 70.707099 944.857788a67.954985 67.954985 0 0 0 67.024985 79.125982h749.369832a67.489985 67.489985 0 0 0 67.954984-79.125982z"
              fill="''' + getColor(1, color, colors, '#9776FF') + '''"
            />
            <path
              d="M947.609902 347.689922a93.089979 93.089979 0 0 0-82.383981-93.089979 367.702917 367.702917 0 0 0-698.170844 0 93.089979 93.089979 0 0 0-89.830979 93.089979 95.416979 95.416979 0 0 0 93.089979 93.088979h6.049998a23.737995 23.737995 0 0 0 20.013996-26.995994 315.107929 315.107929 0 0 1-3.257999-46.544989 323.019927 323.019927 0 0 1 645.575855 0 316.969929 316.969929 0 0 1-3.259 46.544989 23.737995 23.737995 0 0 0 20.014996 26.529994h3.257999a23.737995 23.737995 0 0 0 15.824997-6.049999 93.089979 93.089979 0 0 0 73.074983-86.57398z"
              fill="''' + getColor(2, color, colors, '#B799FF') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.a_gonglve_2:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M517.6832 509.696m-450.816 0a450.816 450.816 0 1 0 901.632 0 450.816 450.816 0 1 0-901.632 0Z"
              fill="''' + getColor(0, color, colors, '#FF9552') + '''"
            />
            <path
              d="M658.2784 219.8528H341.2992c-49.408 0-89.4464 40.0384-89.4464 89.4464v390.3488c0 49.408 40.0384 89.4464 89.4464 89.4464h211.0464c-3.7376-10.8032-4.864-22.5792-2.816-34.4064l7.4752-43.52-31.6416-30.8224c-18.944-18.4832-25.6512-45.6192-17.4592-70.8096 8.192-25.1904 29.5424-43.2128 55.7568-47.0016l43.7248-6.3488 19.5584-39.6288c11.7248-23.7568 35.4304-38.5024 61.9008-38.5024 24.3712 0 46.336 12.4928 58.8288 32.9728v-201.728c0.0512-49.408-39.9872-89.4464-89.3952-89.4464z m-209.4592 394.3936H385.8944a34.304 34.304 0 0 1 0-68.608h62.9248a34.304 34.304 0 0 1 0 68.608z m133.2224-113.0496H385.8944a34.304 34.304 0 0 1 0-68.608h196.1472a34.304 34.304 0 0 1 0 68.608z m26.4192-113.0496H385.8944a34.304 34.304 0 0 1 0-68.608h222.5664a34.304 34.304 0 0 1 0 68.608z"
              fill="''' + getColor(1, color, colors, '#FFFFFF') + '''"
            />
            <path
              d="M712.9088 535.2448l23.1424 46.848a26.81344 26.81344 0 0 0 20.224 14.6944l51.712 7.5264c22.016 3.1744 30.8224 30.2592 14.8992 45.7728l-37.4272 36.4544a26.78784 26.78784 0 0 0-7.7312 23.7568l8.8576 51.5072c3.7376 21.9136-19.2512 38.656-38.9632 28.3136l-46.2336-24.32c-7.8336-4.096-17.152-4.096-24.9856 0l-46.2336 24.32c-19.712 10.3424-42.7008-6.3488-38.9632-28.3136l8.8576-51.5072c1.4848-8.704-1.3824-17.6128-7.7312-23.7568l-37.4272-36.4544c-15.9232-15.5136-7.1168-42.5984 14.8992-45.7728l51.712-7.5264a26.90048 26.90048 0 0 0 20.224-14.6944l23.1424-46.848c9.728-19.968 38.1952-19.968 48.0256 0z"
              fill="''' + getColor(2, color, colors, '#FFFFFF') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.lvyougonglve:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M511.8464 517.7856m-450.816 0a450.816 450.816 0 1 0 901.632 0 450.816 450.816 0 1 0-901.632 0Z"
              fill="''' + getColor(0, color, colors, '#59ADF8') + '''"
            />
            <path
              d="M302.8992 421.4784H237.9264c-15.3088 0-27.7504-12.3904-27.7504-27.7504s12.3904-27.7504 27.7504-27.7504h64.9728c15.3088 0 27.7504 12.3904 27.7504 27.7504s-12.4416 27.7504-27.7504 27.7504zM302.8992 668.7744H237.9264c-15.3088 0-27.7504-12.3904-27.7504-27.7504s12.3904-27.7504 27.7504-27.7504h64.9728c15.3088 0 27.7504 12.3904 27.7504 27.7504s-12.4416 27.7504-27.7504 27.7504z"
              fill="''' + getColor(1, color, colors, '#FFFFFF') + '''"
            />
            <path
              d="M707.4816 224.8192H311.5008c-30.976 0-56.1152 25.1392-56.1152 56.1152v50.0736h43.9808c35.1744 0 63.6928 28.5184 63.6928 63.6928 0 35.1744-28.5184 63.6928-63.6928 63.6928h-43.9808v118.3232h43.9808c35.1744 0 63.6928 28.5184 63.6928 63.6928 0 35.1744-28.5184 63.6928-63.6928 63.6928h-43.9808v47.0528c0 30.976 25.1392 56.1152 56.1152 56.1152h395.9808c31.0272 0 56.1152-25.1392 56.1152-56.1152V280.9856c0-31.0272-25.1392-56.1664-56.1152-56.1664z m-46.4896 264.704l-48.9984 47.7696c-3.84 3.7376-5.632 9.1648-4.7104 14.4896l11.5712 67.4304c2.304 13.3632-11.7248 23.552-23.7568 17.2544l-60.5696-31.8464c-4.7616-2.5088-10.4448-2.5088-15.2064 0l-60.5696 31.8464c-11.9808 6.2976-26.0096-3.8912-23.7568-17.2544l11.5712-67.4304c0.9216-5.3248-0.8704-10.7008-4.7104-14.4896l-48.9984-47.7696c-9.728-9.472-4.352-25.9584 9.0624-27.904l67.7376-9.8304c5.3248-0.768 9.9328-4.1472 12.3392-8.96l30.2592-61.3376c5.9904-12.1856 23.3472-12.1856 29.3376 0l30.2592 61.3376c2.4064 4.8128 7.0144 8.192 12.3392 8.96l67.7376 9.8304c13.4144 1.9456 18.7904 18.432 9.0624 27.904z"
              fill="''' + getColor(2, color, colors, '#FFFFFF') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.kefu:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M512 512m-512 0a512 512 0 1 0 1024 0 512 512 0 1 0-1024 0Z"
              fill="''' + getColor(0, color, colors, '#FEB833') + '''"
            />
            <path
              d="M324.408781 655.018925C505.290126 655.018925 651.918244 508.387706 651.918244 327.509463c0-152.138029-103.733293-280.047334-244.329811-316.853972C205.813923 52.463528 47.497011 213.017581 8.987325 415.981977 47.587706 553.880127 174.183098 655.018925 324.408781 655.018925z"
              fill="''' + getColor(1, color, colors, '#FFFFFF') + '''"
              fill-opacity=".2"
            />
            <path
              d="M512 1024c282.766631 0 512-229.233369 512-512 0-31.765705-2.891385-62.853911-8.433853-93.018889C928.057169 336.0999 809.874701 285.26268 679.824375 285.26268c-269.711213 0-488.357305 218.645317-488.357305 488.357305 0 54.959576 9.084221 107.802937 25.822474 157.10377C300.626556 989.489417 402.283167 1024 512 1024z"
              fill="''' + getColor(2, color, colors, '#FFFFFF') + '''"
              fill-opacity=".15"
            />
            <path
              d="M732.535958 756.566238c36.389596 0 65.889478-29.499882 65.889477-65.889478 0 36.389596 29.502983 65.889478 65.889478 65.889478-17.053747 0-65.889478 29.502983-65.889478 65.889477 0-36.386495-29.499882-65.889478-65.889477-65.889477zM159.685087 247.279334c25.686819 0 46.51022-20.8234 46.51022-46.51022 0 25.686819 20.8234 46.51022 46.510219 46.51022-12.03607 0-46.51022 20.8234-46.510219 46.510219 0-25.686819-20.8234-46.51022-46.51022-46.510219z"
              fill="''' + getColor(3, color, colors, '#FFFFFF') + '''"
              fill-opacity=".5"
            />
            <path
              d="M206.195307 333.32324c8.562531 0 15.503407-6.940875 15.503406-15.503407 0 8.562531 6.940875 15.503407 15.503407 15.503407-4.012282 0-15.503407 6.940875-15.503407 15.503406 0-8.562531-6.940875-15.503407-15.503406-15.503406z"
              fill="''' + getColor(4, color, colors, '#FFFFFF') + '''"
              fill-opacity=".3"
            />
            <path
              d="M759.151431 410.818568h-1.099967C732.566964 295.68407 625.581832 214.054759 503.008799 216.318256c-122.572257 2.264273-226.323379 87.709747-247.215769 203.620191C233.025502 423.560818 216.272521 443.224563 216.272521 466.316112v92.754556c0.582153 26.131767 22.18615 46.894704 48.317917 46.377665 14.036009-0.194568 27.296073-6.468796 36.222159-17.270795 21.732675 54.656484 64.617423 98.317178 118.885547 120.956027 0.711606-1.292984 1.487552-2.522404 2.393726-3.68671a4.257235 4.257235 0 0 1 2.651857-1.940251c0.84106 0 1.617005 0.323246 2.328612 0.775946a205.980584 205.980584 0 0 1-68.110341-121.020367c-3.299125-28.719285 15.5879-55.239413 43.725033-61.57798 41.590213-7.567988 82.857956-15.97626 124.448945-23.221002 24.513986-3.427803 45.53583-19.275385 55.43243-41.978574a105.605329 105.605329 0 0 0 8.085026-32.341657c0.324021-2.005366 1.875912-3.622371 3.816164-4.009956 2.005366-0.452699 4.140185 0.323246 5.30449 1.940252l1.099192-0.711607c16.429735 23.221002 48.317917 73.996984 53.492178 127.553502 5.304491 61.319073 2.393726 103.492215-46.183097 146.506417a3.771204 3.771204 0 0 0-1.099192 2.651857c0.064339 1.293759 0.711606 2.458065 1.810798 3.104557h3.104557l2.07048-1.164305a216.625223 216.625223 0 0 0 103.426326-122.573033 49.203161 49.203161 0 0 0 30.918443 19.921877c-20.374577 90.491058-103.8798 147.217248-207.177447 155.820088-7.76178-18.49944-27.489865-28.977417-47.153611-24.967461-21.732675 3.492917-36.609744 23.932609-33.116827 45.666059 2.84565 17.854498 17.334359 31.567261 35.251646 33.373408 19.792424 2.976654 39.00347-8.402846 45.794737-27.293747 119.597929-9.378786 215.521381-78.136394 235.576588-185.57345 17.9762-6.985835 29.94483-24.191516 30.138622-43.466901v-92.818895c-0.062014-12.613572-5.240151-24.708554-14.42592-33.376509-9.379561-8.926086-21.860578-13.842217-34.797395-13.777102l0.647267-0.129453z m-44.113393 26.778259c-45.989305-114.422892-176.000872-169.920436-290.423764-123.996246-56.144036 22.57451-100.710129 66.881696-123.543546 122.897054-1.617005-1.811573-3.363464-3.492917-5.174262-5.109923 16.364621-99.999298 105.949505-173.737375 211.381972-174.12496 105.431691-0.38836 195.534389 72.831903 212.610616 172.701748-1.875912 2.458065-3.492917 4.980469-4.851016 7.632327z"
              fill="''' + getColor(5, color, colors, '#FFFFFF') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.chenggong:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M512 1024a512 512 0 1 1 0-1024 512 512 0 0 1 0 1024z m-71.318588-361.411765a29.334588 29.334588 0 0 0 20.48-8.252235L774.625882 349.364706a27.708235 27.708235 0 0 0 0-39.936 29.575529 29.575529 0 0 0-41.08047 0l-292.74353 284.912941L290.454588 448.150588a29.575529 29.575529 0 0 0-41.08047 0 27.708235 27.708235 0 0 0 0 39.996236l170.706823 166.128941a29.274353 29.274353 0 0 0 20.540235 8.252235z"
              fill="''' + getColor(0, color, colors, '#33A954') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.quxiao:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M512 512m-450.56 0a450.56 450.56 0 1 0 901.12 0 450.56 450.56 0 1 0-901.12 0Z"
              fill="''' + getColor(0, color, colors, '#131415') + '''"
            />
            <path
              d="M717.55776 305.7664l0.67584 0.67584a30.72 30.72 0 0 1 0 43.43808L556.1344 512l162.0992 162.11968a30.72 30.72 0 0 1 0 43.43808l-0.67584 0.67584a30.72 30.72 0 0 1-43.43808 0L512 556.1344l-162.11968 162.0992a30.72 30.72 0 0 1-43.43808 0l-0.67584-0.67584a30.72 30.72 0 0 1 0-43.43808L467.8656 512l-162.0992-162.11968a30.72 30.72 0 0 1 0-43.43808l0.67584-0.67584a30.72 30.72 0 0 1 43.43808 0L512 467.8656l162.11968-162.0992a30.72 30.72 0 0 1 43.43808 0z"
              fill="''' + getColor(1, color, colors, '#FFFFFF') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.liulanqi:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M752.256 968.832H255.872c-112.64 0-204.032-91.392-204.032-204.032V268.416c0-112.64 91.392-204.032 204.032-204.032h496.384c112.64 0 204.032 91.392 204.032 204.032v496.384c0 112.64-91.392 204.032-204.032 204.032z"
              fill="''' + getColor(0, color, colors, '#FFFFFF') + '''"
            />
            <path
              d="M504.064 516.608m-384.256 0a384.256 384.256 0 1 0 768.512 0 384.256 384.256 0 1 0-768.512 0Z"
              fill="''' + getColor(1, color, colors, '#009CF5') + '''"
            />
            <path
              d="M746.112 270.464L472.448 485.12l63.104 63.104L750.08 274.56c2.304-2.688-1.28-6.144-3.968-4.096z"
              fill="''' + getColor(2, color, colors, '#FF4C3A') + '''"
            />
            <path
              d="M262.016 762.752l273.664-214.528-63.104-63.104-214.656 273.536c-2.176 2.688 1.28 6.144 4.096 4.096z"
              fill="''' + getColor(3, color, colors, '#FFFFFF') + '''"
            />
            <path
              d="M505.216 155.136c-3.2 0-5.888 2.56-5.888 5.888v53.504c0 3.2 2.56 5.888 5.888 5.888s5.888-2.56 5.888-5.888v-53.504c-0.128-3.2-2.688-5.888-5.888-5.888zM442.368 160.512c-3.2 0.512-5.376 3.584-4.736 6.784l9.344 52.736c0.512 3.2 3.584 5.376 6.784 4.736 3.2-0.512 5.376-3.584 4.736-6.784l-9.344-52.736c-0.512-3.2-3.584-5.376-6.784-4.736zM396.288 234.368c1.152 3.072 4.48 4.608 7.552 3.456 3.072-1.152 4.608-4.48 3.456-7.552l-18.304-50.304c-1.152-3.072-4.48-4.608-7.552-3.456-3.072 1.152-4.608 4.48-3.456 7.552l18.304 50.304zM348.928 257.408c1.664 2.816 5.248 3.712 7.936 2.176s3.712-5.248 2.176-7.936l-26.752-46.336c-1.664-2.816-5.248-3.712-7.936-2.176-2.816 1.664-3.712 5.248-2.176 7.936l26.752 46.336zM306.304 288.256c2.048 2.432 5.76 2.816 8.192 0.768 2.432-2.048 2.816-5.76 0.768-8.192l-34.432-40.96c-2.048-2.432-5.76-2.816-8.192-0.768-2.432 2.048-2.816 5.76-0.768 8.192l34.432 40.96zM269.696 326.144c2.432 2.048 6.144 1.792 8.192-0.768 2.048-2.432 1.792-6.144-0.768-8.192l-40.96-34.432c-2.432-2.048-6.144-1.792-8.192 0.768-2.048 2.432-1.792 6.144 0.768 8.192l40.96 34.432zM193.792 342.912l46.336 26.752c2.816 1.664 6.4 0.64 7.936-2.176 1.664-2.816 0.64-6.4-2.176-8.064L199.552 332.8c-2.816-1.664-6.4-0.64-7.936 2.176-1.664 2.688-0.64 6.272 2.176 7.936zM168.32 399.488l50.304 18.304c3.072 1.152 6.4-0.512 7.552-3.456 1.152-3.072-0.512-6.4-3.456-7.552l-50.304-18.304c-3.072-1.152-6.4 0.512-7.552 3.456-1.152 3.072 0.384 6.4 3.456 7.552zM207.872 457.344l-52.736-9.344c-3.2-0.512-6.272 1.536-6.784 4.736-0.512 3.2 1.536 6.272 4.736 6.784l52.736 9.344c3.2 0.512 6.272-1.536 6.784-4.736 0.512-3.2-1.536-6.272-4.736-6.784zM201.984 509.568H148.48c-3.2 0-5.888 2.56-5.888 5.888 0 3.2 2.56 5.888 5.888 5.888h53.504c3.2 0 5.888-2.56 5.888-5.888 0-3.2-2.56-5.888-5.888-5.888zM205.44 562.176l-52.736 9.344c-3.2 0.512-5.376 3.584-4.736 6.784 0.512 3.2 3.584 5.376 6.784 4.736l52.736-9.344c3.2-0.512 5.376-3.584 4.736-6.784s-3.584-5.248-6.784-4.736zM217.856 613.376l-50.304 18.304c-3.072 1.152-4.608 4.48-3.456 7.552 1.152 3.072 4.48 4.608 7.552 3.456l50.304-18.304c3.072-1.152 4.608-4.48 3.456-7.552-1.152-3.072-4.48-4.608-7.552-3.456zM238.976 661.504l-46.336 26.752c-2.816 1.664-3.712 5.248-2.176 8.064 1.664 2.816 5.248 3.712 8.064 2.176l46.336-26.752c2.816-1.664 3.712-5.248 2.176-8.064-1.664-2.816-5.248-3.712-8.064-2.176zM268.16 705.408l-40.96 34.432c-2.432 2.048-2.816 5.76-0.768 8.192 2.048 2.432 5.76 2.816 8.192 0.768l40.96-34.432c2.432-2.048 2.816-5.76 0.768-8.192-1.92-2.56-5.632-2.816-8.192-0.768zM304.512 743.424l-34.432 40.96c-2.048 2.432-1.792 6.144 0.768 8.192 2.432 2.048 6.144 1.792 8.192-0.768l34.432-40.96c2.048-2.432 1.792-6.144-0.768-8.192-2.304-1.92-6.016-1.664-8.192 0.768zM347.008 774.656l-26.752 46.336c-1.664 2.816-0.64 6.4 2.176 7.936 2.816 1.664 6.4 0.64 8.064-2.176l26.752-46.336c1.664-2.816 0.64-6.4-2.176-7.936-2.816-1.536-6.4-0.64-8.064 2.176zM394.24 798.08l-18.304 50.304c-1.152 3.072 0.512 6.4 3.456 7.552 3.072 1.152 6.4-0.512 7.552-3.456l18.304-50.304c1.152-3.072-0.512-6.4-3.456-7.552-3.072-1.152-6.528 0.384-7.552 3.456zM440.192 872.32c3.2 0.512 6.272-1.536 6.784-4.736l9.344-52.736c0.512-3.2-1.536-6.272-4.736-6.784-3.2-0.512-6.272 1.536-6.784 4.736l-9.344 52.736c-0.64 3.2 1.536 6.272 4.736 6.784zM502.912 878.08c3.2 0 5.888-2.56 5.888-5.888v-53.504c0-3.2-2.56-5.888-5.888-5.888-3.2 0-5.888 2.56-5.888 5.888v53.504c0 3.2 2.688 5.888 5.888 5.888zM549.632 815.232l9.344 52.736c0.512 3.2 3.584 5.376 6.784 4.736 3.2-0.512 5.376-3.584 4.736-6.784l-9.344-52.736c-0.512-3.2-3.584-5.376-6.784-4.736-3.2 0.512-5.248 3.584-4.736 6.784zM600.832 802.816l18.304 50.304c1.152 3.072 4.48 4.608 7.552 3.456 3.072-1.152 4.608-4.48 3.456-7.552L611.84 798.72c-1.152-3.072-4.48-4.608-7.552-3.456-3.072 1.152-4.608 4.48-3.456 7.552zM649.088 781.696l26.752 46.336c1.664 2.816 5.248 3.712 8.064 2.176 2.816-1.664 3.712-5.248 2.176-8.064l-26.88-46.336c-1.664-2.816-5.248-3.712-8.064-2.176-2.816 1.664-3.712 5.248-2.048 8.064zM692.864 752.384l34.432 40.96c2.048 2.432 5.76 2.816 8.192 0.768 2.432-2.048 2.816-5.76 0.768-8.192l-34.432-40.96c-2.048-2.432-5.76-2.816-8.192-0.768-2.56 2.048-2.816 5.76-0.768 8.192zM730.88 716.032l40.96 34.432c2.432 2.048 6.144 1.792 8.192-0.768 2.048-2.432 1.792-6.144-0.768-8.192l-40.96-34.432c-2.432-2.048-6.144-1.792-8.192 0.768-1.92 2.432-1.664 6.144 0.768 8.192zM762.112 673.664l46.336 26.752c2.816 1.664 6.4 0.64 8.064-2.176 1.664-2.816 0.64-6.4-2.176-7.936L768 663.552c-2.816-1.664-6.4-0.64-8.064 2.176-1.536 2.688-0.64 6.272 2.176 7.936zM785.536 626.432l50.304 18.304c3.072 1.152 6.4-0.512 7.552-3.456 1.152-3.072-0.512-6.4-3.456-7.552l-50.304-18.304c-3.072-1.152-6.4 0.512-7.552 3.456-1.152 3.072 0.384 6.4 3.456 7.552zM800.256 575.872l52.736 9.344c3.2 0.512 6.272-1.536 6.784-4.736 0.512-3.2-1.536-6.272-4.736-6.784l-52.736-9.344c-3.2-0.512-6.272 1.536-6.784 4.736-0.512 3.2 1.536 6.272 4.736 6.784zM800.256 517.76c0 3.2 2.56 5.888 5.888 5.888h53.504c3.2 0 5.888-2.56 5.888-5.888 0-3.2-2.56-5.888-5.888-5.888h-53.504c-3.328 0-5.888 2.56-5.888 5.888zM802.688 471.04l52.736-9.344c3.2-0.512 5.376-3.584 4.736-6.784-0.512-3.2-3.584-5.376-6.784-4.736l-52.736 9.344c-3.2 0.512-5.376 3.584-4.736 6.784 0.512 3.2 3.584 5.248 6.784 4.736zM790.272 419.84l50.304-18.304c3.072-1.152 4.608-4.48 3.456-7.552-1.152-3.072-4.48-4.608-7.552-3.456l-50.304 18.304c-3.072 1.152-4.608 4.48-3.456 7.552 1.152 2.944 4.48 4.608 7.552 3.456zM769.152 371.584l46.336-26.752c2.816-1.664 3.712-5.248 2.176-7.936-1.664-2.816-5.248-3.712-8.064-2.176l-46.336 26.752c-2.816 1.664-3.712 5.248-2.176 8.064 1.664 2.688 5.248 3.712 8.064 2.048zM739.84 327.808l40.96-34.432c2.432-2.048 2.816-5.76 0.768-8.192-2.048-2.432-5.76-2.816-8.192-0.768l-40.96 34.432c-2.432 2.048-2.816 5.76-0.768 8.192 2.048 2.56 5.76 2.816 8.192 0.768zM703.488 289.664l34.432-40.96c2.048-2.432 1.792-6.144-0.768-8.192-2.432-2.048-6.144-1.792-8.192 0.768l-34.432 40.96c-2.048 2.432-1.792 6.144 0.768 8.192 2.432 2.048 6.144 1.792 8.192-0.768zM661.12 258.56l26.752-46.336c1.664-2.816 0.64-6.4-2.176-7.936-2.816-1.664-6.4-0.64-8.064 2.176l-26.752 46.336c-1.664 2.816-0.64 6.4 2.176 7.936 2.816 1.536 6.4 0.64 8.064-2.176zM613.888 235.136l18.304-50.304c1.152-3.072-0.512-6.4-3.456-7.552-3.072-1.152-6.4 0.512-7.552 3.456L602.88 231.168c-1.152 3.072 0.512 6.4 3.456 7.552 3.072 1.024 6.4-0.512 7.552-3.584zM556.544 225.152c3.2 0.512 6.272-1.536 6.784-4.736l9.344-52.736c0.512-3.2-1.536-6.272-4.736-6.784-3.2-0.512-6.272 1.536-6.784 4.736l-9.344 52.736c-0.512 3.2 1.536 6.144 4.736 6.784zM273.536 290.432c2.432 2.432 6.528 2.432 8.96 0 2.432-2.432 2.432-6.528 0-8.96l-21.12-21.12c-2.432-2.432-6.528-2.432-8.96 0-2.432 2.432-2.432 6.528 0 8.96l21.12 21.12zM237.824 333.824c2.944 2.048 6.912 1.28 8.832-1.536 2.048-2.944 1.28-6.912-1.536-8.832l-24.448-17.152c-2.944-2.048-6.912-1.28-8.832 1.536s-1.28 6.912 1.536 8.832l24.448 17.152zM183.04 370.176l27.136 12.672c3.2 1.536 7.04 0.128 8.448-3.072 1.536-3.2 0.128-7.04-3.072-8.448l-27.136-12.672c-3.2-1.536-7.04-0.128-8.448 3.072-1.536 3.2-0.128 7.04 3.072 8.448zM194.688 423.68l-28.928-7.68c-3.456-0.896-6.912 1.152-7.808 4.48-0.896 3.456 1.152 6.912 4.48 7.808l28.928 7.68c3.456 0.896 6.912-1.152 7.808-4.48 0.896-3.456-1.152-6.912-4.48-7.808zM183.168 478.72l-29.824-2.56c-3.456-0.256-6.656 2.304-6.912 5.76-0.256 3.456 2.304 6.656 5.76 6.912l29.824 2.56c3.456 0.256 6.656-2.304 6.912-5.76 0.384-3.456-2.176-6.528-5.76-6.912zM181.504 535.04l-29.824 2.56c-3.456 0.256-6.144 3.456-5.76 6.912 0.256 3.456 3.456 6.144 6.912 5.76l29.824-2.56c3.456-0.256 6.144-3.456 5.76-6.912-0.256-3.456-3.328-6.016-6.912-5.76zM191.36 590.72l-28.928 7.68c-3.456 0.896-5.376 4.352-4.48 7.808 0.896 3.456 4.352 5.376 7.808 4.48l28.928-7.68c3.456-0.896 5.376-4.352 4.48-7.808-0.896-3.328-4.352-5.376-7.808-4.48zM207.232 644.224l-27.136 12.672c-3.2 1.536-4.608 5.248-3.072 8.448 1.536 3.2 5.248 4.608 8.448 3.072l27.136-12.672c3.2-1.536 4.608-5.248 3.072-8.448-1.408-3.2-5.248-4.48-8.448-3.072zM233.984 693.888l-24.448 17.152c-2.944 2.048-3.584 6.016-1.536 8.832 2.048 2.944 6.016 3.584 8.832 1.536l24.448-17.152c2.944-2.048 3.584-6.016 1.536-8.832-2.048-2.944-6.016-3.584-8.832-1.536zM310.912 775.552L293.76 800c-2.048 2.944-1.28 6.912 1.536 8.832 2.944 2.048 6.912 1.28 8.832-1.536l17.152-24.448c2.048-2.944 1.28-6.912-1.536-8.832-2.816-2.048-6.912-1.408-8.832 1.536zM349.184 840.704c3.2 1.536 7.04 0.128 8.448-3.072l12.672-27.136c1.536-3.2 0.128-7.04-3.072-8.448-3.2-1.536-7.04-0.128-8.448 3.072l-12.672 27.136c-1.408 3.2-0.128 6.912 3.072 8.448zM407.808 862.72c3.456 0.896 6.912-1.152 7.808-4.48l7.68-28.928c0.896-3.456-1.152-6.912-4.48-7.808-3.456-0.896-6.912 1.152-7.808 4.48l-7.68 28.928c-0.896 3.328 1.152 6.912 4.48 7.808zM469.376 874.112c3.456 0.256 6.656-2.304 6.912-5.76l2.56-29.824c0.256-3.456-2.304-6.656-5.76-6.912-3.456-0.256-6.656 2.304-6.912 5.76l-2.56 29.824c-0.256 3.584 2.304 6.656 5.76 6.912zM522.496 839.168l2.56 29.824c0.256 3.456 3.456 6.144 6.912 5.76 3.456-0.256 6.144-3.456 5.76-6.912l-2.56-29.824c-0.256-3.456-3.456-6.144-6.912-5.76-3.456 0.256-6.016 3.328-5.76 6.912zM578.176 830.976l7.68 28.928c0.896 3.456 4.352 5.376 7.808 4.48 3.456-0.896 5.376-4.352 4.48-7.808l-7.68-28.928c-0.896-3.456-4.352-5.376-7.808-4.48-3.328 0.896-5.376 4.48-4.48 7.808zM631.68 813.312l12.672 27.136c1.536 3.2 5.248 4.608 8.448 3.072 3.2-1.536 4.608-5.248 3.072-8.448l-12.672-27.136c-1.536-3.2-5.248-4.608-8.448-3.072-3.2 1.536-4.48 5.248-3.072 8.448zM681.344 786.688l17.152 24.448c2.048 2.944 6.016 3.584 8.832 1.536 2.944-2.048 3.584-6.016 1.536-8.832l-17.152-24.448c-2.048-2.944-6.016-3.584-8.832-1.536-2.944 1.92-3.584 5.888-1.536 8.832zM725.504 751.744l21.12 21.12c2.432 2.432 6.528 2.432 8.96 0 2.432-2.432 2.432-6.528 0-8.96l-21.12-21.12c-2.432-2.432-6.528-2.432-8.96 0-2.432 2.432-2.432 6.528 0 8.96zM763.008 709.76l24.448 17.152c2.944 2.048 6.912 1.28 8.832-1.536 2.048-2.944 1.28-6.912-1.536-8.832l-24.448-17.152c-2.944-2.048-6.912-1.28-8.832 1.536-2.048 2.816-1.408 6.784 1.536 8.832zM792.576 661.888l27.136 12.672c3.2 1.536 7.04 0.128 8.448-3.072 1.536-3.2 0.128-7.04-3.072-8.448l-27.136-12.672c-3.2-1.536-7.04-0.128-8.448 3.072-1.536 3.2-0.128 6.912 3.072 8.448zM813.44 609.536l28.928 7.68c3.456 0.896 6.912-1.152 7.808-4.48 0.896-3.456-1.152-6.912-4.48-7.808l-28.928-7.68c-3.456-0.896-6.912 1.152-7.808 4.48-0.896 3.456 1.024 6.912 4.48 7.808zM824.832 554.368l29.824 2.56c3.456 0.256 6.656-2.304 6.912-5.76 0.256-3.456-2.304-6.656-5.76-6.912l-29.824-2.56c-3.456-0.256-6.656 2.304-6.912 5.76-0.256 3.584 2.304 6.656 5.76 6.912zM826.624 498.176l29.824-2.56c3.456-0.256 6.144-3.456 5.76-6.912-0.256-3.456-3.456-6.144-6.912-5.76l-29.824 2.56c-3.456 0.256-6.144 3.456-5.76 6.912 0.256 3.456 3.328 6.016 6.912 5.76zM818.432 442.368l28.928-7.68c3.456-0.896 5.376-4.352 4.48-7.808-0.896-3.456-4.352-5.376-7.808-4.48l-28.928 7.68c-3.456 0.896-5.376 4.352-4.48 7.808 0.896 3.456 4.48 5.376 7.808 4.48zM800.768 388.992l27.136-12.672c3.2-1.536 4.608-5.248 3.072-8.448-1.536-3.2-5.248-4.608-8.448-3.072l-27.136 12.672c-3.2 1.536-4.608 5.248-3.072 8.448 1.536 3.072 5.248 4.48 8.448 3.072zM774.144 339.328l24.448-17.152c2.944-2.048 3.584-6.016 1.536-8.832-2.048-2.944-6.016-3.584-8.832-1.536L766.848 328.96c-2.944 2.048-3.584 6.016-1.536 8.832 1.92 2.816 5.888 3.584 8.832 1.536zM697.216 257.664l17.152-24.448c2.048-2.944 1.28-6.912-1.536-8.832-2.944-2.048-6.912-1.28-8.832 1.536l-17.152 24.448c-2.048 2.944-1.28 6.912 1.536 8.832 2.816 2.048 6.784 1.408 8.832-1.536zM658.944 192.512c-3.2-1.536-7.04-0.128-8.448 3.072l-12.672 27.136c-1.536 3.2-0.128 7.04 3.072 8.448 3.2 1.536 7.04 0.128 8.448-3.072l12.672-27.136c1.408-3.2 0-7.04-3.072-8.448zM600.192 170.496c-3.456-0.896-6.912 1.152-7.808 4.48l-7.68 28.928c-0.896 3.456 1.152 6.912 4.48 7.808 3.456 0.896 6.912-1.152 7.808-4.48l7.68-28.928c1.024-3.328-1.024-6.912-4.48-7.808zM534.912 201.6c3.456 0.256 6.656-2.304 6.912-5.76l2.56-29.824c0.256-3.456-2.304-6.656-5.76-6.912-3.456-0.256-6.656 2.304-6.912 5.76l-2.56 29.824c-0.256 3.456 2.304 6.528 5.76 6.912zM476.032 158.464c-3.456 0.256-6.144 3.456-5.76 6.912l2.56 29.824c0.256 3.456 3.456 6.144 6.912 5.76 3.456-0.256 6.144-3.456 5.76-6.912l-2.56-29.824c-0.256-3.456-3.328-6.016-6.912-5.76zM422.144 173.312c-0.896-3.456-4.352-5.376-7.808-4.48-3.456 0.896-5.376 4.352-4.48 7.808l7.68 28.928c0.896 3.456 4.352 5.376 7.808 4.48 3.456-0.896 5.376-4.352 4.48-7.808l-7.68-28.928zM376.448 219.776l-12.672-27.136c-1.536-3.2-5.248-4.608-8.448-3.072-3.2 1.536-4.608 5.248-3.072 8.448L364.8 225.28c1.536 3.2 5.248 4.608 8.448 3.072 3.2-1.536 4.608-5.376 3.2-8.576zM316.416 253.824c2.048 2.944 6.016 3.584 8.832 1.536 2.944-2.048 3.584-6.016 1.536-8.832l-17.152-24.448c-2.048-2.944-6.016-3.584-8.832-1.536-2.944 2.048-3.584 6.016-1.536 8.832l17.152 24.448z"
              fill="''' + getColor(4, color, colors, '#FFFFFF') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.fangda:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M852.68743 966.232318 171.311547 966.232318c-62.714867 0-113.562988-50.846038-113.562988-113.558335L57.748558 171.324994c0-62.712297 50.848122-113.558335 113.562988-113.558335l681.376907 0c62.714867 0 113.562988 50.846038 113.562988 113.558335l0 681.348989C966.250418 915.38628 915.40332 966.232318 852.68743 966.232318zM909.469948 171.324994c0-31.356149-25.424061-56.779168-56.781494-56.779168L171.311547 114.545826c-31.357433 0-56.781494 25.423019-56.781494 56.779168l0 681.348989c0 31.357172 25.424061 56.779168 56.781494 56.779168l681.376907 0c31.358457 0 56.781494-25.423019 56.781494-56.779168L909.469948 171.324994zM824.297706 483.610416c-15.665413 0-28.390747-12.697183-28.390747-28.389584l0.887243-186.638771L604.102866 461.264479l-40.145947-40.144302 193.023924-193.016015L568.782006 228.104161c-15.693044 0-28.390747-12.697183-28.390747-28.389584s12.697704-28.389584 28.390747-28.389584l254.711349 0c7.929925 0 15.082105 3.27151 20.238756 8.53949 5.490263 4.657067 8.955319 11.449773 8.955319 19.850094l0 255.506255C852.68743 470.913233 839.989727 483.610416 824.297706 483.610416zM455.219017 852.673983 200.506645 852.673983c-7.929925 0-15.082105-3.270487-20.239779-8.538467-5.489239-4.65809-8.955319-11.423167-8.955319-19.850094L171.311547 568.779168c0-15.692401 12.726357-28.389584 28.390747-28.389584 15.69202 0 28.390747 12.697183 28.390747 28.389584l-0.887243 186.6664 192.690312-192.710047 40.173577 40.143279-193.050531 193.016015 188.198837 0c15.69202 0 28.390747 12.697183 28.390747 28.389584C483.608741 839.9768 470.911038 852.673983 455.219017 852.673983z"
              fill="''' + getColor(0, color, colors, '#272636') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.fangda_1:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M831.89 192l0.11 0.11v639.78l-0.11 0.11H192.11l-0.11-0.11V192.11l0.11-0.11h639.78m0.11-64H192a64.19 64.19 0 0 0-64 64v640a64.19 64.19 0 0 0 64 64h640a64.19 64.19 0 0 0 64-64V192a64.19 64.19 0 0 0-64-64z"
              fill="''' + getColor(0, color, colors, '#333333') + '''"
            />
            <path
              d="M800 224H512v64h288v-64z"
              fill="''' + getColor(1, color, colors, '#333333') + '''"
            />
            <path
              d="M800 224h-64v288h64V224z"
              fill="''' + getColor(2, color, colors, '#333333') + '''"
            />
            <path
              d="M745.37 233.37L512 466.75 557.25 512l233.38-233.37-45.26-45.26zM512 736H224v64h288v-64z"
              fill="''' + getColor(3, color, colors, '#333333') + '''"
            />
            <path
              d="M288 512h-64v288h64V512z"
              fill="''' + getColor(4, color, colors, '#333333') + '''"
            />
            <path
              d="M466.75 512L233.37 745.37l45.26 45.26L512 557.25 466.75 512z"
              fill="''' + getColor(5, color, colors, '#333333') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.tongzhi:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M574.1 405.4c-16.6 0-30.1 12.1-30.1 27v102.5c0 14.9 13.5 27 30.1 27s30.1-12.1 30.1-27V432.4c0-14.9-13.4-27-30.1-27z"
              fill="''' + getColor(0, color, colors, '#FD5F29') + '''"
            />
            <path
              d="M818.3 756.5l-15.7-16.7c-3.7-6.4-34.4-65.5-34.4-264.4 0-120.3-83.3-221.4-195.1-249 1.3-5 2-10.2 2-15.7 0-34.8-28.2-63.1-63.1-63.1-34.8 0-63.1 28.2-63.1 63.1 0 5.5 0.8 10.7 2.1 15.8-111.9 28.4-195.5 133-195.8 253.4-0.4 178.9-25.9 242.8-33 257.1-0.8 1.7-1.9 3.2-3.2 4.6l-13.3 14.1c-11.6 12.2-2.9 32.4 14 32.4h206.9c0 0.9-0.1 1.7-0.1 2.6 0 47.3 38.3 85.6 85.6 85.6s85.6-38.3 85.6-85.6c0-0.9-0.1-1.7-0.1-2.6h181.1l25.2 0.7c17 0.5 26.2-19.9 14.4-32.3zM289.8 728c12.6-42.9 25.6-119.4 25.6-252.6 0-108.2 88-196.2 196.2-196.2S708 367.2 708 475.4c0 133.1 13.1 209.7 25.6 252.6H289.8z"
              fill="''' + getColor(1, color, colors, '#FD5F29') + '''"
            />
            <path
              d="M574.1 616.1m-30.1 0a30.1 30.1 0 1 0 60.2 0 30.1 30.1 0 1 0-60.2 0Z"
              fill="''' + getColor(2, color, colors, '#FD5F29') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.ap_pxiazai:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M575.90896 128.083422h-127.972086a31.993022 31.993022 0 0 0 0 63.986043h127.972086a31.993022 31.993022 0 0 0 0-63.986043zM511.922917 831.929895a31.993022 31.993022 0 1 0 31.993021 31.993022 31.993022 31.993022 0 0 0-31.993021-31.993022zM511.922917 320.041551a31.993022 31.993022 0 0 0-31.993022 31.993021v383.916259a31.993022 31.993022 0 0 0 63.986043 0v-383.916259a31.993022 31.993022 0 0 0-31.993021-31.993021z"
              fill="''' + getColor(0, color, colors, '#494F61') + '''"
            />
            <path
              d="M511.922917 767.943852a31.993022 31.993022 0 0 1-23.034976-9.597906l-223.95115-223.951151a31.993022 31.993022 0 0 1 45.43009-44.79023l201.556036 202.835756 200.916175-203.475616a31.993022 31.993022 0 0 1 45.43009 44.79023l-223.95115 226.510592a31.993022 31.993022 0 0 1-22.395115 7.678325z"
              fill="''' + getColor(1, color, colors, '#494F61') + '''"
            />
            <path
              d="M799.86011 831.929895v63.986043a59.50702 59.50702 0 0 1-63.986043 63.986043H287.971766a59.50702 59.50702 0 0 1-63.986043-63.986043V128.083422a59.50702 59.50702 0 0 1 63.986043-63.986043h447.902301a59.50702 59.50702 0 0 1 63.986043 63.986043v575.874387h63.986043V128.083422a122.853203 122.853203 0 0 0-127.972086-127.972086H287.971766a122.853203 122.853203 0 0 0-127.972086 127.972086v767.832516a122.853203 122.853203 0 0 0 127.972086 127.972086h447.902301a122.853203 122.853203 0 0 0 127.972086-127.972086v-63.986043z"
              fill="''' + getColor(2, color, colors, '#494F61') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.qinglihuancun:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M786.6 715.9c-5.1 0-10.3-1.3-15.1-4.1L295.4 434.7c-14.3-8.3-19.2-26.7-10.8-41 8.3-14.3 26.7-19.2 41-10.8L801.7 660c14.3 8.3 19.2 26.7 10.8 41-5.6 9.5-15.6 14.9-25.9 14.9z"
              fill="''' + getColor(0, color, colors, '#333333') + '''"
            />
            <path
              d="M629.3 960c-14.7 0-29.3-4.2-42.1-11.6L186.1 714.7c-40-23.3-53.8-75.1-30.7-115.4l166.4-290.5c15-26.1 42.9-42.4 72.9-42.4 14.7 0 29.3 3.9 42.1 11.4l113.2 66 129-225.2c19.1-33.4 54.8-54.1 93.1-54.1 18.8 0 37.4 5 53.7 14.5 51.1 29.8 68.8 95.9 39.3 147.4L735.9 452l102 59.4c40 23.3 53.8 75 30.7 115.3L702.2 917.4c-14.9 26.1-42.9 42.6-72.9 42.6zM394.7 326.4c-8.6 0-16.5 4.7-20.8 12.2L207.5 629.1c-6.7 11.8-2.8 26.9 8.9 33.6l401.1 233.5c3.7 2.1 7.7 3.2 11.9 3.2 8.6 0 16.5-4.7 20.8-12.2l166.4-290.5c6.7-11.8 2.8-26.9-8.8-33.6L680 488.8c-14.2-8.3-19.1-26.5-10.9-40.8L813 196.6c13.2-23 5.4-52.5-17.4-65.7-7.2-4.2-15.3-6.4-23.5-6.4-16.9 0-32.6 9.2-41 23.9l-144 251.4c-4 6.9-10.5 12-18.3 14.1-7.7 2.1-15.9 1-22.9-3.1l-139.4-81.1c-3.6-2.2-7.6-3.3-11.8-3.3z"
              fill="''' + getColor(1, color, colors, '#333333') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.suoxiao:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M796 279.9L620.6 455.3c-14 14-36.9 14-50.9 0s-14-36.9 0-50.9L745.1 229c14-14 36.9-14 50.9 0s14 36.9 0 50.9z"
              fill="''' + getColor(0, color, colors, '#585757') + '''"
            />
            <path
              d="M796 481H581.5c-20.2 0-36.5-16.4-36.5-36.5V228.7c0-20.3 16.5-37.1 36.7-36.7 19.5 0.4 35.3 16.4 35.3 36v166.3c0 8.1 6.6 14.7 14.7 14.7h163.5c20.3 0 37.1 16.4 36.7 36.7-0.3 19.6-16.3 35.3-35.9 35.3zM228 744.1l175.4-175.4c14-14 36.9-14 50.9 0s14 36.9 0 50.9L278.9 795c-14 14-36.9 14-50.9 0s-14-36.9 0-50.9z"
              fill="''' + getColor(1, color, colors, '#585757') + '''"
            />
            <path
              d="M228 543h214.3c20.3 0 36.7 16.4 36.7 36.7v215.5c0 20.3-16.5 37.1-36.7 36.7-19.5-0.4-35.3-16.4-35.3-36V615H228.7c-20.3 0-37.1-16.4-36.7-36.7 0.4-19.6 16.4-35.3 36-35.3z"
              fill="''' + getColor(2, color, colors, '#585757') + '''"
            />
            <path
              d="M189.3 135.9c-29.7 0-53.8 24.1-53.8 53.7v644.7c0 29.7 24.1 53.7 53.8 53.7h645.4c29.7 0 53.8-24.1 53.8-53.7V189.6c0-29.7-24.1-53.7-53.8-53.7H189.3z m-13-71.1h671.5c61.8 0 111.9 50.1 111.9 111.8v670.8c0 61.7-50.1 111.8-111.9 111.8H176.3c-61.8 0-111.9-50-111.9-111.8V176.6c0-61.7 50.1-111.8 111.9-111.8z m0 0"
              fill="''' + getColor(3, color, colors, '#333333') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.banbenxinxi:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M481.834667 353.834667a42.624 42.624 0 1 1 60.330666 60.330666 42.624 42.624 0 1 1-60.330666-60.330666zM512 469.333333a42.666667 42.666667 0 0 1 42.666667 42.666667v170.666667a42.666667 42.666667 0 0 1-85.333334 0v-170.666667a42.666667 42.666667 0 0 1 42.666667-42.666667z m0-341.333333c-212.096 0-384 171.904-384 384s171.904 384 384 384 384-171.904 384-384-171.904-384-384-384z m0-85.333333c259.2 0 469.333333 210.133333 469.333333 469.333333s-210.133333 469.333333-469.333333 469.333333S42.666667 771.2 42.666667 512 252.8 42.666667 512 42.666667z"
              fill="''' + getColor(0, color, colors, '#247DCE') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.shuzirenminbi:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M0 512a512 512 0 1 0 1024 0A512 512 0 1 0 0 512z"
              fill="''' + getColor(0, color, colors, '#E3031F') + '''"
            />
            <path
              d="M312.32 450.918v-0.076c35.328 0 70.656 0.076 105.984-0.077 4.25-0.026 9.933 1.817 12.262-3.251 2.228-4.864-2.636-8.448-5.145-11.75a32688.512 32688.512 0 0 0-116.25-151.988c-10.7-13.926-11.776-13.696-24.73-0.768a327.194 327.194 0 0 0-65.203 92.416c-9.702 20.66-17.638 42.189-21.99 64.845-1.357 7.091-0.051 10.752 8.038 10.7 35.687-0.153 71.348-0.05 107.034-0.05z m395.264-0.332v0.179c36.096 0 72.192 0.102 108.288-0.051 11.904-0.026 13.082-2.048 9.933-13.466-5.479-19.942-11.623-39.578-20.378-58.42-17.74-38.246-41.037-72.345-72.192-100.991-6.093-5.632-10.393-5.658-15.36 1.203-7.219 9.984-15.078 19.558-22.528 29.389-33.152 43.648-66.278 87.296-99.328 130.995-1.971 2.586-5.427 5.274-3.737 8.755 1.715 3.584 6.041 2.33 9.241 2.355 35.328 0.103 70.707 0.052 106.035 0.052zM503.578 189.568c-39.63 0.512-77.543 8.96-114.176 23.808-17.408 7.066-18.253 8.55-7.348 23.091 16.18 21.632 32.564 43.136 48.973 64.589 24.627 32.256 49.357 64.41 73.984 96.614 4.813 6.324 8.704 6.836 13.747-0.256 9.55-13.44 19.79-26.419 29.824-39.526 32-41.728 64-83.456 96-125.107 5.632-7.296 5.402-12.237-3.968-16.333a318.592 318.592 0 0 0-137.036-26.88zM325.81 527.693v-0.051c-41.37 0-82.79 0.128-124.16-0.103-8.448-0.051-12.902 1.869-11.136 11.571 1.203 6.63 0.333 13.594 1.46 20.224 11.468 68.07 39.628 127.642 88.063 177.664 46.157 47.693 101.504 77.901 166.016 92.058 16.077 3.533 17.408 2.38 17.51-14.131 0.257-43.623 0.513-87.27 0.871-130.893 0.077-9.267-3.686-13.85-13.465-13.696-20.685 0.333-41.396 0.205-62.08 0.205l-118.528-0.205c-5.786 0-11.597 0.41-11.52-8.269 0.204-20.326 0.153-40.627-0.077-60.928-0.051-5.376 2.201-7.68 7.193-7.833 3.38-0.128 6.784-0.128 10.164-0.128 58.316-0.052 116.659-0.256 174.976-0.026 9.42 0.026 12.748-3.456 12.416-12.544-0.41-12.416-0.077-24.832 0-37.274 0.05-15.027-0.256-15.564-15.77-15.616-40.653-0.102-81.28 0-121.933 0z m412.416 0.102c-54.963 0-109.9 0.23-164.864-0.179-10.214-0.077-14.208 3.072-13.721 13.466 0.64 13.516 0.69 27.084 0.076 40.601-0.435 9.19 3.2 11.623 11.853 11.571 57.19-0.256 114.381 0 171.571-0.204 22.17-0.077 22.119-0.41 22.016 21.862-0.05 13.568 0.128 27.11-0.025 40.653-0.154 14.566-0.256 14.848-15.207 14.873-52.684 0.154-105.37 0.052-158.054 0.052-4.506 0-9.011 0.076-13.542 0.128-18.048 0.179-18.432 0.512-18.432 18.099-0.077 42.496-0.18 85.043-0.026 127.565 0.051 15.001 1.92 16.46 16.64 13.107 102.758-23.373 177.997-82.33 225.843-176.026 7.987-15.641 14.925-32.077 18.816-49.408 1.792-8.013 5.76-11.187 14.055-11.008 21.043 0.461 42.137 0.41 63.206 0.205 8.96-0.102 10.88 3.38 8.806 11.802-19.328 78.694-57.702 146.508-116.3 202.393-55.706 53.146-121.6 87.45-197.12 102.989-75.981 15.616-150.528 10.214-223.028-16.691-81.33-30.157-146.585-81.664-195.225-153.6-52.455-77.568-75.008-163.661-68.506-256.666 4.864-68.94 25.856-133.222 63.898-191.565 49.561-75.93 116.992-129.74 201.651-161.152a390.86 390.86 0 0 1 187.418-21.401c107.622 13.568 196.326 62.157 265.036 145.357 62.004 75.059 92.493 162.304 91.904 260.096-0.05 9.779-2.79 13.158-12.8 13.056-55.296-0.359-110.643-0.18-165.964-0.18v0.205z"
              fill="''' + getColor(1, color, colors, '#FFFFFF') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.usdt:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M1023.082985 511.821692c0 281.370746-228.08199 509.452736-509.452736 509.452736-281.360557 0-509.452736-228.08199-509.452737-509.452736 0-281.365652 228.092179-509.452736 509.452737-509.452737 281.370746 0 509.452736 228.087085 509.452736 509.452737"
              fill="''' + getColor(0, color, colors, '#1BA27A') + '''"
            />
            <path
              d="M752.731701 259.265592h-482.400796v116.460896h182.969951v171.176119h116.460895v-171.176119h182.96995z"
              fill="''' + getColor(1, color, colors, '#FFFFFF') + '''"
            />
            <path
              d="M512.636816 565.13592c-151.358408 0-274.070289-23.954468-274.070289-53.50782 0-29.548259 122.706786-53.507821 274.070289-53.507821 151.358408 0 274.065194 23.959562 274.065194 53.507821 0 29.553353-122.706786 53.507821-274.065194 53.50782m307.734925-44.587303c0-38.107065-137.776398-68.995184-307.734925-68.995184-169.953433 0-307.74002 30.888119-307.74002 68.995184 0 33.557652 106.837333 61.516418 248.409154 67.711363v245.729433h116.450707v-245.632637c142.66205-6.001353 250.615085-34.077294 250.615084-67.808159"
              fill="''' + getColor(2, color, colors, '#FFFFFF') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.tupian:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M899.9936 555.0592c16.9472 0 30.72-13.7728 30.72-30.72V286.72c0-90.5216-73.6256-164.1472-164.1472-164.1472H261.7856c-90.5216 0-164.1472 73.6256-164.1472 164.1472v449.4848c0 90.5216 73.6256 164.1472 164.1472 164.1472h504.7808c90.5216 0 164.1472-73.6256 164.1472-164.1472v-60.9792c0-16.9472-13.7728-30.72-30.72-30.72s-30.72 13.7728-30.72 30.72v60.9792c0 56.6272-46.08 102.7072-102.7072 102.7072H261.7856c-56.6272 0-102.7072-46.08-102.7072-102.7072V286.72c0-56.6272 46.08-102.7072 102.7072-102.7072h504.7808c56.6272 0 102.7072 46.08 102.7072 102.7072v237.6192c0 16.9472 13.7728 30.72 30.72 30.72z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M395.776 563.456h-0.1024c-18.6368 0-36.096 7.2704-49.2544 20.48l-123.904 124.672c-11.9808 12.032-11.8784 31.488 0.1536 43.4688a30.6688 30.6688 0 0 0 21.6576 8.9088c7.8848 0 15.7696-3.0208 21.8112-9.0624l123.904-124.672c1.9456-1.9456 4.1472-2.3552 5.632-2.3552 1.536 0 3.7376 0.4096 5.6832 2.3552l123.0336 124.6208a30.73024 30.73024 0 0 0 43.4688 0.256 30.73024 30.73024 0 0 0 0.256-43.4688l-123.0336-124.6208a69.34528 69.34528 0 0 0-49.3056-20.5824zM604.672 585.8304l160.2048 157.696a30.78656 30.78656 0 0 0 43.4688-0.3584c11.9296-12.0832 11.7248-31.5392-0.3584-43.4176l-160.2048-157.696c-26.112-25.7024-67.9424-26.624-95.1808-2.0992l-33.792 30.4128a30.6944 30.6944 0 0 0-2.2528 43.3664 30.6944 30.6944 0 0 0 43.3664 2.2528l33.792-30.4128c3.1232-2.816 7.936-2.7136 10.9568 0.256z"
              fill="''' + getColor(1, color, colors, '#363F5B') + '''"
            />
            <path
              d="M360.4992 479.3856c-55.9616 0-101.4784-45.5168-101.4784-101.4784S304.5376 276.48 360.4992 276.48s101.4784 45.5168 101.4784 101.4784c-0.0512 55.9104-45.568 101.4272-101.4784 101.4272z m0-141.4656c-22.0672 0-40.0384 17.9712-40.0384 40.0384s17.9712 40.0384 40.0384 40.0384 40.0384-17.9712 40.0384-40.0384S382.5664 337.92 360.4992 337.92z"
              fill="''' + getColor(2, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.shouye:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M794.4192 919.7568h-145.8688c-32 0-58.0096-26.0096-58.0096-58.0096v-135.68H442.8288v135.68c0 32-26.0096 58.0096-58.0096 58.0096H238.9504c-60.5696 0-109.8752-49.3056-109.8752-109.8752v-407.04c0-37.376 18.7392-71.8336 50.0736-92.16L456.96 130.56c36.3008-23.552 83.2-23.552 119.5008 0l277.76 180.0704c31.3856 20.3264 50.0736 54.784 50.0736 92.16v225.9456c0 16.9472-13.7728 30.72-30.72 30.72s-30.72-13.7728-30.72-30.72V402.8416a48.1792 48.1792 0 0 0-22.0672-40.6016l-277.76-180.0704a48.50688 48.50688 0 0 0-52.6848 0L212.6336 362.1888a48.24064 48.24064 0 0 0-22.0672 40.6016v407.0912c0 26.6752 21.7088 48.4352 48.4352 48.4352H381.44v-135.0656c0-32.3584 26.3168-58.6752 58.6752-58.6752h153.2928c32.3584 0 58.6752 26.3168 58.6752 58.6752v135.0656h142.4384c26.6752 0 48.4352-21.7088 48.4352-48.4352v-46.4896c0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72v46.4896c-0.1024 60.5696-49.408 109.8752-109.9776 109.8752z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M516.7104 582.144c-67.3792 0-122.2144-54.8352-122.2144-122.2144s54.8352-122.2144 122.2144-122.2144c18.8928 0 36.9664 4.1984 53.8112 12.4928a30.7456 30.7456 0 0 1 14.0288 41.1136c-7.4752 15.2064-25.856 21.5552-41.1136 14.0288-8.3456-4.096-17.3568-6.1952-26.7264-6.1952-33.536 0-60.7744 27.2896-60.7744 60.7744s27.2896 60.7744 60.7744 60.7744c33.536 0 60.7744-27.2896 60.7744-60.7744 0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72c0 67.3792-54.8352 122.2144-122.2144 122.2144z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.gouwuche:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M833.024 731.392H386.0992c-26.9824 0-49.6128-19.3536-53.8112-46.0288l-75.6736-484.352c-7.7312-49.6128-49.8176-85.6576-100.0448-85.6576h-27.904c-16.9472 0-30.72 13.7728-30.72 30.72s13.7728 30.72 30.72 30.72h27.904a39.68 39.68 0 0 1 39.3728 33.6896l75.6736 484.352c8.8576 56.7808 57.0368 97.9968 114.4832 97.9968h446.9248c16.9472 0 30.72-13.7728 30.72-30.72s-13.7216-30.72-30.72-30.72z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M882.3296 237.4144c-16.4352-19.456-40.3968-30.5664-65.8432-30.5664H364.3392c-16.9472 0-30.72 13.7728-30.72 30.72s13.7728 30.72 30.72 30.72h452.1472c9.984 0 16.128 5.5296 18.8928 8.8064s7.168 10.24 5.4784 20.1216l-41.5744 244.4288a24.63232 24.63232 0 0 1-22.8352 20.5312l-361.3696 22.6816a30.70464 30.70464 0 0 0 1.8944 61.3376c0.6656 0 1.28 0 1.9456-0.0512l361.3696-22.6816c40.0896-2.5088 72.8576-31.9488 79.5648-71.5776l41.5744-244.4288c4.3008-25.088-2.6624-50.5856-19.0976-70.0416z"
              fill="''' + getColor(1, color, colors, '#363F5B') + '''"
            />
            <path
              d="M358.4 875.2128m-43.6736 0a43.6736 43.6736 0 1 0 87.3472 0 43.6736 43.6736 0 1 0-87.3472 0Z"
              fill="''' + getColor(2, color, colors, '#144eee') + '''"
            />
            <path
              d="M772.1984 875.2128m-43.6736 0a43.6736 43.6736 0 1 0 87.3472 0 43.6736 43.6736 0 1 0-87.3472 0Z"
              fill="''' + getColor(3, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.paizhao:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M516.1984 716.0832c-88.7296 0-160.9216-72.192-160.9216-160.9216S427.4176 394.24 516.1984 394.24c25.856 0 51.5584 6.2976 74.3936 18.176a30.64832 30.64832 0 0 1 13.0048 41.4208 30.64832 30.64832 0 0 1-41.4208 13.0048c-14.2848-7.424-29.696-11.2128-45.9264-11.2128-54.8352 0-99.4816 44.6464-99.4816 99.4816s44.6464 99.4816 99.4816 99.4816 99.4816-44.6464 99.4816-99.4816c0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72c-0.0512 88.7808-72.2432 160.9728-160.9728 160.9728z"
              fill="''' + getColor(0, color, colors, '#144eee') + '''"
            />
            <path
              d="M800.256 234.9056h-21.1968c-16.9472 0-30.72 13.7728-30.72 30.72s13.7728 30.72 30.72 30.72h21.1968c60.2624 0 109.2608 48.9984 109.2608 109.2608v303.6672c0 60.2624-48.9984 109.2608-109.2608 109.2608H237.2096c-60.2624 0-109.2608-48.9984-109.2608-109.2608V405.6064c0-60.2624 48.9984-109.2608 109.2608-109.2608h24.7808c24.9856 0 47.7696-12.6976 60.8768-33.9968l27.904-45.312c11.5712-18.7904 32.4096-30.4128 54.4256-30.4128h200.9088c19.968 0 39.0656 9.5232 51.0464 25.4976a30.65344 30.65344 0 0 0 43.008 6.0416 30.65344 30.65344 0 0 0 6.0416-43.008c-23.552-31.2832-60.9792-49.9712-100.1472-49.9712H405.1968c-43.2128 0-84.1216 22.8352-106.752 59.648l-27.8528 45.312c-1.8432 3.0208-5.0688 4.8128-8.5504 4.8128h-24.7808C143.1552 234.9568 66.56 311.552 66.56 405.6576v303.6672c0 94.1056 76.5952 170.7008 170.7008 170.7008H800.256c94.1056 0 170.7008-76.5952 170.7008-170.7008V405.6064c0-94.1568-76.544-170.7008-170.7008-170.7008z"
              fill="''' + getColor(1, color, colors, '#363F5B') + '''"
            />
            <path
              d="M241.0496 366.8992c-16.9472 0-30.72 13.7728-30.72 30.72s13.7728 30.72 30.72 30.72h67.328c16.9472 0 30.72-13.7728 30.72-30.72s-13.7728-30.72-30.72-30.72H241.0496z"
              fill="''' + getColor(2, color, colors, '#363F5B') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.tishi:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M510.9248 938.3936c-82.688 0-149.9136-67.2768-149.9136-149.9136 0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72c0 48.7936 39.68 88.4736 88.4736 88.4736 48.7936 0 88.4736-39.68 88.4736-88.4736 0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72c0.0512 82.6368-67.2256 149.9136-149.9136 149.9136z"
              fill="''' + getColor(0, color, colors, '#144eee') + '''"
            />
            <path
              d="M822.6304 815.5648H199.2704c-52.7872 0-95.6928-42.9568-95.6928-95.6928 0-49.5616 37.888-90.4704 86.2208-95.232V407.7568c0-177.1008 144.0768-321.1776 321.1776-321.1776 177.1008 0 321.1776 144.0768 321.1776 321.1776v115.0464c0 16.9472-13.7728 30.72-30.72 30.72s-30.72-13.7728-30.72-30.72V407.7568c0-143.2064-116.5312-259.7376-259.7376-259.7376S251.2384 264.5504 251.2384 407.7568v225.8944c0 28.6208-23.296 51.9168-51.9168 51.9168-18.8928 0-34.2528 15.36-34.2528 34.2528s15.36 34.2528 34.2528 34.2528h623.36c18.8928 0 34.2528-15.36 34.2528-34.2528s-15.36-34.2528-34.2528-34.2528c-16.9472 0-30.72-13.7728-30.72-30.72s13.7728-30.72 30.72-30.72c52.7872 0 95.6928 42.9568 95.6928 95.6928s-43.008 95.744-95.744 95.744z"
              fill="''' + getColor(1, color, colors, '#363F5B') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.wenjian:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M866.4576 612.5056c16.9472 0 30.72-13.7728 30.72-30.72V270.9504c0-97.3824-79.2064-176.5888-176.5888-176.5888H308.2752c-97.3824 0-176.5888 79.2064-176.5888 176.5888v482.0992c0 97.3824 79.2064 176.5888 176.5888 176.5888h412.3136c97.3824 0 176.5888-79.2064 176.5888-176.5888 0-16.9472-13.7728-30.72-30.72-30.72s-30.72 13.7728-30.72 30.72c0 63.488-51.6608 115.1488-115.1488 115.1488H308.2752c-63.488 0-115.1488-51.6608-115.1488-115.1488V270.9504c0-63.488 51.6608-115.1488 115.1488-115.1488h412.3136c63.488 0 115.1488 51.6608 115.1488 115.1488v310.8864a30.6688 30.6688 0 0 0 30.72 30.6688z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M302.4384 322.9696h100.8128c16.9472 0 30.72-13.7728 30.72-30.72s-13.7728-30.72-30.72-30.72H302.4384c-16.9472 0-30.72 13.7728-30.72 30.72s13.7216 30.72 30.72 30.72zM302.4384 476.416h100.8128c16.9472 0 30.72-13.7728 30.72-30.72s-13.7728-30.72-30.72-30.72H302.4384c-16.9472 0-30.72 13.7728-30.72 30.72s13.7216 30.72 30.72 30.72zM302.4384 773.5808h426.9056c16.9472 0 30.72-13.7728 30.72-30.72s-13.7728-30.72-30.72-30.72H302.4384c-16.9472 0-30.72 13.7728-30.72 30.72s13.7216 30.72 30.72 30.72zM302.4384 629.8624h327.2192c16.9472 0 30.72-13.7728 30.72-30.72s-13.7728-30.72-30.72-30.72H302.4384c-16.9472 0-30.72 13.7728-30.72 30.72s13.7216 30.72 30.72 30.72z"
              fill="''' + getColor(1, color, colors, '#363F5B') + '''"
            />
            <path
              d="M680.8064 498.3296h-109.9776c-43.7248 0-79.2576-35.5328-79.2576-79.2576v-97.28c0-43.6736 35.5328-79.2576 79.2576-79.2576h109.9776c43.7248 0 79.2576 35.5328 79.2576 79.2576v97.28c0 43.7248-35.584 79.2576-79.2576 79.2576z m-110.0288-194.3552c-9.8304 0-17.8176 7.9872-17.8176 17.8176v97.28c0 9.8304 7.9872 17.8176 17.8176 17.8176h109.9776c9.8304 0 17.8176-7.9872 17.8176-17.8176v-97.28c0-9.8304-7.9872-17.8176-17.8176-17.8176h-109.9776z"
              fill="''' + getColor(2, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.wode:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M777.2672 674.304c-31.8464-67.584-88.3712-119.1936-155.7504-146.0224 31.9488-29.0816 52.0704-71.0144 52.0704-117.5552 0-87.6544-71.2704-158.9248-158.9248-158.9248S355.7376 323.1232 355.7376 410.7776c0 46.4896 20.0704 88.3712 51.968 117.4528-107.1616 42.6496-183.1936 147.4048-183.1936 269.6192 0 14.336 1.0752 28.8768 3.2256 43.1616 2.2528 15.2576 15.36 26.2144 30.3616 26.2144 1.4848 0 3.0208-0.1024 4.5568-0.3584a30.70976 30.70976 0 0 0 25.856-34.9184c-1.6896-11.3152-2.56-22.7328-2.56-34.0992 0-122.88 97.4336-223.3856 219.0848-228.4544 3.1744 0.2048 6.3488 0.3072 9.5744 0.3072 3.2768 0 6.5024-0.1536 9.728-0.3072 84.3776 3.6352 161.0752 54.272 197.2736 131.1232 7.2192 15.36 25.5488 21.9648 40.8576 14.6944a30.70976 30.70976 0 0 0 14.7968-40.9088zM417.1776 410.7776c0-53.76 43.7248-97.4848 97.4848-97.4848s97.4848 43.7248 97.4848 97.4848c0 50.9952-39.424 92.928-89.344 97.0752-2.7136-0.1024-5.4272-0.1536-8.1408-0.1536-2.4576 0-4.9152 0.1024-7.3728 0.2048-50.2784-3.84-90.112-45.8752-90.112-97.1264z"
              fill="''' + getColor(0, color, colors, '#144eee') + '''"
            />
            <path
              d="M514.6624 956.7232c-244.3776 0-443.2384-198.8096-443.2384-443.2384s198.8096-443.2384 443.2384-443.2384 443.2384 198.8096 443.2384 443.2384c0 65.28-13.8752 128.1536-41.216 186.88-7.168 15.36-25.4464 22.0672-40.8064 14.8992-15.36-7.168-22.016-25.4464-14.8992-40.8064 23.552-50.5344 35.4816-104.704 35.4816-160.9216 0-210.5344-171.264-381.7984-381.7984-381.7984S132.864 303.0016 132.864 513.536s171.264 381.7984 381.7984 381.7984c80.9984 0 158.3104-25.0368 223.6928-72.3456 13.7216-9.9328 32.9216-6.8608 42.9056 6.8608a30.76096 30.76096 0 0 1-6.8608 42.9056c-75.9296 54.9376-165.7344 83.968-259.7376 83.968z"
              fill="''' + getColor(1, color, colors, '#363F5B') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.xiaoxi:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M513.0752 901.9392c-17.5104 0-34.9696-6.8096-47.9744-20.2752L392.192 806.0928c-0.9728-1.024-2.3552-1.5872-3.7376-1.5872H256.512c-85.8624 0-155.7504-69.888-155.7504-155.7504V299.9808c0-85.8624 69.888-155.7504 155.7504-155.7504h510.976c85.8624 0 155.7504 69.888 155.7504 155.7504v348.7232c0 85.8624-69.888 155.7504-155.7504 155.7504-16.9472 0-30.72-13.7728-30.72-30.72s13.7728-30.72 30.72-30.72c52.0192 0 94.3104-42.2912 94.3104-94.3104V299.9808c0-52.0192-42.2912-94.3104-94.3104-94.3104H256.512c-52.0192 0-94.3104 42.2912-94.3104 94.3104v348.7744c0 52.0192 42.2912 94.3104 94.3104 94.3104h131.9424c17.9712 0 35.4816 7.424 47.9744 20.3776l72.9088 75.52c1.9456 2.048 5.2736 2.1504 7.3216 0.1536l81.5616-77.6704c12.4416-11.8784 28.7744-18.3808 45.9776-18.3808 16.9472 0 30.72 13.7728 30.72 30.72s-13.7728 30.72-30.72 30.72c-1.3312 0-2.6112 0.512-3.584 1.4336l-81.5616 77.6704a66.5088 66.5088 0 0 1-45.9776 18.3296z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M690.432 415.8464h-354.816c-16.9472 0-30.72-13.7728-30.72-30.72s13.7728-30.72 30.72-30.72h354.816c16.9472 0 30.72 13.7728 30.72 30.72s-13.7728 30.72-30.72 30.72zM564.736 602.4192H335.616c-16.9472 0-30.72-13.7728-30.72-30.72s13.7728-30.72 30.72-30.72h229.12c16.9472 0 30.72 13.7728 30.72 30.72s-13.7728 30.72-30.72 30.72z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.gonggao:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M392.6016 562.2784c-16.9472 0-30.72-13.7728-30.72-30.72V333.7728c0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72v197.7856c0 16.9472-13.7728 30.72-30.72 30.72zM758.9888 589.9776c-16.9472 0-30.72-13.7728-30.72-30.72s13.7728-30.72 30.72-30.72c49.9712 0 90.6752-40.6528 90.6752-90.6752 0-49.9712-40.6528-90.6752-90.6752-90.6752-16.9472 0-30.72-13.7728-30.72-30.72s13.7728-30.72 30.72-30.72c83.8656 0 152.1152 68.2496 152.1152 152.1152s-68.2496 152.1152-152.1152 152.1152z"
              fill="''' + getColor(0, color, colors, '#144eee') + '''"
            />
            <path
              d="M752.0256 100.864a84.44416 84.44416 0 0 0-79.4624-7.68L388.4544 211.5072H259.7888c-78.5408 0-142.4896 63.8976-142.4896 142.4896v162.3552c0 78.5408 63.8976 142.4896 142.4896 142.4896h134.8096c16.9472 0 30.72-13.7728 30.72-30.72s-13.7728-30.72-30.72-30.72H259.7888c-44.6976 0-81.0496-36.352-81.0496-81.0496V353.9968c0-44.6976 36.352-81.0496 81.0496-81.0496h134.8096c4.0448 0 8.0896-0.8192 11.8272-2.3552l289.792-120.7296c10.3424-4.3008 18.6368 0.0512 21.76 2.0992 3.1232 2.048 10.2912 8.0896 10.2912 19.2512v536.1152c0 11.3664-7.3728 17.3568-10.5472 19.4048s-11.6736 6.3488-22.016 1.7408l-157.0304-69.9392a30.7456 30.7456 0 0 0-40.5504 15.5648 30.68416 30.68416 0 0 0 15.5648 40.5504L670.72 784.5888c11.0592 4.9152 22.784 7.3728 34.4576 7.3728 16.0768 0 32.0512-4.608 46.0288-13.6704 24.1152-15.6672 38.5024-42.1888 38.5024-70.9632V171.264c0-28.3648-14.08-54.6816-37.6832-70.4z"
              fill="''' + getColor(1, color, colors, '#363F5B') + '''"
            />
            <path
              d="M435.3024 725.76c-5.9392-15.872-23.6032-24.0128-39.5264-18.0736a30.70464 30.70464 0 0 0-18.0736 39.5264l27.136 72.96c7.2192 19.3536-2.6624 40.96-22.016 48.128-19.3536 7.168-40.96-2.6624-48.128-22.016l-45.4656-122.112c-5.9392-15.872-23.6032-24.0128-39.5264-18.0736a30.70464 30.70464 0 0 0-18.0736 39.5264l45.4656 122.112c14.7968 39.7824 52.6336 64.3584 92.7744 64.3584 11.4176 0 23.04-1.9968 34.4064-6.1952 51.0976-19.0464 77.1584-76.0832 58.1632-127.1808l-27.136-72.96z"
              fill="''' + getColor(2, color, colors, '#363F5B') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.hongbao:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M867.9424 283.136a30.73024 30.73024 0 0 0-43.4176-1.2288c-52.6848 49.8176-116.5824 87.0912-185.4976 108.288-18.0224-53.1968-68.4032-91.5968-127.6416-91.5968-61.3376 0-113.2032 41.216-129.4336 97.3824-67.5328-17.4592-131.2768-50.2784-184.9856-95.3856a30.6944 30.6944 0 0 0-43.264 3.7888 30.6944 30.6944 0 0 0 3.7888 43.264c64 53.76 140.5952 92.0576 221.5936 110.8992 11.8272 62.3104 66.6624 109.568 132.352 109.568 67.7888 0 124.0064-50.3296 133.376-115.5584 82.5856-23.1936 159.3344-66.7136 221.952-126.0032 12.288-11.6224 12.8512-31.0784 1.1776-43.4176zM511.3856 506.6752c-40.448 0-73.3184-32.8704-73.3184-73.3184s32.8704-73.3184 73.3184-73.3184 73.3184 32.8704 73.3184 73.3184-32.8704 73.3184-73.3184 73.3184z"
              fill="''' + getColor(0, color, colors, '#144eee') + '''"
            />
            <path
              d="M703.232 940.7488H319.5904c-101.4272 0-184.0128-82.5344-184.0128-184.0128V272.384c0-101.4784 82.5344-184.0128 184.0128-184.0128h383.6928c101.4784 0 184.0128 82.5344 184.0128 184.0128v51.712c0 16.9472-13.7728 30.72-30.72 30.72s-30.72-13.7728-30.72-30.72V272.384c0-67.584-54.9888-122.5728-122.5728-122.5728H319.5904c-67.584 0-122.5728 54.9888-122.5728 122.5728v484.352c0 67.584 54.9888 122.5728 122.5728 122.5728h383.6928c67.584 0 122.5728-54.9888 122.5728-122.5728V509.44c0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72v247.296c-0.0512 101.4784-82.5856 184.0128-184.064 184.0128z"
              fill="''' + getColor(1, color, colors, '#363F5B') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.shezhi:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M662.8352 904.3456H367.2064c-48.0256 0-92.7232-25.8048-116.736-67.3792l-147.8144-256c-24.0128-41.5744-24.0128-93.2352 0-134.8096l147.8144-256c24.0128-41.5744 68.7104-67.3792 116.736-67.3792h295.6288c48.0256 0 92.7232 25.8048 116.736 67.3792l147.8144 256c24.0128 41.5744 24.0128 93.2352 0 134.8096l-44.288 76.7488a30.72512 30.72512 0 0 1-41.984 11.264 30.78144 30.78144 0 0 1-11.264-41.984l44.288-76.7488c13.056-22.6304 13.056-50.7392 0-73.3696l-147.8144-256c-13.056-22.6304-37.376-36.6592-63.5392-36.6592H367.2064c-26.112 0-50.4832 14.0288-63.5392 36.6592l-147.8144 256a73.61536 73.61536 0 0 0 0 73.3696l147.8144 256c13.056 22.6304 37.376 36.6592 63.5392 36.6592h295.6288c26.112 0 50.4832-14.08 63.5392-36.6592l30.1056-50.432a30.80192 30.80192 0 0 1 42.1376-10.6496 30.80192 30.80192 0 0 1 10.6496 42.1376l-29.8496 50.0224c-23.8592 41.216-68.608 67.0208-116.5824 67.0208z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M515.0208 673.0752c-87.9616 0-159.488-71.5264-159.488-159.488s71.5264-159.488 159.488-159.488c24.6272 0 48.2304 5.4784 70.2464 16.2816 15.2064 7.4752 21.504 25.9072 14.0288 41.1136s-25.856 21.504-41.1136 14.0288a97.26464 97.26464 0 0 0-43.1616-9.984c-54.0672 0-98.048 43.9808-98.048 98.048s43.9808 98.048 98.048 98.048 98.048-43.9808 98.048-98.048c0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72c0 87.9104-71.5776 159.488-159.488 159.488z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.wenzhang:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M640.2048 519.6288H389.2224c-16.9472 0-30.72-13.7728-30.72-30.72s13.7728-30.72 30.72-30.72h250.9824c16.9472 0 30.72 13.7728 30.72 30.72s-13.7728 30.72-30.72 30.72zM640.2048 709.8368H389.2224c-16.9472 0-30.72-13.7728-30.72-30.72s13.7728-30.72 30.72-30.72h250.9824c16.9472 0 30.72 13.7728 30.72 30.72s-13.7728 30.72-30.72 30.72z"
              fill="''' + getColor(0, color, colors, '#144eee') + '''"
            />
            <path
              d="M870.2976 518.0928c-16.9472 0-30.72 13.7728-30.72 30.72v227.0208c0 62.3616-50.7392 113.1008-113.0496 113.1008H302.9504c-62.3616 0-113.0496-50.7392-113.0496-113.1008V341.8112c0-62.3616 50.7392-113.0496 113.0496-113.0496h12.6464c12.288 59.4432 65.024 104.2432 128.0512 104.2432h142.1824c63.0272 0 115.7632-44.8 128.0512-104.2432h12.6464c62.3616 0 113.0496 50.7392 113.0496 113.0496 0 16.9472 13.7728 30.72 30.72 30.72s30.72-13.7728 30.72-30.72c0-96.2048-78.2848-174.4896-174.4896-174.4896h-14.7456c-15.36-55.1424-65.9456-95.744-125.952-95.744H443.648c-59.9552 0-110.592 40.6016-125.952 95.744h-14.7456c-96.2048 0-174.4896 78.2848-174.4896 174.4896v434.0224c0 96.2048 78.2848 174.5408 174.4896 174.5408h423.5264c96.2048 0 174.4896-78.2848 174.4896-174.5408v-227.0208c0.0512-16.9472-13.7216-30.72-30.6688-30.72zM443.648 133.0176h142.1824c38.1952 0 69.2736 31.0784 69.2736 69.2736 0 38.1952-31.0784 69.2736-69.2736 69.2736H443.648c-38.1952 0-69.2736-31.0784-69.2736-69.2736-0.0512-38.1952 31.0272-69.2736 69.2736-69.2736z"
              fill="''' + getColor(1, color, colors, '#363F5B') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.youhuiquan_1:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M777.0112 873.3184H246.9888c-88.5248 0-160.512-71.9872-160.512-160.512v-34.7136c0-32.768 20.4288-62.464 50.7904-73.8304 39.2704-14.7456 65.6384-52.8384 65.6384-94.7712S176.5376 429.4656 137.2672 414.72c-30.3616-11.4176-50.7904-41.0624-50.7904-73.8304V306.176c0-88.5248 71.9872-160.512 160.512-160.512h529.9712c88.5248 0 160.512 71.9872 160.512 160.512v33.3312c0 33.536-21.0944 63.488-52.48 74.4448-40.4992 14.1824-67.7376 52.5824-67.7376 95.5392 0 51.968 40.4992 96.2048 92.16 100.8128 16.896 1.4848 29.3888 16.384 27.904 33.3312-1.4848 16.896-16.3328 29.3376-33.3312 27.904-84.48-7.4752-148.224-77.1072-148.224-161.9968 0-69.0176 43.7248-130.7136 108.8512-153.4976 6.8096-2.3552 11.3664-9.0112 11.3664-16.4864v-33.3312c0-54.6304-44.4416-99.072-99.072-99.072H246.9888c-54.6304 0-99.072 44.4416-99.072 99.072v34.7136c0 7.3216 4.4032 13.8752 10.9568 16.3328 63.1296 23.7056 105.5232 84.8896 105.5232 152.32s-42.3936 128.6144-105.5232 152.32c-6.5536 2.4576-10.9568 9.0112-10.9568 16.3328v34.7136c0 54.6304 44.4416 99.072 99.072 99.072h529.9712c34.56 0 66.048-17.5616 84.2752-47.0016a30.68416 30.68416 0 0 1 42.2912-9.9328 30.68416 30.68416 0 0 1 9.9328 42.2912c-29.44 47.4624-80.4864 75.9296-136.448 75.9296z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M630.4256 430.8992H393.5744c-16.9472 0-30.72-13.7728-30.72-30.72s13.7728-30.72 30.72-30.72h236.8512c16.9472 0 30.72 13.7728 30.72 30.72s-13.7216 30.72-30.72 30.72zM630.4256 665.6H393.5744c-16.9472 0-30.72-13.7728-30.72-30.72s13.7728-30.72 30.72-30.72h236.8512c16.9472 0 30.72 13.7728 30.72 30.72s-13.7216 30.72-30.72 30.72z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.anquanyanzheng:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M512.3584 935.168c-25.6512 0-51.3536-6.6048-74.24-19.8144l-224.0512-129.3312c-45.7728-26.4192-74.24-75.7248-74.24-128.5632V335.7184c0-58.7264 34.7136-112.0256 88.3712-135.7824l224.0512-99.1744c38.1952-16.896 81.9712-16.896 120.1664 0l224.0512 99.1744a148.52608 148.52608 0 0 1 88.3712 135.7824v34.4064c0 16.9472-13.7728 30.72-30.72 30.72s-30.72-13.7728-30.72-30.72v-34.4064c0-34.4064-20.3264-65.6384-51.8144-79.5648l-224.0512-99.1744a87.41888 87.41888 0 0 0-70.4512 0L253.0816 256.1024a87.04512 87.04512 0 0 0-51.8144 79.5648v321.7408c0 30.976 16.6912 59.8528 43.52 75.3664l224.0512 129.3312a87.20896 87.20896 0 0 0 87.04 0l224.0512-129.3312c26.8288-15.5136 43.52-44.3904 43.52-75.3664v-127.7952c0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72v127.7952c0 52.8896-28.4672 102.144-74.24 128.5632l-224.0512 129.3312a148.096 148.096 0 0 1-74.24 19.8656z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M492.5952 659.2c-18.5856 0-36.5056-7.2192-49.92-20.3776l-93.6448-91.6992c-12.1344-11.8784-12.3392-31.3344-0.4608-43.4176 11.8784-12.1344 31.3344-12.3392 43.4176-0.4608l93.6448 91.6992c2.8672 2.816 6.1952 2.9696 7.936 2.816 1.7408-0.1536 4.9664-0.9216 7.2704-4.2496l134.912-195.5328c9.6256-13.9776 28.7744-17.4592 42.752-7.8336 13.9776 9.6256 17.4592 28.7744 7.8336 42.752l-134.912 195.5328a71.2192 71.2192 0 0 1-51.9168 30.5152c-2.304 0.1536-4.608 0.256-6.912 0.256z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.sousuo:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M681.1648 442.8288c-13.5168 0-25.9072-9.0112-29.6448-22.6816a168.67328 168.67328 0 0 0-122.0608-119.6032c-16.4864-4.096-26.4704-20.736-22.3744-37.2224s20.736-26.4704 37.2224-22.3744c80.9472 20.1216 144.7424 82.6368 166.5536 163.1744 4.4544 16.384-5.2736 33.2288-21.6064 37.6832-2.7136 0.6656-5.4272 1.024-8.0896 1.024z"
              fill="''' + getColor(0, color, colors, '#144eee') + '''"
            />
            <path
              d="M910.4384 860.6208l-133.9392-137.728c18.8928-22.0672 35.2768-46.1312 48.7424-71.7824 7.8848-15.0016 2.1504-33.5872-12.9024-41.472a30.68416 30.68416 0 0 0-41.472 12.9024c-13.2096 25.088-29.6448 48.4352-48.9472 69.3248-61.5424 66.7648-148.9408 105.0624-239.6672 105.0624-179.712 0-325.9392-146.2272-325.9392-325.9392s146.2272-325.9392 325.9392-325.9392S808.1408 291.328 808.1408 471.04c0 16.9472 13.7728 30.72 30.72 30.72s30.72-13.7728 30.72-30.72c0-213.6064-173.7728-387.3792-387.3792-387.3792S94.8736 257.4336 94.8736 471.04s173.7728 387.3792 387.3792 387.3792c92.0064 0 181.0432-33.2288 250.624-92.2112l133.5296 137.2672a30.67392 30.67392 0 0 0 22.016 9.3184c7.7312 0 15.4624-2.8672 21.4016-8.704a30.73536 30.73536 0 0 0 0.6144-43.4688z"
              fill="''' + getColor(1, color, colors, '#363F5B') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.yiwen:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M515.6864 954.112c-244.3776 0-443.2384-198.8096-443.2384-443.2384 0-244.3776 198.8096-443.2384 443.2384-443.2384s443.2384 198.8096 443.2384 443.2384c0 65.28-13.8752 128.1536-41.216 186.88-7.168 15.36-25.4464 22.0672-40.8064 14.8992-15.36-7.168-22.0672-25.4464-14.8992-40.8064 23.552-50.5344 35.4816-104.704 35.4816-160.9728 0-210.5344-171.264-381.7984-381.7984-381.7984S133.888 300.3392 133.888 510.8736c0 210.5344 171.264 381.7984 381.7984 381.7984 80.9984 0 158.3616-25.0368 223.6928-72.3456 13.7216-9.984 32.9216-6.8608 42.9056 6.8608 9.9328 13.7216 6.8608 32.9216-6.8608 42.9056-75.9296 54.9376-165.7344 84.0192-259.7376 84.0192z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M512.9216 678.4c-16.9472 0-30.72-13.7728-30.72-30.72v-34.0992c0-44.4928 27.0848-85.248 67.4304-101.376 39.7824-15.9232 64.7168-55.3984 62.0544-98.304-3.0208-48.7936-43.6224-89.344-92.3648-92.3648-27.6992-1.6896-54.016 7.7312-74.1376 26.624-20.1216 18.8928-31.1808 44.544-31.1808 72.1408 0 16.9472-13.7728 30.72-30.72 30.72s-30.72-13.7728-30.72-30.72c0-44.0832 18.432-86.6816 50.5856-116.8896 32.6144-30.6176 75.264-45.9776 120.0128-43.1616 80.4864 4.9664 144.896 69.4272 149.9136 149.9136 4.3008 69.4272-36.096 133.376-100.5568 159.1296-17.2032 6.8608-28.7744 24.6784-28.7744 44.288v34.0992c-0.1024 16.9472-13.824 30.72-30.8224 30.72z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
            <path
              d="M512.1024 746.3936m-33.9968 0a33.9968 33.9968 0 1 0 67.9936 0 33.9968 33.9968 0 1 0-67.9936 0Z"
              fill="''' + getColor(2, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.kabao:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M913.664 602.88h-200.8576c-48.9984 0-88.8832-39.8848-88.8832-88.8832s39.8848-88.8832 88.8832-88.8832h82.8928c16.9472 0 30.72-13.7728 30.72-30.72s-13.7728-30.72-30.72-30.72h-82.8928c-82.8928 0-150.3232 67.4304-150.3232 150.3232 0 82.8928 67.4304 150.3232 150.3232 150.3232h200.8576c16.9472 0 30.72-13.7728 30.72-30.72s-13.7216-30.72-30.72-30.72z"
              fill="''' + getColor(0, color, colors, '#144eee') + '''"
            />
            <path
              d="M706.9696 513.9968m-41.6768 0a41.6768 41.6768 0 1 0 83.3536 0 41.6768 41.6768 0 1 0-83.3536 0Z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
            <path
              d="M765.3376 881.92H265.9328c-98.7648 0-179.0976-83.456-179.0976-186.0608V337.3568c0-102.6048 80.3328-186.0608 179.0976-186.0608h499.3536c98.7648 0 179.0976 83.456 179.0976 186.0608 0 16.9472-13.7728 30.72-30.72 30.72s-30.72-13.7728-30.72-30.72c0-68.7104-52.7872-124.6208-117.6576-124.6208H265.9328c-64.8704 0-117.6576 55.9104-117.6576 124.6208v358.5536c0 68.7104 52.7872 124.6208 117.6576 124.6208h499.3536c64.8704 0 117.6576-55.9104 117.6576-124.6208v-162.5088c0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72v162.5088c0 102.5536-80.3328 186.0096-179.0464 186.0096z"
              fill="''' + getColor(2, color, colors, '#363F5B') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.renwu:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M766.9248 900.4544H259.7888c-91.4432 0-165.8368-80.9472-165.8368-180.48V294.2464c0-99.5328 74.3936-180.48 165.8368-180.48h507.136c91.4432 0 165.8368 80.9472 165.8368 180.48v224.8192c0 16.9472-13.7728 30.72-30.72 30.72s-30.72-13.7728-30.72-30.72V294.2464c0-65.6384-46.848-119.04-104.3968-119.04H259.7888c-57.5488 0-104.3968 53.4016-104.3968 119.04v425.728c0 65.6384 46.848 119.04 104.3968 119.04h507.136c57.5488 0 104.3968-53.4016 104.3968-119.04 0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72c0 99.5328-74.3936 180.48-165.8368 180.48z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M425.2672 292.5568L331.6224 390.9632l-40.4992-41.728a30.6688 30.6688 0 0 0-43.4176-0.6656c-12.1856 11.8272-12.4928 31.2832-0.6656 43.4176L309.76 456.704a30.58176 30.58176 0 0 0 22.0672 9.3184h0.1536c8.3456-0.0512 16.3328-3.4816 22.1184-9.5232l115.712-121.6c11.6736-12.288 11.2128-31.744-1.0752-43.4176a30.78656 30.78656 0 0 0-43.4688 1.0752zM549.1712 405.248h220.2624c16.9472 0 30.72-13.7728 30.72-30.72s-13.7728-30.72-30.72-30.72h-220.2624c-16.9472 0-30.72 13.7728-30.72 30.72s13.7216 30.72 30.72 30.72zM769.4336 602.3168h-220.2624c-16.9472 0-30.72 13.7728-30.72 30.72s13.7728 30.72 30.72 30.72h220.2624c16.9472 0 30.72-13.7728 30.72-30.72s-13.7728-30.72-30.72-30.72zM358.2976 508.5184c-60.16 0-109.1584 48.9472-109.1584 109.1584s48.9472 109.1584 109.1584 109.1584 109.1584-48.9472 109.1584-109.1584-48.9472-109.1584-109.1584-109.1584z m0 156.8768c-26.3168 0-47.7184-21.4016-47.7184-47.7184 0-26.3168 21.4016-47.7184 47.7184-47.7184 26.3168 0 47.7184 21.4016 47.7184 47.7184 0 26.3168-21.4016 47.7184-47.7184 47.7184z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.shuju:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M769.2288 888.064H262.0928c-91.4432 0-165.8368-77.8752-165.8368-173.568V308.5312c0-95.6928 74.3936-173.568 165.8368-173.568h507.136c91.4432 0 165.8368 77.8752 165.8368 173.568v214.3744c0 16.9472-13.7728 30.72-30.72 30.72s-30.72-13.7728-30.72-30.72V308.5312c0-61.7984-46.848-112.128-104.3968-112.128H262.0928c-57.5488 0-104.3968 50.2784-104.3968 112.128v405.9648c0 61.7984 46.848 112.128 104.3968 112.128h507.136c57.5488 0 104.3968-50.2784 104.3968-112.128 0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72c0 95.6928-74.3936 173.568-165.8368 173.568z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M348.16 532.736c-16.9472 0-30.72 13.7728-30.72 30.72v130.7136c0 16.9472 13.7728 30.72 30.72 30.72s30.72-13.7728 30.72-30.72v-130.7136c0-16.9472-13.7216-30.72-30.72-30.72zM515.6352 297.472c-16.9472 0-30.72 13.7728-30.72 30.72v366.0288c0 16.9472 13.7728 30.72 30.72 30.72s30.72-13.7728 30.72-30.72V328.192c0-16.9984-13.7216-30.72-30.72-30.72zM681.7792 400.384c-16.9472 0-30.72 13.7728-30.72 30.72v263.0656c0 16.9472 13.7728 30.72 30.72 30.72s30.72-13.7728 30.72-30.72V431.104c0-16.9472-13.7216-30.72-30.72-30.72z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.anquan:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M517.5296 947.1488c-26.0096 0-52.0192-6.7072-75.2128-20.0704L214.528 795.5456c-46.3872-26.7776-75.2128-76.6976-75.2128-130.2528V338.2272c0-59.4944 35.1744-113.4592 89.5488-137.5744L456.6528 99.84a150.4768 150.4768 0 0 1 121.7536 0l227.7888 100.8128c54.4256 24.064 89.5488 78.08 89.5488 137.5744v34.9696c0 16.9472-13.7728 30.72-30.72 30.72s-30.72-13.7728-30.72-30.72v-34.9696c0-35.1744-20.7872-67.1232-52.992-81.3568l-227.7888-100.8128c-22.8864-10.1376-49.152-10.1376-72.0384 0L253.7472 256.8704a89.00608 89.00608 0 0 0-52.992 81.3568v327.0656c0 31.6928 17.0496 61.2352 44.4928 77.056l227.7888 131.4816c27.4432 15.872 61.5424 15.8208 88.9856 0l227.7888-131.4816a89.1904 89.1904 0 0 0 44.4928-77.056v-129.8944c0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72v129.8944c0 53.5552-28.8256 103.4752-75.2128 130.2528l-227.7888 131.4816a150.1952 150.1952 0 0 1-75.2128 20.1216z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M633.4464 489.8304H553.472V409.8048c0-16.9472-13.7728-30.72-30.72-30.72s-30.72 13.7728-30.72 30.72v79.9744H412.0064c-16.9472 0-30.72 13.7728-30.72 30.72s13.7728 30.72 30.72 30.72h79.9744v79.9744c0 16.9472 13.7728 30.72 30.72 30.72s30.72-13.7728 30.72-30.72v-79.9744h79.9744c16.9472 0 30.72-13.7728 30.72-30.72s-13.7216-30.6688-30.6688-30.6688z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.chakandingdan:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M567.2448 905.5744H264.9088c-91.4432 0-165.8368-80.9472-165.8368-180.48V299.3664c0-99.5328 74.3936-180.48 165.8368-180.48h507.136c91.4432 0 165.8368 80.9472 165.8368 180.48v173.6192c0 16.9472-13.7728 30.72-30.72 30.72s-30.72-13.7728-30.72-30.72V299.3664c0-65.6384-46.848-119.04-104.3968-119.04H264.9088c-57.5488 0-104.3968 53.4016-104.3968 119.04v425.728c0 65.6384 46.848 119.04 104.3968 119.04h302.336c16.9472 0 30.72 13.7728 30.72 30.72s-13.7728 30.72-30.72 30.72z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M309.1456 371.712h350.5664c16.9472 0 30.72-13.7728 30.72-30.72s-13.7728-30.72-30.72-30.72H309.1456c-16.9472 0-30.72 13.7728-30.72 30.72s13.7728 30.72 30.72 30.72zM457.728 501.76H309.1456c-16.9472 0-30.72 13.7728-30.72 30.72s13.7728 30.72 30.72 30.72H457.728c16.9472 0 30.72-13.7728 30.72-30.72s-13.7216-30.72-30.72-30.72zM912.128 837.0688L855.04 769.4848c30.4128-35.5328 47.1552-82.7392 42.752-132.9152-4.1984-47.9744-26.8288-91.4432-63.744-122.368-36.9152-30.9248-83.6096-45.6704-131.584-41.472-47.9744 4.1984-91.4432 26.8288-122.368 63.744-30.9248 36.9152-45.6704 83.6096-41.472 131.584 4.1984 47.9744 26.8288 91.4432 63.744 122.368 32.768 27.4944 73.2672 42.1888 115.5072 42.1888 5.3248 0 10.7008-0.256 16.0768-0.7168 26.88-2.3552 51.8144-10.5472 73.7792-23.1936l57.4976 68.0448a30.7712 30.7712 0 0 0 23.5008 10.9056c7.0144 0 14.0288-2.3552 19.8144-7.2704a30.78656 30.78656 0 0 0 3.584-43.3152z m-183.552-66.3552c-31.6416 2.7648-62.4128-6.912-86.7328-27.3408a118.01088 118.01088 0 0 1-42.0352-80.64c-2.7648-31.6416 6.912-62.4128 27.3408-86.7328 20.3776-24.32 49.0496-39.2192 80.64-42.0352 3.5328-0.3072 7.0656-0.4608 10.5984-0.4608 27.8528 0 54.5792 9.6768 76.1344 27.8016 24.32 20.3776 39.2192 49.0496 42.0352 80.64 5.7344 65.28-42.7008 123.0336-107.9808 128.768z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.gouwu:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M913.7664 778.5472c-0.8704-16.9472-15.2064-30.1568-32.2048-29.1328-16.9472 0.8704-30.0032 15.2576-29.1328 32.2048 1.0752 21.3504-6.4512 41.6256-21.1456 57.1392a76.47232 76.47232 0 0 1-55.9616 24.0128H252.4672c-21.3504 0-41.2672-8.5504-55.9616-24.0128-14.7456-15.5136-22.2208-35.7888-21.1456-57.1392l20.992-417.2288c2.0992-41.1648 35.9424-73.3696 77.1584-73.3696h19.712c-0.256 4.3008-0.4096 8.6528-0.4096 13.056v66.1504c0 16.9472 13.7728 30.72 30.72 30.72s30.72-13.7728 30.72-30.72V304.0768c0-4.4032 0.2048-8.7552 0.5632-13.056h318.1056c0.3584 4.3008 0.5632 8.6528 0.5632 13.056v66.1504c0 16.9472 13.7728 30.72 30.72 30.72s30.72-13.7728 30.72-30.72V304.0768c0-4.4032-0.1536-8.7552-0.4096-13.056h19.712c41.216 0 75.1104 32.2048 77.1584 73.3696l10.4448 207.104c0.8704 16.9472 15.3088 30.208 32.2048 29.1328 16.9472-0.8704 30.0032-15.2576 29.1328-32.2048l-10.4448-207.104c-3.7376-73.8816-64.5632-131.7376-138.496-131.7376h-32.256c-30.6688-85.3504-112.384-146.5856-208.128-146.5856S336.384 144.2304 305.7152 229.5808h-32.256c-73.9328 0-134.8096 57.856-138.496 131.7376l-20.992 417.2288c-1.9456 38.2976 11.5712 74.752 37.9904 102.5536 26.4704 27.8016 62.1568 43.1104 100.5056 43.1104h522.8032c38.4 0 74.0864-15.3088 100.5056-43.1104 26.4192-27.8016 39.936-64.256 37.9904-102.5536zM513.8432 144.4352c61.1328 0 114.3296 34.56 141.1072 85.1456H372.736c26.7776-50.5856 79.9744-85.1456 141.1072-85.1456z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M653.312 747.1104H374.3744c-16.9472 0-30.72-13.7728-30.72-30.72s13.7728-30.72 30.72-30.72h278.9376c16.9472 0 30.72 13.7728 30.72 30.72s-13.7216 30.72-30.72 30.72z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.youjian:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M510.6688 533.5552c-14.7968 0-29.5424-3.3792-43.6224-10.1888L218.4704 403.3024a30.72512 30.72512 0 0 1-14.2848-41.0112 30.72512 30.72512 0 0 1 41.0112-14.2848l248.576 120.064c11.0592 5.3248 22.784 5.3248 33.8432 0l248.576-120.064a30.72512 30.72512 0 0 1 41.0112 14.2848c7.3728 15.2576 0.9728 33.6384-14.2848 41.0112l-248.576 120.064c-14.08 6.7584-28.8768 10.1888-43.6736 10.1888z"
              fill="''' + getColor(0, color, colors, '#144eee') + '''"
            />
            <path
              d="M764.2624 902.0416H257.1264c-91.4432 0-165.8368-79.2064-165.8368-176.5888V310.784c0-97.3824 74.3936-176.5888 165.8368-176.5888h507.136c91.4432 0 165.8368 79.2064 165.8368 176.5888v218.9312c0 16.9472-13.7728 30.72-30.72 30.72s-30.72-13.7728-30.72-30.72V310.784c0-63.488-46.848-115.1488-104.3968-115.1488H257.1264c-57.5488 0-104.3968 51.6608-104.3968 115.1488v414.6176c0 63.488 46.848 115.1488 104.3968 115.1488h507.136c57.5488 0 104.3968-51.6608 104.3968-115.1488 0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72c0 97.4336-74.3936 176.64-165.8368 176.64z"
              fill="''' + getColor(1, color, colors, '#363F5B') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.luxiang:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M919.808 292.096c-22.5792-13.056-49.5616-13.0048-72.1408 0l-75.264 43.4688v-17.408c0-86.1184-70.0928-156.2112-156.2112-156.2112H229.888c-86.1184 0-156.2112 70.0928-156.2112 156.2112v400.0256c0 86.1184 70.0928 156.2112 156.2112 156.2112h230.0928c16.9472 0 30.72-13.7728 30.72-30.72s-13.7728-30.72-30.72-30.72H229.888c-52.2752 0-94.7712-42.496-94.7712-94.7712V318.1056c0-52.2752 42.496-94.7712 94.7712-94.7712h386.304c52.2752 0 94.7712 42.496 94.7712 94.7712v400.0256c0 52.2752-42.496 94.7712-94.7712 94.7712-16.9472 0-30.72 13.7728-30.72 30.72s13.7728 30.72 30.72 30.72c86.1184 0 156.2112-70.0928 156.2112-156.2112v-17.408l75.264 43.4688c11.3152 6.5024 23.6544 9.7792 36.0448 9.7792s24.7808-3.2768 36.0448-9.7792c22.5792-13.056 36.0448-36.4032 36.0448-62.464v-327.168c0.0512-26.112-13.4144-49.4592-35.9936-62.464z m-25.3952 389.632c0 5.376-3.328 8.0896-5.3248 9.2672-1.9968 1.1776-6.0416 2.6624-10.7008 0L772.4032 629.76V406.4768l105.984-61.184c4.6592-2.6624 8.6528-1.1264 10.7008 0 1.9968 1.1264 5.3248 3.8912 5.3248 9.2672v327.168z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M382.8224 377.0368H245.5552c-16.9472 0-30.72-13.7728-30.72-30.72s13.7728-30.72 30.72-30.72h137.2672c16.9472 0 30.72 13.7728 30.72 30.72s-13.7216 30.72-30.72 30.72z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.jiesuo:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M748.032 362.4448H336.8448v-38.0928c0-102.2464 83.1488-185.3952 185.3952-185.3952 77.7728 0 147.8656 49.1008 174.3872 122.2144a30.72 30.72 0 0 0 39.3728 18.432 30.72 30.72 0 0 0 18.432-39.3728c-35.2768-97.3312-128.5632-162.7136-232.1408-162.7136-136.0896 0-246.8352 110.7456-246.8352 246.8352v39.3728c-89.344 10.4448-158.9248 86.5792-158.9248 178.688v209.3568c0 99.2256 80.7424 179.968 179.968 179.968h273.3056c16.9472 0 30.72-13.7728 30.72-30.72s-13.7728-30.72-30.72-30.72H296.448c-65.3824 0-118.528-53.1456-118.528-118.528v-209.3568c0-65.3824 53.1456-118.528 118.528-118.528h451.6352c65.3824 0 118.528 53.1456 118.528 118.528v209.3568c0 65.3824-53.1968 118.528-118.528 118.528-16.9472 0-30.72 13.7728-30.72 30.72s13.7728 30.72 30.72 30.72c99.2256 0 179.968-80.7424 179.968-179.968v-209.3568c0-99.2768-80.7424-179.968-180.0192-179.968z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M530.944 759.6544c-16.9472 0-30.72-13.7728-30.72-30.72v-150.9888c0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72v150.9888c0 16.9984-13.7216 30.72-30.72 30.72z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.mima:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M768.0512 363.6736v-39.3728c0-136.0896-110.7456-246.8352-246.8352-246.8352S274.3808 188.2112 274.3808 324.352v39.3728c-89.344 10.4448-158.9248 86.5792-158.9248 178.688v209.3568c0 99.2256 80.7424 179.968 179.968 179.968h273.3056c16.9472 0 30.72-13.7728 30.72-30.72s-13.7728-30.72-30.72-30.72H295.424c-65.3824 0-118.528-53.1456-118.528-118.528v-209.3568c0-65.3824 53.1456-118.528 118.528-118.528h451.6352c65.3824 0 118.528 53.1456 118.528 118.528v209.3568c0 65.3824-53.1968 118.528-118.528 118.528-16.9472 0-30.72 13.7728-30.72 30.72s13.7728 30.72 30.72 30.72c99.2256 0 179.968-80.7424 179.968-179.968v-209.3568c0-92.16-69.5808-168.2944-158.976-178.7392z m-246.8352-224.768c102.2464 0 185.3952 83.1488 185.3952 185.3952v38.0928H335.8208v-38.0928c0-102.1952 83.1488-185.3952 185.3952-185.3952z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M529.9712 759.6544c-16.9472 0-30.72-13.7728-30.72-30.72v-150.9888c0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72v150.9888c0 16.9984-13.7728 30.72-30.72 30.72z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.yinhangka_1:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M920.064 490.3424c16.9472 0 30.72-13.7728 30.72-30.72v-139.264c0-102.3488-83.2512-185.6-185.6-185.6h-496.128c-102.3488 0-185.6 83.2512-185.6 185.6v364.6976c0 102.3488 83.2512 185.6 185.6 185.6h496.0768c102.3488 0 185.6-83.2512 185.6-185.6v-49.92c0-16.9472-13.7728-30.72-30.72-30.72s-30.72 13.7728-30.72 30.72v49.92c0 68.4544-55.7056 124.16-124.16 124.16H269.056c-68.4544 0-124.16-55.7056-124.16-124.16v-245.76h744.448v20.2752c0 16.9984 13.7728 30.7712 30.72 30.7712zM144.896 377.9072V320.3584c0-68.4544 55.7056-124.16 124.16-124.16h496.0768c68.4544 0 124.16 55.7056 124.16 124.16V377.856H144.896z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M769.0752 694.272h-166.656c-16.9472 0-30.72-13.7728-30.72-30.72s13.7728-30.72 30.72-30.72h166.656c16.9472 0 30.72 13.7728 30.72 30.72s-13.7216 30.72-30.72 30.72z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.chongzhi:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M844.4416 939.1616h-329.472c-237.8752 0-431.36-193.4848-431.36-431.36s193.4848-431.36 431.36-431.36 431.36 193.4848 431.36 431.36c0 35.8912-4.4032 71.5776-13.1584 106.0864a30.6688 30.6688 0 0 1-37.3248 22.2208 30.6944 30.6944 0 0 1-22.2208-37.3248c7.4752-29.5936 11.264-60.2112 11.264-91.0336 0-203.9808-165.9392-369.92-369.92-369.92S145.0496 303.7696 145.0496 507.7504s165.9392 369.92 369.92 369.92h270.0288l-37.376-52.736c-9.8304-13.824-6.5536-33.024 7.3216-42.8544 13.824-9.8304 33.024-6.5536 42.8544 7.3216l71.7312 101.2224c6.656 9.3696 7.4752 21.6576 2.2016 31.8464a30.64832 30.64832 0 0 1-27.2896 16.6912z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M678.8608 575.5904h-128.2048v-74.24h128.2048c16.9472 0 30.72-13.7728 30.72-30.72s-13.7728-30.72-30.72-30.72h-90.4192l58.0096-87.7056a30.65856 30.65856 0 0 0-8.704-42.5472 30.64832 30.64832 0 0 0-42.5472 8.704l-75.4176 114.1248-98.816-116.992a30.7456 30.7456 0 0 0-43.3152-3.6352 30.7456 30.7456 0 0 0-3.6352 43.3152l71.68 84.8384H361.0112c-16.9472 0-30.72 13.7728-30.72 30.72s13.7728 30.72 30.72 30.72h128.2048v74.24H361.0112c-16.9472 0-30.72 13.7728-30.72 30.72s13.7728 30.72 30.72 30.72h128.2048v69.376c0 16.9472 13.7728 30.72 30.72 30.72s30.72-13.7728 30.72-30.72v-69.376h128.2048c16.9472 0 30.72-13.7728 30.72-30.72s-13.7728-30.8224-30.72-30.8224z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.yue:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M511.0784 956.1088c-244.3776 0-443.2384-198.8096-443.2384-443.2384S266.6496 69.632 511.0784 69.632s443.2384 198.8096 443.2384 443.2384c0 65.28-13.8752 128.1536-41.216 186.88-7.168 15.36-25.4464 22.0672-40.8064 14.8992-15.36-7.168-22.0672-25.4464-14.8992-40.8064 23.552-50.5856 35.4816-104.704 35.4816-160.9728 0-210.5344-171.264-381.7984-381.7984-381.7984s-381.7984 171.264-381.7984 381.7984 171.264 381.7984 381.7984 381.7984c80.9984 0 158.3104-25.0368 223.6928-72.3456 13.7216-9.984 32.9216-6.8608 42.9056 6.8608a30.76096 30.76096 0 0 1-6.8608 42.9056c-75.8784 54.9888-165.7344 84.0192-259.7376 84.0192z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M679.8336 583.6288h-132.9152V505.3952h132.9152c16.9472 0 30.72-13.7728 30.72-30.72s-13.7728-30.72-30.72-30.72h-94.8224l60.672-91.7504a30.65856 30.65856 0 0 0-8.704-42.5472 30.64832 30.64832 0 0 0-42.5472 8.704l-78.336 118.4768-102.5024-121.344a30.7456 30.7456 0 0 0-43.3152-3.6352 30.7456 30.7456 0 0 0-3.6352 43.3152l75.0592 88.832h-89.088c-16.9472 0-30.72 13.7728-30.72 30.72s13.7728 30.72 30.72 30.72h132.9152V583.68H352.6144c-16.9472 0-30.72 13.7728-30.72 30.72s13.7728 30.72 30.72 30.72h132.9152v72.3456c0 16.9472 13.7728 30.72 30.72 30.72s30.72-13.7728 30.72-30.72V645.12h132.9152c16.9472 0 30.72-13.7728 30.72-30.72s-13.824-30.7712-30.7712-30.7712z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.guanyuwomen:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M512.3584 956.1088c-244.3776 0-443.2384-198.8096-443.2384-443.2384S267.9296 69.632 512.3584 69.632s443.2384 198.8096 443.2384 443.2384c0 65.28-13.8752 128.1536-41.216 186.88-7.168 15.36-25.4464 22.0672-40.8064 14.8992-15.36-7.168-22.0672-25.4464-14.8992-40.8064 23.552-50.5856 35.4816-104.704 35.4816-160.9728 0-210.5344-171.264-381.7984-381.7984-381.7984S130.56 302.3872 130.56 512.9216s171.264 381.7984 381.7984 381.7984c80.9984 0 158.3104-25.0368 223.6928-72.3456 13.7216-9.984 32.9216-6.8608 42.9056 6.8608a30.76096 30.76096 0 0 1-6.8608 42.9056c-75.9296 54.9376-165.7344 83.968-259.7376 83.968z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M512.3584 752.7424c-16.9472 0-30.72-13.7728-30.72-30.72V432.2816c0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72v289.7408c0 16.9472-13.7728 30.72-30.72 30.72zM512.3584 350.6688c-16.9472 0-30.72-13.7728-30.72-30.72v-19.712c0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72v19.712c0 16.9472-13.7728 30.72-30.72 30.72z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.shijian:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M518.912 957.1328c-244.3776 0-443.2384-198.8096-443.2384-443.2384 0-244.3776 198.8096-443.2384 443.2384-443.2384s443.2384 198.8096 443.2384 443.2384c0 65.28-13.8752 128.1536-41.216 186.88-7.168 15.36-25.4464 22.0672-40.8064 14.8992s-22.0672-25.4464-14.8992-40.8064c23.552-50.5344 35.4816-104.704 35.4816-160.9728 0-210.5344-171.264-381.7984-381.7984-381.7984s-381.7984 171.264-381.7984 381.7984c0 210.5344 171.264 381.7984 381.7984 381.7984 80.9984 0 158.3616-25.0368 223.6928-72.3456 13.7216-9.984 32.9216-6.8608 42.9056 6.8608 9.9328 13.7216 6.8608 32.9216-6.8608 42.9056-75.9296 54.9376-165.7344 84.0192-259.7376 84.0192z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M751.616 605.4912H508.3648c-16.9472 0-30.72-13.7728-30.72-30.72V325.2736c0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72v218.8288h212.5312c16.9472 0 30.72 13.7728 30.72 30.72s-13.7216 30.6688-30.72 30.6688z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.saomiao:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M865.5872 403.2c-16.9472 0-30.72-13.7728-30.72-30.72V308.224c0-64.512-52.48-116.992-116.992-116.992h-80.1792c-16.9472 0-30.72-13.7728-30.72-30.72s13.7728-30.72 30.72-30.72h80.1792c98.4064 0 178.432 80.0768 178.432 178.432v64.256c0 16.9472-13.7216 30.72-30.72 30.72zM161.9968 401.8688c-16.9472 0-30.72-13.7728-30.72-30.72V308.224c0-98.4064 80.0768-178.432 178.4832-178.432h82.7904c16.9472 0 30.72 13.7728 30.72 30.72s-13.7728 30.72-30.72 30.72H309.76c-64.512 0-117.0432 52.48-117.0432 116.992v62.9248c0 16.9472-13.7216 30.72-30.72 30.72zM391.2704 894.7712H309.76c-98.4064 0-178.4832-80.0768-178.4832-178.4832v-54.9888c0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72v54.9888c0 64.512 52.48 117.0432 117.0432 117.0432h81.5104c16.9472 0 30.72 13.7728 30.72 30.72s-13.7728 30.72-30.72 30.72zM717.8752 894.7712h-76.1856c-16.9472 0-30.72-13.7728-30.72-30.72s13.7728-30.72 30.72-30.72h76.1856c64.512 0 116.992-52.48 116.992-117.0432v-53.6576c0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72v53.6576c0 98.4576-80.0256 178.4832-178.432 178.4832z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M896.0512 548.4032H138.1888c-16.9472 0-30.72-13.7728-30.72-30.72s13.7728-30.72 30.72-30.72h757.9136c16.9472 0 30.72 13.7728 30.72 30.72s-13.7728 30.72-30.7712 30.72z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.shanchu:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M899.6352 217.5488h-112.8448v-32.0512c0-56.9344-47.8208-103.2704-106.5984-103.2704H350.0544c-58.7776 0-106.5984 46.336-106.5984 103.2704v32.0512H124.4672c-16.9472 0-30.72 13.7728-30.72 30.72s13.7728 30.72 30.72 30.72h775.168c16.9472 0 30.72-13.7728 30.72-30.72s-13.7728-30.72-30.72-30.72zM304.896 185.4976c0-23.04 20.2752-41.8304 45.1584-41.8304h330.1888c24.8832 0 45.1584 18.7904 45.1584 41.8304v32.0512H304.896v-32.0512zM812.1344 334.848c-16.9472 0-30.72 13.7728-30.72 30.72v445.44c0 38.1952-30.2592 69.2736-67.4304 69.2736H308.0192c-37.1712 0-67.4304-31.0784-67.4304-69.2736v-445.44c0-16.9472-13.7728-30.72-30.72-30.72s-30.72 13.7728-30.72 30.72v445.44c0 72.0896 57.8048 130.7136 128.8704 130.7136h405.9648c71.0656 0 128.8704-58.624 128.8704-130.7136v-445.44c0-16.9472-13.7728-30.72-30.72-30.72z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M405.8624 757.3504c-16.9472 0-30.72-13.7728-30.72-30.72V449.9968c0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72v276.5824c0 16.9984-13.7728 30.7712-30.72 30.7712z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
            <path
              d="M616.192 757.3504c-16.9472 0-30.72-13.7728-30.72-30.72V449.9968c0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72v276.5824c0 16.9984-13.7728 30.7712-30.72 30.7712z"
              fill="''' + getColor(2, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.renzheng:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M867.9936 513.3312c-0.512-0.8192-0.512-1.8432 0-2.6624l49.2032-79.104c7.6288-12.288 11.5712-26.7776 10.1376-41.1648-2.4576-24.1664-17.8688-44.2368-39.6288-53.0432l-59.3408-24.1152a30.73024 30.73024 0 0 0-39.68 16.0768c-6.9632 15.8208 0.512 34.2528 16.4864 40.8064 25.8048 10.496 59.3408 24.1664 59.3408 24.1664 0.3072 0.1024 1.0752 0.4608 1.4336 1.536 0.3584 1.1264-0.1024 1.8944-0.256 2.0992l-49.92 80.2816a63.62624 63.62624 0 0 0 0 67.584l49.92 80.2816c0.1536 0.256 0.6144 1.024 0.256 2.0992-0.3584 1.1264-1.1264 1.4336-1.4336 1.536l-87.552 35.584c-22.7328 9.216-37.9392 30.1568-39.7312 54.6304l-6.8096 94.3104c0 0.3072-0.1024 1.1776-1.024 1.8432s-1.792 0.512-2.0992 0.4096l-91.8016-22.5792a63.4368 63.4368 0 0 0-64.1536 20.8384l-60.9792 72.2432a2.3552 2.3552 0 0 1-1.9456 0.8704c-1.1776 0-1.7408-0.6656-1.9456-0.8704l-60.9792-72.2432c-12.3904-14.6432-30.1568-22.7328-48.6912-22.7328-5.12 0-10.3424 0.6144-15.4624 1.8944l-91.8016 22.5792c-0.256 0.0512-1.1264 0.256-2.0992-0.4096a2.2784 2.2784 0 0 1-1.024-1.8432l-6.8096-94.3104c-1.792-24.4736-16.9984-45.4144-39.7312-54.6304l-87.552-35.584a2.31936 2.31936 0 0 1-1.4336-1.536c-0.3584-1.1264 0.1024-1.8944 0.256-2.0992l49.92-80.2816c12.9536-20.8384 12.9536-46.7456 0-67.584l-49.92-80.2816c-0.1536-0.256-0.6144-1.024-0.256-2.0992 0.3584-1.1264 1.1776-1.4336 1.4336-1.536l87.552-35.584c22.7328-9.216 37.9392-30.1568 39.7312-54.6304l6.8096-94.3104c0-0.3072 0.1024-1.1776 1.024-1.8432 0.9728-0.7168 1.792-0.512 2.0992-0.4096l91.8016 22.5792a63.6416 63.6416 0 0 0 64.1536-20.8384l60.9792-72.2432c0.2048-0.2048 0.768-0.9216 1.9456-0.9216s1.7408 0.6656 1.9456 0.8704l60.9792 72.2432c15.7696 18.688 40.3968 26.7264 64.1536 20.8384l91.8016-22.5792c0.3072-0.0512 1.1264-0.256 2.0992 0.4096 0.9216 0.6656 1.024 1.536 1.024 1.8432l0.256 3.072a30.72512 30.72512 0 0 0 33.3312 28.1088 30.66368 30.66368 0 0 0 27.904-32.9728l-0.1024-1.2288c-1.024-14.4384-6.2976-28.416-15.9232-39.168a64.01024 64.01024 0 0 0-63.232-19.7632l-91.8016 22.5792a2.57024 2.57024 0 0 1-2.5088-0.8192L557.3632 97.28a63.98464 63.98464 0 0 0-97.7408 0L398.592 169.5744c-0.6144 0.7168-1.5872 1.0752-2.56 0.8192l-91.8016-22.5792c-22.7328-5.5808-46.9504 1.5872-63.1808 19.6608-9.6768 10.8032-14.9504 24.7808-16.0256 39.2192l-6.7072 92.928c-0.0512 0.9728-0.6656 1.792-1.5872 2.1504l-86.272 35.072c-13.5168 5.4784-25.2928 15.0016-32.5632 27.6992-12.032 20.992-11.264 46.08 1.024 65.8944l49.92 80.2816c0.512 0.8192 0.512 1.8432 0 2.6624l-49.2032 79.104c-7.6288 12.288-11.5712 26.7776-10.0864 41.1648 2.4576 24.1664 17.8688 44.2368 39.6288 53.0432l87.552 35.584c0.8704 0.3584 1.4848 1.1776 1.5872 2.1504l6.7072 92.8256c1.024 14.3872 6.2976 28.416 15.9232 39.168 16.1792 18.176 40.4992 25.3952 63.2832 19.7632l91.8016-22.5792c0.9216-0.2048 1.8944 0.1024 2.56 0.8192l60.0576 71.168c9.3184 11.0592 21.8112 19.2512 35.9424 22.3232 23.7568 5.12 47.5648-3.2768 62.72-21.1968l60.9792-72.2432c0.6144-0.7168 1.5872-1.024 2.5088-0.8192l90.4704 22.272c14.0288 3.4304 28.9792 2.7136 42.1888-3.1232 22.2208-9.8304 36.5056-30.6688 38.1952-54.016l6.8096-94.3104c0.0512-0.9728 0.6656-1.792 1.5872-2.1504l87.552-35.584c21.76-8.8064 37.12-28.8768 39.6288-53.0432 1.4848-14.3872-2.4576-28.8768-10.1376-41.1648l-49.1008-79.2064z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M506.88 663.8592c-18.5856 0-36.5056-7.2192-49.92-20.3776l-93.6448-91.6992c-12.1344-11.8784-12.3392-31.3344-0.4608-43.4176 11.8784-12.1344 31.3344-12.3392 43.4176-0.4608l93.6448 91.6992c2.8672 2.816 6.2464 2.9696 7.936 2.816 1.7408-0.1536 4.9664-0.9216 7.2704-4.2496l134.912-195.5328c9.6256-13.9776 28.7744-17.4592 42.752-7.8336 13.9776 9.6256 17.4592 28.7744 7.8336 42.752l-134.912 195.5328a71.2192 71.2192 0 0 1-51.9168 30.5152c-2.304 0.1536-4.608 0.256-6.912 0.256z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.wendang:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M862.72 625.1008c16.9472 0 30.72-13.7728 30.72-30.72V415.232c0-28.8256-11.8272-56.832-32.512-76.9024l-239.9744-233.1136a106.59328 106.59328 0 0 0-74.7008-30.3104H320.5632c-93.184 0-168.96 75.776-168.96 168.96v523.5712c0 93.184 75.776 168.96 168.96 168.96h403.9168c93.184 0 168.96-75.776 168.96-168.96v-18.6368c0-16.9472-13.7728-30.72-30.72-30.72s-30.72 13.7728-30.72 30.72v18.6368c0 59.2896-48.2304 107.52-107.52 107.52H320.5632c-59.2896 0-107.52-48.2304-107.52-107.52V243.9168c0-59.2896 48.2304-107.52 107.52-107.52h210.7904v194.1504c0 48.9984 39.8848 88.8832 88.8832 88.8832h211.7632v174.9504c0 16.9472 13.7728 30.72 30.72 30.72z m-269.9264-294.6048V163.5328l200.192 194.4576h-172.6976c-15.1552-0.0512-27.4944-12.3392-27.4944-27.4944z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M303.872 559.9232H512c16.9472 0 30.72-13.7728 30.72-30.72s-13.7728-30.72-30.72-30.72H303.872c-16.9472 0-30.72 13.7728-30.72 30.72s13.7728 30.72 30.72 30.72zM687.2576 702.4128H303.872c-16.9472 0-30.72 13.7728-30.72 30.72s13.7728 30.72 30.72 30.72h383.3344c16.9472 0 30.72-13.7728 30.72-30.72s-13.7216-30.72-30.6688-30.72z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.history:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M908.6976 426.24c-24.3712-107.3152-89.0368-198.656-182.1184-257.3312-93.0816-58.624-203.4688-77.5168-310.7328-53.1456-63.3856 14.3872-121.344 42.9056-170.5472 83.5072l0.3072-62.9248A30.77632 30.77632 0 0 0 215.04 105.472h-0.1536c-16.896 0-30.6176 13.6704-30.72 30.5664l-0.6656 145.2032a30.6688 30.6688 0 0 0 30.6176 30.8224l154.88 0.512h0.1024c16.9472 0 30.6688-13.6704 30.72-30.6176a30.7456 30.7456 0 0 0-30.6176-30.8224L279.5008 250.88c42.8544-36.7104 93.9008-62.464 149.9648-75.1616 91.2896-20.736 185.1904-4.6592 264.3968 45.2096s134.2464 127.6416 154.9824 218.9312c20.736 91.2896 4.6592 185.1904-45.2096 264.3968-49.8688 79.2064-127.6416 134.2464-218.9312 154.9824s-185.1904 4.6592-264.3968-45.2096c-79.2064-49.8688-134.2464-127.6416-154.9824-218.9312a351.99488 351.99488 0 0 1-8.704-86.1184 30.72 30.72 0 0 0-30.0032-31.4368h-0.7168c-16.64 0-30.3104 13.2608-30.72 30.0032-0.8192 33.8432 2.6112 67.8912 10.1888 101.1712 24.3712 107.3152 89.0368 198.656 182.1184 257.3312 66.56 41.9328 141.9264 63.5392 218.7264 63.5392 30.6176 0 61.44-3.4304 92.0064-10.3936 107.3152-24.3712 198.656-89.0368 257.3312-182.1184 58.624-93.184 77.5168-203.52 53.1456-310.8352z"
              fill="''' + getColor(0, color, colors, '#363F5B') + '''"
            />
            <path
              d="M625.9712 683.1616c-8.3968 0-16.7424-3.4304-22.8352-10.1376l-118.9376-132.0448a30.7456 30.7456 0 0 1-7.8848-20.5824V381.7984c0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72v126.7712l111.0528 123.2896a30.6944 30.6944 0 0 1-2.2528 43.3664 30.49984 30.49984 0 0 1-20.5824 7.936z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.zijin:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M508.245333 713.258667c8.490667 0 16.64-3.328 22.613334-9.258667 6.016-5.973333 9.386667-13.994667 9.386666-22.357333v-74.410667h101.461334a32.213333 32.213333 0 0 0 21.674666-9.770667 31.445333 31.445333 0 0 0 0-43.648 32.213333 32.213333 0 0 0-21.674666-9.813333h-101.461334v-45.525333h83.84a32.384 32.384 0 0 0 23.594667-8.704 31.658667 31.658667 0 0 0 9.898667-22.912 31.274667 31.274667 0 0 0-9.898667-22.869334 32.085333 32.085333 0 0 0-23.594667-8.704h-65.493333l41.472-40.021333a31.445333 31.445333 0 0 0 0-44.672 32.213333 32.213333 0 0 0-45.226667 0l-46.592 45.056-46.592-45.056a32.256 32.256 0 0 0-45.226666 0 31.445333 31.445333 0 0 0 0 44.672l41.429333 39.978667H389.461333a32.213333 32.213333 0 0 0-21.674666 9.770666 31.402667 31.402667 0 0 0 0 43.648c5.674667 5.888 13.44 9.386667 21.674666 9.813334l86.784-0.042667v45.568H371.84a32.213333 32.213333 0 0 0-21.632 9.813333 31.402667 31.402667 0 0 0 0 43.648c5.674667 5.845333 13.44 9.386667 21.674667 9.728h104.362666v74.453334c0 8.362667 3.413333 16.384 9.386667 22.314666 5.973333 5.973333 14.122667 9.301333 22.613333 9.301334z"
              fill="''' + getColor(0, color, colors, '#144eee') + '''"
            />
            <path
              d="M194.645333 354.645333a354.176 354.176 0 0 1 669.696 121.813334l-91.434666-15.232a29.866667 29.866667 0 1 0-9.813334 58.88l128 21.333333 34.773334 5.802667V512c0-228.565333-185.301333-413.866667-413.866667-413.866667A413.866667 413.866667 0 0 0 141.184 328.106667a29.866667 29.866667 0 0 0 53.461333 26.581333z m634.666667 314.752a354.176 354.176 0 0 1-669.696-121.813333l91.477333 15.189333a29.866667 29.866667 0 0 0 9.813334-58.88l-128-21.333333-34.773334-5.802667V512c0 228.565333 185.301333 413.866667 413.866667 413.866667a413.866667 413.866667 0 0 0 370.816-229.930667 29.866667 29.866667 0 1 0-53.504-26.581333z"
              fill="''' + getColor(1, color, colors, '#303133') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.daiban:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M437.333333 341.333333a32 32 0 0 1 32-32h213.333334a32 32 0 0 1 0 64h-213.333334a32 32 0 0 1-32-32zM437.333333 512a32 32 0 0 1 32-32h213.333334a32 32 0 0 1 0 64h-213.333334a32 32 0 0 1-32-32zM437.333333 682.666667a32 32 0 0 1 32-32h213.333334a32 32 0 0 1 0 64h-213.333334a32 32 0 0 1-32-32z"
              fill="''' + getColor(0, color, colors, '#144eee') + '''"
            />
            <path
              d="M337.792 380.458667a39.125333 39.125333 0 1 0 0-78.250667 39.125333 39.125333 0 0 0 0 78.250667zM337.792 547.541333a39.125333 39.125333 0 1 0 0-78.208 39.125333 39.125333 0 0 0 0 78.208zM337.792 721.792a39.125333 39.125333 0 1 0 0-78.250667 39.125333 39.125333 0 0 0 0 78.250667z"
              fill="''' + getColor(1, color, colors, '#303133') + '''"
            />
            <path
              d="M138.666667 170.666667A117.333333 117.333333 0 0 1 256 53.333333h512A117.333333 117.333333 0 0 1 885.333333 170.666667v682.666666A117.333333 117.333333 0 0 1 768 970.666667H256A117.333333 117.333333 0 0 1 138.666667 853.333333V170.666667zM256 117.333333c-29.44 0-53.333333 23.893333-53.333333 53.333334v682.666666c0 29.44 23.893333 53.333333 53.333333 53.333334h512c29.44 0 53.333333-23.893333 53.333333-53.333334V170.666667c0-29.44-23.893333-53.333333-53.333333-53.333334H256z"
              fill="''' + getColor(2, color, colors, '#303133') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.forward_zhuanfa:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M498.64 919.82c-53.74 0-105.89-10.53-155-31.3-47.42-20.06-90-48.76-126.56-85.32s-65.26-79.14-85.32-126.56c-20.77-49.11-31.3-101.26-31.3-155s10.53-105.89 31.3-155c20.06-47.42 48.76-90 85.32-126.56s79.14-65.26 126.56-85.32c49.11-20.77 101.26-31.3 155-31.3 16.57 0 30 13.43 30 30s-13.43 30-30 30c-186.47 0-338.18 151.71-338.18 338.18s151.71 338.18 338.18 338.18 338.18-151.71 338.18-338.18c0-16.57 13.43-30 30-30s30 13.43 30 30c0 53.74-10.53 105.89-31.3 155-20.06 47.42-48.76 90-85.32 126.56s-79.14 65.26-126.56 85.32c-49.11 20.77-101.26 31.3-155 31.3z"
              fill="''' + getColor(0, color, colors, '#333333') + '''"
            />
            <path
              d="M884.05 374.67h-60V197.11H646.49v-60h237.56z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
            <path
              d="M519.413 550.353l-48.599-48.6L804.63 167.94l48.6 48.599z"
              fill="''' + getColor(2, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.cart_gouwuche:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M695.09 581.91H373.14c-16.57 0-30-13.43-30-30s13.43-30 30-30h321.95c83.16 0 150.82-67.66 150.82-150.82v-82.64c0-15.04-12.24-27.28-27.28-27.28H307.08c-16.57 0-30-13.43-30-30s13.43-30 30-30h511.55c48.13 0 87.28 39.15 87.28 87.28v82.64c0 116.25-94.57 210.82-210.82 210.82z"
              fill="''' + getColor(0, color, colors, '#144eee') + '''"
            />
            <path
              d="M867.73 779.91H392.76c-116.7 0-211.65-94.94-211.65-211.65V247.95c0-39.74-2.9-70.13-17.06-89.28-15.88-21.47-49.69-31.91-103.35-31.91-16.57 0-30-13.43-30-30s13.43-30 30-30c37.44 0 67.75 4.47 92.67 13.66 25.02 9.22 44.84 23.55 58.91 42.58 26.6 35.96 28.82 83.36 28.82 124.95v320.31c0 83.62 68.03 151.65 151.65 151.65h474.97c16.57 0 30 13.43 30 30s-13.42 30-29.99 30z"
              fill="''' + getColor(1, color, colors, '#333333') + '''"
            />
            <path
              d="M360.17 877.34m-60 0a60 60 0 1 0 120 0 60 60 0 1 0-120 0Z"
              fill="''' + getColor(2, color, colors, '#333333') + '''"
            />
            <path
              d="M732.24 877.34m-60 0a60 60 0 1 0 120 0 60 60 0 1 0-120 0Z"
              fill="''' + getColor(3, color, colors, '#333333') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.order_dingdan:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M307 309.18h378v60H307zM307 512.09h268.36v60H307z"
              fill="''' + getColor(0, color, colors, '#144eee') + '''"
            />
            <path
              d="M574.55 905.73h-301.1c-54.89 0-99.55-44.66-99.55-99.55V223.64c0-54.89 44.66-99.55 99.55-99.55h482.73c54.89 0 99.55 44.66 99.55 99.55v400.91c0 75.11-29.25 145.72-82.36 198.83s-123.72 82.35-198.82 82.35z m-301.1-721.64c-21.81 0-39.55 17.74-39.55 39.55v582.55c0 21.81 17.74 39.55 39.55 39.55h301.09c121.96 0 221.18-99.22 221.18-221.18V223.64c0-21.81-17.74-39.55-39.55-39.55H273.45z"
              fill="''' + getColor(1, color, colors, '#333333') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.a_customerservice_kefu:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M910.02 753.27h-60c0-2.05 0-205.29-0.01-210-1.33-185.27-153.15-336-338.48-336-184.19 0-336 149.75-338.45 333.85-0.02 6.1-0.03 210.11-0.03 212.15h-60c0-2.1 0.01-210.85 0.03-212.81 0.69-53.22 11.72-104.79 32.77-153.27 20.34-46.86 49.16-88.9 85.66-124.94 75.06-74.15 174.51-114.98 280.03-114.98 53.55 0 105.53 10.45 154.5 31.07 47.28 19.91 89.79 48.41 126.34 84.72 36.54 36.3 65.31 78.6 85.53 125.74 20.93 48.79 31.73 100.65 32.1 154.13 0.01 1.04 0.01 208.25 0.01 210.34z"
              fill="''' + getColor(0, color, colors, '#333333') + '''"
            />
            <path
              d="M172.73 857.45c-33 0-60-27-60-60v-130.9c0-33 27-60 60-60s60 27 60 60v130.91c0 32.99-27 59.99-60 59.99zM850.36 857.45c-33 0-60-27-60-60v-130.9c0-33 27-60 60-60s60 27 60 60v130.91c0 32.99-27 59.99-60 59.99z"
              fill="''' + getColor(1, color, colors, '#333333') + '''"
            />
            <path
              d="M706.16 539.16c-16.57 0-30-13.43-30-30C676.16 424.71 607.45 356 523 356c-16.57 0-30-13.43-30-30s13.43-30 30-30c117.54 0 213.16 95.62 213.16 213.16 0 16.57-13.43 30-30 30z"
              fill="''' + getColor(2, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.gongjijin:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M766.3616 927.8976H256.4608c-47.7184 0-86.5792-38.8096-86.5792-86.5792v-290.816h-25.1904c-30.208 0-56.32-17.2544-68.1984-45.056-11.8784-27.8016-6.2464-58.5728 14.6432-80.384 0.6656-0.7168 1.3824-1.3824 2.1504-1.9968l365.7216-315.2384c13.9776-13.9776 32.512-21.6576 52.3776-21.6576 19.8656 0 38.4 7.68 52.3776 21.6576l365.7216 315.2384c0.7168 0.6144 1.4336 1.3312 2.1504 1.9968 20.8896 21.8112 26.5216 52.6336 14.6432 80.384-11.8784 27.8016-37.9904 45.056-68.1984 45.056h-55.9104c-16.9472 0-30.72-13.7728-30.72-30.72s13.7728-30.72 30.72-30.72h55.9104c7.3216 0 10.4448-4.8128 11.6736-7.7312 1.1776-2.7136 2.4064-7.936-1.792-12.9536L522.7008 153.6c-0.7168-0.6144-1.4336-1.3312-2.1504-1.9968-3.2768-3.3792-7.1168-3.8912-9.1648-3.8912-2.048 0-5.888 0.512-9.1648 3.8912-0.6656 0.7168-1.3824 1.3824-2.0992 1.9968L134.8096 468.4288c-4.1984 5.0176-2.9696 10.24-1.792 12.9536 1.2288 2.8672 4.4032 7.7312 11.6736 7.7312h55.9104c16.9472 0 30.72 13.7728 30.72 30.72v321.536c0 13.8752 11.264 25.1392 25.1392 25.1392h509.9008c13.8752 0 25.1392-11.264 25.1392-25.1392v-168.3456c0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72v168.3456c0 47.7184-38.8608 86.528-86.5792 86.528z"
              fill="''' + getColor(0, color, colors, '#474747') + '''"
            />
            <path
              d="M636.0064 656.2304h-93.44v-41.5232h93.44c16.9472 0 30.72-13.7728 30.72-30.72s-13.7728-30.72-30.72-30.72h-64.0512l77.7728-76.8512a30.6688 30.6688 0 0 0 0.256-43.4176 30.73024 30.73024 0 0 0-43.4688-0.256L510.464 527.6672 408.6272 432.1792a30.73024 30.73024 0 0 0-43.4176 1.3824 30.73024 30.73024 0 0 0 1.3824 43.4176l81.408 76.288H387.6352c-16.9472 0-30.72 13.7728-30.72 30.72s13.7728 30.72 30.72 30.72h93.4912v41.5232H387.6352c-16.9472 0-30.72 13.7728-30.72 30.72s13.7728 30.72 30.72 30.72h93.4912v59.4944c0 16.9472 13.7728 30.72 30.72 30.72s30.72-13.7728 30.72-30.72v-59.4944h93.44c16.9472 0 30.72-13.7728 30.72-30.72s-13.7728-30.72-30.72-30.72z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.goupiao:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M511.8976 934.6048c-18.688 0-37.376-6.656-52.224-20.0192l-96.512-86.784c-6.0928-5.4784-14.8992-5.8368-21.3504-0.8704l-82.8928 64.2048c-23.7568 18.3808-55.1424 21.6064-81.9712 8.448-27.6992-13.568-44.9024-41.5232-44.9024-72.9088V242.1248c0-69.9904 56.9344-126.8736 126.8736-126.8736H768c69.9904 0 126.8736 56.9344 126.8736 126.8736v316.0064c0 16.9472-13.7728 30.72-30.72 30.72s-30.72-13.7728-30.72-30.72V242.1248c0-36.096-29.3888-65.4336-65.4336-65.4336H258.9696c-36.096 0-65.4336 29.3888-65.4336 65.4336v584.6016c0 11.6736 8.0384 16.5376 10.496 17.7664 3.4304 1.6896 10.1888 3.6352 17.3056-1.8944l82.8928-64.2048a78.08 78.08 0 0 1 100.0448 3.7376l96.512 86.784a16.73216 16.73216 0 0 0 22.9376-0.5632l87.04-86.1696c27.7504-27.4944 70.5536-30.5152 101.7344-7.168l93.44 69.8368c7.1168 5.3248 13.824 3.328 17.2032 1.6384 2.4576-1.2288 10.3936-6.0928 10.3936-17.664v-90.3168c0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72v90.3168c0 31.0784-16.9984 58.9312-44.288 72.6016-26.4704 13.2608-57.7024 10.4448-81.5104-7.3728l-93.44-69.8368c-6.7584-5.0176-15.6672-4.352-21.76 1.6384l-87.04 86.1696a78.21824 78.21824 0 0 1-55.04 22.5792z"
              fill="''' + getColor(0, color, colors, '#474747') + '''"
            />
            <path
              d="M644.1472 536.2176h-99.9424v-46.08h99.9424c16.9472 0 30.72-13.7728 30.72-30.72s-13.7728-30.72-30.72-30.72h-64.2048l62.72-62.3104a30.77632 30.77632 0 0 0 0.1536-43.4688 30.77632 30.77632 0 0 0-43.4688-0.1536l-84.6848 84.1216-87.3472-84.4288a30.72 30.72 0 0 0-43.4176 0.7168 30.72 30.72 0 0 0 0.7168 43.4176l64.1536 62.0032H382.8224c-16.9472 0-30.72 13.7728-30.72 30.72s13.7728 30.72 30.72 30.72h99.9424v46.08H382.8224c-16.9472 0-30.72 13.7728-30.72 30.72s13.7728 30.72 30.72 30.72h99.9424v58.9824c0 16.9472 13.7728 30.72 30.72 30.72s30.72-13.7728 30.72-30.72v-58.9824h99.9424c16.9472 0 30.72-13.7728 30.72-30.72s-13.7728-30.6176-30.72-30.6176z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.kaijuzhengming:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M462.7456 917.2992H262.2464c-67.6864 0-122.7264-51.9168-122.7264-115.7632V224.8192C139.52 160.9728 194.56 109.056 262.2464 109.056h390.5024c28.5184 0 55.296 11.9296 73.4208 32.8192l123.136 141.4656c14.08 16.1792 21.8112 36.608 21.8112 57.6v123.0336c0 16.9472-13.7728 30.72-30.72 30.72s-30.72-13.7728-30.72-30.72V340.8896c0-6.144-2.4064-12.288-6.7072-17.2544l-123.136-141.4656c-6.4-7.3216-16.4864-11.7248-27.0848-11.7248H262.2464c-33.792 0-61.2864 24.3712-61.2864 54.3232v576.6656c0 29.952 27.4944 54.3232 61.2864 54.3232h200.4992c16.9472 0 30.72 13.7728 30.72 30.72s-13.7728 30.8224-30.72 30.8224z"
              fill="''' + getColor(0, color, colors, '#474747') + '''"
            />
            <path
              d="M748.288 403.456H630.272c-27.2384 0-49.408-22.1696-49.408-49.408V235.008c0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72v107.008h105.984c16.9472 0 30.72 13.7728 30.72 30.72s-13.7728 30.72-30.72 30.72z"
              fill="''' + getColor(1, color, colors, '#474747') + '''"
            />
            <path
              d="M802.3552 722.0736c20.736-21.76 33.536-51.2512 33.536-83.6096 0-66.9184-54.4256-121.344-121.344-121.344s-121.344 54.4256-121.344 121.344c0 32.4096 12.8 61.8496 33.536 83.6096-54.3232 30.7712-91.136 89.0368-91.136 155.8016 0 16.9472 13.7728 30.72 30.72 30.72s30.72-13.7728 30.72-30.72c0-64.8192 52.736-117.504 117.504-117.504s117.504 52.736 117.504 117.504c0 16.9472 13.7728 30.72 30.72 30.72s30.72-13.7728 30.72-30.72c0-66.7648-36.7616-125.0304-91.136-155.8016z m-87.808-143.5648c33.024 0 59.904 26.88 59.904 59.904 0 33.024-26.88 59.904-59.904 59.904s-59.904-26.88-59.904-59.904c0-32.9728 26.88-59.904 59.904-59.904z"
              fill="''' + getColor(2, color, colors, '#144eee') + '''"
            />
            <path
              d="M443.0336 392.8576H291.4304c-16.9472 0-30.72-13.7728-30.72-30.72s13.7728-30.72 30.72-30.72h151.6032c16.9472 0 30.72 13.7728 30.72 30.72s-13.7216 30.72-30.72 30.72zM508.7232 548.9664H291.4304c-16.9472 0-30.72-13.7728-30.72-30.72s13.7728-30.72 30.72-30.72h217.2928c16.9472 0 30.72 13.7728 30.72 30.72s-13.7728 30.72-30.72 30.72zM508.7232 705.0752H291.4304c-16.9472 0-30.72-13.7728-30.72-30.72s13.7728-30.72 30.72-30.72h217.2928c16.9472 0 30.72 13.7728 30.72 30.72s-13.7728 30.72-30.72 30.72z"
              fill="''' + getColor(3, color, colors, '#474747') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.shenfenzheng:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M812.2368 875.52H222.0032c-77.4656 0-140.544-63.0272-140.544-140.544V277.6576c0-77.4656 63.0272-140.544 140.544-140.544h590.2336c77.4656 0 140.544 63.0272 140.544 140.544V404.992c0 16.9472-13.7728 30.72-30.72 30.72s-30.72-13.7728-30.72-30.72V277.6576c0-43.6224-35.4816-79.104-79.104-79.104H222.0032c-43.6224 0-79.104 35.4816-79.104 79.104v457.3696c0 43.6224 35.4816 79.104 79.104 79.104h590.2336c43.6224 0 79.104-35.4816 79.104-79.104v-160.9216c0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72v160.9216c0 77.4656-63.0784 140.4928-140.544 140.4928z"
              fill="''' + getColor(0, color, colors, '#474747') + '''"
            />
            <path
              d="M464.7424 516.9152c30.7712-22.528 50.8416-58.88 50.8416-99.84 0-68.1472-55.4496-123.5968-123.5968-123.5968S268.3392 348.928 268.3392 417.0752c0 40.96 20.0192 77.312 50.8416 99.84-64.5632 28.16-109.824 92.6208-109.824 167.4752 0 16.9472 13.7728 30.72 30.72 30.72s30.72-13.7728 30.72-30.72c0-66.816 54.3744-121.1904 121.1904-121.1904s121.1904 54.3744 121.1904 121.1904c0 16.9472 13.7728 30.72 30.72 30.72s30.72-13.7728 30.72-30.72c-0.0512-74.8544-45.312-139.3152-109.8752-167.4752zM391.936 354.9184c34.304 0 62.1568 27.904 62.1568 62.1568 0 34.304-27.904 62.1568-62.1568 62.1568s-62.1568-27.904-62.1568-62.1568 27.904-62.1568 62.1568-62.1568z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
            <path
              d="M799.7952 451.072H636.416c-16.9472 0-30.72-13.7728-30.72-30.72s13.7728-30.72 30.72-30.72h163.4304c16.9472 0 30.72 13.7728 30.72 30.72s-13.7728 30.72-30.7712 30.72zM701.7472 599.6544H636.416c-16.9472 0-30.72-13.7728-30.72-30.72s13.7728-30.72 30.72-30.72h65.3824c16.9472 0 30.72 13.7728 30.72 30.72s-13.7728 30.72-30.7712 30.72z"
              fill="''' + getColor(2, color, colors, '#474747') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.tongzhigonggao:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M891.136 667.904l-84.0704-116.3776V438.4768c0-111.6672-66.0992-211.8656-169.8816-260.096-11.4688-60.2112-66.7648-106.2912-132.0448-106.2912s-120.576 46.08-132.0448 106.2912c-103.7824 48.2304-169.8816 148.48-169.8816 260.096v127.1808l-70.2976 104.96c-18.944 28.3136-20.736 63.0784-4.7104 93.0304 16.5376 30.976 49.152 50.176 85.1456 50.176h139.4688c9.9328 73.3696 72.96 130.1504 149.0432 130.1504h22.2208c82.944 0 150.4256-67.4816 150.4256-150.4256 0-23.0912-18.7904-41.8304-41.8304-41.8304H393.3184c-2.5088 0-4.9664 0.256-7.3728 0.7168h-172.544c-13.4656 0-25.0368-6.6048-30.9248-17.664-2.4576-4.608-7.2192-16.7424 1.5872-29.9008l75.4688-112.7424c3.3792-5.0688 5.1712-11.008 5.1712-17.1008V438.4768c0-92.3136 58.2144-174.8992 148.2752-210.3808a30.75584 30.75584 0 0 0 19.456-27.9552c0.768-36.7616 33.4336-66.6624 72.7552-66.6624s71.9872 29.9008 72.7552 66.6624a30.75584 30.75584 0 0 0 19.456 27.9552c90.0608 35.4816 148.2752 118.0672 148.2752 210.3808v123.0336c0 6.4512 2.048 12.7488 5.8368 17.9712l89.856 124.416c9.5232 13.1584 4.9152 25.6 2.4576 30.3104-5.8368 11.3664-17.4592 18.176-31.1808 18.176h-30.5664c-16.9472 0-30.72 13.7728-30.72 30.72s13.7728 30.72 30.72 30.72h30.5664c36.7104 0 69.5808-19.7632 85.8624-51.6096 15.7696-30.8736 13.0048-66.0992-7.3728-94.3104z m-367.0016 214.6304h-22.2208c-42.1376 0-77.5168-29.44-86.6816-68.8128 1.3824-0.1024 2.7648-0.3072 4.096-0.5632h191.6416c-8.96 39.6288-44.4928 69.376-86.8352 69.376z"
              fill="''' + getColor(0, color, colors, '#474747') + '''"
            />
            <path
              d="M362.5984 546.7136c-14.592 0-27.4944-10.3936-30.208-25.2416-17.152-94.8736 9.7792-152.8832 33.8944-183.9616 13.056-16.8448 39.0144-15.2064 50.2272 2.9184 6.7072 10.8032 6.144 24.576-1.5872 34.7136-15.0528 19.8144-35.1744 61.44-22.3232 134.1952 2.56 14.3872-4.4032 29.2352-17.8688 34.9184-3.9936 1.6896-8.1408 2.4576-12.1344 2.4576z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.yinsijimi:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M901.12 622.3872c-16.9472 0-30.72 13.7728-30.72 30.72v151.9616c0 45.2096-36.8128 82.0224-82.0224 82.0224H246.528c-45.2096 0-82.0224-36.8128-82.0224-82.0224V460.1344c0-45.2096 36.8128-82.0224 82.0224-82.0224h541.8496c45.2096 0 82.0224 36.8128 82.0224 82.0224 0 16.9472 13.7728 30.72 30.72 30.72s30.72-13.7728 30.72-30.72c0-79.104-64.3584-143.4624-143.4624-143.4624h-10.9056c-15.2576-129.0752-125.2864-229.5296-258.3552-229.5296h-23.0912c-133.2224 0-243.3024 100.608-258.4064 229.8368-75.008 4.608-134.5536 67.0208-134.5536 143.1552v344.9344c0 79.104 64.3584 143.4624 143.4624 143.4624h541.8496c79.104 0 143.4624-64.3584 143.4624-143.4624v-151.9616c0-16.9984-13.7728-30.72-30.72-30.72zM495.9744 148.5824h23.0912c99.1744 0 181.6064 73.0112 196.4032 168.0896H299.5712C314.368 221.5424 396.8 148.5824 495.9744 148.5824z"
              fill="''' + getColor(0, color, colors, '#474747') + '''"
            />
            <path
              d="M507.5456 663.3472c-60.16 0-109.056-48.9472-109.056-109.056s48.9472-109.056 109.056-109.056 109.056 48.9472 109.056 109.056-48.9472 109.056-109.056 109.056z m0-156.7232c-26.2656 0-47.616 21.3504-47.616 47.616s21.3504 47.616 47.616 47.616 47.616-21.3504 47.616-47.616-21.3504-47.616-47.616-47.616z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
            <path
              d="M507.5456 820.48c-16.9472 0-30.72-13.7728-30.72-30.72v-157.1328c0-16.9472 13.7728-30.72 30.72-30.72s30.72 13.7728 30.72 30.72v157.1328c0 16.9472-13.7728 30.72-30.72 30.72z"
              fill="''' + getColor(2, color, colors, '#144eee') + '''"
            />
            <path
              d="M585.8816 757.248h-66.4064c-16.9472 0-30.72-13.7728-30.72-30.72s13.7728-30.72 30.72-30.72h66.4064c16.9472 0 30.72 13.7728 30.72 30.72s-13.7728 30.72-30.72 30.72z"
              fill="''' + getColor(3, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.youhuiquan:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M785.0496 902.8096H238.9504c-90.112 0-163.3792-73.9328-163.3792-164.8128v-115.968c0-24.5248 16.4864-45.824 40.1408-51.7632 26.624-6.7072 45.2096-30.8736 45.2096-58.7264S142.336 459.52 115.712 452.8128c-23.6544-5.9392-40.1408-27.2384-40.1408-51.7632V285.0816c0-90.88 73.3184-164.8128 163.3792-164.8128h546.0992c77.8752 0 145.3056 55.8592 160.3072 132.864 3.2256 16.64-7.6288 32.768-24.2688 36.0448-16.64 3.2256-32.768-7.6288-36.0448-24.2688-9.4208-48.2304-51.456-83.2-99.9936-83.2H238.9504c-56.2176 0-101.9392 46.3872-101.9392 103.3728v109.8752c50.5856 15.6672 85.3504 62.6688 85.3504 116.5312s-34.7648 100.864-85.3504 116.5312v109.8752c0 56.9856 45.7216 103.3728 101.9392 103.3728h546.0992c56.2176 0 101.9392-46.3872 101.9392-103.3728v-109.8752c-50.6368-15.616-85.4528-62.6688-85.4528-116.5824 0-56.1152 37.7344-104.7552 91.7504-118.3232a30.70464 30.70464 0 0 1 37.2736 22.3232 30.70464 30.70464 0 0 1-22.3232 37.2736c-26.624 6.7072-45.2608 30.8224-45.2608 58.7264 0 27.904 18.5856 52.0704 45.2608 58.7264 23.6544 5.9392 40.192 27.2384 40.192 51.7632v115.9168c0 91.0336-73.2672 164.9664-163.3792 164.9664z"
              fill="''' + getColor(0, color, colors, '#474747') + '''"
            />
            <path
              d="M642.0992 459.0592H381.9008c-16.9472 0-30.72-13.7728-30.72-30.72s13.7728-30.72 30.72-30.72h260.2496c16.9472 0 30.72 13.7728 30.72 30.72s-13.7728 30.72-30.7712 30.72zM642.0992 638.976H381.9008c-16.9472 0-30.72-13.7728-30.72-30.72s13.7728-30.72 30.72-30.72h260.2496c16.9472 0 30.72 13.7728 30.72 30.72s-13.7728 30.72-30.7712 30.72z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.zixun:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M518.1952 620.7488c-92.5184 0-144.5888-55.6032-146.7904-57.9584a30.7456 30.7456 0 0 1 1.8432-43.4176 30.74048 30.74048 0 0 1 43.264 1.6896c1.792 1.8944 37.4272 38.2464 101.6832 38.2464 62.1056 0 89.3952-34.304 90.5216-35.7376 9.984-13.7216 29.0816-16.5376 42.8032-6.5536 13.7216 9.984 16.5888 29.3888 6.6048 43.1104-1.8432 2.4576-45.3632 60.6208-139.9296 60.6208z"
              fill="''' + getColor(0, color, colors, '#144eee') + '''"
            />
            <path
              d="M268.7488 395.264c0-136.0384 110.6944-246.7328 246.7328-246.7328 83.712 0 160.9728 41.8816 206.7968 112.0768 9.2672 14.1824 28.3136 18.2272 42.496 8.96a30.68928 30.68928 0 0 0 8.96-42.496c-57.1904-87.6544-153.7536-139.9808-258.2528-139.9808-168.4992 0-305.7664 135.936-308.0704 303.9232h-2.2528c-66.9696 0-121.3952 54.4768-121.3952 121.3952v73.5232c0 66.9184 54.4768 121.3952 121.3952 121.3952h41.6768c9.5232 0 18.4832-4.4032 24.2688-11.9296s7.8336-17.3056 5.4784-26.4704c-5.2224-20.1216-7.8336-40.96-7.8336-61.9008V395.264z m-63.5392 250.6752c-33.0752 0-59.9552-26.88-59.9552-59.9552v-73.5232c0-33.0752 26.88-59.9552 59.9552-59.9552h2.1504v154.5728c0 13.0048 0.8192 26.0096 2.4576 38.912h-4.608zM822.6304 391.0144h-0.4096a30.6944 30.6944 0 0 0-29.2352-21.3504c-16.9472 0-30.72 13.7728-30.72 30.72v206.6432c0 4.8128-0.1536 9.6256-0.4608 14.4384-0.0512 1.2288-0.2048 2.4576-0.256 3.6864-0.256 3.7888-0.6144 7.5776-1.0752 11.3664-0.1024 1.0752-0.256 2.0992-0.4096 3.1744-1.3312 9.8816-3.1744 19.6608-5.632 29.2352-0.0512 0.1536-0.0512 0.256-0.1024 0.4096-23.3472 90.4704-96.4096 160.6656-189.2352 179.4048-10.0352-13.6704-26.2144-22.6304-44.4928-22.6304h-40.9088c-30.5152 0-55.2448 24.7296-55.2448 55.2448 0 30.5152 24.7296 55.2448 55.2448 55.2448h40.9088c19.6608 0 36.9152-10.2912 46.6944-25.8048 112.7936-18.8928 203.8272-98.2528 239.7696-203.4688h15.616c66.9696 0 121.3952-54.4768 121.3952-121.3952v-73.5232c0-66.9184-54.4768-121.3952-121.4464-121.3952z m60.0064 194.9696c0 33.0752-26.88 59.9552-59.9552 59.9552h-1.3824c0.2048-1.536 0.3584-3.072 0.512-4.6592 0.1536-1.5872 0.3584-3.1232 0.512-4.7104 0.4096-4.1472 0.6656-8.2432 0.9216-12.3904l0.1536-3.6352c0.2048-4.5056 0.3072-9.0112 0.3072-13.5168V452.5056c32.6144 0.5632 58.9312 27.2384 58.9312 59.9552v73.5232z"
              fill="''' + getColor(1, color, colors, '#474747') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.piaoju:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M520.16 848.85a102 102 0 0 1-41.16-8.64l-99.16-43.73c-0.49-0.21-1-0.44-1.45-0.69a10.43 10.43 0 0 0-9.6 0l-79.24 41a60.42 60.42 0 0 1-88.16-53.68V274.37A109.49 109.49 0 0 1 310.78 165h418.38a109.5 109.5 0 0 1 109.37 109.37v508.34a60.42 60.42 0 0 1-88.44 53.53l-77.27-40.44a10.46 10.46 0 0 0-9.6 0c-0.47 0.25-1 0.47-1.43 0.69L560.87 840.4a102.1 102.1 0 0 1-40.71 8.45zM400.67 751l98.52 43.45a52.11 52.11 0 0 0 41.72 0.09l100.28-43.67a60.51 60.51 0 0 1 54.81 0.62l77.27 40.44a10.43 10.43 0 0 0 15.26-9.23V274.37A59.43 59.43 0 0 0 729.16 215H310.78a59.43 59.43 0 0 0-59.37 59.37v508.68a10.42 10.42 0 0 0 15.2 9.26l79.25-40.95a60.5 60.5 0 0 1 54.81-0.36z"
              fill="''' + getColor(0, color, colors, '#0F0F0F') + '''"
            />
            <path
              d="M673.57 368.28h-307.2a25 25 0 0 1 0-50h307.2a25 25 0 0 1 0 50zM673.57 494.44h-307.2a25 25 0 0 1 0-50h307.2a25 25 0 0 1 0 50zM528 621.58H366.51a25 25 0 0 1 0-50H528a25 25 0 0 1 0 50z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.zhifubao:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M228.766 568.647c-10.894 8.715-23.966 23.966-28.323 41.396-4.358 23.966-2.18 54.468 21.787 78.434 28.323 28.323 71.898 37.038 89.327 39.217 50.111 4.357 104.58-21.788 145.975-50.111 15.251-10.894 43.574-34.86 69.72-69.72-58.826-30.501-132.903-63.182-209.158-61.003-41.396 2.178-69.72 10.893-89.328 21.787z m742.945 135.08c26.144-61.004 39.217-128.544 39.217-198.263C1010.928 226.587 784.34 0 505.464 0S0 226.587 0 505.464c0 278.876 226.587 505.464 505.464 505.464 167.762 0 318.093-82.792 409.6-209.158-87.15-43.574-230.945-113.293-318.094-156.868-41.396 47.932-104.579 95.864-174.298 117.651-43.574 13.073-84.97 17.43-126.366 8.715s-71.897-28.323-89.327-47.932c-8.715-10.893-19.609-21.787-26.145-37.038 0 2.179 2.179 2.179 2.179 2.179s-4.358-6.537-8.715-17.43c-2.179-6.536-2.179-10.894-4.358-17.43v-13.072c0-8.715 0-15.251 2.18-23.966 4.357-19.609 13.071-43.575 34.859-65.362 47.932-47.932 113.293-50.11 145.974-50.11 50.11 0 137.26 21.787 209.158 47.931 19.608-43.574 32.68-89.327 41.395-119.83H302.843v-32.68h154.689v-65.362h-187.37v-32.68h187.37v-65.363c0-8.714 2.179-17.43 17.43-17.43h74.076v82.792h204.8v32.681h-204.8v65.362h163.405s-17.43 91.506-67.54 183.012c113.293 39.217 272.34 102.4 326.808 124.188z"
              fill="''' + getColor(0, color, colors, '#1296DB') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.weixin:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M337.387283 341.82659c-17.757225 0-35.514451 11.83815-35.514451 29.595375s17.757225 29.595376 35.514451 29.595376 29.595376-11.83815 29.595376-29.595376c0-18.49711-11.83815-29.595376-29.595376-29.595375zM577.849711 513.479769c-11.83815 0-22.936416 12.578035-22.936416 23.6763 0 12.578035 11.83815 23.676301 22.936416 23.676301 17.757225 0 29.595376-11.83815 29.595376-23.676301s-11.83815-23.676301-29.595376-23.6763zM501.641618 401.017341c17.757225 0 29.595376-12.578035 29.595376-29.595376 0-17.757225-11.83815-29.595376-29.595376-29.595375s-35.514451 11.83815-35.51445 29.595375 17.757225 29.595376 35.51445 29.595376zM706.589595 513.479769c-11.83815 0-22.936416 12.578035-22.936416 23.6763 0 12.578035 11.83815 23.676301 22.936416 23.676301 17.757225 0 29.595376-11.83815 29.595376-23.676301s-11.83815-23.676301-29.595376-23.6763z"
              fill="''' + getColor(0, color, colors, '#28C445') + '''"
            />
            <path
              d="M510.520231 2.959538C228.624277 2.959538 0 231.583815 0 513.479769s228.624277 510.520231 510.520231 510.520231 510.520231-228.624277 510.520231-510.520231-228.624277-510.520231-510.520231-510.520231zM413.595376 644.439306c-29.595376 0-53.271676-5.919075-81.387284-12.578034l-81.387283 41.433526 22.936416-71.768786c-58.450867-41.433526-93.965318-95.445087-93.965317-159.815029 0-113.202312 105.803468-201.988439 233.803468-201.98844 114.682081 0 216.046243 71.028902 236.023121 166.473989-7.398844-0.739884-14.797688-1.479769-22.196532-1.479769-110.982659 1.479769-198.289017 85.086705-198.289017 188.67052 0 17.017341 2.959538 33.294798 7.398844 49.572255-7.398844 0.739884-15.537572 1.479769-22.936416 1.479768z m346.265896 82.867052l17.757225 59.190752-63.630058-35.514451c-22.936416 5.919075-46.612717 11.83815-70.289017 11.83815-111.722543 0-199.768786-76.947977-199.768786-172.393063-0.739884-94.705202 87.306358-171.653179 198.289017-171.65318 105.803468 0 199.028902 77.687861 199.028902 172.393064 0 53.271676-34.774566 100.624277-81.387283 136.138728z"
              fill="''' + getColor(1, color, colors, '#28C445') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.anquanyinsi:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M512 71.274667l373.333333 176.362666v302.698667c0 162.048-133.034667 332.224-344.682666 392.469333l-8.853334 2.453334-19.797333 5.12-20.032-5.184C282.026667 889.045333 146.730667 724.096 138.986667 563.029333l-0.256-6.890666-0.064-308.48L512 71.253333z m-0.021333 70.784l-309.333334 146.112 0.085334 267.136c3.285333 129.6 112.789333 269.354667 288.341333 323.072l8.533333 2.538666 8.661334 2.389334 3.690666 0.96 3.541334-0.896c183.104-48.981333 298.581333-189.141333 305.493333-320.554667l0.256-6.250667 0.085333-6.229333V288.170667L511.978667 142.058667z m104.704 237.141333l45.248 45.248-203.648 203.648-143.296-143.296 45.248-45.248 98.026666 98.048 158.421334-158.4z"
              fill="''' + getColor(0, color, colors, '#1677FF') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.bank:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M960.2 327.7V251c0-37.6-30.4-68-68-68H132c-37.6 0-68 30.4-68 68v76.7c0 6.6 5.4 12 12 12h872.2c6.6 0 12-5.4 12-12zM948.2 403.3H76c-6.6 0-12 5.4-12 12v390.3c0 37.6 30.4 68 68 68h760.2c37.6 0 68-30.4 68-68V415.3c0-6.6-5.4-12-12-12zM511.9 654l-18.3 103.8c-1 5.7-6 9.9-11.8 9.9h-39.6c-7.5 0-13.1-6.7-11.8-14.1l18.3-103.8c1-5.7 6-9.9 11.8-9.9h39.6c7.5 0.1 13.1 6.8 11.8 14.1z m128.1 0l-18.3 103.8c-1 5.7-6 9.9-11.8 9.9h-39.6c-7.5 0-13.1-6.7-11.8-14.1l18.3-103.8c1-5.7 6-9.9 11.8-9.9h39.6c7.5 0.1 13.1 6.8 11.8 14.1z m192 0l-18.3 103.8c-1 5.7-6 9.9-11.8 9.9H698.4c-7.5 0-13.1-6.7-11.8-14.1l18.3-103.8c1-5.7 6-9.9 11.8-9.9h103.5c7.4 0.1 13.1 6.8 11.8 14.1z"
              fill="''' + getColor(0, color, colors, '#F98434') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.security:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M511.74 853.63c-4.29-0.07-41.25-4.28-86.47-21-61.79-22.9-113.34-59.51-149.08-105.87-24.71-32.07-43.62-69.06-56.18-109.94a412.8 412.8 0 0 1-17.75-121.44V291.05a84 84 0 0 1 65.23-82.15L485 158a115.69 115.69 0 0 1 52.22 0l218.9 50.88a84 84 0 0 1 65.2 82.12v204.34c0 101.21-25.39 179.66-75.48 233.2-30.08 32.15-81.27 76.41-154.29 104.6-43 16.61-75.11 20.43-79.71 20.48h-0.1z m0-50zM511.22 205a65.19 65.19 0 0 0-14.8 1.7l-217.59 50.9a34.19 34.19 0 0 0-26.59 33.45v204.29a363.11 363.11 0 0 0 15.54 106.75c10.8 35.14 27 66.8 48 94.1 67.15 87.14 178.43 105 196 107.26 7.34-1 31.9-5.13 64.26-17.91 50.55-20 95.42-50.63 133.34-91.16 41.14-44 62-110.93 62-199V291a34.2 34.2 0 0 0-26.52-33.44l-218.93-50.87a65 65 0 0 0-14.71-1.69z"
              fill="''' + getColor(0, color, colors, '#0F0F0F') + '''"
            />
            <path
              d="M469.15 620.55a68.44 68.44 0 0 1-52-23.79l-62.51-67a25 25 0 0 1 36.56-34.11L454.11 563c0.28 0.3 0.54 0.6 0.81 0.91a18.66 18.66 0 0 0 28.68-0.24l0.23-0.27 158.41-188a25 25 0 0 1 38.24 32.22L522.16 595.54a68.49 68.49 0 0 1-52.44 25z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.edit:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M456.47 835H256.65a79.87 79.87 0 0 1-79.78-79.79V264.78A79.87 79.87 0 0 1 256.65 185h446.54A79.87 79.87 0 0 1 783 264.78v160.31a25 25 0 0 1-50 0V264.78A29.81 29.81 0 0 0 703.19 235H256.65a29.81 29.81 0 0 0-29.78 29.78v490.47A29.82 29.82 0 0 0 256.65 785h199.82a25 25 0 0 1 0 50z"
              fill="''' + getColor(0, color, colors, '#0F0F0F') + '''"
            />
            <path
              d="M630.59 362.11H329.91a25 25 0 1 1 0-50h300.68a25 25 0 0 1 0 50zM524.31 491.09h-194.4a25 25 0 0 1 0-50h194.4a25 25 0 0 1 0 50z"
              fill="''' + getColor(1, color, colors, '#0F0F0F') + '''"
            />
            <path
              d="M629 836.46h-1.91l-54.68-1.68a63.34 63.34 0 0 1-61.2-60.84l-2-54.94a63.4 63.4 0 0 1 18.46-47l172.71-172.73a63.24 63.24 0 0 1 89.35 0l56.65 56.65a63.24 63.24 0 0 1 0 89.35L673.7 818a63.45 63.45 0 0 1-44.7 18.46z m116-305.69a13.14 13.14 0 0 0-9.32 3.85L563 707.34a13.19 13.19 0 0 0-3.85 9.8l2 54.94a13.22 13.22 0 0 0 12.77 12.69l54.68 1.68a13.22 13.22 0 0 0 9.72-3.85L811 609.92a13.21 13.21 0 0 0 0-18.65l-56.64-56.65a13.15 13.15 0 0 0-9.31-3.85z"
              fill="''' + getColor(2, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.share:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M519.5 840.5a328 328 0 0 1 0-656 25 25 0 0 1 0 50 278 278 0 1 0 278 278 25 25 0 0 1 50 0 328 328 0 0 1-328 328z"
              fill="''' + getColor(0, color, colors, '#0F0F0F') + '''"
            />
            <path
              d="M822.5 429.5a25 25 0 0 1-25-25v-170h-170a25 25 0 0 1 0-50h195a25 25 0 0 1 25 25v195a25 25 0 0 1-25 25z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
            <path
              d="M606 451.05a25 25 0 0 1-17.68-42.68l186-186a25 25 0 1 1 35.36 35.36l-186 186a24.93 24.93 0 0 1-17.68 7.32z"
              fill="''' + getColor(2, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.video:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M514.89 859.28a349.19 349.19 0 1 1 136.29-27.53 347.83 347.83 0 0 1-136.29 27.53z m0-650.26a300.14 300.14 0 1 0 212.22 87.91A298.13 298.13 0 0 0 514.89 209z"
              fill="''' + getColor(0, color, colors, '#0F0F0F') + '''"
            />
            <path
              d="M458.11 650.28A41.24 41.24 0 0 1 417 609.13V477.82a25 25 0 1 1 50 0v115.87l135.3-78.12-162.49-93.66a25 25 0 1 1 25-43.32L640.69 480a41.08 41.08 0 0 1 0 71.16l-162.04 93.55a41 41 0 0 1-20.54 5.57z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.search:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M767.1 862a75.8 75.8 0 0 1-54-22.35l-66.42-66.42a76.29 76.29 0 0 1 107.89-107.9L821 731.76A76.3 76.3 0 0 1 767.1 862z m-66.42-169a26.29 26.29 0 0 0-18.6 44.88l66.43 66.43a26.29 26.29 0 1 0 37.18-37.19l-66.42-66.42a26.11 26.11 0 0 0-18.59-7.7z"
              fill="''' + getColor(0, color, colors, '#0F0F0F') + '''"
            />
            <path
              d="M479.78 761.51a299.24 299.24 0 1 1 211.6-87.64 297.26 297.26 0 0 1-211.6 87.64z m0-548.48A249.25 249.25 0 1 0 656 286a247.61 247.61 0 0 0-176.22-73z"
              fill="''' + getColor(1, color, colors, '#0F0F0F') + '''"
            />
            <path
              d="M627.51 389.09a25 25 0 0 1-21.08-11.53c-26.62-41.6-78-67.44-134.12-67.44a25 25 0 0 1 0-50c73 0 140.53 34.67 176.23 90.5a25 25 0 0 1-21 38.47z"
              fill="''' + getColor(2, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.delete:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M809 354.13a24.74 24.74 0 0 1-7.94-1.31 905.42 905.42 0 0 0-221.77-44.32 944.64 944.64 0 0 0-183.61 4.64C291.47 326 224.79 352.09 224.13 352.35a25 25 0 0 1-18.5-46.45c2.89-1.15 72.05-28.39 182.13-42.16a995.13 995.13 0 0 1 194-5.2 955.4 955.4 0 0 1 235.21 46.88 25 25 0 0 1-7.97 48.71z"
              fill="''' + getColor(0, color, colors, '#0F0F0F') + '''"
            />
            <path
              d="M565 305a25 25 0 0 1-25-25v-36a28 28 0 0 0-56.05 0v36a25 25 0 0 1-50 0v-36A78 78 0 0 1 590 244v36a25 25 0 0 1-25 25zM628.08 855.19H395.81a92.78 92.78 0 0 1-92.48-85.25l-32-366.75a25 25 0 1 1 49.81-4.35l32 366.84v0.16a43 43 0 0 0 42.65 39.35h232.29a43 43 0 0 0 42.65-39.35v-0.16l32-366.84a25 25 0 1 1 49.81 4.35l-32 366.75a92.78 92.78 0 0 1-92.48 85.25z"
              fill="''' + getColor(1, color, colors, '#0F0F0F') + '''"
            />
            <path
              d="M417.24 735.83a25 25 0 0 1-24.88-22.94l-22-266.8a25 25 0 0 1 49.83-4.09l22 266.8a25 25 0 0 1-22.86 27c-0.7 0-1.4 0.03-2.09 0.03zM604.64 735.83c-0.69 0-1.38 0-2.08-0.08a25 25 0 0 1-22.86-27l22-266.8a25 25 0 0 1 49.83 4.11l-22 266.8a25 25 0 0 1-24.89 22.97zM509.4 735.83a25 25 0 0 1-25-25V444a25 25 0 0 1 50 0v266.8a25 25 0 0 1-25 25.03z"
              fill="''' + getColor(2, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.camera:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M511.5 706.5A169 169 0 1 1 631 657a167.89 167.89 0 0 1-119.5 49.5z m0-288a119 119 0 1 0 84.15 203.15A119 119 0 0 0 511.5 418.5z"
              fill="''' + getColor(0, color, colors, '#144eee') + '''"
            />
            <path
              d="M763.4 811.5H260.6a118.23 118.23 0 0 1-118.1-118.1V405.6a118.23 118.23 0 0 1 118.1-118.1h87.55l7.67-39.38a57.73 57.73 0 0 1 56.57-46.62h199.22a57.73 57.73 0 0 1 56.57 46.61l7.67 39.39h87.55a118.23 118.23 0 0 1 118.1 118.1v287.8a118.23 118.23 0 0 1-118.1 118.1z m-502.8-474a68.18 68.18 0 0 0-68.1 68.1v287.8a68.18 68.18 0 0 0 68.1 68.1h502.8a68.18 68.18 0 0 0 68.1-68.1V405.6a68.18 68.18 0 0 0-68.1-68.1H655.25a25 25 0 0 1-24.54-20.22l-11.61-59.6a7.65 7.65 0 0 0-7.49-6.18H412.39a7.65 7.65 0 0 0-7.49 6.18l-11.61 59.6a25 25 0 0 1-24.54 20.22z"
              fill="''' + getColor(1, color, colors, '#0F0F0F') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.star:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M700.12 867.75a66 66 0 0 1-30.75-7.65l-150-78.83a16 16 0 0 0-14.84 0l-149.9 78.83a66 66 0 0 1-95.69-69.52l28.64-167A15.93 15.93 0 0 0 283 609.5L161.68 491.25a66 66 0 0 1 36.55-112.49l167.65-24.36a16 16 0 0 0 12-8.72l75-151.92a66 66 0 0 1 118.28 0l75 151.92a16 16 0 0 0 12 8.72l167.65 24.36a66 66 0 0 1 36.55 112.49L741 609.5a15.93 15.93 0 0 0-4.59 14.11l28.64 167a66.09 66.09 0 0 1-64.94 77.17zM512 729.44a65.94 65.94 0 0 1 30.69 7.56l149.95 78.84A16 16 0 0 0 715.78 799l-28.64-167a66 66 0 0 1 19-58.37l121.28-118.19a16 16 0 0 0-8.84-27.2l-167.65-24.36a65.93 65.93 0 0 1-49.65-36.07l-75-151.92a15.95 15.95 0 0 0-28.6 0l-75 151.91a65.92 65.92 0 0 1-49.65 36.08l-167.61 24.36a16 16 0 0 0-8.84 27.2L317.9 573.69a66 66 0 0 1 19 58.37L308.22 799a16 16 0 0 0 23.14 16.81l150-78.84a65.94 65.94 0 0 1 30.64-7.53z"
              fill="''' + getColor(0, color, colors, '#0F0F0F') + '''"
            />
            <path
              d="M697.78 502.1a26.2 26.2 0 0 1-3.93-0.3l-86.61-13.68c-49.21-6.66-72.59-48.8-74.94-53.26l-31.5-60a25 25 0 1 1 44.26-23.26l31.51 60 0.12 0.23c1.11 2 13.45 23.61 37.42 26.76l0.64 0.1 86.9 13.72a25 25 0 0 1-3.87 49.69z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.bank_2:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M802.05 786.77H223.52a91.06 91.06 0 0 1-91-91V331.88a91.05 91.05 0 0 1 91-90.95h578.53a91.05 91.05 0 0 1 91 90.95v363.93a91.06 91.06 0 0 1-91 90.96zM223.52 290.93a41 41 0 0 0-41 40.95v363.93a41 41 0 0 0 41 41h578.53a41 41 0 0 0 41-41V331.88a41 41 0 0 0-41-40.95z"
              fill="''' + getColor(0, color, colors, '#0F0F0F') + '''"
            />
            <path
              d="M719.48 672.24H596.9a45.94 45.94 0 0 1-45.23-54l13-72.92a45.88 45.88 0 0 1 45.22-37.88h122.57a45.94 45.94 0 0 1 45.23 54l-13 72.92a45.88 45.88 0 0 1-45.21 37.88z m-117.73-50h114.32l11.54-64.79H613.28z m151.33-65.18z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
            <path
              d="M861.85 436.52H158a25 25 0 1 1 0-50h703.85a25 25 0 0 1 0 50z"
              fill="''' + getColor(2, color, colors, '#0F0F0F') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.message:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M516.37 747.88c-62.24 0-122.95-2.75-170.95-7.75-72.14-7.51-92.46-17.46-99.63-21.77-19.71-9.4-33.14-29.59-34.43-52-1.33-23.27 10.06-44.2 30.48-56l9.8-5.66a31.56 31.56 0 0 0 15.75-27.26V427a244.33 244.33 0 0 1 167.05-231.8 6.5 6.5 0 0 0 4.26-4 78.48 78.48 0 0 1 149.43-0.66 7.09 7.09 0 0 0 4.48 4.63A244.33 244.33 0 0 1 759.66 427v148.39a29.9 29.9 0 0 0 14.9 25.81l15.86 9.15c19.86 11.46 31.28 31.82 30.55 54.44a61.23 61.23 0 0 1-32 52.31c-10.17 6.6-32.39 15.67-99.47 22.8-48.37 5.15-109.86 7.98-173.13 7.98z m-2.85-561.44a28.37 28.37 0 0 0-27.15 19.87 56.6 56.6 0 0 1-36.14 36.33A194.32 194.32 0 0 0 317.39 427v150.43A81.69 81.69 0 0 1 276.64 648l-9.8 5.66a10.05 10.05 0 0 0-5.56 9.83c0.19 3.38 2 8 6.27 9.86a25.62 25.62 0 0 1 3.4 1.79c0.54 0.34 14 8.44 79.65 15.27 46.34 4.82 105.21 7.48 165.77 7.48s119.63-2.66 166-7.5c64.75-6.76 78.51-14.69 79.39-15.23a25.11 25.11 0 0 1 3.35-2c3.9-1.93 5.76-6.4 5.87-10a10.08 10.08 0 0 0-5.57-9.53l-15.86-9.15a80 80 0 0 1-39.9-69.11V427a194.34 194.34 0 0 0-132.84-184.36 57.38 57.38 0 0 1-36.21-36.57 28.41 28.41 0 0 0-27.08-19.63z"
              fill="''' + getColor(0, color, colors, '#0F0F0F') + '''"
            />
            <path
              d="M516.13 878.28c-52.42 0-96.39-27.66-106.92-67.27a25 25 0 1 1 48.32-12.85c5 18.85 33.73 30.12 58.6 30.12s53.59-11.27 58.6-30.12A25 25 0 1 1 623.05 811c-10.53 39.62-54.5 67.28-106.92 67.28z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.picture:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M824.78 798H199a94.33 94.33 0 0 1-94.22-94.22V321.21A94.32 94.32 0 0 1 199 227h625.78A94.32 94.32 0 0 1 919 321.21v382.55A94.33 94.33 0 0 1 824.78 798zM199 277a44.27 44.27 0 0 0-44.22 44.22v382.54A44.27 44.27 0 0 0 199 748h625.78A44.27 44.27 0 0 0 869 703.76V321.21A44.27 44.27 0 0 0 824.78 277z"
              fill="''' + getColor(0, color, colors, '#0F0F0F') + '''"
            />
            <path
              d="M381.15 407.85m-40.66 0a40.66 40.66 0 1 0 81.32 0 40.66 40.66 0 1 0-81.32 0Z"
              fill="''' + getColor(1, color, colors, '#0F0F0F') + '''"
            />
            <path
              d="M460 681.14c-38.38 0-62.06-25.25-68-32.4L327.91 584l-0.24-0.26c-11.24-11.66-21.73-17.35-31.17-16.9-11.09 0.52-20.86 9.75-23.84 13.43a16.68 16.68 0 0 1-1.36 1.62l-25.24 27.76a25 25 0 1 1-37-33.64l24.66-27.12c4.88-6 26.23-30 59.56-31.95 24.71-1.46 48.35 9.3 70.26 32l64.9 65.51a17.66 17.66 0 0 1 2 2.32c1.29 1.55 12.49 14.37 29.55 14.37 13.46 0 19.61-4.94 32.44-20.83l0.63-0.76 152.6-174.33c2.81-3.23 29.07-32.15 68.81-33.48 25.93-0.86 50.32 10 72.49 32.32 0.21 0.21 0.41 0.43 0.61 0.64l32.93 35.57a25 25 0 0 1-36.7 34L751.25 469c-11.78-11.75-23.48-17.57-34.76-17.3-18.24 0.44-32.65 15.89-33.23 16.52l-152.2 173.9C515 661.93 496.25 681.14 460 681.14z"
              fill="''' + getColor(2, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.setup:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M512.2 866.49a311.09 311.09 0 0 1-49-4 86.66 86.66 0 0 1-69.89-59.8c0-0.08-0.05-0.16-0.07-0.23A62.88 62.88 0 0 0 333 758.34h-0.2a66.09 66.09 0 0 0-13.93 1.5h-0.13a87.73 87.73 0 0 1-18.12 1.9 85.93 85.93 0 0 1-67.62-32.8l-0.15-0.19a359.13 359.13 0 0 1-48.46-83.82c-0.07-0.15-0.13-0.31-0.19-0.46a86.78 86.78 0 0 1 17-90.43 64.41 64.41 0 0 0 0-85.9 86.73 86.73 0 0 1-17-90.43l0.09-0.23A336.93 336.93 0 0 1 233 293.23l0.24-0.29A88.49 88.49 0 0 1 320 262.31l0.27 0.06a62.87 62.87 0 0 0 13.73 1.52 63.51 63.51 0 0 0 60.59-44.44 86.56 86.56 0 0 1 70-59.8l0.66-0.09a386 386 0 0 1 47.67-2.94 406 406 0 0 1 48.53 2.93l0.74 0.1a86.55 86.55 0 0 1 70 59.82 2.76 2.76 0 0 1 0.08 0.27 60.58 60.58 0 0 0 28.5 35.39l0.25 0.14a64.63 64.63 0 0 0 31.85 8.57 63 63 0 0 0 13.62-1.52l0.29-0.06a88.23 88.23 0 0 1 18.05-1.9 84.68 84.68 0 0 1 67.95 33.16l0.57 0.78a448.08 448.08 0 0 1 46.48 83.89l0.27 0.68a86.74 86.74 0 0 1-17 90.43 64.4 64.4 0 0 0 0 85.9 86.76 86.76 0 0 1 17 90.43 1.67 1.67 0 0 1-0.08 0.2 333.93 333.93 0 0 1-48.74 84.3l-0.12 0.16a87.23 87.23 0 0 1-67.85 32.63 82.37 82.37 0 0 1-18-1.95 63 63 0 0 0-13.72-1.52A63.65 63.65 0 0 0 631 803.92a86.63 86.63 0 0 1-70 59.79l-1.5 0.18c-14.28 1.28-31.04 2.6-47.3 2.6zM441 787.68a37 37 0 0 0 29.84 25.44h0.22a260.44 260.44 0 0 0 41.15 3.34c13.93 0 28.93-1.16 41.87-2.32a37 37 0 0 0 29.2-25.41 113.44 113.44 0 0 1 132.88-76.59 31.8 31.8 0 0 0 7 0.75 37.43 37.43 0 0 0 29-13.94 284.61 284.61 0 0 0 41.33-71.49 37.05 37.05 0 0 0-7.35-38.59c-0.07-0.08-0.14-0.15-0.2-0.23a114.35 114.35 0 0 1 0-152.84l0.2-0.23a37.05 37.05 0 0 0 7.43-38.38 398.24 398.24 0 0 0-40.82-73.7 34.47 34.47 0 0 0-27.46-13.16H725a39.28 39.28 0 0 0-7.69 0.79 112.92 112.92 0 0 1-24.38 2.69h-0.12a114.73 114.73 0 0 1-56.52-15.15 110.32 110.32 0 0 1-51.74-64.23A36.88 36.88 0 0 0 555 209.14a355.52 355.52 0 0 0-42.14-2.52 335.08 335.08 0 0 0-41.12 2.51 36.89 36.89 0 0 0-29.55 25.45 113.47 113.47 0 0 1-132.69 76.63 37.31 37.31 0 0 0-7.69-0.79 38.24 38.24 0 0 0-29.69 14 286.94 286.94 0 0 0-41.3 71.45 37.08 37.08 0 0 0 7.35 38.58l0.21 0.23a114.35 114.35 0 0 1 0 152.84l-0.2 0.22a37.06 37.06 0 0 0-7.39 38.49 308.83 308.83 0 0 0 41.5 71.77 36.21 36.21 0 0 0 28.4 13.75 37 37 0 0 0 7.65-0.81 116.07 116.07 0 0 1 24.35-2.62A112.5 112.5 0 0 1 441 787.68zM816.8 636.6z"
              fill="''' + getColor(0, color, colors, '#0F0F0F') + '''"
            />
            <path
              d="M512.16 654.4c-78.77 0-142.84-64.08-142.84-142.85s64.07-142.84 142.84-142.84S655 432.79 655 511.55 590.92 654.4 512.16 654.4z m0-235.69A92.85 92.85 0 1 0 605 511.55a92.94 92.94 0 0 0-92.84-92.84z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.file:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M672.66 674.45H272.3a25 25 0 1 1 0-50h400.36a25 25 0 1 1 0 50z"
              fill="''' + getColor(0, color, colors, '#144eee') + '''"
            />
            <path
              d="M793.54 791.64h-560a103.25 103.25 0 0 1-103.11-103.13V336.13A103.24 103.24 0 0 1 233.55 233h226.6A103.71 103.71 0 0 1 519 251.73a116.1 116.1 0 0 1 41.52 52.14l20.4 48.06c0.4 1 0.79 2 1.15 3 8.28 24 20.18 37.92 56.51 37.92h155A103.24 103.24 0 0 1 896.67 496v192.51a103.25 103.25 0 0 1-103.13 103.13zM233.55 283a53.18 53.18 0 0 0-53.12 53.13v352.38a53.19 53.19 0 0 0 53.12 53.13h560a53.19 53.19 0 0 0 53.13-53.13V496a53.18 53.18 0 0 0-53.13-53.12h-155c-53.18 0-87.12-23.4-103.75-71.53l-20.41-48.09-0.15-0.35C506.19 303 486.33 283 460.15 283z m301.33 88.45z m-0.09-0.21z"
              fill="''' + getColor(1, color, colors, '#0F0F0F') + '''"
            />
            <path
              d="M831.37 436.42a25 25 0 0 1-25-25v-89.56a17.32 17.32 0 0 0-17.3-17.3H519.25a25 25 0 0 1 0-50h269.82a67.38 67.38 0 0 1 67.3 67.3v89.56a25 25 0 0 1-25 25z"
              fill="''' + getColor(2, color, colors, '#0F0F0F') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.person_card:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M645.45 687.35c-29.68 0-63.49-1.26-89.33-10.61-15.15-5.49-27.09-13.56-35.47-24-9.62-12-14.5-26.68-14.5-43.75 0-38.48 24.93-73.41 66.67-93.43a25 25 0 0 1 21.62 45.09c-24 11.49-38.29 29.57-38.29 48.34 0 9.46 2.71 15.56 17 20.73 18.67 6.76 48.45 7.63 72.31 7.63s53.63-0.87 72.31-7.63c14.27-5.17 17-11.27 17-20.73 0-18.77-14.31-36.85-38.29-48.34a25 25 0 0 1 21.62-45.09c41.75 20 66.67 55 66.67 93.43 0 17.07-4.88 31.79-14.49 43.75-8.39 10.44-20.33 18.51-35.48 24-25.86 9.35-59.68 10.61-89.35 10.61z"
              fill="''' + getColor(0, color, colors, '#144eee') + '''"
            />
            <path
              d="M645.45 570.92c-51.58 0-93.54-45.74-93.54-102s42-102 93.54-102S739 412.74 739 469s-42 101.92-93.55 101.92z m0-153.92c-24 0-43.54 23.31-43.54 52s19.53 52 43.54 52S689 497.61 689 469s-19.55-52-43.55-52z"
              fill="''' + getColor(1, color, colors, '#144eee') + '''"
            />
            <path
              d="M804.5 795H222.76a91.05 91.05 0 0 1-90.95-91V349a91.05 91.05 0 0 1 90.95-91H804.5a91.05 91.05 0 0 1 91 90.95v355.1a91.05 91.05 0 0 1-91 90.95zM222.76 308a41 41 0 0 0-40.95 41v355.1a41 41 0 0 0 40.95 41H804.5a41 41 0 0 0 41-41V349a41 41 0 0 0-41-40.95z"
              fill="''' + getColor(2, color, colors, '#0F0F0F') + '''"
            />
            <path
              d="M439 449.11H287.91a25 25 0 1 1 0-50H439a25 25 0 0 1 0 50zM439 553.11H287.91a25 25 0 1 1 0-50H439a25 25 0 0 1 0 50zM439 657.11H287.91a25 25 0 1 1 0-50H439a25 25 0 1 1 0 50z"
              fill="''' + getColor(3, color, colors, '#0F0F0F') + '''"
            />
          </svg>
        ''';
        break;
      case IconNames.home:
        svgXml = '''
          <svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M870 484.09a24.9 24.9 0 0 1-14.52-4.66L529.4 246.28c-11.46-8.23-28.48-8.27-39.63-0.14l-0.19 0.14-326.06 233.15a25 25 0 1 1-29.08-40.68l326-233.08c28.73-20.88 69.06-20.9 98.12 0l326 233.11A25 25 0 0 1 870 484.09z"
              fill="''' + getColor(0, color, colors, '#0F0F0F') + '''"
            />
            <path
              d="M735.28 826.86H283.7a74.83 74.83 0 0 1-74.7-74.75l0.1-254.61a25 25 0 0 1 25-25 25 25 0 0 1 25 25l-0.1 254.6a24.77 24.77 0 0 0 24.75 24.74h451.53A24.77 24.77 0 0 0 760 752.11V497.53a25 25 0 0 1 50 0v254.58a74.83 74.83 0 0 1-74.72 74.75z"
              fill="''' + getColor(1, color, colors, '#0F0F0F') + '''"
            />
            <path
              d="M598.29 750.42a25 25 0 0 1-25-25V600.11a15 15 0 0 0-14.95-15h-97.7a15 15 0 0 0-15 15v125.31a25 25 0 0 1-50 0V600.11a65 65 0 0 1 65-65h97.7a65 65 0 0 1 64.95 65v125.31a25 25 0 0 1-25 25z"
              fill="''' + getColor(2, color, colors, '#0969DB') + '''"
            />
          </svg>
        ''';
        break;

    }

    return SvgPicture.string(svgXml, width: this.size, height: this.size);
  }
}
