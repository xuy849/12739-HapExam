package hbi.core.test.controllers;

import com.hand.hap.core.IRequest;
import com.hand.hap.system.controllers.BaseController;
import com.hand.hap.system.dto.ResponseData;
import hbi.core.test.dto.TestCompany;
import hbi.core.test.service.ITestCompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by xuy849 on 2017/1/11.
 */
@RestController
@RequestMapping(path="/testCompany")
public class TestCompanyController extends BaseController {
    @Autowired
    @Qualifier("testCompanyService")
    private ITestCompanyService companyService;

    //基于COMPANY_ID进行关联查询
    @RequestMapping(path = "/selectByPrimaryKey",method = RequestMethod.GET)
    public ResponseData selectByPrimaryKey(HttpServletRequest httpServletRequest,
                               @RequestParam(name="companyId") String companyId){
        //
        TestCompany company = new TestCompany();
        IRequest iRequest = this.createRequestContext(httpServletRequest);
        ResponseData responseData = new ResponseData();

        //将字符串转换为Long
        Long id = new Long(Long.parseLong(companyId));
        company.setCompanyId(id);

        //
        company = companyService.selectByPrimaryKey(iRequest,company);
        List<TestCompany> list = new ArrayList<TestCompany>();
        list.add(company);

        //
        responseData.setRows(list);
        responseData.setTotal(new Long(1));
        responseData.setMessage(String.format("公司Id:%l,公司名称:%s",company.getCompanyId(),company.getCompanyName()));

        return responseData;
    }

}
