package br.com.academiadoflutter.pizzaDeliveryApi.dto;

import java.util.List;
import java.util.stream.Collectors;

import br.com.academiadoflutter.pizzaDeliveryApi.entities.MenuE;
import lombok.Data;

@Data
public class MenuResponse {
  private Long id;
  private String name;
  private List<MenuItemResponse> items;

  public static MenuResponse entityToResponse(MenuE menu) {
    final var menuResp = new MenuResponse();
    menuResp.setId(menu.getId());
    menuResp.setName(menu.getName());
    // final var items = menu.getItems().stream().map((m) -> MenuItemResponse.entityToResponse(m)).collect(Collectors.toList());        //Forma completa
    final var items = menu.getItems().stream().map(MenuItemResponse::entityToResponse).collect(Collectors.toList());                    //Forma reduzida
    menuResp.setItems(items);
    return menuResp;
  }
}
