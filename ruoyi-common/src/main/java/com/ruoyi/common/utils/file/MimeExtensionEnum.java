package com.ruoyi.common.utils.file;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public enum MimeExtensionEnum {
  IMAGE(new String[] { "bmp", "gif", "jpg", "jpeg", "png" }, "图片"),
  MUSIC(new String[] { "swf", "flv", "mp3", "wav", "wma", "wmv", "mid", "avi", "mpg", "asf", "rm", "rmvb" }, "音乐"),
  VIDEO(new String[] { "mp4", "avi", "rmvb" }, "视频"),
  DOCUMENT(new String[] { "doc", "docx", "xls", "xlsx", "ppt", "pptx", "html", "htm", "txt", "pdf" }, "文档"),
  COMPRESS(new String[] { "rar", "zip", "gz", "bz2" }, "压缩");

  private String[] type;
  private String value;

  /**
   * @return the type
   */
  public String[] getType() {
    return type;
  }

  /**
   * @return the value
   */
  public String getValue() {
    return value;
  }

  MimeExtensionEnum(String[] type, String value) {
    this.type = type;
    this.value = value;
  }

  public static List<String> getExtensions() {
    List<String> exs = new ArrayList<String>();
    for (MimeExtensionEnum iter : MimeExtensionEnum.values()) {
      exs.add(iter.name().toLowerCase());
    }
    return exs;
  }

  public static Map<String, String> getTv() {
    Map<String, String> ex = new HashMap<>();
    for (MimeExtensionEnum iter : MimeExtensionEnum.values()) {
      ex.put(iter.name().toLowerCase(), iter.getValue());
    }
    return ex;
  }

}
