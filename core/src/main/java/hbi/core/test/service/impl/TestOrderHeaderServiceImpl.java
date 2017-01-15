package hbi.core.test.service.impl;

import com.hand.hap.system.service.impl.BaseServiceImpl;
import hbi.core.test.dto.TestOrderHeader;
import hbi.core.test.mapper.TestOrderHeaderMapper;
import hbi.core.test.service.ITestOrderHeaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by xuy849 on 2017/1/12.
 */
@Service
public class TestOrderHeaderServiceImpl extends BaseServiceImpl<TestOrderHeader> implements ITestOrderHeaderService {
    @Autowired
    private TestOrderHeaderMapper testOrderHeaderMapper;

    //查询订单状态种类
    @Override
    public List<String> selectOrderStateCategory() {
        List<TestOrderHeader> list = testOrderHeaderMapper.selectOrderState();
        List<String> list_orderState = new ArrayList<String>();

        //
        list_orderState.add("请选择订单状态");
        for(TestOrderHeader item:list){
            list_orderState.add(item.getOrderStatus());
        }
        return list_orderState;
    }

}
