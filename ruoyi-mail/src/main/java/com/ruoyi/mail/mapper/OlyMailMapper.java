package com.ruoyi.mail.mapper;

import java.util.List;
import com.ruoyi.mail.domain.OlyMail;

/**
 * 邮件Mapper接口
 * 
 * @author hush
 * @date 2021-03-06
 */
public interface OlyMailMapper {
    /**
     * 查询邮件
     * 
     * @param mailId 邮件ID
     * @return 邮件
     */
    public OlyMail selectOlyMailById(Long mailId);

    /**
     * 查询邮件列表
     * 
     * @param olyMail 邮件
     * @return 邮件集合
     */
    public List<OlyMail> selectOlyMailList(OlyMail olyMail);

    /**
     * 新增邮件
     * 
     * @param olyMail 邮件
     * @return 结果
     */
    public int insertOlyMail(OlyMail olyMail);

    /**
     * 修改邮件
     * 
     * @param olyMail 邮件
     * @return 结果
     */
    public int updateOlyMail(OlyMail olyMail);

    /**
     * 删除邮件
     * 
     * @param mailId 邮件ID
     * @return 结果
     */
    public int deleteOlyMailById(Long mailId);

    /**
     * 批量删除邮件
     * 
     * @param mailIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteOlyMailByIds(String[] mailIds);
}
