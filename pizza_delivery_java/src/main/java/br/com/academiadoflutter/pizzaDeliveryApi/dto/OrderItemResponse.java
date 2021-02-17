package br.com.academiadoflutter.pizzaDeliveryApi.dto;

import br.com.academiadoflutter.pizzaDeliveryApi.entities.OrderItemE;
import lombok.Data;

@Data
public class OrderItemResponse {
  private Long id;
  private MenuItemResponse item;

  public static OrderItemResponse entityToResponse(OrderItemE orderItemE) {
    final var orderItem = new OrderItemResponse();
    orderItem.setId(orderItemE.getId());
    orderItem.setItem(MenuItemResponse.entityToResponse(orderItemE.getMenu()));
    return orderItem;
  }
}
