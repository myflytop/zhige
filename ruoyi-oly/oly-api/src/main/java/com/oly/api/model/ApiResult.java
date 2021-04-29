package com.oly.api.model;
import java.util.HashMap;

import com.ruoyi.common.utils.StringUtils;
public class ApiResult extends HashMap<String, Object>
    {
        
        private static final long serialVersionUID = 1L;
    
        /** 状态码 */
        public static final String CODE_TAG = "code";
    
        /** 返回内容 */
        public static final String CACHE_TAG = "cache";
    
        /** 数据对象 */
        public static final String DATA_TAG = "data";
    
        /**
         * 状态类型
         */
        public enum Type
        {
            /** 成功 */
            SUCCESS(0),
            /** 警告 */
            WARN(301),
            /** 错误 */
            ERROR(500);
            private final int value;
    
            Type(int value)
            {
                this.value = value;
            }
    
            public int value()
            {
                return this.value;
            }
        }
    
        /**
         * 初始化一个新创建的 ApiResult 对象，使其表示一个空消息。
         */
        public ApiResult()
        {
        }
    
        /**
         * 初始化一个新创建的 ApiResult 对象
         *
         * @param type 状态类型
         * @param cache 返回内容
         */
        public ApiResult(Type type,Boolean cache)
        {
            super.put(CODE_TAG, type.value);
            super.put(CACHE_TAG, cache);
        }
    
        /**
         * 初始化一个新创建的 ApiResult 对象
         *
         * @param type 状态类型
         * @param cache 返回内容
         * @param data 数据对象
         */
        public ApiResult(Type type,Boolean cache, Object data)
        {
            super.put(CODE_TAG, type.value);
            super.put(CACHE_TAG, cache);
            if (StringUtils.isNotNull(data))
            {
                super.put(DATA_TAG, data);
            }
        }
    
        /**
         * 方便链式调用
         *
         * @param key 键
         * @param value 值
         * @return 数据对象
         */
        @Override
        public ApiResult put(String key, Object value)
        {
            super.put(key, value);
            return this;
        }
    
        /**
         * 返回成功消息
         *
         * @return 成功消息
         */
        public static ApiResult success()
        {
            return ApiResult.success("操作成功");
        }
    
        /**
         * 返回成功数据
         *
         * @return 成功消息
         */
        public static ApiResult success(Object data)
        {
            return ApiResult.success(data);
        }
    
        /**
         * 返回成功消息
         *
         * @param cache 返回内容
         * @return 成功消息
         */
        public static ApiResult success(Boolean cache)
        {
            return ApiResult.success(cache, null);
        }
    
        /**
         * 返回成功消息
         *
         * @param cache 返回内容
         * @param data 数据对象
         * @return 成功消息
         */
        public static ApiResult success(Boolean cache, Object data)
        {
            return new ApiResult(Type.SUCCESS, cache, data);
        }
    
        /**
         * 返回警告消息
         *
         * @param cache 返回内容
         * @return 警告消息
         */
        public static ApiResult warn(Boolean cache)
        {
            return ApiResult.warn(cache, null);
        }
    
        /**
         * 返回警告消息
         *
         * @param cache 返回内容
         * @param data 数据对象
         * @return 警告消息
         */
        public static ApiResult warn(Boolean cache, Object data)
        {
            return new ApiResult(Type.WARN, cache, data);
        }
    
        /**
         * 返回错误消息
         *
         * @return
         */
        public static ApiResult error()
        {
            return ApiResult.error();
        }
    
        /**
         * 返回错误消息
         *
         * @param cache 返回内容
         * @return 警告消息
         */
        public static ApiResult error(Boolean cache)
        {
            return ApiResult.error(cache, null);
        }
    
        /**
         * 返回错误消息
         *
         * @param cache 返回内容
         * @param data 数据对象
         * @return 警告消息
         */
        public static ApiResult error(Boolean cache, Object data)
        {
            return new ApiResult(Type.ERROR, cache, data);
        }
}
