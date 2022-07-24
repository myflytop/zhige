package com.ruoyi.common.utils;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.HanyuPinyinVCharType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

public class PinYinUtils {
  /**
   * 获得汉语拼音首字母
   *
   * @param chines 汉字
   * @return
   */
  public static String getAlpha(String chines) {
    String pinyinName = "";
    char[] nameChar = chines.toCharArray();
    HanyuPinyinOutputFormat defaultFormat = new HanyuPinyinOutputFormat();
    defaultFormat.setCaseType(HanyuPinyinCaseType.UPPERCASE);
    defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
    for (int i = 0; i < nameChar.length; i++) {
      if (nameChar[i] > 128) {
        try {
          pinyinName += PinyinHelper.toHanyuPinyinStringArray(nameChar[i], defaultFormat)[0].charAt(0);
        } catch (BadHanyuPinyinOutputFormatCombination e) {

        }
      } else {
        pinyinName += nameChar[i];
      }
    }
    return pinyinName;
  }

  /**
   * 将字符串中的中文转化为拼音,英文字符不变
   *
   * @param inputString 汉字
   * @return
   */
  public static String getPingYin(String inputString) {
    HanyuPinyinOutputFormat format = new HanyuPinyinOutputFormat();
    format.setCaseType(HanyuPinyinCaseType.LOWERCASE);
    format.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
    format.setVCharType(HanyuPinyinVCharType.WITH_V);
    String output = "";
    if (inputString != null && inputString.length() > 0 && !"null".equals(inputString)) {
      char[] input = inputString.trim().toCharArray();
      try {
        for (int i = 0; i < input.length; i++) {
          if (java.lang.Character.toString(input[i]).matches("[\\u4E00-\\u9FA5]+")) {
            String[] temp = PinyinHelper.toHanyuPinyinStringArray(input[i], format);
            output += temp[0];
          } else
            output += java.lang.Character.toString(input[i]);
        }
      } catch (BadHanyuPinyinOutputFormatCombination e) {

      }
    } else {
      return "*";
    }
    return output;
  }

  /**
   * 汉字转换为汉语拼音首字母，英文字符不变
   *
   * @param chines 汉字
   * @return 拼音
   */
  public static String converterToFirstSpell(String chines) {
    String pinyinName = "";
    char[] nameChar = chines.toCharArray();
    HanyuPinyinOutputFormat defaultFormat = new HanyuPinyinOutputFormat();
    defaultFormat.setCaseType(HanyuPinyinCaseType.UPPERCASE);
    defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
    for (int i = 0; i < nameChar.length; i++) {
      if (nameChar[i] > 128) {
        try {
          pinyinName += PinyinHelper.toHanyuPinyinStringArray(nameChar[i], defaultFormat)[0].charAt(0);
        } catch (BadHanyuPinyinOutputFormatCombination e) {
          pinyinName += "*";
        }
      } else {
        pinyinName += nameChar[i];
      }
    }
    return pinyinName;
  }

}