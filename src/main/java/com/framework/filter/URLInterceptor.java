package com.framework.filter;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zskang on 2017/7/3.
 */

public class URLInterceptor implements HandlerInterceptor {
    private static List<String> execUrl = new ArrayList<String>();
    static{
        execUrl.add("/open");//对外公开
    }
    /**
     * 在业务处理器处理之前调用
     * 如果返回false
     *    则从当前的处理器往回执行afterCompletion(),再退出拦截连
     * 如果返回true
     *    执行下一个拦截器，知道所有拦截器你执行完毕
     *    在执行业务处理器Controller
     *    然后进入拦截器链
     *    从最后一个拦截器往回执行所有的postHandle()
     *    接着再从最后一个拦截器往回执行所有的afterCompletion()
     */
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object object) throws Exception {
        String requestUrl = request.getRequestURI().replace(request.getRequestURI().substring(0, request.getRequestURI().indexOf(request.getContextPath())+request.getContextPath().length()), "");

        if(requestUrl.startsWith("/")){
            if(!ifInExecRes(execUrl,requestUrl)){

            }
        }
        return true;
    }
    /**
     * 判断请求的连接是否在访问控制连接的例外情况之内
     * @param resUrls
     * @param reqUrl
     * @return
     */
    public boolean ifInExecRes(List<String> resUrls,String reqUrl){
        boolean result = false;
        for(String url : resUrls){
            if(reqUrl.startsWith(url)){
                result = true;
                break;
            }
        }
        return result;
    }
    /**
     * 在业务处理器处理完成之后执行
     * 在生成视图操作之前执行
     */
    public void postHandle(HttpServletRequest request, HttpServletResponse response,
                           Object object, ModelAndView mav) throws Exception {
    }
    /**
     * 在DispatcherServlet完全处理完请求后调用
     *    如果发生异常，则会从当前的拦截器往回执行所有的afterCompletion
     */
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object object, Exception exception)
            throws Exception {
    }

}