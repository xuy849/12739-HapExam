package hbi.core.test.mapper;

import hbi.core.test.dto.TestOrderTotal;

import java.util.List;

/**
 * Created by xuy849 on 2017/1/13.
 */
public interface TestOrderTotalMapper {

    //根据公司Id、客户Id、销售订单号、物料Id、订单状态进行订单汇总查询界面
    public List<TestOrderTotal> myQuery1(TestOrderTotal testOrderTotal);

}
