package com.ruoyi.cms.system.service.impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.ruoyi.cache.redis.util.RedisUtils;
import com.ruoyi.cms.common.constant.CmsSystemConstant;
import com.ruoyi.cms.common.enums.ThemeEnums;
import com.ruoyi.cms.common.mould.support.OperateStatus;
import com.ruoyi.cms.system.utils.CmsUtils;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ruoyi.cms.system.mapper.CmsThemeMapper;
import com.ruoyi.cms.system.model.po.CmsTheme;
import com.ruoyi.cms.system.service.ICmsThemeService;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.ZipUtil;

@Service
public class CmsThemeServiceImpl implements ICmsThemeService {

	@Autowired
	private CmsThemeMapper themeMapper;

	@Autowired
	private RedisUtils redisUtils;

	/**
	 * 删除主题
	 * @param themeName
	 * @return
	 * @throws FileNotFoundException
	 */
	@Override
	public int deleteByName(String themeName) throws FileNotFoundException {
			if(CmsUtils.deleteThemeFile(themeName))
			{
				themeMapper.deleteByName(themeName);
				return 1;
			}
			return 0;	
	}

	/**
	 * 插入主题
	 * @param theme
	 * @return
	 */
	@Override
	public int insert(CmsTheme theme) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 有选择插入主题
	 * @param theme
	 * @return
	 */
	@Override
	public int insertSelective(CmsTheme theme) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 根据主题ID查询 主题
	 * @param themeId
	 * @return
	 */
	@Override
	public CmsTheme selectById(Integer themeId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CmsTheme selectThemeByUsed() {
		return themeMapper.selectThemeByUsed();
	}

	/**
     * 更新主题
     * @param theme
     * @return
     */
	@Override
	public int updateById(CmsTheme theme) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 上传主题
	 * @param file 文件
	 * @param themePath 主题路径
	 * @return
	 * @throws Throwable
	 * @throws IOException
	 */
	@Override
	public OperateStatus uploadTheme(MultipartFile file, File themePath) throws Throwable, IOException {
		// 上传
		file.transferTo(themePath);
		// 解压到当前目录
		ZipUtil.unzip(themePath, new File(themePath.getParent()));
		// 删除压缩文件
		FileUtil.del(themePath);
		// 读取配置主题文件
		String fileName = file.getOriginalFilename() ;
		String filePrefix=fileName.substring(0, fileName.lastIndexOf("."));

		File themeJson=new File(themePath.getParent() + "/" + filePrefix+ "/theme.json");
		if (themeJson.exists()&&!themeJson.isDirectory()) {
			//用于读取json
			ObjectMapper mapper = new ObjectMapper();
			// 读取主题说明 将配置文件转换为CmsTheme
			CmsTheme theme = mapper.readValue(
					themeJson,
					CmsTheme.class);
			//默认不开启
			theme.setThemeEnabled((byte) 0);
			//插入数据库上传主题
			themeMapper.insertSelective(theme);
			//设置主题名字
			theme.setThemeName(filePrefix);
			return OperateStatus.ok(theme);
		}
		return OperateStatus.fail();
	}

	/**
	 * 获取主题列表
	 * @return
	 */
	@Override
	public Map<String, CmsTheme> listThemes() {
		List<CmsTheme> themeList=themeMapper.listThemes();
		Map<String, CmsTheme> themeMap =themeList.stream().collect(Collectors.toMap(CmsTheme::getThemeName,a -> a,(k1,k2)->k1));
		return themeMap;
	}

	@Override
	public String getUseTheme(){
		Object ob=redisUtils.get(ThemeEnums.THEME_USED.getValue());
		if(ob==null)
		{  String u = null;
			try {
				//获取启用的主题
			 u=themeMapper.selectThemeByUsed().getThemeName();
			}
			catch (Exception e)
			{
				u=ThemeEnums.DEFAULT_THEME.getValue();
				this.setTheme(u);
			}
			return u;
		}
		else {
			return ob.toString();
		}

	}

	@Override
	public List<String> listThemeName() {
		return themeMapper.listThemeName();
	}

	/**
	 * 设置更新主题
	 * @param themeName
	 * @return
	 * @throws FileNotFoundException
	 */
    @Transactional
    @Override
	public int setTheme(String themeName)  {
        //获取启用的主题
		Object ob=redisUtils.get(ThemeEnums.THEME_USED.getValue());
		String oldThemeName=ob==null?null:ob.toString();
		if(StringUtils.isEmpty(oldThemeName))
		{
		CmsTheme cmsTheme=themeMapper.selectThemeByUsed();
		oldThemeName=cmsTheme==null?"":cmsTheme.getThemeName();
		}
		//更新数据库
		int ih=themeMapper.updateThemeEnable(oldThemeName==null?"":oldThemeName,themeName);
		//不存在主题,使用默认主题
		if(ih==0)
		{
			redisUtils.set(ThemeEnums.THEME_USED.getValue(),ThemeEnums.DEFAULT_THEME.getValue());
			return themeMapper.updateThemeEnable("",ThemeEnums.DEFAULT_THEME.getValue());
		}
		redisUtils.set(ThemeEnums.THEME_USED.getValue(),themeName);
		return ih;
	}




}
