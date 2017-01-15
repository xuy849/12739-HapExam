package hbi.core.test.service.impl;

import com.hand.hap.system.service.impl.BaseServiceImpl;
import hbi.core.test.dto.TestCompany;
import hbi.core.test.mapper.TestCompanyMapper;
import hbi.core.test.service.ITestCompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by xuy849 on 2017/1/11.
 */
@Service("testCompanyService")
public class TestCompanyServiceImpl extends BaseServiceImpl<TestCompany> implements ITestCompanyService {

}
