package hbi.core.test.service;

import hbi.core.test.dto.TestOrderTotal;

import java.util.List;

/**
 * Created by xuy849 on 2017/1/13.
 */
public interface ITestOrderTotalService {

    //进行订单汇总查询
    public List<TestOrderTotal> queryTestOrderTotal(TestOrderTotal testOrderTotal);

}
