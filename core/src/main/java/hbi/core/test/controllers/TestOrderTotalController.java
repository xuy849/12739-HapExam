package hbi.core.test.controllers;

import com.hand.hap.system.dto.ResponseData;
import hbi.core.test.dto.TestOrderTotal;
import hbi.core.test.service.ITestOrderTotalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by xuy849 on 2017/1/13.
 */
@RestController
@RequestMapping(path="/TestOrderTotal")
public class TestOrderTotalController {

    @Autowired
    private ITestOrderTotalService iTestOrderTotalService;

    ////进行订单汇总查询
    @RequestMapping(path="/queryOrderTotal",method = RequestMethod.GET)
    public ResponseData queryOrderTotal(
                                        @RequestParam(name="companyId",required = false,defaultValue = "") String companyId,
                                        @RequestParam(name="customerId",required = false,defaultValue = "")String customerId,
                                        @RequestParam(name="orderNumber",required = false,defaultValue = "") String orderNumber,
                                        @RequestParam(name="itemId",required = false,defaultValue = "") String itemId,
                                        @RequestParam(name="orderStatus",required = false,defaultValue = "") String orderStatus){
            ResponseData responseData = new ResponseData();
            TestOrderTotal testOrderTotal = new TestOrderTotal();

            if(isNumeric(companyId))
                testOrderTotal.setCompanyId(parseToLong(companyId));

            if(isNumeric(customerId))
                testOrderTotal.setCustomerId(parseToLong(customerId));

            testOrderTotal.setOrderNumber(orderNumber);

            if(isNumeric(itemId))
                testOrderTotal.setInventoryItemId(parseToLong(itemId));

            if(!orderStatus.equals(""))
                testOrderTotal.setOrderStatus(orderStatus);

            List<TestOrderTotal> list = iTestOrderTotalService.queryTestOrderTotal(testOrderTotal);


            responseData.setRows(list);
            responseData.setTotal(Long.valueOf(list.size()));

            return responseData;
    }

    //将字符串转换为Long
    private static Long parseToLong(String str){
        System.out.println(str);
                                            return Long.parseLong(str);
    }

    //判断字符串是否为数字
    public static boolean isNumeric(String str){
        if(str.equals(""))
            return false;
        for (int i = 0; i < str.length(); i++){
            System.out.println(str.charAt(i));
            if (!Character.isDigit(str.charAt(i))){
                return false;
            }
        }
        return true;
    }

}
