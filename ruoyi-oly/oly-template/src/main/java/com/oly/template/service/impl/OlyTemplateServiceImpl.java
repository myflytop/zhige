package com.oly.template.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.oly.template.domain.OlyTemplate;
import com.oly.template.mapper.OlyTemplateMapper;
import com.oly.template.service.IOlyTemplateService;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.enums.OlyStageRoot;
import com.ruoyi.common.utils.DateUtils;

import org.apache.tika.Tika;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.templateresolver.StringTemplateResolver;

/**
 * 模板模型Service业务层处理
 * 
 * @author 止戈
 * @date 2020-12-20
 */
@Service
public class OlyTemplateServiceImpl implements IOlyTemplateService {
    @Autowired
    private OlyTemplateMapper olyTemplateMapper;

    private TemplateEngine templateEngine;

    public OlyTemplateServiceImpl() {
        templateEngine = new TemplateEngine();
        StringTemplateResolver stringTemplateResolver = new StringTemplateResolver();
        templateEngine.addTemplateResolver(stringTemplateResolver);
    }

    /**
     * 查询模板模型
     * 
     * @param templateId 模板模型ID
     * @return 模板模型
     */
    @Override
    public OlyTemplate selectOlyTemplateById(Long templateId) {
        return olyTemplateMapper.selectOlyTemplateById(templateId);
    }

    /**
     * 查询模板模型列表
     * 
     * @param olyTemplate 模板模型
     * @return 模板模型
     */
    @Override
    public List<OlyTemplate> selectOlyTemplateList(OlyTemplate olyTemplate) {
        return olyTemplateMapper.selectOlyTemplateList(olyTemplate);
    }

    /**
     * 新增模板模型
     * 
     * @param olyTemplate 模板模型
     * @return 结果
     */
    @Override
    public int insertOlyTemplate(OlyTemplate olyTemplate) {
        olyTemplate.setCreateTime(DateUtils.getNowDate());
        return olyTemplateMapper.insertOlyTemplate(olyTemplate);
    }

    /**
     * 修改模板模型
     * 
     * @param olyTemplate 模板模型
     * @return 结果
     */
    @Override
    public int updateOlyTemplate(OlyTemplate olyTemplate) {
        olyTemplate.setUpdateTime(DateUtils.getNowDate());
        return olyTemplateMapper.updateOlyTemplate(olyTemplate);
    }

    /**
     * 删除模板模型对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteOlyTemplateByIds(String ids) {
        return olyTemplateMapper.deleteOlyTemplateByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除模板模型信息
     * 
     * @param templateId 模板模型ID
     * @return 结果
     */
    @Override
    public int deleteOlyTemplateById(Long templateId) {
        return olyTemplateMapper.deleteOlyTemplateById(templateId);
    }

    @Override
    public TemplateEngine getTemplateEngine() {
        return templateEngine;
    }

    /**
     * 查询模板模型树列表
     * 
     * @return 所有模板模型信息
     */
    @Override
    public List<Ztree> selectOlyTemplateTree(int olType) {
        OlyTemplate oly = new OlyTemplate();
        oly.setTemplateType(olType);
        List<OlyTemplate> olyTemplateList = olyTemplateMapper.selectOlyTemplateList(oly);
        List<Ztree> ztrees = new ArrayList<Ztree>();
        if (olyTemplateList == null || olyTemplateList.size() == 0) {
            Ztree ztree = new Ztree();
            ztree.setId(0L);
            ztree.setpId(0L);
            ztree.setName("根目录");
            ztree.setTitle("根目录");
            ztrees.add(ztree);

        } else {
            for (OlyTemplate olyTemplate : olyTemplateList) {
                Ztree ztree = new Ztree();
                ztree.setId(olyTemplate.getTemplateId());
                ztree.setpId(olyTemplate.getParentId());
                ztree.setName(olyTemplate.getTemplateName());
                ztree.setTitle(olyTemplate.getTemplateName());
                ztrees.add(ztree);
            }
        }
        return ztrees;
    }

    @Override
    public void getTemolateContent(String tUrl,HttpServletResponse response) {
      File inFile=Paths.get(RuoYiConfig.getWorkPath(), OlyStageRoot.TEMPLATE_DIR.getDir(),tUrl).toFile();
  // 判断文件是否存在
  if (!inFile.exists()) {
      PrintWriter writer = null;
      try {
          response.setContentType("text/html;charset=UTF-8");
          writer = response.getWriter();
          writer.write(
                  "<!doctype html><title>404 Not Found</title><h1 style=\"text-align: center\">404 Not Found</h1><hr/><p style=\"text-align: center\">Easy File Server</p>");
          writer.flush();
      } catch (IOException e) {
          e.printStackTrace();
      }
      return;
  }
  // 获取文件类型
  String contentType = null;
  try {
      // Path path = Paths.get(inFile.getName());
      // contentType = Files.probeContentType(path);
      contentType = new Tika().detect(inFile);
  } catch (IOException e) {
      e.printStackTrace();
  }
  if (contentType != null) {
      response.setContentType(contentType);
  } else {
      response.setContentType("application/force-download");
      String newName;
      try {
          newName = URLEncoder.encode(inFile.getName(), "utf-8");
      } catch (UnsupportedEncodingException e) {
          e.printStackTrace();
          newName = inFile.getName();
      }
      response.setHeader("Content-Disposition", "attachment;fileName=" + newName);
  }
  // 输出文件流
  OutputStream os = null;
  FileInputStream is = null;
  try {
      is = new FileInputStream(inFile);
      os = response.getOutputStream();
      byte[] bytes = new byte[1024];
      int len;
      while ((len = is.read(bytes)) != -1) {
          os.write(bytes, 0, len);
      }
      os.flush();
  } catch (FileNotFoundException e) {
      e.printStackTrace();
  } catch (IOException e) {
      e.printStackTrace();
  } finally {
      try {
          is.close();
          os.close();
      } catch (IOException e) {
          e.printStackTrace();
      }
  }
}

    @Override
    public int countTemplate(Long templateId) {
      
        return olyTemplateMapper.countTemplate(templateId);
    }
}
