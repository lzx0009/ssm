package com.web;

import com.dto.Result;
import com.entity.Cart;
import com.entity.Employee;
import com.entity.Equipment;
import com.entity.equipout;
import com.service.CartService;
import com.service.EquipOutService;
import com.service.EquipmentService;
import javafx.scene.input.DataFormat;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.util.*;

@Controller
public class CartController {

    private static final Logger log = LoggerFactory.getLogger(CartController.class);

    @Autowired
    private EquipmentService equipmentService;
    @Autowired
    private CartService cartService;
    @Autowired
    private EquipOutService equipOutService;

    @RequestMapping("/addGoodsInCart")
    @ResponseBody
    public Result addGoodsInCart(@RequestParam("id") Integer id, @RequestParam("number") Integer number, HttpSession session) {
        Equipment equipment = equipmentService.queryById(id);
        Cart cart = null;
        if (session.getAttribute("cart") != null) {
            cart = (Cart) session.getAttribute("cart");
        } else {
            cart = new Cart();
        }
        cart = cartService.addGoodsInCart(equipment, number, cart);
        log.info("当前购物车内信息："+cart.toString());
        session.setAttribute("cart", cart);
        Result result = new Result();
        result.setSuccess(true);
        return result;
    }

    @RequestMapping("cartCommit")
    public ModelAndView cartCommit(HttpSession session){
        List list = new ArrayList();
        List loglist = new ArrayList();
        Cart cart = (Cart) session.getAttribute("cart");
        Map<Equipment, Integer> equipmentSet = cart.getGoods();
        Iterator eqIt = equipmentSet.entrySet().iterator();
        while (eqIt.hasNext()) {
            Map.Entry next = (Map.Entry) eqIt.next();
            Equipment equipment = (Equipment) next.getKey();
            int num = (int) next.getValue();//所申请数量
            equipment.setEquiNum(num);
            list.add(equipment);
            equipmentService.borrow(equipment);

            //借出记录日志
            Employee loginEmpl = (Employee) session.getAttribute("loginEmpl");
            equipout equipout = new equipout();
            equipout.setUserName(loginEmpl.getUsername());
            equipout.setOutDate(new Date());
            equipout.setEquipOutNum(num);
            equipout.setEquipId(equipment.getId());
            equipout.setEquipName(equipment.getEquiName());
            //借出默认为1，归还后为0;类别为1和2的物资无需归还
            if (equipment.getEquiClass()==1||equipment.getEquiClass()==2){
                equipout.setTag(0);
            } else {
                equipout.setTag(1);
            }
            System.out.println("出借记录："+equipout.getEquipId());
            equipOutService.insert(equipout);
            loglist.add(equipout);
        }
//        if (equipmentService.updateList(list)!=0){
            session.setAttribute("cart",new Cart());
//        }
        log.info("购物车提交信息："+list.toString());
        return new ModelAndView("redirect:equipList?currPage=1");
    }


    @RequestMapping("/removeGoodsFromCart")
    public ModelAndView removeGoodsFromCart(Integer id, HttpSession session) {
        Equipment book = equipmentService.queryById(id);
        Cart cart = (Cart) session.getAttribute("cart");
        cart = cartService.removeGoodsFromCart(book, cart);
        session.setAttribute("cart", cart);
        return new ModelAndView("redirect:/Equipment/cartPage");
    }

    @RequestMapping("/cleanCart")
    public String cleanCart(HttpSession session) {
        Cart cart = null;
        session.setAttribute("cart", cart);
        return "Equipment/cartPage";
    }

    @ResponseBody
    @RequestMapping(value = "/checkStore", produces = {"text/html;charset=UTF-8;", "application/json;"})
    public String checkStore(HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        Map<Equipment, Integer> map = cart.getGoods();
        Iterator<Map.Entry<Equipment, Integer>> iter = map.entrySet().iterator();
        while (iter.hasNext()) {
            Map.Entry<Equipment, Integer> entry = iter.next();
            Equipment book = entry.getKey();
            Integer number = entry.getValue();
//            if (!equipmentService.checkStore(book.getId(),number)){
//                return "《"+book.getEquiName()+"》库存不足,库存剩余:"+book.getEquiNum();
//            }
        }
        return "success";
    }
}


