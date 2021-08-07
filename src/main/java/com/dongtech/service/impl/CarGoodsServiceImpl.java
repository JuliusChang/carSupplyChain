package com.dongtech.service.impl;


import com.dongtech.dao.CarGoodsDao;
import com.dongtech.dao.impl.CarGoodsDaoImpl;
import com.dongtech.service.CarVGoodsService;
import com.dongtech.vo.*;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

@Service
public class CarGoodsServiceImpl implements CarVGoodsService {

    CarGoodsDao dao = new CarGoodsDaoImpl();

    @Override
    public void saveOrders(List<Cart> cartInCookie) {
        int number = (int) (Math.random() * 1000000);
        int totalPrice = 0;
        for (Cart cart : cartInCookie) {
            totalPrice += cart.getPrice();
        }
        dao.saveOrder(String.valueOf(number), BigDecimal.valueOf(totalPrice));
        int id = dao.queryMaxOrderId();
        for (Cart cart : cartInCookie) {
            totalPrice += cart.getPrice();
            dao.saveOrdersDetails(cart.getName(), cart.getNum(), cart.getProduce(), BigDecimal.valueOf(cart.getPrice()), id);
        }
    }

    @Override
    public List<CarGoods> queryList(CarGoods carGoods) throws SQLException {
        return dao.queryList(carGoods);
    }

    @Override
    public List<CarOrders> queryOrders() {
        return dao.queryOrders();
    }

    @Override
    public List<CarOrderDetails> queryOrdersDetails(Integer id) {
        return dao.queryOrdersDetails(id);
    }



}
