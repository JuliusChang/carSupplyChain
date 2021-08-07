package com.dongtech.dao;


import com.dongtech.vo.*;

import java.math.BigDecimal;
import java.util.List;

public interface CarGoodsDao {
    List<CarGoods> queryList(CarGoods carGoods) ;

    List<CarOrders> queryOrders();

    List<CarOrderDetails> queryOrdersDetails(Integer id);

    void saveOrder(String number, BigDecimal price);

    void saveOrdersDetails(String goods_name,int num,String produce,BigDecimal price,int order_id);

    int queryMaxOrderId();




}
