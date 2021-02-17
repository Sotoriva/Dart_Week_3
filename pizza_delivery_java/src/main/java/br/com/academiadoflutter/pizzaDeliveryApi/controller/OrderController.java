package br.com.academiadoflutter.pizzaDeliveryApi.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.academiadoflutter.pizzaDeliveryApi.dto.OrderResponse;
import br.com.academiadoflutter.pizzaDeliveryApi.dto.SaveOrderRequest;
import br.com.academiadoflutter.pizzaDeliveryApi.services.OrderService;
import br.com.academiadoflutter.pizzaDeliveryApi.view_models.SaveOrderInputModel;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(value = "/order")
@RequiredArgsConstructor
public class OrderController {
  private final OrderService orderService;

  @PostMapping("/")
  void saveOrder(@RequestBody SaveOrderRequest orderRequest) {
    final var saveOrder = new SaveOrderInputModel();
    saveOrder.setUserId(orderRequest.getUserId());
    saveOrder.setAddress(orderRequest.getAddress());
    saveOrder.setPaymentType(orderRequest.getPaymentType());
    saveOrder.setItemsId(orderRequest.getItemsId());
    orderService.saveOrder(saveOrder);
  }

  @GetMapping("/user/{userId}")
  List<OrderResponse> findAllByUserId(@PathVariable("userId") Long userId) {
    final var orders = orderService.findMyOrders(userId);
    return orders.stream().map(OrderResponse::entityToResponse).collect(Collectors.toList());
  }

}
