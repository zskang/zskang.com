package com.framework.controller;

import com.framework.entity.SysLogEntity;
import com.framework.service.SysLogService;
import com.framework.utils.DateUtil;
import com.framework.utils.R;
import com.framework.utils.ShiroUtils;
import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.MDC;
import org.apache.shiro.authc.*;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Date;

/**
 * 登录相关
 */
@Controller
public class SysLoginController {
    @Autowired
    private Producer producer;
    protected Logger logger = LoggerFactory.getLogger(getClass());

    /**
     * 处理验证码
     */
    @RequestMapping("captcha.jpg")
    public void captcha(HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-store, no-cache");
        response.setContentType("image/jpeg");

        // 生成文字验证码
        String text = producer.createText().substring(0, 4);
        // 生成图片验证码
        BufferedImage image = producer.createImage(text);
        // 保存到shiro session
        ShiroUtils.setSessionAttribute(Constants.KAPTCHA_SESSION_KEY, text);

        ServletOutputStream out = response.getOutputStream();
        ImageIO.write(image, "jpg", out);
    }

    @Autowired
    private SysLogService sysLogService;

    /**
     * 登录
     */
    @ResponseBody
    @RequestMapping(value = "/sys/login", method = RequestMethod.POST)
    public R login(String username, String password, String captcha, HttpServletRequest request) throws IOException {
        String kaptcha = ShiroUtils.getKaptcha(Constants.KAPTCHA_SESSION_KEY);
        if (!captcha.equalsIgnoreCase(kaptcha)) {
            return R.error("验证码不正确");
        }
        try {
            Subject subject = ShiroUtils.getSubject();
            // sha256加密
            password = new Sha256Hash(password).toHex();
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
            subject.login(token);
            MDC.put("operateModuleName", "用户登陆");
            MDC.put("operateType", "登陆系统");
            MDC.put("clientIp", getIp2(request));
            logger.info("登陆成功了.........");
            //MDC.put("operateContent",user.getUsername()+"登陆成功");
            SysLogEntity logEntity = new SysLogEntity();
            logEntity.setClientip(getIp2(request));
            logEntity.setOperatecontent("系统登陆:" + DateUtil.formatDateYYYY_MM_DD_HH_MM_SS(new Date()));
            logEntity.setOperatemodule("系统登陆");
            logEntity.setOperatetype("登陆");
            logEntity.setOperateresult("登陆成功");
            logEntity.setUsername(username);
            sysLogService.save(logEntity);
        } catch (UnknownAccountException e) {
            return R.error(e.getMessage());
        } catch (IncorrectCredentialsException e) {
            return R.error(e.getMessage());
        } catch (LockedAccountException e) {
            return R.error(e.getMessage());
        } catch (AuthenticationException e) {
            return R.error("账户验证失败");
        }

        return R.ok();
    }

    public static String getIp2(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if (StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)) {
            //多次反向代理后会有多个ip值，第一个ip才是真实ip
            int index = ip.indexOf(",");
            if (index != -1) {
                return ip.substring(0, index);
            } else {
                return ip;
            }
        }
        ip = request.getHeader("X-Real-IP");
        if (StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)) {
            return ip;
        }
        return request.getRemoteAddr();
    }

    /**
     * 退出
     */
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request) {
        ShiroUtils.logout();
        return "redirect:login.html";
    }
}
