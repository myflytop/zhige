package com.ruoyi.message.mail.mapper;

import com.ruoyi.message.mail.domain.MsgEmail;

import java.util.List;

/**
 * 邮件记录Mapper接口
 * 
 * @author ruoyi
 * @date 2020-03-17
 */
public interface MsgEmailMapper 
{
    /**
     * 查询邮件记录
     * 
     * @param mailId 邮件记录ID
     * @return 邮件记录
     */
    public MsgEmail selectMsgEmailById(Long mailId);

    /**
     * 查询邮件记录列表
     * 
     * @param msgEmail 邮件记录
     * @return 邮件记录集合
     */
    public List<MsgEmail> selectMsgEmailList(MsgEmail msgEmail);

    /**
     * 新增邮件记录
     * 
     * @param msgEmail 邮件记录
     * @return 结果
     */
    public int insertMsgEmail(MsgEmail msgEmail);

    /**
     * 修改邮件记录
     * 
     * @param msgEmail 邮件记录
     * @return 结果
     */
    public int updateMsgEmail(MsgEmail msgEmail);

    /**
     * 删除邮件记录
     * 
     * @param mailId 邮件记录ID
     * @return 结果
     */
    public int deleteMsgEmailById(Long mailId);

    /**
     * 批量删除邮件记录
     * 
     * @param mailIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteMsgEmailByIds(String[] mailIds);
}
