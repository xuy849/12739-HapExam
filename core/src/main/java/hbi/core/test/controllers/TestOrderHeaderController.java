package hbi.core.test.controllers;

import com.hand.hap.core.IRequest;
import com.hand.hap.system.controllers.BaseController;
import com.hand.hap.system.dto.ResponseData;
import hbi.core.test.dto.TestOrderHeader;
import hbi.core.test.service.ITestOrderHeaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by xuy849 on 2017/1/12.
 */
@RestController
@RequestMapping(path="/testOrderHeader")
public class TestOrderHeaderController  extends BaseController {

    @Autowired
    private ITestOrderHeaderService iTestOrderHeaderService;

    //订单插入
    @RequestMapping(path="/insert",method = RequestMethod.POST)
    public ResponseData insert(@RequestParam(name="orderNumber") String orderNumber,
                                @RequestParam(name="companyId") String companyId,
                               @RequestParam(name="customerId") String customerId,
                               @RequestParam(name="orderDate") String orderDate,
                               @RequestParam(name="orderStatus") String orderStatus, HttpServletRequest request) {
        TestOrderHeader testOrderHeader = new TestOrderHeader();
        ResponseData responseData = new ResponseData();

        //添值
        testOrderHeader.setOrderNumber(orderNumber);
        testOrderHeader.setCompanyId(Long.parseLong(companyId));
        testOrderHeader.setCustomerId(Long.parseLong(customerId));
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
        Date d = new Date();
        try {
            d = simpleDateFormat.parse(orderDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        testOrderHeader.setOrderDate(d);
        testOrderHeader.setOrderStatus(orderStatus);

        //
        IRequest iRequest = this.createRequestContext(request);
        TestOrderHeader testOrderHeader1 = iTestOrderHeaderService.insertSelective(iRequest,testOrderHeader);
        responseData.setMessage(String.valueOf(testOrderHeader1.getHeaderId().longValue()));
        System.out.println(responseData.getMessage());

        return responseData;
    }
}
