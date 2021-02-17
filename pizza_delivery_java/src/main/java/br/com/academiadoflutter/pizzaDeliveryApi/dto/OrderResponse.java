package br.com.academiadoflutter.pizzaDeliveryApi.dto;

import java.util.List;
import java.util.stream.Collectors;

import br.com.academiadoflutter.pizzaDeliveryApi.entities.OrderE;
import lombok.Data;

@Data
public class OrderResponse {
  private Long id;
  private String address;
  private String paymentType;
  private List<OrderItemResponse> items;

  public static OrderResponse entityToResponse(OrderE orderE) {
    final var order = new OrderResponse();
    order.setId(orderE.getId());
    order.setAddress(orderE.getAddress());
    order.setPaymentType(orderE.getPaymentType());
    final var items = orderE.getItems().stream().map(OrderItemResponse::entityToResponse).collect(Collectors.toList());
    order.setItems(items);
    return order;
  }
}
