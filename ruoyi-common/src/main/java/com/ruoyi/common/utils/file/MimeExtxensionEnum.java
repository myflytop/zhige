package com.ruoyi.common.utils.file;

import java.util.ArrayList;
import java.util.List;

public enum MimeExtxensionEnum {
  IMAGE(new String[] { "bmp", "gif", "jpg", "jpeg", "png" }),
  MUSIC(new String[] { "swf", "flv", "mp3", "wav", "wma", "wmv", "mid", "avi", "mpg", "asf", "rm", "rmvb" }),
  VIDEO(new String[] { "mp4", "avi", "rmvb" }),
  DOCUMENT(new String[] { "doc", "docx", "xls", "xlsx", "ppt", "pptx", "html", "htm", "txt", "pdf" }),
  COMPRESS(new String[] { "rar", "zip", "gz", "bz2" });

  private String[] type;

  /**
   * @return the type
   */
  public String[] getType() {
    return type;
  }

  MimeExtxensionEnum(String[] type) {
    this.type = type;
  }

  public static List<String> getExtensions() {
    List<String> exs = new ArrayList<String>();
    for (MimeExtxensionEnum iter : MimeExtxensionEnum.values()) {
      exs.add(iter.name().toLowerCase());
    }
    return exs;
  }

}
