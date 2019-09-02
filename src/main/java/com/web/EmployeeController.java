package com.web;

import com.dto.Result;
import com.entity.Employee;
import com.entity.PageBean;
import com.service.DepartmentService;
import com.service.EmployeeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class EmployeeController {

    final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private DepartmentService departmentService;

    /**
     * 登录验证
     * @param session
     * @param employee
     * @return
     */
    @RequestMapping("/login")
    @ResponseBody
    public Result login(HttpSession session, Employee employee){
        Result rs = new Result();
        employee  = employeeService.queryByPassword(employee.getUsername(),employee.getPassword());
//        logger.info("登录用户信息："+employee.toString());
        if (employee==null){
            rs.setSuccess(false);
        }else {
            session.setAttribute("loginEmpl", employee);
            rs.setSuccess(true);
        }

        return rs;
    }

    @RequestMapping("index")
    public String goIndex(){
        return "pages/index";
    }

    @RequestMapping("logout")
    public String logout(HttpSession session){
        session.setAttribute("loginEmpl",null);
        return "pages/login";
    }

    /**
     * 获取用户列表
     * @param model
     * @param session
     * @param currPage
     * @return
     */
    @RequestMapping("/emplList")
    public String list(Model model,HttpSession session,Integer currPage){
        PageBean pageBean = employeeService.queryByPage(currPage);
        session.setAttribute("emplList", pageBean);
        model.addAttribute("model", "testtesttesttest");
//        logger.debug("用户列表："+pageBean.getList().get(1).toString());
        return "pages/EmplList";
    }

    /**
     * 获取全部物资
     * @param session
     * @return
     */
    @RequestMapping("/depaList")
    public String depalist(HttpSession session){

        List list = departmentService.queryAll();
        session.setAttribute("departList", list);
//        logger.debug("用户列表："+pageBean.getList().get(1).toString());
        return "pages/DepaList";
    }

    /**
     * 用户信息修改
     * @param employee
     * @param session
     * @return
     */
    @RequestMapping("emplEdit")
    public String toedit(Employee employee,HttpSession session){
        System.out.println("页面保存："+employee.toString());
        Employee e = (Employee) session.getAttribute("loginEmpl");
        System.out.println("修改前信息："+e.toString());
        e.setBirthday(employee.getBirthday());
        e.setEname(employee.getEname());
        e.setSex(employee.getSex());
        e.setPassword(employee.getPassword());
        System.out.println("修改后信息："+e.toString());

        int update = employeeService.update(e);
        return "redirect:jsp/pages/EmplEdit.jsp";
    }

    /**
     * 新用户注册
     * @param employee
     * @return
     */
    @RequestMapping("add")
    @ResponseBody
    public Result add(Employee employee){
        Result result = new Result();
        if (employeeService.add(employee)==1){
            result.setSuccess(true);
            result.setError("注册成功");
        }else {
            result.setSuccess(false);
            result.setError("系统故障，请联系管理员");
        }
        return result;
    }

    /**
     * 删除用户
     * @param eid
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(int eid){
        Result result = new Result();
        int i = employeeService.deleteEmpl(eid);

        if (i==1){
            result.setSuccess(true);
            result.setError("已删除");
        }else {
            result.setSuccess(false);
            result.setError("系统异常，删除失败，请重试");
        }
        return result;
    }

    /**
     * 查询用户黑名单
     * @param session
     * @return
     */
    @RequestMapping("/queryBlack")
    public String queryBlack(HttpSession session){
        List list = employeeService.queryBlack();
        session.setAttribute("black",list);
        return "pages/Emplblack";
    }
}
