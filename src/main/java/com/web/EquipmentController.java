package com.web;

import com.dto.Result;
import com.entity.Description;
import com.entity.Equipment;
import com.entity.PageBean;
import com.service.DescriptionService;
import com.service.EquipOutService;
import com.service.EquipmentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class EquipmentController {

    static final Logger log = LoggerFactory.getLogger(EquipmentController.class);

    @Autowired
    private EquipmentService equipmentService;
    @Autowired
    private DescriptionService descriptionService;
    @Autowired
    private EquipOutService equipOutService;

//    private int currPage = 1;
//
//    public void setCurrPage(int currPage) {
//        this.currPage = currPage;
//    }

    @RequestMapping("equipList")
    public String list(HttpSession session,Integer currPage){
        //分页查询
//        PageBean list = equipmentService.queryByPage(currPage);
        //全查
        List<Equipment> list = equipmentService.queryByPage2();
        session.setAttribute("equipList",list);
        return "pages/EquiList";
    }

    @RequestMapping("queryById")
    @ResponseBody
    public Result queryById(HttpSession session,int id){
        Result rs = new Result();
        log.info("需要修改的物资编号为："+id);
        Equipment equip = equipmentService.queryById(id);
        List<Description> list = descriptionService.findAll();
        session.setAttribute("equip", equip);
        session.setAttribute("description",list);
        log.info("修改物资信息："+equip.toString());
        log.info("物资种类信息："+list.toString());
        rs.setSuccess(true);
        return rs;
    }

    @RequestMapping("toInsert")
    public String toInsert(HttpSession session){
        List<Description> list = descriptionService.findAll();
        session.setAttribute("description",list);
        log.info("物资种类信息："+list.toString());
        return "pages/EquiAdd";
    }


    @RequestMapping("/descList")
    public String descList(Model model){
        List<Description> list = descriptionService.findAll();
        model.addAttribute("description",list);
        return "pages/DescList";
    }

    @RequestMapping("insertEqui")
    @ResponseBody
    public Result insertEqui(Equipment equipment){
        Result result = new Result();
        log.debug("新增物资信息："+equipment.getEquiName()+equipment.getEndDate());
        if (equipmentService.add(equipment)!=0){
            result.setSuccess(true);
            result.setError("新增成功！");
        }

        return result;
    }

    @RequestMapping("loglist")
    public String equipLog(HttpSession session,String username){
        System.out.println("查询"+username+"的领取记录");
        List list = equipOutService.queryByuser(username);
        session.setAttribute("equiplog",list);
        return "pages/logList";
    }

    @RequestMapping("backEquip")
    @ResponseBody
    public Result backEquip(int id,int equipId,int equipNum){
        Result rs = new Result();
        if (equipmentService.backEquip(equipId,equipNum)){
            equipOutService.backEqui(id);
            rs.setSuccess(true);
            rs.setData("归还成功");
        }else {
            rs.setSuccess(false);
            rs.setData("归还失败！！");
        }
        return rs;
    }

    @RequestMapping("/descSave")
    public String saveDesc(Model model,Description description){
        descriptionService.add(description);
        return descList(model);
    }

    @RequestMapping("deleteEquip")
    public String delete(@RequestParam("id") int id, HttpSession session){
        equipmentService.delete(id);
        List<Equipment> list = equipmentService.queryByPage2();
        session.setAttribute("equipList",list);
        return "pages/EquiList";
    }

    @RequestMapping("deleteDesc")
    public String deletedesc(@RequestParam("descid") int descid, Model model){
        descriptionService.delete(descid);
        List<Description> list = descriptionService.findAll();
        model.addAttribute("description",list);
        return "pages/DescList";
    }

    @RequestMapping("/Equiupdate")
    public String saveEqui(HttpSession session,Equipment equipment){
        equipmentService.update(equipment);
        return list(session,1);
    }


//    @InitBinder
//    protected void init(HttpServletRequest request, ServletRequestDataBinder binder) {
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
//        dateFormat.setLenient(false);
//        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
//    }


}
