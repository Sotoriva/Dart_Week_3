package br.com.academiadoflutter.pizzaDeliveryApi.dto;

import java.math.BigDecimal;

import br.com.academiadoflutter.pizzaDeliveryApi.entities.MenuItemE;
import lombok.Data;

@Data
public class MenuItemResponse {
  private Long id;
  private String name;
  private BigDecimal price;

  public static MenuItemResponse entityToResponse(MenuItemE item) {
    final var menuItem = new MenuItemResponse();
    menuItem.setId(item.getId());
    menuItem.setName(item.getName());
    menuItem.setPrice(item.getPrice());
    return menuItem;
  }
}
