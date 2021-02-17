package br.com.academiadoflutter.pizzaDeliveryApi.services;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import br.com.academiadoflutter.pizzaDeliveryApi.entities.MenuItemE;
import br.com.academiadoflutter.pizzaDeliveryApi.entities.OrderE;
import br.com.academiadoflutter.pizzaDeliveryApi.entities.OrderItemE;
import br.com.academiadoflutter.pizzaDeliveryApi.entities.UserE;
import br.com.academiadoflutter.pizzaDeliveryApi.repositories.OrderRepository;
import br.com.academiadoflutter.pizzaDeliveryApi.view_models.SaveOrderInputModel;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderService {
  private final OrderRepository orderRepository;

  public List<OrderE> findAll() {
    return orderRepository.findAll();
  }

  public void saveOrder(SaveOrderInputModel saveModel) {
    
    var order = new OrderE();
    var user = new UserE();
    user.setId(saveModel.getUserId());

    order.setUser(user);
    order.setAddress(saveModel.getAddress());
    order.setPaymentType(saveModel.getPaymentType());
    order.setItems(saveModel.getItemsId().stream().map((i) -> {
      final var menu = new MenuItemE();
      menu.setId(i);
      final var item = new OrderItemE();
      item.setOrder(order);
      item.setMenu(menu);
      return item;
    }).collect(Collectors.toList()));
    orderRepository.save(order);
  }

  public List<OrderE> findMyOrders(Long userId) {
    return orderRepository.findByUserIdOrderById(userId);
  }
}
