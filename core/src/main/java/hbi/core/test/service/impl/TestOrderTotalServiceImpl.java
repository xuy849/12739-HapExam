package hbi.core.test.service.impl;

import hbi.core.test.dto.TestOrderTotal;
import hbi.core.test.mapper.TestOrderTotalMapper;
import hbi.core.test.service.ITestOrderTotalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by xuy849 on 2017/1/13.
 */
@Service
public class TestOrderTotalServiceImpl implements ITestOrderTotalService {

    @Autowired
    private TestOrderTotalMapper testOrderTotalMapper;

    @Override   //进行订单汇总查询
    public List<TestOrderTotal> queryTestOrderTotal(TestOrderTotal testOrderTotal) {
        return testOrderTotalMapper.myQuery1(testOrderTotal);
    }
}
